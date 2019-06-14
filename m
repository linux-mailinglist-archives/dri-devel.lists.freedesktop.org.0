Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599846058
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD4A89930;
	Fri, 14 Jun 2019 14:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8FA0892DE;
 Fri, 14 Jun 2019 14:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E3B7C2A604A;
 Fri, 14 Jun 2019 16:16:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id DFSo_5xs-dbV; Fri, 14 Jun 2019 16:16:18 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 97A552A6048;
 Fri, 14 Jun 2019 16:16:18 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hbn05-0004oo-RJ; Fri, 14 Jun 2019 16:16:17 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <ae843423-745f-6d75-2460-6b0a3845ced5@daenzer.net>
Date: Fri, 14 Jun 2019 16:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNCAyOjU1IHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IEFtIDE0
LjA2LjE5IHVtIDE0OjA5IHNjaHJpZWIgRW1pbCBWZWxpa292Ogo+IAo+PiBUaGF0IHNhaWQsIHRo
ZSBwcm9wb3NhbCB3aWxsIG5vdCBjb25mbGljdCB3aXRoIHRoZSBEUk1fQVVUSCByZW1vdmFsLiBJ
Zgo+PiBhbnl0aGluZyBpdCBpcyBzdGVwIDAuNSBvZiB0aGUgZ3JhbmQgbWFzdGVyIHBsYW4uCj4g
Cj4gVGhhdCdzIHRoZSBwb2ludCBJIHN0cm9uZ2x5IGRpc2FncmVlIG9uLgo+IAo+IEJ5IGxvd2Vy
aW5nIHRoZSBEUk1fQVVUSCByZXN0cmljdGlvbiB5b3UgYXJlIGVuY291cmFnaW5nIHVzZXJzcGFj
ZSB0byAKPiB1c2UgdGhlIHNob3J0Y3V0IGFuZCB1c2UgdGhlIHByaW1hcnkgbm9kZSBmb3IgcmVu
ZGVyaW5nIGluc3RlYWQgb2YgCj4gZml4aW5nIHRoZSBjb2RlIGFuZCB1c2luZyB0aGUgcmVuZGVy
IG5vZGUuCj4gCj4gU28gYXQgdGhlIGVuZCBvZiB0aGUgZGF5IHVzZXJzcGFjZSB3aWxsIG1vc3Qg
bGlrZWx5IGNvbXBsZXRlbHkgZHJvcCAKPiBzdXBwb3J0IGZvciB0aGUgcmVuZGVyIG5vZGUsIHNp
bXBseSBmb3IgdGhlIHJlYXNvbiB0aGF0IGl0IGJlY2FtZSAKPiBzdXBlcmZsdW91cy4gWW91IGNh
biBqdXN0IG9wZW4gdXAgdGhlIHByaW1hcnkgbm9kZSBhbmQgZ2V0IHRoZSBzYW1lIAo+IGZ1bmN0
aW9uYWxpdHkuCj4gCj4gSSBhYnNvbHV0ZWx5IGNhbid0IHVuZGVyc3RhbmQgaG93IHlvdSBjYW4g
YXJndWUgdGhhdCB0aGlzIHdvbid0IG1ha2UgaXQgCj4gaGFyZGVyIHRvIGNsZWFubHkgc2VwYXJh
dGUgcmVuZGVyaW5nIGFuZCBwcmltYXJ5IG5vZGUgZnVuY3Rpb25hbGl0eS4KCkZXSVcsIEkgYWdy
ZWUgd2l0aCBDaHJpc3RpYW4gb24gdGhpcy4KCgpBbHNvIEZXSVcsIHRoZSBzb2x1dGlvbiBJJ20g
d29ya2luZyBvbiBmb3IKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy8xMTA5MDMgc2hvdWxk
IGFsbG93IG1ha2luZyBsaWJkcm1fYW1kZ3B1CmFsd2F5cyB1c2UgYSByZW5kZXIgbm9kZSBmb3Ig
cmVuZGVyaW5nLiBGb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkKaXQnbGwgcHJvYmFibHkgcmVx
dWlyZSBhZGRpbmcgYSBuZXcgdmFyaWFudCBvZiBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUKdGhv
dWdoLCBzaW5jZSBleGlzdGluZyB1c2VycyBtYXkgcmVseSBvbiB0aGUgZmlyc3QgYW1kZ3B1X2Rl
dmljZSBmb3IgYQpHUFUgdXNpbmcgdGhlIERSTSBmaWxlIGRlc2NyaXB0aW9uIHBhc3NlZCB0byBh
bWRncHVfZGV2aWNlX2luaXRpYWxpemUKZm9yIHJlbmRlcmluZy4KCgotLSAKRWFydGhsaW5nIE1p
Y2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1k
LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAg
TWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
