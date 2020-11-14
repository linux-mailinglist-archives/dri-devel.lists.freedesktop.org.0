Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC12B2FFE
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59906E943;
	Sat, 14 Nov 2020 19:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8436E943
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 19:11:31 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D60F080560;
 Sat, 14 Nov 2020 20:11:28 +0100 (CET)
Date: Sat, 14 Nov 2020 20:11:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Message-ID: <20201114191127.GB3797389@ravnborg.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-13-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113134938.4004947-13-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=Cwvp4g05kwjmXd1pErQA:9 a=QEXdDO2ut3YA:10 a=srlwD-8ojaedGGhPAyx8:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLApPbiBGcmksIE5vdiAxMywgMjAyMCBhdCAwMTo0OToxMFBNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmco
cyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmM6MzU2OjY6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcGwxMTFfZGlzcGxheV9kaXNhYmxl
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAKPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5o
b2x0Lm5ldD4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKRXJpYydzIHdhcyBub3QgY29waWVkIG9uIHRoaXMgb3IgdGhlIG90aGVyIHBsMTExIHBhdGNo
LgpBZGRlZCBFcmljIHNvIGhlIGNhbiBiZSBhd2FyZSBvZiB0aGlzIGZpeC4KCglTYW0KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJt
L3BsMTExL3BsMTExX2Rpc3BsYXkuYwo+IGluZGV4IGIzZTg2OTdjYWZjZjEuLjY5YzAyZTdjODJi
N2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMKPiBAQCAtMzUzLDcg
KzM1Myw3IEBAIHN0YXRpYyB2b2lkIHBsMTExX2Rpc3BsYXlfZW5hYmxlKHN0cnVjdCBkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiAgCQlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7Cj4g
IH0KPiAgCj4gLXZvaWQgcGwxMTFfZGlzcGxheV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rp
c3BsYXlfcGlwZSAqcGlwZSkKPiArc3RhdGljIHZvaWQgcGwxMTFfZGlzcGxheV9kaXNhYmxlKHN0
cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSkKPiAgewo+ICAJc3RydWN0IGRybV9j
cnRjICpjcnRjID0gJnBpcGUtPmNydGM7Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gY3J0
Yy0+ZGV2Owo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
