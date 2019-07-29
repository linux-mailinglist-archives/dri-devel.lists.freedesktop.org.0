Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C182E78D9B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4787189FD1;
	Mon, 29 Jul 2019 14:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E8CA89FC9;
 Mon, 29 Jul 2019 14:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 463242A6042;
 Mon, 29 Jul 2019 16:17:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id kaDjO01CxHgZ; Mon, 29 Jul 2019 16:17:19 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id F15372A6046;
 Mon, 29 Jul 2019 16:17:18 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hs6Sk-0003Mw-4w; Mon, 29 Jul 2019 16:17:18 +0200
Subject: Re: [PATCH v3 1/1] drm/vblank: drop use of DRM_WAIT_ON()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190726210658.GA6299@ravnborg.org>
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
Message-ID: <8e6175cf-31d9-a71e-aa26-5aca184238fb@daenzer.net>
Date: Mon, 29 Jul 2019 16:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726210658.GA6299@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNiAxMTowNiBwLm0uLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gRFJNX1dBSVRf
T04oKSBpcyBmcm9tIHRoZSBkZXByZWNhdGVkIGRybV9vc19saW51eCBoZWFkZXIgYW5kCj4gdGhl
IG1vZGVybiByZXBsYWNlbWVudCBpcyB0aGUgd2FpdF9ldmVudF8qLgo+IAo+IFRoZSByZXR1cm4g
dmFsdWVzIGRpZmZlciwgc28gYSBjb252ZXJzaW9uIGlzIG5lZWRlZCB0bwo+IGtlZXAgdGhlIG9y
aWdpbmFsIGludGVyZmFjZSB0b3dhcmRzIHVzZXJzcGFjZS4KPiBJbnRyb2R1Y2VkIGEgc3dpdGNo
L2Nhc2UgdG8gbWFrZSBjb2RlIG9idmlvdXMuCj4gCj4gQW5hbHlzaXMgZnJvbSBNaWNoZWwgRMOk
bnplcjoKPiAKPiBUaGUgd2FpdGluZyBjb25kaXRpb24gcmVseSBvbiBhbGwgcmVsZXZhbnQgcGxh
Y2VzIHdoZXJlIHZibGFua19jb3VudAo+IGlzIG1vZGlmaWVkIGNhbGxzIHdha2VfdXAoJnZibGFu
ay0+cXVldWUpLgo+IAo+IGRybV9oYW5kbGVfdmJsYW5rKCk6Cj4gLSBDYWxscyB3YWtlX3VwKCZ2
YmxhbmstPnF1ZXVlKQo+IAo+IGRybV92YmxhbmtfZW5hYmxlKCk6Cj4gLSBUaGVyZSBpcyBubyBu
ZWVkIGhlcmUgYmVjYXVzZSB0aGVyZSBjYW4gYmUgbm8gc2xlZXBpbmcgd2FpdGVycwo+ICAgaW4g
dGhlIHF1ZXVlLCBiZWNhdXNlIHZibGFuay0+ZW5hYmxlZCA9PSBmYWxzZSBpbW1lZGlhdGVseQo+
ICAgdGVybWluYXRlcyBhbnkgd2FpdHMuCj4gCj4gZHJtX2NydGNfYWNjdXJhdGVfdmJsYW5rX2Nv
dW50KCk6Cj4gLSBUaGlzIGlzIGNhbGxlZCBmcm9tIGludGVycnVwdCBoYW5kbGVycywgYXQgbGVh
c3QgZnJvbQo+ICAgYW1kZ3B1X2RtLmM6ZG1fcGZsaXBfaGlnaF9pcnEoKS4gTm90IHN1cmUgaXQg
bmVlZHMgdG8gd2FrZSB1cAo+ICAgdGhlIHF1ZXVlIHRob3VnaCwgdGhlIGRyaXZlciBzaG91bGQg
Y2FsbAo+ICAgZHJtXyhjcnRjXylfaGFuZGxlX3ZibGFuayBhbnl3YXkuCj4gCj4gZHJtX3ZibGFu
a19kaXNhYmxlX2FuZF9zYXZlKCk6Cj4gLSBJdCBjYW4gYmUgY2FsbGVkIGZyb20gYW4gaW50ZXJy
dXB0LCB2aWEgZHJtX2hhbmRsZV92YmxhbmsgLT4KPiAgIHZibGFua19kaXNhYmxlX2ZuLiBIb3dl
dmVyLCB0aGUgb25seSBwbGFjZSB3aGVyZQo+ICAgZHJtX3ZibGFua19kaXNhYmxlX2FuZF9zYXZl
IGNhbiBiZSBjYWxsZWQgd2l0aCBzbGVlcGluZyB3YWl0ZXJzCj4gICBpbiB0aGUgcXVldWUgaXMg
aW4gZHJtX2NydGNfdmJsYW5rX29mZiwgd2hpY2ggd2FrZXMgdXAgdGhlIHF1ZXVlCj4gICBhZnRl
cndhcmRzICh3aGljaCB0ZXJtaW5hdGVzIGFsbCB3YWl0cywgYmVjYXVzZQo+ICAgdmJsYW5rLT5l
bmFibGVkID09IGZhbHNlIGF0IHRoaXMgcG9pbnQpLgo+IAo+IHYzOgo+IC0gQWRkZWQgYW5hbHlz
aXMgdG8gY2hhbmdlbG9nIGZyb20gTWljaGVsIETDpG56ZXIKPiAtIE1vdmVkIHJldHVybiByZXN1
bHQgaGFuZGxpbmcgaW5zaWRlIGlmIChyZXFfc2VxICE9IHNlcSkgKERhbmllbCBWKQo+IC0gUmV1
c2VkIG1vcmUgb2YgdGhlIGZvcm1lciBsb2dpYyAtIHJlc3VsdGluZyBpbiBzaW1wbGVyIGNvZGUK
PiAtIERyb3BwZWQgUmV2aWV3ZWQtYnkgZnJvbSBTZWFuIFBhdWwgYXMgdGhpcyBpcyBhIG5ldyBp
bXBsbWVudGF0aW9uCj4gCj4gdjI6Cj4gLSBGaXggc28gdGhlIGNhc2Ugd2hlcmUgcmVxX3NlcSBl
cXVhbHMgc2VxIHdhcyBoYW5kbGVkIHByb3Blcmx5Cj4gLSBxdWljayBoYWNrIHRvIGNoZWNrIGlm
IElHVCBiZWNhbWUgaGFwcHkKPiAtIE9ubHkgc2VudCB0byBpZ3QsIG5vdCB0byBkcmktZGV2ZWwK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6
ICJNaWNoZWwgRMOkbnplciIgPG1pY2hlbEBkYWVuemVyLm5ldD4KPiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgoKUmV2aWV3ZWQtYnk6IE1pY2hlbCBEw6RuemVy
IDxtaWNoZWwuZGFlbnplckBhbWQuY29tPgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNv
ZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRl
dmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
