Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6EAEB80
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B0E6E0B7;
	Tue, 10 Sep 2019 13:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6766E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:27:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRcdW074556;
 Tue, 10 Sep 2019 08:27:38 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRcer080158;
 Tue, 10 Sep 2019 08:27:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:27:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:27:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRbfE035367;
 Tue, 10 Sep 2019 08:27:37 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v6 1/4] leds: Add of_led_get() and led_put()
Date: Tue, 10 Sep 2019 15:27:31 +0200
Message-ID: <20190910132734.9544-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910132734.9544-1-jjhiblot@ti.com>
References: <20190910132734.9544-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568122058;
 bh=88mpiURaZ0Bg8Ua0PPuNeiQeaqUqbzMHmmZqerjgVIE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=V5e2Nbz9ulWefAKKyrmMfNZnf4PbnuwtTtuLj71hBjlbYGW755kipGLjKRAimeJIr
 Mg9CbMOVDbMYUAXys3CIhtA8iVeTmo9yHRjFCAbpipZyVAkC5OCXBO0qfGW7e/yjVC
 1w8TS0AufUYnRm2izLPoO1WDeMkvR4rM31Iapl/A=
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
YwppbmRleCAxNTljNmNhYTM3NGIuLmQ0ZDIyZjRiNTA1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwpAQCAtMTgsNiAr
MTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvdGlt
ZXIuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3VsZWRzLmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KICNpbmNsdWRlICJsZWRzLmgiCiAKIHN0YXRpYyBzdHJ1Y3QgY2xhc3MgKmxlZHNfY2xhc3M7
CkBAIC0yMTMsNiArMjE0LDU1IEBAIHN0YXRpYyBpbnQgbGVkX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhsZWRzX2NsYXNzX2Rldl9wbV9vcHMs
IGxlZF9zdXNwZW5kLCBsZWRfcmVzdW1lKTsKIAorc3RhdGljIGludCBsZWRfbWF0Y2hfbGVkX25v
ZGUoc3RydWN0IGRldmljZSAqbGVkX2RldiwgY29uc3Qgdm9pZCAqZGF0YSkKK3sKKwlyZXR1cm4g
bGVkX2Rldi0+b2Zfbm9kZSA9PSBkYXRhOworfQorCisvKioKKyAqIG9mX2xlZF9nZXQoKSAtIHJl
cXVlc3QgYSBMRUQgZGV2aWNlIHZpYSB0aGUgTEVEIGZyYW1ld29yaworICogQG5wOiBkZXZpY2Ug
bm9kZSB0byBnZXQgdGhlIExFRCBkZXZpY2UgZnJvbQorICogQGluZGV4OiB0aGUgaW5kZXggb2Yg
dGhlIExFRAorICoKKyAqIFJldHVybnMgdGhlIExFRCBkZXZpY2UgcGFyc2VkIGZyb20gdGhlIHBo
YW5kbGUgc3BlY2lmaWVkIGluIHRoZSAibGVkcyIKKyAqIHByb3BlcnR5IG9mIGEgZGV2aWNlIHRy
ZWUgbm9kZSBvciBhIG5lZ2F0aXZlIGVycm9yLWNvZGUgb24gZmFpbHVyZS4KKyAqLworc3RydWN0
IGxlZF9jbGFzc2RldiAqb2ZfbGVkX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5k
ZXgpCit7CisJc3RydWN0IGRldmljZSAqbGVkX2RldjsKKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2ICps
ZWRfY2RldjsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxlZF9ub2RlOworCisJbGVkX25vZGUgPSBv
Zl9wYXJzZV9waGFuZGxlKG5wLCAibGVkcyIsIGluZGV4KTsKKwlpZiAoIWxlZF9ub2RlKQorCQly
ZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsKKworCWxlZF9kZXYgPSBjbGFzc19maW5kX2RldmljZShs
ZWRzX2NsYXNzLCBOVUxMLCBsZWRfbm9kZSwKKwkJbGVkX21hdGNoX2xlZF9ub2RlKTsKKwlvZl9u
b2RlX3B1dChsZWRfbm9kZSk7CisKKwlpZiAoIWxlZF9kZXYpCisJCXJldHVybiBFUlJfUFRSKC1F
UFJPQkVfREVGRVIpOworCisJbGVkX2NkZXYgPSBkZXZfZ2V0X2RydmRhdGEobGVkX2Rldik7CisK
KwlpZiAoIXRyeV9tb2R1bGVfZ2V0KGxlZF9jZGV2LT5kZXYtPnBhcmVudC0+ZHJpdmVyLT5vd25l
cikpCisJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOworCisJcmV0dXJuIGxlZF9jZGV2OworfQor
RVhQT1JUX1NZTUJPTF9HUEwob2ZfbGVkX2dldCk7CisKKy8qKgorICogbGVkX3B1dCgpIC0gcmVs
ZWFzZSBhIExFRCBkZXZpY2UKKyAqIEBsZWRfY2RldjogTEVEIGRldmljZQorICovCit2b2lkIGxl
ZF9wdXQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpCit7CisJbW9kdWxlX3B1dChsZWRf
Y2Rldi0+ZGV2LT5wYXJlbnQtPmRyaXZlci0+b3duZXIpOworfQorRVhQT1JUX1NZTUJPTF9HUEwo
bGVkX3B1dCk7CisKIHN0YXRpYyBpbnQgbWF0Y2hfbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IHZvaWQgKmRhdGEpCiB7CiAJaWYgKCFkZXZfbmFtZShkZXYpKQpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9sZWRzLmggYi9pbmNsdWRlL2xpbnV4L2xlZHMuaAppbmRleCBiZWU4ZTNmOGRk
ZGQuLjBhNzFjN2NkZDE5MSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9sZWRzLmgKKysrIGIv
aW5jbHVkZS9saW51eC9sZWRzLmgKQEAgLTE5LDYgKzE5LDcgQEAKIAogc3RydWN0IGRldmljZTsK
IHN0cnVjdCBsZWRfcGF0dGVybjsKK3N0cnVjdCBkZXZpY2Vfbm9kZTsKIC8qCiAgKiBMRUQgQ29y
ZQogICovCkBAIC0xNDUsNiArMTQ2LDkgQEAgZXh0ZXJuIHZvaWQgZGV2bV9sZWRfY2xhc3NkZXZf
dW5yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCiBleHRlcm4gdm9pZCBsZWRfY2xhc3Nk
ZXZfc3VzcGVuZChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiBleHRlcm4gdm9pZCBs
ZWRfY2xhc3NkZXZfcmVzdW1lKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKIAorZXh0
ZXJuIHN0cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpu
cCwgaW50IGluZGV4KTsKK2V4dGVybiB2b2lkIGxlZF9wdXQoc3RydWN0IGxlZF9jbGFzc2RldiAq
bGVkX2NkZXYpOworCiAvKioKICAqIGxlZF9ibGlua19zZXQgLSBzZXQgYmxpbmtpbmcgd2l0aCBz
b2Z0d2FyZSBmYWxsYmFjawogICogQGxlZF9jZGV2OiB0aGUgTEVEIHRvIHN0YXJ0IGJsaW5raW5n
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
