Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B952CFE3F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FCA6E842;
	Tue,  8 Oct 2019 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988C26E842
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:58:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98Fw38Z043631;
 Tue, 8 Oct 2019 10:58:03 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98Fw3Lc006756
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 10:58:03 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 10:57:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 10:57:59 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Fw1lR110935;
 Tue, 8 Oct 2019 10:58:01 -0500
Subject: Re: [v3,7/8] drm/omap: add omap_gem_validate_flags()
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20191007112555.25278-8-jjhiblot@ti.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <c7131455-daee-3020-3b00-8b8897925060@ti.com>
Date: Tue, 8 Oct 2019 17:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007112555.25278-8-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570550283;
 bh=kwtPY2PWWVkRn0yIydBbFcTDOJkb7ryWUY/fryI4fSY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lipFqIyqW1XYtsUofvo1EokgbWfJb4cXfbxPOzaTCQHHd8qkyMc75m7arAQT0e3Ey
 HSATdZmBBBkwCo4GoO6fFiocmlxO/KsQWMBwul6kJZBHkOqOC4m3N5zIwCsb3DsZ5q
 XQKiQH1kGW/MOIz5I8XMIpielPOVsvXdPaqmTk9A=
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
Cc: dri-devel@lists.freedesktop.org, jsarha@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA3LzEwLzIwMTkgMTM6MjUsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4gRnJvbTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IEFkZCBhIGhlbHBlciBm
dW5jdGlvbiBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpIHdoaWNoIHZhbGlkYXRlcyB0aGUKPiBv
bWFwX2JvIGZsYWdzIHBhc3NlZCBmcm9tIHRoZSB1c2Vyc3BhY2UuCj4KPiBBbHNvIGRyb3AgdGhl
IGRldl9lcnIoKSBtZXNzYWdlLCBhcyB0aGUgdXNlcnNwYWNlIGNhbiBjYXVzZSB0aGF0IGF0Cj4g
d2lsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0
aS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNDAg
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
Ywo+IGluZGV4IDI3ZTBhMmY4NTA4YS4uZTUxOGQ5M2NhNmRmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2dlbS5jCj4gQEAgLTExMzMsNiArMTEzMywzOCBAQCB2b2lkIG9tYXBfZ2VtX2Zy
ZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgCWtmcmVlKG9tYXBfb2Jq
KTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgYm9vbCBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgZmxhZ3MpCj4gK3sKPiArCXN0cnVjdCBvbWFwX2RybV9w
cml2YXRlICpwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKPiArCj4gKwlzd2l0Y2ggKGZsYWdzICYg
T01BUF9CT19DQUNIRV9NQVNLKSB7Cj4gKwljYXNlIE9NQVBfQk9fQ0FDSEVEOgo+ICsJY2FzZSBP
TUFQX0JPX1dDOgo+ICsJY2FzZSBPTUFQX0JPX0NBQ0hFX01BU0s6Cj4gKwkJYnJlYWs7Cj4gKwo+
ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwo+ICsJaWYgKGZsYWdzICYg
T01BUF9CT19USUxFRF9NQVNLKSB7Cj4gKwkJaWYgKCFwcml2LT51c2VyZ2FydCkKPiArCQkJcmV0
dXJuIGZhbHNlOwo+ICsKPiArCQlzd2l0Y2ggKGZsYWdzICYgT01BUF9CT19USUxFRF9NQVNLKSB7
Cj4gKwkJY2FzZSBPTUFQX0JPX1RJTEVEXzg6Cj4gKwkJY2FzZSBPTUFQX0JPX1RJTEVEXzE2Ogo+
ICsJCWNhc2UgT01BUF9CT19USUxFRF8zMjoKPiArCQkJYnJlYWs7Cj4gKwo+ICsJCWRlZmF1bHQ6
Cj4gKwkJCXJldHVybiBmYWxzZTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHRydWU7Cj4g
K30KPiArCj4gICAvKiBHRU0gYnVmZmVyIG9iamVjdCBjb25zdHJ1Y3RvciAqLwo+ICAgc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAg
IAkJdW5pb24gb21hcF9nZW1fc2l6ZSBnc2l6ZSwgdTMyIGZsYWdzKQo+IEBAIC0xMTQ0LDEzICsx
MTc2LDExIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb21hcF9nZW1fbmV3KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gICAJc2l6ZV90IHNpemU7Cj4gICAJaW50IHJldDsKPiAgIAo+ICsJaWYg
KCFvbWFwX2dlbV92YWxpZGF0ZV9mbGFncyhkZXYsIGZsYWdzKSkKPiArCQlyZXR1cm4gTlVMTDsK
PiArCj4gICAJLyogVmFsaWRhdGUgdGhlIGZsYWdzIGFuZCBjb21wdXRlIHRoZSBtZW1vcnkgYW5k
IGNhY2hlIGZsYWdzLiAqLwo+ICAgCWlmIChmbGFncyAmIE9NQVBfQk9fVElMRURfTUFTSykgewo+
IC0JCWlmICghcHJpdi0+dXNlcmdhcnQpIHsKPiAtCQkJZGV2X2VycihkZXYtPmRldiwgIlRpbGVk
IGJ1ZmZlcnMgcmVxdWlyZSBETU1cbiIpOwo+IC0JCQlyZXR1cm4gTlVMTDsKPiAtCQl9Cj4gLQo+
ICAgCQkvKgo+ICAgCQkgKiBUaWxlZCBidWZmZXJzIGFyZSBhbHdheXMgc2htZW0gcGFnZWQgYmFj
a2VkLiBXaGVuIHRoZXkgYXJlCj4gICAJCSAqIHNjYW5uZWQgb3V0LCB0aGV5IGFyZSByZW1hcHBl
ZCBpbnRvIERNTS9USUxFUi4KUmV2aWV3ZWQtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGli
bG90QHRpLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
