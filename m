Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333ED1B3B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 12:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B5B89BA3;
	Mon, 13 May 2019 10:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4DB689BA3;
 Mon, 13 May 2019 10:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B2BDE2A604B;
 Mon, 13 May 2019 12:14:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id gMG9OcG-EHFj; Mon, 13 May 2019 12:14:32 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 1AEFF2A6045;
 Mon, 13 May 2019 12:14:32 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hQ7yY-00070M-Vf; Mon, 13 May 2019 12:14:31 +0200
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
To: Aaron Ma <aaron.ma@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
 <20190510154208.GL17751@phenom.ffwll.local>
 <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
 <1946afdf-f87f-c6bb-e492-be5c73707995@canonical.com>
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
Message-ID: <75236873-7a53-9106-cba5-b0353aae2eef@daenzer.net>
Date: Mon, 13 May 2019 12:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1946afdf-f87f-c6bb-e492-be5c73707995@canonical.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xMCA4OjAxIHAubS4sIEFhcm9uIE1hIHdyb3RlOgo+IE9uIDUvMTAvMTkgMTE6
NDYgUE0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4gR2l2ZW4gdGhhdCB0aGUgYnVnIGlzIGEg
Yml0IGEgbWVzcyBJIHRoaW5rIHdlIG5lZWQgdG8gYWRkIGEgYml0IG1vcmUKPj4+IGNvbnRleHQg
aGVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIE15IHVuZGVyc3RhbmRpbmc6Cj4+Pgo+Pj4gR29h
bCBvZiB0aGUgcmV2ZXJ0IGNvbW1pdCB3YXMgdG8gbWFrZSB0aGUgaW50ZWdyYXRlZCBib290IGRl
dmljZSB0aGUKPj4+IHByaW1hcnkgb25lLCBpZiB3ZSBjYW4ndCBkZXRlY3Qgd2hpY2ggb25lIGlz
IHRoZSBib290IGRldmljZSwgaW5zdGVhZCBvZgo+Pj4gdGhlIGxhc3Qgb25lLiBXaGljaCBtYWtl
cyBzb21lIHNlbnNlLgo+Pj4KPj4+IE5vdyBwZW9wbGUgaGF2ZSByZWxpZWQgb24gdGhlIGtlcm5l
bCBwaWNraW5nIHRoZSBsYXN0IG9uZSwgd2hpY2ggdXN1YWxseQo+Pj4gaXMgYW4gYWRkLW9uIGNh
cmQsIGFuZCB0aGVyZWZvcmUgc2ltcGx5IHBsdWdnaW5nIGluIGFuIGFkZC1vbiBjYXJkIGFsbG93
cwo+Pj4gdGhlbSB0byBvdmVyd3JpdGUgdGhlIGRlZmF1bHQgY2hvaWNlLiBXaGljaCBhbHNvIG1h
a2VzIHNlbnNlLCBhbmQgc2luY2UKPj4+IGl0J3MgdGhlIG9sZGVyIGJlaGF2aW91ciwgd2lucy4K
Pj4+Cj4+PiBJIHRoaW5rIGl0J2QgYmUgZ29vZCB0byBhZGQgYSBjb21tZW50IGhlcmUgdGhhdCB0
aGlzIGJlaGF2aW91ciBoYXMgYmVjb21lCj4+PiB1YXBpLCBlLmcuCj4+Pgo+Pj4gCS8qIEFkZCBh
dCB0aGUgZnJvbnQgc28gdGhhdCB3ZSBwaWNrIHRoZSBsYXN0IGRldmljZSBhcyBmYWxsYmFjawo+
Pj4gCSAqIGRlZmF1bHQsIHdpdGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0IHBsdWcgaW4gY2FyZHMg
YXJlIHByZWZlcnJlZAo+Pj4gCSAqIG92ZXIgaW50ZWdyYXRlZCBncmFwaGljcy4gKi8KPj4+Cj4+
PiBXaXRoIHRoYXQgKG9yIHNpbWlsYXIpIGFuZCBtb3JlIGNvbW1pdCBtZXNzYWdlIGNvbnRleHQ6
Cj4+IFRoZSBidWcgcmVwb3J0ZXIncyBzeXN0ZW0gZG9lc24ndCBoYXZlIGludGVncmF0ZWQgZ3Jh
cGhpY3MgdGhvdWdoLCBqdXN0Cj4+IHR3byBwbHVnLWluIGNhcmRzLiBJdCdzIG5vdCBjbGVhciB0
byBtZSB5ZXQgdGhhdCB0aGVpciBleHBlY3RhdGlvbiBvZgo+PiBYb3JnIHRvIHBpY2sgYW55IHBh
cnRpY3VsYXIgb25lIG9mIHRoZW0gd2l0aG91dCBjb25maWd1cmF0aW9uIHdhcyBqdXN0aWZpZWQu
Cj4gCj4gCj4gVGhpcyBjb2RlIGlzIGtpbmQgb2YgZmFpbCBzYWZlLgo+IAo+IFdoZW4gaW4gaHli
cmlkIGdyYXBoaWMgbW9kZS4KPiBJdCBzaG91bGQgZmFsbGJhY2sgdG8gaW50ZWdyYXRlZCBHUFUs
IHdoaWNoIHNob3VsZCBhbHdheXMgYmUgcHJpbWFyeSBmYi4KPiBTbyBwaWNraW5nIDFzdCAobWlu
b3IgUENJIElEIG51bWJlcikgR1BVIHNob3VsZCBtYWtlIG1vcmUgc2Vuc2UuCj4gCj4gV2hlbiB3
aXRoIG11bHRpcGxlIGQtR1BVcywgd2UgY2FuJ3Qgc2F5IHdoaWNoIGNhcmQgc2hvdWxkIGJlIHRo
ZSByaWdodAo+IG9uZSBmb3IgdXNlcnMgd2hlbiBubyBYb3JnIGNvbmYgc2V0Lgo+IFVzdWFsbHkg
QklPUyB3aWxsIHNldCB0aGUgMXN0IChtaW5vciBQQ0kgSUQgbnVtYmVyKSBkLUdQVSBhcyBwcmlt
YXJ5Lgo+IFNvIGFsaWduaW5nIHdpdGggQklPUyBzZXR0aW5nIHdpbGwgYmUgYmV0dGVyIEkgdGhp
bmsuCgpSaWdodC4gVGhlIGJ1ZyBkZXNjcmlwdGlvbiBldmVuIHNheXMgdGhhdCB0aGUgY2FyZCB0
aGUgcmVwb3J0ZXIgZXhwZWN0ZWQKWG9yZyB0byBjb21lIHVwIG9uIGlzIHRoZSAic2Vjb25kYXJ5
IiBjYXJkIGluIGEgUENJZSAxeCBzbG90ICh3aGVyZWFzCnRoZSBwcmltYXJ5IGlzIGluIFBDSWUg
MTZ4KS4gSXQgc2VlbXMgcHJldHR5IGNsZWFyIHRoYXQgeW91ciBjaGFuZ2UKYWN0dWFsbHkgbWFk
ZSB0aGluZ3MgYmV0dGVyLCBhbmQgdGhlIHJlcG9ydGVyIHdhcyBqdXN0IHJlbHlpbmcgb24gdGhl
CnByZXZpb3VzIHdyb25nIGJlaGF2aW91ci4gVGhlcmVmb3JlIEkgcmVzb2x2ZWQgdGhlIHJlcG9y
dCBhcyBub3QgYSBidWcsCmFuZCB0aGlzIHBhdGNoIHNob3VsZCBiZSBkcm9wcGVkLgoKCi0tIApF
YXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRw
czovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAg
ICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
