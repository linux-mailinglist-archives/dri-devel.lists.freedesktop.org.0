Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D1B7FBD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2E56F46C;
	Thu, 19 Sep 2019 17:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4E446F46C;
 Thu, 19 Sep 2019 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3ADAB2AA0FB;
 Thu, 19 Sep 2019 19:11:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id x1F0UOtU4EPY; Thu, 19 Sep 2019 19:11:42 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C1D592AA0C6;
 Thu, 19 Sep 2019 19:11:42 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iAzy2-00041o-Fl; Thu, 19 Sep 2019 19:11:42 +0200
Subject: Re: [PATCH] drm/radeon: fix a potential NULL pointer dereference
To: Allen Pais <allen.pais@oracle.com>
References: <1568824282-4081-1-git-send-email-allen.pais@oracle.com>
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
Message-ID: <5603dddb-8ae3-e145-69af-c6ccea68ca1b@daenzer.net>
Date: Thu, 19 Sep 2019 19:11:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568824282-4081-1-git-send-email-allen.pais@oracle.com>
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
Cc: airlied@linux.ie, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xOCA2OjMxIHAubS4sIEFsbGVuIFBhaXMgd3JvdGU6Cj4gYWxsb2Nfd29ya3F1
ZXVlIGlzIG5vdCBjaGVja2VkIGZvciBlcnJvcnMgYW5kIGFzIGEgcmVzdWx0LAo+IGEgcG90ZW50
aWFsIE5VTEwgZGVyZWZlcmVuY2UgY291bGQgb2NjdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxs
ZW4gUGFpcyA8YWxsZW4ucGFpc0BvcmFjbGUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiBp
bmRleCBiZDUyZjE1Li4xYTQxNzY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Rpc3BsYXkuYwo+IEBAIC02ODMsNiArNjgzLDEwIEBAIHN0YXRpYyB2b2lkIHJhZGVvbl9jcnRj
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGluZGV4KQo+ICAJZHJtX21vZGVfY3J0
Y19zZXRfZ2FtbWFfc2l6ZSgmcmFkZW9uX2NydGMtPmJhc2UsIDI1Nik7Cj4gIAlyYWRlb25fY3J0
Yy0+Y3J0Y19pZCA9IGluZGV4Owo+ICAJcmFkZW9uX2NydGMtPmZsaXBfcXVldWUgPSBhbGxvY193
b3JrcXVldWUoInJhZGVvbi1jcnRjIiwgV1FfSElHSFBSSSwgMCk7Cj4gKwlpZiAodW5saWtlbHko
IXJhZGVvbl9jcnRjLT5mbGlwX3F1ZXVlKSkgewo+ICsJCWtmcmVlKHJhZGVvbl9jcnRjKTsKPiAr
CQlyZXR1cm47Cj4gKwl9Cj4gIAlyZGV2LT5tb2RlX2luZm8uY3J0Y3NbaW5kZXhdID0gcmFkZW9u
X2NydGM7Cj4gIAo+ICAJaWYgKHJkZXYtPmZhbWlseSA+PSBDSElQX0JPTkFJUkUpIHsKPiAKCkkn
bSBhZnJhaWQganVzdCBzaWxlbnRseSBsZWF2aW5nIHRoZSBDUlRDIHVuaW5pdGlhbGl6ZWQgaXNu
J3QgYSBnb29kIHdheQp0byBoYW5kbGUgdGhpcy4gVGhlIGZhaWx1cmUgd291bGQgbmVlZCB0byBi
ZSBwcm9wYWdhdGVkLCBwcm9iYWJseQpyZXN1bHRpbmcgaW4gdGhlIGRyaXZlciBhYm9ydGluZyBp
dHMgaW5pdGlhbGl6YXRpb24gYWx0b2dldGhlci4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6Ru
emVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJy
ZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQg
WCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
