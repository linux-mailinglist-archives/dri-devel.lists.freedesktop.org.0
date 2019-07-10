Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F46465C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCD589745;
	Wed, 10 Jul 2019 12:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4D289745
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:39:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdddj125377;
 Wed, 10 Jul 2019 07:39:39 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACddbl080923
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jul 2019 07:39:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdc9P071864;
 Wed, 10 Jul 2019 07:39:38 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v3 1/4] leds: Add of_led_get() and led_put()
Date: Wed, 10 Jul 2019 14:39:29 +0200
Message-ID: <20190710123932.28244-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710123932.28244-1-jjhiblot@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562762379;
 bh=nU97vt4bCNmMA9ZfacNjLitUhnqsxdeLpbW/G535FUs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=nt+FSnlezL9wtBvqQeSS6MVK33FJ6jGj3Az6wVgbgJRkoyz5ioF6pyG5nuffASu5z
 wgWR7z3N8T6BwVR/GXV1o8TxDj8cf1mrmlmhqRF1k5/8cY91j8PjlW9Qo960VPUSXJ
 IP11bvSVIuev/jLmcDwFLmgRd3weF25O6ryMeJnQ=
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
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
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
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBkcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L2xlZHMuaCAgICAgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgYi9kcml2
ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggZTAxYjJkOTgyNTY0Li4wZjY3YjEzYjBmMWYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMKQEAgLTE5LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC90aW1lci5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPHVhcGkvbGludXgv
dWxlZHMuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgImxlZHMuaCIKIAogc3Rh
dGljIHN0cnVjdCBjbGFzcyAqbGVkc19jbGFzczsKQEAgLTIxNCw2ICsyMTUsNTUgQEAgc3RhdGlj
IGludCBsZWRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAogc3RhdGljIFNJTVBMRV9ERVZf
UE1fT1BTKGxlZHNfY2xhc3NfZGV2X3BtX29wcywgbGVkX3N1c3BlbmQsIGxlZF9yZXN1bWUpOwog
CitzdGF0aWMgaW50IGxlZF9tYXRjaF9sZWRfbm9kZShzdHJ1Y3QgZGV2aWNlICpsZWRfZGV2LCBj
b25zdCB2b2lkICpkYXRhKQoreworCXJldHVybiBsZWRfZGV2LT5vZl9ub2RlID09IGRhdGEgPyAx
IDogMDsKK30KKworLyoqCisgKiBvZl9sZWRfZ2V0KCkgLSByZXF1ZXN0IGEgTEVEIGRldmljZSB2
aWEgdGhlIExFRCBmcmFtZXdvcmsKKyAqIEBucDogZGV2aWNlIG5vZGUgdG8gZ2V0IHRoZSBMRUQg
ZGV2aWNlIGZyb20KKyAqIEBpbmRleDogdGhlIGluZGV4IG9mIHRoZSBMRUQKKyAqCisgKiBSZXR1
cm5zIHRoZSBMRUQgZGV2aWNlIHBhcnNlZCBmcm9tIHRoZSBwaGFuZGxlIHNwZWNpZmllZCBpbiB0
aGUgImxlZHMiCisgKiBwcm9wZXJ0eSBvZiBhIGRldmljZSB0cmVlIG5vZGUgb3IgYSBuZWdhdGl2
ZSBlcnJvci1jb2RlIG9uIGZhaWx1cmUuCisgKi8KK3N0cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xl
ZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50IGluZGV4KQoreworCXN0cnVjdCBkZXZp
Y2UgKmxlZF9kZXY7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXY7CisJc3RydWN0IGRl
dmljZV9ub2RlICpsZWRfbm9kZTsKKworCWxlZF9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwg
ImxlZHMiLCBpbmRleCk7CisJaWYgKCFsZWRfbm9kZSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VO
VCk7CisKKwlsZWRfZGV2ID0gY2xhc3NfZmluZF9kZXZpY2UobGVkc19jbGFzcywgTlVMTCwgbGVk
X25vZGUsCisJCWxlZF9tYXRjaF9sZWRfbm9kZSk7CisJb2Zfbm9kZV9wdXQobGVkX25vZGUpOwor
CisJaWYgKCFsZWRfZGV2KQorCQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKKworCWxl
ZF9jZGV2ID0gZGV2X2dldF9kcnZkYXRhKGxlZF9kZXYpOworCisJaWYgKCF0cnlfbW9kdWxlX2dl
dChsZWRfY2Rldi0+ZGV2LT5wYXJlbnQtPmRyaXZlci0+b3duZXIpKQorCQlyZXR1cm4gRVJSX1BU
UigtRU5PREVWKTsKKworCXJldHVybiBsZWRfY2RldjsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKG9m
X2xlZF9nZXQpOworCisvKioKKyAqIGxlZF9wdXQoKSAtIHJlbGVhc2UgYSBMRUQgZGV2aWNlCisg
KiBAbGVkX2NkZXY6IExFRCBkZXZpY2UKKyAqLwordm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xh
c3NkZXYgKmxlZF9jZGV2KQoreworCW1vZHVsZV9wdXQobGVkX2NkZXYtPmRldi0+cGFyZW50LT5k
cml2ZXItPm93bmVyKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGxlZF9wdXQpOworCiBzdGF0aWMg
aW50IG1hdGNoX25hbWUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpkYXRhKQogewog
CWlmICghZGV2X25hbWUoZGV2KSkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGVkcy5oIGIv
aW5jbHVkZS9saW51eC9sZWRzLmgKaW5kZXggYmVlOGUzZjhkZGRkLi4wYTcxYzdjZGQxOTEgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbGVkcy5oCisrKyBiL2luY2x1ZGUvbGludXgvbGVkcy5o
CkBAIC0xOSw2ICsxOSw3IEBACiAKIHN0cnVjdCBkZXZpY2U7CiBzdHJ1Y3QgbGVkX3BhdHRlcm47
CitzdHJ1Y3QgZGV2aWNlX25vZGU7CiAvKgogICogTEVEIENvcmUKICAqLwpAQCAtMTQ1LDYgKzE0
Niw5IEBAIGV4dGVybiB2b2lkIGRldm1fbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoc3RydWN0IGRl
dmljZSAqcGFyZW50LAogZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3N1c3BlbmQoc3RydWN0IGxl
ZF9jbGFzc2RldiAqbGVkX2NkZXYpOwogZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3Jlc3VtZShz
dHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiAKK2V4dGVybiBzdHJ1Y3QgbGVkX2NsYXNz
ZGV2ICpvZl9sZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7CitleHRl
cm4gdm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKKwogLyoqCiAg
KiBsZWRfYmxpbmtfc2V0IC0gc2V0IGJsaW5raW5nIHdpdGggc29mdHdhcmUgZmFsbGJhY2sKICAq
IEBsZWRfY2RldjogdGhlIExFRCB0byBzdGFydCBibGlua2luZwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
