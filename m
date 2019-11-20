Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2BC104CFE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651496EB5D;
	Thu, 21 Nov 2019 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B906E117
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 09:57:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="204685531"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2019 01:57:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9602F250; Wed, 20 Nov 2019 11:57:17 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 devel@driverdev.osuosl.org
Subject: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
Date: Wed, 20 Nov 2019 11:57:14 +0200
Message-Id: <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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

Rmlyc3Qgb2YgYWxsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZ3VhcmQgR1BJTyByZXF1ZXN0IGJ5IENP
TkZJR19PRi4KSXQgd29ya3MgZm9yIGV2ZXJ5Ym9keSBpbmRlcGVuZGVudGx5IG9uIHJlc291cmNl
IHByb3ZpZGVyLiBXaGlsZSBoZXJlLApyZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIHJlZmxlY3QgdGhl
IGFib3ZlLgoKTW9yZW92ZXIsIHNpbmNlIHdlIGhhdmUgYSBnbG9iYWwgZGVwZW5kZW5jeSB0byBP
RiwgdGhlIHJlc3Qgb2YKY29uZGl0aW9uYWwgY29tcGlsYXRpb24gaXMgbm8tb3AsIGkuZS4gaXQn
cyBhbHdheXMgYmUgdHJ1ZS4KCkR1ZSB0byBhYm92ZSBkcm9wIHVzZWxlc3MgI2lmZGVmIENPTkZJ
R19PRiBhbmQgdGhlcmVmb3JlIGRlYWQgY29kZS4KClNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L2ZidGZ0LWNvcmUuYwppbmRleCAyMTIyYzQ0MDdiZGIuLmZmOGNiNjY3MGVhMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCkBAIC03MCw3ICs3MCw2IEBAIHZvaWQgZmJ0ZnRfZGJnX2hl
eChjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBncm91cHNpemUsCiB9CiBFWFBPUlRfU1lN
Qk9MKGZidGZ0X2RiZ19oZXgpOwogCi0jaWZkZWYgQ09ORklHX09GCiBzdGF0aWMgaW50IGZidGZ0
X3JlcXVlc3Rfb25lX2dwaW8oc3RydWN0IGZidGZ0X3BhciAqcGFyLAogCQkJCSAgY29uc3QgY2hh
ciAqbmFtZSwgaW50IGluZGV4LAogCQkJCSAgc3RydWN0IGdwaW9fZGVzYyAqKmdwaW9wKQpAQCAt
OTIsMTQgKzkxLDExIEBAIHN0YXRpYyBpbnQgZmJ0ZnRfcmVxdWVzdF9vbmVfZ3BpbyhzdHJ1Y3Qg
ZmJ0ZnRfcGFyICpwYXIsCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBmYnRmdF9yZXF1
ZXN0X2dwaW9zX2R0KHN0cnVjdCBmYnRmdF9wYXIgKnBhcikKK3N0YXRpYyBpbnQgZmJ0ZnRfcmVx
dWVzdF9ncGlvcyhzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIpCiB7CiAJaW50IGk7CiAJaW50IHJldDsK
IAotCWlmICghcGFyLT5pbmZvLT5kZXZpY2UtPm9mX25vZGUpCi0JCXJldHVybiAtRUlOVkFMOwot
CiAJcmV0ID0gZmJ0ZnRfcmVxdWVzdF9vbmVfZ3BpbyhwYXIsICJyZXNldCIsIDAsICZwYXItPmdw
aW8ucmVzZXQpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CkBAIC0xMzUsNyArMTMxLDYgQEAg
c3RhdGljIGludCBmYnRmdF9yZXF1ZXN0X2dwaW9zX2R0KHN0cnVjdCBmYnRmdF9wYXIgKnBhcikK
IAogCXJldHVybiAwOwogfQotI2VuZGlmCiAKICNpZmRlZiBDT05GSUdfRkJfQkFDS0xJR0hUCiBz
dGF0aWMgaW50IGZidGZ0X2JhY2tsaWdodF91cGRhdGVfc3RhdHVzKHN0cnVjdCBiYWNrbGlnaHRf
ZGV2aWNlICpiZCkKQEAgLTg5OCw3ICs4OTMsNiBAQCBpbnQgZmJ0ZnRfdW5yZWdpc3Rlcl9mcmFt
ZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIH0KIEVYUE9SVF9TWU1CT0woZmJ0ZnRf
dW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcik7CiAKLSNpZmRlZiBDT05GSUdfT0YKIC8qKgogICogZmJ0
ZnRfaW5pdF9kaXNwbGF5X2R0KCkgLSBEZXZpY2UgVHJlZSBpbml0X2Rpc3BsYXkoKSBmdW5jdGlv
bgogICogQHBhcjogRHJpdmVyIGRhdGEKQEAgLTk3Nyw3ICs5NzEsNiBAQCBzdGF0aWMgaW50IGZi
dGZ0X2luaXRfZGlzcGxheV9kdChzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIpCiAKIAlyZXR1cm4gMDsK
IH0KLSNlbmRpZgogCiAvKioKICAqIGZidGZ0X2luaXRfZGlzcGxheSgpIC0gR2VuZXJpYyBpbml0
X2Rpc3BsYXkoKSBmdW5jdGlvbgpAQCAtMTEzOCw3ICsxMTMxLDYgQEAgc3RhdGljIGludCBmYnRm
dF92ZXJpZnlfZ3Bpb3Moc3RydWN0IGZidGZ0X3BhciAqcGFyKQogCXJldHVybiAwOwogfQogCi0j
aWZkZWYgQ09ORklHX09GCiAvKiByZXR1cm5zIDAgaWYgdGhlIHByb3BlcnR5IGlzIG5vdCBwcmVz
ZW50ICovCiBzdGF0aWMgdTMyIGZidGZ0X29mX3ZhbHVlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSwgY29uc3QgY2hhciAqcHJvcG5hbWUpCiB7CkBAIC0xMTg0LDE3ICsxMTc2LDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgZmJ0ZnRfcGxhdGZvcm1fZGF0YSAqZmJ0ZnRfcHJvYmVfZHQoc3RydWN0IGRldmlj
ZSAqZGV2KQogCQlwZGF0YS0+ZGlzcGxheS5iYWNrbGlnaHQgPSAxOwogCWlmIChvZl9maW5kX3By
b3BlcnR5KG5vZGUsICJpbml0IiwgTlVMTCkpCiAJCXBkYXRhLT5kaXNwbGF5LmZidGZ0b3BzLmlu
aXRfZGlzcGxheSA9IGZidGZ0X2luaXRfZGlzcGxheV9kdDsKLQlwZGF0YS0+ZGlzcGxheS5mYnRm
dG9wcy5yZXF1ZXN0X2dwaW9zID0gZmJ0ZnRfcmVxdWVzdF9ncGlvc19kdDsKKwlwZGF0YS0+ZGlz
cGxheS5mYnRmdG9wcy5yZXF1ZXN0X2dwaW9zID0gZmJ0ZnRfcmVxdWVzdF9ncGlvczsKIAogCXJl
dHVybiBwZGF0YTsKIH0KLSNlbHNlCi1zdGF0aWMgc3RydWN0IGZidGZ0X3BsYXRmb3JtX2RhdGEg
KmZidGZ0X3Byb2JlX2R0KHN0cnVjdCBkZXZpY2UgKmRldikKLXsKLQlkZXZfZXJyKGRldiwgIk1p
c3NpbmcgcGxhdGZvcm0gZGF0YVxuIik7Ci0JcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Ci19Ci0j
ZW5kaWYKIAogLyoqCiAgKiBmYnRmdF9wcm9iZV9jb21tb24oKSAtIEdlbmVyaWMgZGV2aWNlIHBy
b2JlKCkgaGVscGVyIGZ1bmN0aW9uCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
