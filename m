Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BF35E71
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 15:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B3C899DE;
	Wed,  5 Jun 2019 13:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BFE089244;
 Wed,  5 Jun 2019 13:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 544462A6045;
 Wed,  5 Jun 2019 15:56:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Sp19YxS3dxQa; Wed,  5 Jun 2019 15:56:29 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id B2A5F2A6016;
 Wed,  5 Jun 2019 15:56:29 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hYWOz-0002PK-1s; Wed, 05 Jun 2019 15:56:29 +0200
Subject: Re: [PATCH] drm/ttm: fix ttm_bo_unreserve
To: christian.koenig@amd.com, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190604152306.1804-1-christian.koenig@amd.com>
 <497dc76b-4752-59cf-a9a4-8fdf8c608383@amd.com>
 <BL0PR12MB2580B3E88C17043DE402CF3280150@BL0PR12MB2580.namprd12.prod.outlook.com>
 <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
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
Message-ID: <1a0e5fdc-5b9d-844c-10cb-2cc880863142@daenzer.net>
Date: Wed, 5 Jun 2019 15:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5a0f4e09-2614-5bbc-b8a2-53746bbb0b15@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNSAxOjI0IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMDQu
MDYuMTkgdW0gMjE6MDMgc2NocmllYiBaZW5nLCBPYWs6Cj4+IEZyb206IGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZgo+PiBLdWVobGlu
ZywgRmVsaXgKPj4gT24gMjAxOS0wNi0wNCAxMToyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4KPj4+IFNpbmNlIHdlIG5vdyBrZWVwIEJPcyBvbiB0aGUgTFJVIHdlIG5lZWQgdG8gbWFrZSBz
dXJlIHRoYXQgdGhleSBhcmUKPj4+IHJlbW92ZWQgd2hlbiB0aGV5IGFyZSBwaW5uZWQuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+Pj4gLS0tCj4+PiDCoMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAx
NCArKysrKystLS0tLS0tLQo+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2RyaXZlci5oCj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggaW5kZXgg
OWY1NGNmOWM2MGRmLi5jOWI4YmE0OTJmMjQKPj4+IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaAo+Pj4gQEAgLTc2NywxNCArNzY3LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4+PiB0
dG1fYm9fcmVzZXJ2ZV9zbG93cGF0aChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4g
wqDCoMKgICovCj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fdW5yZXNlcnZlKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+PiDCoMKgIHsKPj4+IC3CoMKgwqAgaWYgKCEo
Ym8tPm1lbS5wbGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkpIHsKPj4+IC3CoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9iLT5scnVfbG9jayk7Cj4+PiAtwqDCoMKg
wqDCoMKgwqAgaWYgKGxpc3RfZW1wdHkoJmJvLT5scnUpKQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdHRtX2JvX2FkZF90b19scnUoYm8pOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKGJvLCBOVUxM
KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmYm8tPmJkZXYtPmdsb2ItPmxydV9s
b2NrKTsKPj4+IC3CoMKgwqAgfQo+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmJvLT5iZGV2LT5nbG9i
LT5scnVfbG9jayk7Cj4+PiArwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZiby0+bHJ1KSkKPj4+ICvC
oMKgwqDCoMKgwqDCoCB0dG1fYm9fYWRkX3RvX2xydShibyk7Cj4+PiArwqDCoMKgIGVsc2UKPj4+
ICvCoMKgwqDCoMKgwqDCoCB0dG1fYm9fbW92ZV90b19scnVfdGFpbChibywgTlVMTCk7Cj4+IEdv
aW5nIGp1c3QgYnkgdGhlIGZ1bmN0aW9uIG5hbWVzLCB0aGlzIHNlZW1zIHRvIGRvIHRoZSBleGFj
dCBvcHBvc2l0ZQo+PiBvZiB3aGF0IHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24gc2F5cy4KPj4KPj4g
W09ha10gKzEsIHdoZW4gSSByZWFkIHRoZSBkZXNjcmlwdGlvbiwgSSBhbHNvIGdldCBsb3N0Li4u
U28gcGxlYXNlIGRvCj4+IGFkZCBhIG1vcmUgYWNjdXJhdGUgZGVzY3JpcHRpb24uCj4gCj4gSSdt
IHB1enpsZWQgd2h5IHlvdSBhcmUgY29uZnVzZWQuIFdlIG5vdyBrZWVwIHRoZSBCT3Mgb24gdGhl
IExSVSB3aGlsZQo+IHRoZXkgYXJlIHJlc2VydmVkLCBzbyBvbiB1bnJlc2VydmUgd2Ugbm93IG5l
ZWQgdG8gZXhwbGljaXRseSByZW1vdmUgdGhlbQo+IGZyb20gdGhlIExSVSB3aGVuIHRoZXkgYXJl
IHBpbm5lZC4KCkkgZG9uJ3Qga25vdyBhYm91dCBGZWxpeCBhbmQgT2FrLCBidXQgZm9yIG1lICJy
ZW1vdmUgZnJvbSB0aGUgTFJVIiBpcwpjb25mdXNpbmcsIGFzIEkgZG9uJ3Qgc2VlIHRoYXQgaW4g
dGhlIGNvZGUsIG9ubHkgYWRkaW5nIHRvIHRoZSBMUlUgb3IKbW92aW5nIHRvIGl0cyB0YWlsLgoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
