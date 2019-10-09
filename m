Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10AD0A2F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000DD89D30;
	Wed,  9 Oct 2019 08:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D538967F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:51:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pj9p016803;
 Wed, 9 Oct 2019 03:51:45 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998pjD2073296
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 03:51:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998ph4L099088;
 Wed, 9 Oct 2019 03:51:44 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v10 2/6] leds: Add of_led_get() and led_put()
Date: Wed, 9 Oct 2019 10:51:23 +0200
Message-ID: <20191009085127.22843-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570611105;
 bh=FR+nvrSZgWMXntW2XMWvjmlcw8r7jN30c+jRxIX64OA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=s/g71kTwPC1ghewOl8Z6WeV+GKMOtPKEOgLgRCmTFAssdJ/Vhi1AfB9CVgrbT/JlD
 qVn8VxEqS3n4FV+0yHih9A9q80IEUyzfEMO9ahHc5tvXpQpsU2T36rt+k104UQZmFu
 MlCK3oLXa24LcyEn+GXqukGEMBzylvk5pS5QM+PM=
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
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hl
ayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyB8IDUwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5o
ICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3Mu
YwppbmRleCBiZmExYjEwMzMyNzQuLjFkMWYxZDU0NmRjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwpAQCAtMTksNiAr
MTksNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvdGlt
ZXIuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3VsZWRzLmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KICNpbmNsdWRlICJsZWRzLmgiCiAKIHN0YXRpYyBzdHJ1Y3QgY2xhc3MgKmxlZHNfY2xhc3M7
CkBAIC0yMTQsNiArMjE1LDU1IEBAIHN0YXRpYyBpbnQgbGVkX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhsZWRzX2NsYXNzX2Rldl9wbV9vcHMs
IGxlZF9zdXNwZW5kLCBsZWRfcmVzdW1lKTsKIAorLyoqCisgKiBvZl9sZWRfZ2V0KCkgLSByZXF1
ZXN0IGEgTEVEIGRldmljZSB2aWEgdGhlIExFRCBmcmFtZXdvcmsKKyAqIEBucDogZGV2aWNlIG5v
ZGUgdG8gZ2V0IHRoZSBMRUQgZGV2aWNlIGZyb20KKyAqIEBpbmRleDogdGhlIGluZGV4IG9mIHRo
ZSBMRUQKKyAqCisgKiBSZXR1cm5zIHRoZSBMRUQgZGV2aWNlIHBhcnNlZCBmcm9tIHRoZSBwaGFu
ZGxlIHNwZWNpZmllZCBpbiB0aGUgImxlZHMiCisgKiBwcm9wZXJ0eSBvZiBhIGRldmljZSB0cmVl
IG5vZGUgb3IgYSBuZWdhdGl2ZSBlcnJvci1jb2RlIG9uIGZhaWx1cmUuCisgKi8KK3N0cnVjdCBs
ZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50IGluZGV4
KQoreworCXN0cnVjdCBkZXZpY2UgKmxlZF9kZXY7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqbGVk
X2NkZXY7CisJc3RydWN0IGRldmljZV9ub2RlICpsZWRfbm9kZTsKKworCS8qIE5vdCB1c2luZyBk
ZXZpY2UgdHJlZT8gKi8KKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX09GKSkKKwkJcmV0dXJuIEVS
Ul9QVFIoLUVOT1RTVVBQKTsKKwlpZiAoIW5wKQorCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsK
KworCWxlZF9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImxlZHMiLCBpbmRleCk7CisJaWYg
KCFsZWRfbm9kZSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7CisKKwlsZWRfZGV2ID0gY2xh
c3NfZmluZF9kZXZpY2VfYnlfb2Zfbm9kZShsZWRzX2NsYXNzLCBsZWRfbm9kZSk7CisJb2Zfbm9k
ZV9wdXQobGVkX25vZGUpOworCisJaWYgKCFsZWRfZGV2KQorCQlyZXR1cm4gRVJSX1BUUigtRVBS
T0JFX0RFRkVSKTsKKworCWxlZF9jZGV2ID0gZGV2X2dldF9kcnZkYXRhKGxlZF9kZXYpOworCisJ
aWYgKCF0cnlfbW9kdWxlX2dldChsZWRfY2Rldi0+ZGV2LT5wYXJlbnQtPmRyaXZlci0+b3duZXIp
KQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKKworCXJldHVybiBsZWRfY2RldjsKK30KK0VY
UE9SVF9TWU1CT0xfR1BMKG9mX2xlZF9nZXQpOworCisvKioKKyAqIGxlZF9wdXQoKSAtIHJlbGVh
c2UgYSBMRUQgZGV2aWNlCisgKiBAbGVkX2NkZXY6IExFRCBkZXZpY2UKKyAqLwordm9pZCBsZWRf
cHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQoreworCW1vZHVsZV9wdXQobGVkX2Nk
ZXYtPmRldi0+cGFyZW50LT5kcml2ZXItPm93bmVyKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGxl
ZF9wdXQpOworCiBzdGF0aWMgaW50IGxlZF9jbGFzc2Rldl9uZXh0X25hbWUoY29uc3QgY2hhciAq
aW5pdF9uYW1lLCBjaGFyICpuYW1lLAogCQkJCSAgc2l6ZV90IGxlbikKIHsKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbGVkcy5oIGIvaW5jbHVkZS9saW51eC9sZWRzLmgKaW5kZXggYjhkZjcx
MTkzMzI5Li42ZjczNzFiYzc3NTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbGVkcy5oCisr
KyBiL2luY2x1ZGUvbGludXgvbGVkcy5oCkBAIC0yMCw2ICsyMCw3IEBACiAKIHN0cnVjdCBkZXZp
Y2U7CiBzdHJ1Y3QgbGVkX3BhdHRlcm47CitzdHJ1Y3QgZGV2aWNlX25vZGU7CiAvKgogICogTEVE
IENvcmUKICAqLwpAQCAtMTk2LDYgKzE5Nyw5IEBAIGV4dGVybiB2b2lkIGRldm1fbGVkX2NsYXNz
ZGV2X3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAogZXh0ZXJuIHZvaWQgbGVkX2Ns
YXNzZGV2X3N1c3BlbmQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpOwogZXh0ZXJuIHZv
aWQgbGVkX2NsYXNzZGV2X3Jlc3VtZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiAK
K2V4dGVybiBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpvZl9sZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAsIGludCBpbmRleCk7CitleHRlcm4gdm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3Nk
ZXYgKmxlZF9jZGV2KTsKKwogLyoqCiAgKiBsZWRfYmxpbmtfc2V0IC0gc2V0IGJsaW5raW5nIHdp
dGggc29mdHdhcmUgZmFsbGJhY2sKICAqIEBsZWRfY2RldjogdGhlIExFRCB0byBzdGFydCBibGlu
a2luZwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
