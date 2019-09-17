Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A4B50B9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 16:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743396ECBF;
	Tue, 17 Sep 2019 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 379706ECBD;
 Tue, 17 Sep 2019 14:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 82B7C322005;
 Tue, 17 Sep 2019 16:48:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PLoz8y56Zh5T; Tue, 17 Sep 2019 16:48:52 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7AEB6322004;
 Tue, 17 Sep 2019 16:48:52 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iAEmh-0008TE-TR; Tue, 17 Sep 2019 16:48:51 +0200
Subject: Re: [PATCH 1/2] drm/kms: Duct-tape for mode object lifetime checks
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190917120936.7501-1-daniel.vetter@ffwll.ch>
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
Message-ID: <5d194c3a-7224-bd0b-a967-050ef2dbd0a6@daenzer.net>
Date: Tue, 17 Sep 2019 16:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917120936.7501-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xNyAyOjA5IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gY29tbWl0IDRm
NTM2OGI1NTQxYTkwMmY2NTk2NTU4YjA1ZjVjMjFhOTc3MGRkMzIKPiBBdXRob3I6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gRGF0ZTogICBGcmkgSnVuIDE0IDA4OjE3
OjIzIDIwMTkgKzAyMDAKPiAKPiAgICAgZHJtL2ttczogQ2F0Y2ggbW9kZV9vYmplY3QgbGlmZXRp
bWUgZXJyb3JzCj4gCj4gdW5jb3ZlcmVkIGEgYml0IGEgbWVzcyBpbiBkcCBkcml2ZXJzLiBNb3N0
IGRyaXZlcnMgKGZyb20gYSBxdWljayBsb29rLAo+IGFsbCBleGNlcHQgaTkxNSkgcmVnaXN0ZXIg
YWxsIHRoZSBkcCBzdHVmZiBpbiB0aGVpciBpbml0IGNvZGUsIHdoaWNoCj4gaXMgdG9vIGVhcmx5
LiBXaXRoIENPTkZJR19EUk1fRFBfQVVYX0NIQVJERVYgdGhpcyB3aWxsIGJsb3cgdXAsCj4gYmVj
YXVzZSBkcm1fZHBfYXV4X3JlZ2lzdGVyIHRyaWVzIHRvIGFkZCBhIGNoaWxkIHRvIGEgZGV2aWNl
IGluIHN5c2ZzCj4gKHRoZSBjb25uZWN0b3IpIHdoaWNoIGRvZXNuJ3QgZXZlbiBleGlzdCB5ZXQu
Cj4gCj4gTm8gb25lIHNlZW1zIHRvIGhhdmUgY2FyZWQgdGh1cyBmYXIuIEJ1dCB3aXRoIHRoZSBh
Ym92ZSBjaGFuZ2UgSSBhbHNvCj4gbW92ZWQgdGhlIHNldHRpbmcgb2YgZGV2LT5yZWdpc3RlcmVk
IGFmdGVyIHRoZSAtPmxvYWQgY2FsbGJhY2ssIGluIGFuCj4gYXR0ZW1wdCB0byBrZWVwIG9sZCBk
cml2ZXJzIGZyb20gaGl0dGluZyBhbnkgV0FSTl9PTiBiYWNrdHJhY2VzLiBCdXQKPiB0aGF0IG1v
dmVkIHJhZGVvbi5rbyBmcm9tIHRoZSAid29ya2luZywgYnkgYWNjaWRlbnQiIHRvICJub3cgYWxz
bwo+IGJyb2tlbiIgY2F0ZWdvcnkuCj4gCj4gU2luY2UgdGhpcyBpcyBhIGh1Z2UgbWVzcyBJIGZp
Z3VyZWQgYSByZXZlcnQgd291bGQgYmUgc2ltcGxlc3QuIEJ1dAo+IHRoaXMgY2hlY2sgaGFzIGFs
cmVhZHkgY2F1Z2h0IGlzc3VlcyBpbiBpOTE1Ogo+IAo+IGNvbW1pdCAxYjliZDA5NjMwZDRkYjQ4
MjdjYzA0ZDM1OGE0MWExNmE2YmMyY2IwCj4gQXV0aG9yOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IERhdGU6ICAgVHVlIEF1ZyAyMCAxOToxNjo1NyAy
MDE5ICswMzAwCj4gCj4gICAgIGRybS9pOTE1OiBEbyBub3QgY3JlYXRlIGEgbmV3IG1heF9icGMg
cHJvcCBmb3IgTVNUIGNvbm5lY3RvcnMKPiAKPiBIZW5jZSBJJ2QgbGlrZSB0byByZXRhaW4gaXQu
IEZpeCB0aGUgcmFkZW9uIHJlZ3Jlc3Npb24gYnkgbW92aW5nIHRoZQo+IHNldHRpbmcgb2YgZGV2
LT5yZWdpc3RlcmVkIGJhY2sgdG8gd2VyZSBpdCB3YXMsIGFuZCBzdG9wIHRoZQo+IGJhY2t0cmFj
ZXMgd2l0aCBhbiBleHBsaWNpdCBjaGVjayBmb3IgZGV2LT5kcml2ZXItPmxvYWQuCj4gCj4gRXZl
cnlvbmUgZWxzZSB3aWxsIHN0YXkgYXMgYnJva2VuIHdpdGggQ09ORklHX0RSTV9EUF9BVVhfQ0hB
UkRFVi4gVGhlCj4gbmV4dCBwYXRjaCB3aWxsIGltcHJvdmUgdGhlIGtlcm5lbGRvYyBhbmQgYWRk
IGEgdG9kbyBlbnRyeSBmb3IgdGhpcy4KPiAKPiBGaXhlczogNGY1MzY4YjU1NDFhICgiZHJtL2tt
czogQ2F0Y2ggbW9kZV9vYmplY3QgbGlmZXRpbWUgZXJyb3JzIikKPiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxA
ZGFlbnplci5uZXQ+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CgpS
ZXZpZXdlZC1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+ClRlc3RlZC1i
eTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpUaGFua3MhCgoKLS0gCkVh
cnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRw
czovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAg
ICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
