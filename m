Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6435B08F6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 08:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CDD6EA4C;
	Thu, 12 Sep 2019 06:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAD76EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 06:42:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19F42AD4B;
 Thu, 12 Sep 2019 06:42:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 kraxel@redhat.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2 2/3] drm/mgag200: Rename constant MGAREG_Status to
 MGAREG_STATUS
Date: Thu, 12 Sep 2019 08:42:29 +0200
Message-Id: <20190912064230.27972-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912064230.27972-1-tzimmermann@suse.de>
References: <20190912064230.27972-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVnaXN0ZXIgY29uc3RhbnRzIGFyZSB1cHBlciBjYXNlLiBGaXggTUdBUkVHX1N0YXR1cyBhY2Nv
cmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgNiAr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmggIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwppbmRleCA1ZTc3OGI1ZjFhMTAuLjMwMmJhNDBlYjAz
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKQEAgLTc5LDEyICs3OSwx
MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbWdhX3dhaXRfdnN5bmMoc3RydWN0IG1nYV9kZXZpY2Ug
Km1kZXYpCiAJdW5zaWduZWQgaW50IHN0YXR1cyA9IDA7CiAKIAlkbyB7Ci0JCXN0YXR1cyA9IFJS
RUczMihNR0FSRUdfU3RhdHVzKTsKKwkJc3RhdHVzID0gUlJFRzMyKE1HQVJFR19TVEFUVVMpOwog
CX0gd2hpbGUgKChzdGF0dXMgJiAweDA4KSAmJiB0aW1lX2JlZm9yZShqaWZmaWVzLCB0aW1lb3V0
KSk7CiAJdGltZW91dCA9IGppZmZpZXMgKyBIWi8xMDsKIAlzdGF0dXMgPSAwOwogCWRvIHsKLQkJ
c3RhdHVzID0gUlJFRzMyKE1HQVJFR19TdGF0dXMpOworCQlzdGF0dXMgPSBSUkVHMzIoTUdBUkVH
X1NUQVRVUyk7CiAJfSB3aGlsZSAoIShzdGF0dXMgJiAweDA4KSAmJiB0aW1lX2JlZm9yZShqaWZm
aWVzLCB0aW1lb3V0KSk7CiB9CiAKQEAgLTkzLDcgKzkzLDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IG1nYV93YWl0X2J1c3koc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpCiAJdW5zaWduZWQgbG9uZyB0
aW1lb3V0ID0gamlmZmllcyArIEhaOwogCXVuc2lnbmVkIGludCBzdGF0dXMgPSAwOwogCWRvIHsK
LQkJc3RhdHVzID0gUlJFRzgoTUdBUkVHX1N0YXR1cyArIDIpOworCQlzdGF0dXMgPSBSUkVHOChN
R0FSRUdfU1RBVFVTICsgMik7CiAJfSB3aGlsZSAoKHN0YXR1cyAmIDB4MDEpICYmIHRpbWVfYmVm
b3JlKGppZmZpZXMsIHRpbWVvdXQpKTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
cmVnLmgKaW5kZXggYzA5NmE5ZDZiY2JjLi42YzQ2MGQ5YTIxNDMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9yZWcuaApAQCAtMTAxLDcgKzEwMSw3IEBACiAjZGVmaW5lIE1HQVJFR19F
WEVDCQkweDAxMDAKIAogI2RlZmluZQlNR0FSRUdfRklGT1NUQVRVUwkweDFlMTAKLSNkZWZpbmUJ
TUdBUkVHX1N0YXR1cwkJMHgxZTE0CisjZGVmaW5lCU1HQVJFR19TVEFUVVMJCTB4MWUxNAogI2Rl
ZmluZSBNR0FSRUdfQ0FDSEVGTFVTSCAgICAgICAweDFmZmYKICNkZWZpbmUJTUdBUkVHX0lDTEVB
UgkJMHgxZTE4CiAjZGVmaW5lCU1HQVJFR19JRU4JCTB4MWUxYwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
