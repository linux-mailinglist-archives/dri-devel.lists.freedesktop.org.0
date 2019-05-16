Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27CF20D13
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B521891CA;
	Thu, 16 May 2019 16:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42B8F891CA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 6567D2A6048;
 Thu, 16 May 2019 18:33:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rMFgZ-PfqUBr; Thu, 16 May 2019 18:33:02 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4FC9F2A6016;
 Thu, 16 May 2019 18:33:01 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hRJJV-0006P8-AD; Thu, 16 May 2019 18:33:01 +0200
Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190516080714.14980-1-david1.zhou@amd.com>
 <20190516080714.14980-7-david1.zhou@amd.com>
 <e9b4e467-775f-e3e0-b842-07e4d12cf093@amd.com>
 <212b7506-58cc-fd48-a0cf-4e6098d0d4b1@gmail.com>
 <fef207ec-90e0-5fbe-5743-56c9d5a04e6d@daenzer.net>
 <CAKMK7uEjU2vCuV0WPFKNkQw_mzojWEEax-YSXU_04o3Uf3uvmg@mail.gmail.com>
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
Message-ID: <62699155-3011-4112-c45d-71b100296717@daenzer.net>
Date: Thu, 16 May 2019 18:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEjU2vCuV0WPFKNkQw_mzojWEEax-YSXU_04o3Uf3uvmg@mail.gmail.com>
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
Cc: zhoucm1 <zhoucm1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNiAyOjQ3IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBN
YXkgMTYsIDIwMTkgYXQgMjo0NiBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4gT24gMjAxOS0wNS0xNiAxMjowOSBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4gQW0gMTYuMDUuMTkgdW0gMTA6MTYgc2NocmllYiB6aG91Y20xOgo+Pj4+IEkgd2Fz
IGFibGUgdG8gcHVzaCBjaGFuZ2VzIHRvIGxpYmRybSwgYnV0IG5vdyBzZWVtcyBhZnRlciBsaWJk
cm0gaXMKPj4+PiBtaWdyYXRlZCB0byBnaXRsYWIsIEkgY2Fubm90IHlldC4gV2hhdCBzdGVwIGRv
IEkgbmVlZCB0byBnZXQgYmFjayBteQo+Pj4+IHBlcm1pc3Npb24/IEkgYWxyZWFkeSBjYW4gbG9n
aW4gaW50byBnaXRsYWIgd2l0aCBvbGQgZnJlZWRlc2t0b3AgYWNjb3VudC4KPj4+Pgo+Pj4+IEBD
aHJpc3RpYW4sIENhbiB5b3UgaGVscCBzdWJtaXQgdGhpcyBwYXRjaCBzZXQgdG8gbGliZHJtIGZp
cnN0Pwo+Pj4KPj4+IERvbmUuCj4+Cj4+IFRoaXMgYnJva2UgYW1kZ3B1LXN5bWJvbC1jaGVjazoK
Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZHJtL3BpcGVsaW5lcy8zNzE3
Nwo+Pgo+Pgo+PiBJIHB1c2hlZCB0aGUgdHJpdmlhbCBmaXguIFBsZWFzZSBjb25zaWRlciB1c2lu
ZyBHaXRMYWIgTVJzLCBzbyB0aGF0IHRoZQo+PiBDSSBwaXBlbGluZSBjYW4gY2F0Y2ggaXNzdWVz
IGxpa2UgdGhpcyBiZWZvcmUgdGhleSBjYW4gYnJlYWsgdGhlIG1hc3Rlcgo+PiBicmFuY2guCj4g
Cj4gU2hvdWxkIHdlIHN3aXRjaCBkb2NzIHRvIHJlY29tbWVuZCBNUj8gTWFrZSBpdCB0aGUgZGVm
YXVsdD8gSSBndWVzcwo+IG1lc2EgaGFzbid0IG1hZGUgdGhlbSBtYW5kYXRvcnkgeWV0LCBzbyBk
b2luZyB0aGF0IGZvciBsaWJkcm0gaXMgYSBiaXQKPiBqdW1waW5nIGFocmVhZCAuLi4KCldoeSBj
YW4ndCBsaWJkcm0gZ28gZmlyc3Q/CgpXaXRoIE1lc2EsIGl0IHRvb2sgc29tZSBlZmZvcnQgdG8g
Z2V0IHRoZSBDSSBwaXBlbGluZSB0byBmaW5pc2ggaW4gYW4KYWNjZXB0YWJsZSBhbW91bnQgb2Yg
dGltZSwgYnV0IHRoYXQgZG9lc24ndCBzZWVtIHRvIGJlIGFuIGlzc3VlIHdpdGgKbGliZHJtICh0
aG91Z2ggaXQgY291bGQgcHJvYmFibHkgc3RpbGwgYmUgc3BlZCB1cCBzb21ld2hhdCwgZS5nLiBi
eQp1c2luZyBwcmUtZ2VuZXJhdGVkIGRvY2tlciBpbWFnZXMgYXMgaW4gb3RoZXIgcHJvamVjdHMs
IG9yIGp1c3QgYnkKcGFzc2luZyAtajQgdG8gbWFrZSkuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwg
RMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20K
TGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2Eg
YW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
