Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD524E156
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFD06E82D;
	Fri, 21 Jun 2019 07:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 012856E82D;
 Fri, 21 Jun 2019 07:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2849E322001;
 Fri, 21 Jun 2019 09:41:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 881zKm5LIqPU; Fri, 21 Jun 2019 09:41:21 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4115D2AA115;
 Fri, 21 Jun 2019 09:41:21 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1heEAi-0005mM-EU; Fri, 21 Jun 2019 09:41:20 +0200
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
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
Message-ID: <80d7f5d7-e1a3-f03b-6dd9-d1979da27adc@daenzer.net>
Date: Fri, 21 Jun 2019 09:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMSA5OjEyIGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IAo+IEZp
cnN0IG9mIGFsbCBJIHRyaWVkIHRvIGRpc2FibGUgRFJNIGF1dGhlbnRpY2F0aW9uIGNvbXBsZXRl
bHkgd2l0aCBhIAo+IGtlcm5lbCBjb25maWcgb3B0aW9uLiBTdXJwcmlzaW5nbHkgdGhhdCBhY3R1
YWxseSB3b3JrcyBvdXQgb2YgdGhlIGJveCBhdCAKPiBsZWFzdCBvbiB0aGUgQU1ER1BVIHN0YWNr
Lgo+IAo+IFRoaXMgZWZmZWN0aXZlbHkgYWxsb3dzIHVzIHRvIGdldCByaWQgb2YgRFJJMiBhbmQg
dGhlIHJlbGF0ZWQgc2VjdXJpdHkgCj4gcHJvYmxlbXMuIE9ubHkgdGhpbmcgbGVmdCBmb3IgdGhh
dCBpcyB0aGF0IEknbSBqdXN0IG5vdCBzdXJlIGhvdyB0byAKPiBzaWduYWwgdGhpcyB0byB1c2Vy
c3BhY2Ugc28gdGhhdCB0aGUgRERYIHdvdWxkbid0IGFkdmVydGlzZSBEUkkyIGF0IGFsbCAKPiBh
bnkgbW9yZS4KCkZXSVcsIGdldHRpbmcgcmlkIG9mIERSSTIgYWxzbyBuZWVkcyB0byBiZSBkaXNj
dXNzZWQgd2l0aCBhbWRncHUtcHJvCk9wZW5HTCBkcml2ZXIgZm9sa3MuCgoKPiBBcyBhIG5leHQg
c3RlcCBJIGxvb2tlZCBpbnRvIGlmIHdlIGNhbiBkaXNhYmxlIHRoZSBjb21tYW5kIHN1Ym1pc3Np
b24gCj4gZm9yIERSTSBtYXN0ZXIuIFR1cm5lZCBvdXQgdGhhdCB0aGlzIGlzIHJlbGF0aXZlbHkg
ZWFzeSBhcyB3ZWxsLgo+IAo+IEFsbCB3ZSBoYXZlIHRvIGRvIGlzIHRvIGZpeCB0aGUgYnVnIE1p
Y2hlbCBwb2ludGVkIG91dCBhYm91dCBLTVMgaGFuZGxlcyAKPiBmb3IgZGlzcGxheQoKSSdtIHdv
cmtpbmcgb24gdGhhdCwgY29uc2lkZXIgaXQgZml4ZWQuCgoKPiBhbmQgbGV0IHRoZSBERFggdXNl
IGEgcmVuZGVyIG5vZGUgaW5zdGVhZCBvZiB0aGUgRFJNIG1hc3RlciBmb3IgR2xhbW9yLgo+IFN0
aWxsIG5lZWQgdG8gc3luYyB1cCB3aXRoIE1pY2hlbCBhbmQvb3IgTWFyZWsgd2hhdHMgdGhlIGJl
c3Qgd2F5IG9mCj4gZG9pbmcgdGhpcy4KCk15IHN1Z2dlc3Rpb24gd2FzIHRvIGFkZCBhIG5ldyB2
YXJpYW50IG9mIGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZS4gV2hlbgp0aGUgbmV3IHZhcmlhbnQg
aXMgY2FsbGVkLCBsaWJkcm1fYW1kZ3B1IGludGVybmFsbHkgdXNlcyBhIHJlbmRlciBub2RlCmZv
ciBjb21tYW5kIHN1Ym1pc3Npb24gZXRjLiB3aGVuZXZlciBwb3NzaWJsZS4KCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93
d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
