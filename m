Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC72B668A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C106F3D3;
	Wed, 18 Sep 2019 14:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF51E6F3D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:57:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvhG7030891;
 Wed, 18 Sep 2019 09:57:43 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvhPf034516;
 Wed, 18 Sep 2019 09:57:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvg21012827;
 Wed, 18 Sep 2019 09:57:42 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v7 2/5] leds: Add of_led_get() and led_put()
Date: Wed, 18 Sep 2019 16:57:27 +0200
Message-ID: <20190918145730.22805-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918145730.22805-1-jjhiblot@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568818664;
 bh=FW2OvH18itsvE6UAtDakYRqQG2wDJZRYT9jmsjwMxCQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ISNJEmG1QANm/MzdWIWF0ndFcJQPjmCDXbuBj17aL5fxcDXNtPCHdUVis9ykGtIC8
 V9w4AbtLrtbZy8pI6qBTzlMiXQf5iUhDiMVV/3GbaSdpP7iDCTe03pYrp0oGp9BLQ6
 8IbBF9VK72/TAY6Xm6rTEgSow/QXN7Gz5j3IjAYg=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, jjhiblot@ti.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClRoaXMgcGF0Y2gg
YWRkcyBiYXNpYyBzdXBwb3J0IGZvciBhIGtlcm5lbCBkcml2ZXIgdG8gZ2V0IGEgTEVEIGRldmlj
ZS4KVGhpcyB3aWxsIGJlIHVzZWQgYnkgdGhlIGxlZC1iYWNrbGlnaHQgZHJpdmVyLgoKT25seSBP
RiB2ZXJzaW9uIGlzIGltcGxlbWVudGVkIGZvciBub3csIGFuZCB0aGUgYmVoYXZpb3IgaXMgc2lt
aWxhciB0bwpQV00ncyBvZl9wd21fZ2V0KCkgYW5kIHB3bV9wdXQoKS4KClNpZ25lZC1vZmYtYnk6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEpl
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hl
ayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyB8IDUwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5o
ICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3Mu
YwppbmRleCBjMjE2N2I2NmI2MWYuLjJiOGYyMGY5NDEyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwpAQCAtMTksNiAr
MTksNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvdGlt
ZXIuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3VsZWRzLmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KICNpbmNsdWRlICJsZWRzLmgiCiAKIHN0YXRpYyBzdHJ1Y3QgY2xhc3MgKmxlZHNfY2xhc3M7
CkBAIC0yMTQsNiArMjE1LDU1IEBAIHN0YXRpYyBpbnQgbGVkX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhsZWRzX2NsYXNzX2Rldl9wbV9vcHMs
IGxlZF9zdXNwZW5kLCBsZWRfcmVzdW1lKTsKIAorc3RhdGljIGludCBsZWRfbWF0Y2hfbGVkX29m
X25vZGUoc3RydWN0IGRldmljZSAqbGVkX2RldiwgY29uc3Qgdm9pZCAqZGF0YSkKK3sKKwlyZXR1
cm4gbGVkX2Rldi0+b2Zfbm9kZSA9PSBkYXRhOworfQorCisvKioKKyAqIG9mX2xlZF9nZXQoKSAt
IHJlcXVlc3QgYSBMRUQgZGV2aWNlIHZpYSB0aGUgTEVEIGZyYW1ld29yaworICogQG5wOiBkZXZp
Y2Ugbm9kZSB0byBnZXQgdGhlIExFRCBkZXZpY2UgZnJvbQorICogQGluZGV4OiB0aGUgaW5kZXgg
b2YgdGhlIExFRAorICoKKyAqIFJldHVybnMgdGhlIExFRCBkZXZpY2UgcGFyc2VkIGZyb20gdGhl
IHBoYW5kbGUgc3BlY2lmaWVkIGluIHRoZSAibGVkcyIKKyAqIHByb3BlcnR5IG9mIGEgZGV2aWNl
IHRyZWUgbm9kZSBvciBhIG5lZ2F0aXZlIGVycm9yLWNvZGUgb24gZmFpbHVyZS4KKyAqLworc3Ry
dWN0IGxlZF9jbGFzc2RldiAqb2ZfbGVkX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQg
aW5kZXgpCit7CisJc3RydWN0IGRldmljZSAqbGVkX2RldjsKKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2
ICpsZWRfY2RldjsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxlZF9ub2RlOworCisJbGVkX25vZGUg
PSBvZl9wYXJzZV9waGFuZGxlKG5wLCAibGVkcyIsIGluZGV4KTsKKwlpZiAoIWxlZF9ub2RlKQor
CQlyZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKKworCWxlZF9kZXYgPSBjbGFzc19maW5kX2Rldmlj
ZShsZWRzX2NsYXNzLCBOVUxMLCBsZWRfbm9kZSwKKwkJbGVkX21hdGNoX2xlZF9vZl9ub2RlKTsK
KwlvZl9ub2RlX3B1dChsZWRfbm9kZSk7CisKKwlpZiAoIWxlZF9kZXYpCisJCXJldHVybiBFUlJf
UFRSKC1FUFJPQkVfREVGRVIpOworCisJbGVkX2NkZXYgPSBkZXZfZ2V0X2RydmRhdGEobGVkX2Rl
dik7CisKKwlpZiAoIXRyeV9tb2R1bGVfZ2V0KGxlZF9jZGV2LT5kZXYtPnBhcmVudC0+ZHJpdmVy
LT5vd25lcikpCisJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOworCisJcmV0dXJuIGxlZF9jZGV2
OworfQorRVhQT1JUX1NZTUJPTF9HUEwob2ZfbGVkX2dldCk7CisKKy8qKgorICogbGVkX3B1dCgp
IC0gcmVsZWFzZSBhIExFRCBkZXZpY2UKKyAqIEBsZWRfY2RldjogTEVEIGRldmljZQorICovCit2
b2lkIGxlZF9wdXQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpCit7CisJbW9kdWxlX3B1
dChsZWRfY2Rldi0+ZGV2LT5wYXJlbnQtPmRyaXZlci0+b3duZXIpOworfQorRVhQT1JUX1NZTUJP
TF9HUEwobGVkX3B1dCk7CisKIHN0YXRpYyBpbnQgbGVkX2NsYXNzZGV2X25leHRfbmFtZShjb25z
dCBjaGFyICppbml0X25hbWUsIGNoYXIgKm5hbWUsCiAJCQkJICBzaXplX3QgbGVuKQogewpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sZWRzLmggYi9pbmNsdWRlL2xpbnV4L2xlZHMuaAppbmRl
eCBiOGRmNzExOTMzMjkuLjZmNzM3MWJjNzc1NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9s
ZWRzLmgKKysrIGIvaW5jbHVkZS9saW51eC9sZWRzLmgKQEAgLTIwLDYgKzIwLDcgQEAKIAogc3Ry
dWN0IGRldmljZTsKIHN0cnVjdCBsZWRfcGF0dGVybjsKK3N0cnVjdCBkZXZpY2Vfbm9kZTsKIC8q
CiAgKiBMRUQgQ29yZQogICovCkBAIC0xOTYsNiArMTk3LDkgQEAgZXh0ZXJuIHZvaWQgZGV2bV9s
ZWRfY2xhc3NkZXZfdW5yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCiBleHRlcm4gdm9p
ZCBsZWRfY2xhc3NkZXZfc3VzcGVuZChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiBl
eHRlcm4gdm9pZCBsZWRfY2xhc3NkZXZfcmVzdW1lKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9j
ZGV2KTsKIAorZXh0ZXJuIHN0cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRl
dmljZV9ub2RlICpucCwgaW50IGluZGV4KTsKK2V4dGVybiB2b2lkIGxlZF9wdXQoc3RydWN0IGxl
ZF9jbGFzc2RldiAqbGVkX2NkZXYpOworCiAvKioKICAqIGxlZF9ibGlua19zZXQgLSBzZXQgYmxp
bmtpbmcgd2l0aCBzb2Z0d2FyZSBmYWxsYmFjawogICogQGxlZF9jZGV2OiB0aGUgTEVEIHRvIHN0
YXJ0IGJsaW5raW5nCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
