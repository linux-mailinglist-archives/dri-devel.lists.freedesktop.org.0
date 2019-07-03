Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA95F3B1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98B26E2B0;
	Thu,  4 Jul 2019 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jul 2019 22:10:08 UTC
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1AD6E20F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 22:10:08 +0000 (UTC)
Received: from sdf.org (IDENT:coypu@otaku.freeshell.org [205.166.94.9])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id x63M2xPA006593
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits) verified NO)
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Jul 2019 22:02:59 GMT
Received: (from coypu@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id x63M2xGP018951
 for dri-devel@lists.freedesktop.org; Wed, 3 Jul 2019 22:02:59 GMT
Date: Wed, 3 Jul 2019 22:02:59 +0000
From: Maya Rashish <coypu@sdf.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] Drop unused return value to build_power_updown_phy
Message-ID: <20190703220259.GA17999@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
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

LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNyArKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDA5ODRiOWEzNGQ1NS4uNTE0ZWY0ZWIzZjQy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTc4MCw3ICs3ODAsNyBA
QCBzdGF0aWMgaW50IGJ1aWxkX2FsbG9jYXRlX3BheWxvYWQoc3RydWN0IGRybV9kcF9zaWRlYmFu
ZF9tc2dfdHggKm1zZywgaW50IHBvcnRfbgogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGJ1
aWxkX3Bvd2VyX3VwZG93bl9waHkoc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKm1zZywK
K3N0YXRpYyB2b2lkIGJ1aWxkX3Bvd2VyX3VwZG93bl9waHkoc3RydWN0IGRybV9kcF9zaWRlYmFu
ZF9tc2dfdHggKm1zZywKIAkJCQkgIGludCBwb3J0X251bSwgYm9vbCBwb3dlcl91cCkKIHsKIAlz
dHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSByZXE7CkBAIC03OTMsNyArNzkzLDYg
QEAgc3RhdGljIGludCBidWlsZF9wb3dlcl91cGRvd25fcGh5KHN0cnVjdCBkcm1fZHBfc2lkZWJh
bmRfbXNnX3R4ICptc2csCiAJcmVxLnUucG9ydF9udW0ucG9ydF9udW1iZXIgPSBwb3J0X251bTsK
IAlkcm1fZHBfZW5jb2RlX3NpZGViYW5kX3JlcSgmcmVxLCBtc2cpOwogCW1zZy0+cGF0aF9tc2cg
PSB0cnVlOwotCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IGRybV9kcF9tc3RfYXNzaWduX3Bh
eWxvYWRfaWQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCkBAIC0yMjEyLDcg
KzIyMTEsNyBAQCBpbnQgZHJtX2RwX3NlbmRfcG93ZXJfdXBkb3duX3BoeShzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCQkgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9y
dCwgYm9vbCBwb3dlcl91cCkKIHsKIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ190eCAqdHht
c2c7Ci0JaW50IGxlbiwgcmV0OworCWludCByZXQ7CiAKIAlwb3J0ID0gZHJtX2RwX21zdF90b3Bv
bG9neV9nZXRfcG9ydF92YWxpZGF0ZWQobWdyLCBwb3J0KTsKIAlpZiAoIXBvcnQpCkBAIC0yMjI1
LDcgKzIyMjQsNyBAQCBpbnQgZHJtX2RwX3NlbmRfcG93ZXJfdXBkb3duX3BoeShzdHJ1Y3QgZHJt
X2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAl9CiAKIAl0eG1zZy0+ZHN0ID0gcG9ydC0+cGFy
ZW50OwotCWxlbiA9IGJ1aWxkX3Bvd2VyX3VwZG93bl9waHkodHhtc2csIHBvcnQtPnBvcnRfbnVt
LCBwb3dlcl91cCk7CisJYnVpbGRfcG93ZXJfdXBkb3duX3BoeSh0eG1zZywgcG9ydC0+cG9ydF9u
dW0sIHBvd2VyX3VwKTsKIAlkcm1fZHBfcXVldWVfZG93bl90eChtZ3IsIHR4bXNnKTsKIAogCXJl
dCA9IGRybV9kcF9tc3Rfd2FpdF90eF9yZXBseShwb3J0LT5wYXJlbnQsIHR4bXNnKTsKLS0gCjIu
MTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
