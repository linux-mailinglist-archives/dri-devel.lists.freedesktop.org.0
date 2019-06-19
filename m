Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3D4C806
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2DA6E50E;
	Thu, 20 Jun 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B48888E37
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 15:21:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 08:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="186488610"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2019 08:21:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BB05D14B; Wed, 19 Jun 2019 18:21:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] backlight: gpio_backlight: Enable ACPI enumeration
Date: Wed, 19 Jun 2019 18:21:27 +0300
Message-Id: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QUNQSSBhbGxvd3MgdG8gZW51bWVyYXRlIHNwZWNpZmljIGRldmljZXMgYnkgdXNpbmcgY29tcGF0
aWJsZSBzdHJpbmdzLgpFbmFibGUgdGhhdCBlbnVtZXJhdGlvbiBmb3IgR1BJTyBiYXNlZCBiYWNr
bGlnaHQgZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggZTQ3MGRhOTVkODA2Li4wNWMxMmRmNjJiMjcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtMTgsNiArMTgsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
YXRhL2dwaW9fYmFja2xpZ2h0Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
CisjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAK
IHN0cnVjdCBncGlvX2JhY2tsaWdodCB7CkBAIC02MSwxMSArNjIsMTAgQEAgc3RhdGljIGludCBn
cGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJ
CSAgIHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQogewogCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKIAll
bnVtIGdwaW9kX2ZsYWdzIGZsYWdzOwogCWludCByZXQ7CiAKLQlnYmwtPmRlZl92YWx1ZSA9IG9m
X3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImRlZmF1bHQtb24iKTsKKwlnYmwtPmRlZl92YWx1ZSA9
IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwogCWZsYWdzID0g
Z2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09VVF9MT1c7CiAKIAlnYmwt
PmdwaW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBmbGFncyk7CkBAIC04OSwyNiArODks
MTkgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKIAlzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Ci0Jc3Ry
dWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCWludCByZXQ7CiAKLQlp
ZiAoIXBkYXRhICYmICFucCkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsCi0JCQkiZmFpbGVkIHRv
IGZpbmQgcGxhdGZvcm0gZGF0YSBvciBkZXZpY2UgdHJlZSBub2RlLlxuIik7Ci0JCXJldHVybiAt
RU5PREVWOwotCX0KLQogCWdibCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmdi
bCksIEdGUF9LRVJORUwpOwogCWlmIChnYmwgPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAK
IAlnYmwtPmRldiA9ICZwZGV2LT5kZXY7CiAKLQlpZiAobnApIHsKKwlpZiAocGRldi0+ZGV2LmZ3
bm9kZSkgewogCQlyZXQgPSBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChwZGV2LCBnYmwpOwogCQlp
ZiAocmV0KQogCQkJcmV0dXJuIHJldDsKLQl9IGVsc2UgeworCX0gZWxzZSBpZiAocGRhdGEpIHsK
IAkJLyoKIAkJICogTGVnYWN5IHBsYXRmb3JtIGRhdGEgR1BJTyByZXRyaWV2ZWFsLiBEbyBub3Qg
ZXhwYW5kCiAJCSAqIHRoZSB1c2Ugb2YgdGhpcyBjb2RlIHBhdGgsIGN1cnJlbnRseSBvbmx5IHVz
ZWQgYnkgb25lCkBAIC0xMjksNiArMTIyLDEwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ2JsLT5ncGlvZCA9IGdwaW9f
dG9fZGVzYyhwZGF0YS0+Z3Bpbyk7CiAJCWlmICghZ2JsLT5ncGlvZCkKIAkJCXJldHVybiAtRUlO
VkFMOworCX0gZWxzZSB7CisJCWRldl9lcnIoJnBkZXYtPmRldiwKKwkJCSJmYWlsZWQgdG8gZmlu
ZCBwbGF0Zm9ybSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKKwkJcmV0dXJuIC1FTk9E
RVY7CiAJfQogCiAJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3BzKSk7CkBAIC0xNDksMTkg
KzE0NiwxNyBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLSNpZmRlZiBDT05GSUdfT0YKIHN0YXRp
YyBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGdwaW9fYmFja2xpZ2h0X29mX21hdGNoW10gPSB7CiAJeyAu
Y29tcGF0aWJsZSA9ICJncGlvLWJhY2tsaWdodCIgfSwKIAl7IC8qIHNlbnRpbmVsICovIH0KIH07
CiAKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGdwaW9fYmFja2xpZ2h0X29mX21hdGNoKTsKLSNl
bmRpZgogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBncGlvX2JhY2tsaWdodF9kcml2
ZXIgPSB7CiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCQk9ICJncGlvLWJhY2tsaWdodCIsCi0JCS5v
Zl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihncGlvX2JhY2tsaWdodF9vZl9tYXRjaCksCisJ
CS5vZl9tYXRjaF90YWJsZSA9IGdwaW9fYmFja2xpZ2h0X29mX21hdGNoLAogCX0sCiAJLnByb2Jl
CQk9IGdwaW9fYmFja2xpZ2h0X3Byb2JlLAogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
