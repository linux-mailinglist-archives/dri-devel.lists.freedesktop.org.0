Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366361AF7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B00899EA;
	Mon,  8 Jul 2019 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD676E486
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 11:24:59 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D3D5D6788578AE1B141F;
 Fri,  5 Jul 2019 19:24:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 5 Jul 2019 19:24:48 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <imre.deak@intel.com>, <dhinakaran.pandiyan@intel.com>,
 <ville.syrjala@linux.intel.com>, <chris@chris-wilson.co.uk>,
 <manasi.d.navare@intel.com>
Subject: [PATCH -next] drm/i915: Remove set but not used variable 'encoder'
Date: Fri, 5 Jul 2019 11:31:12 +0000
Message-ID: <20190705113112.64715-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiAnaW50ZWxfZHBfc2V0
X2RycnNfc3RhdGUnOgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6NjYy
MzoyNDogd2FybmluZzoKIHZhcmlhYmxlICdlbmNvZGVyJyBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQncyBuZXZlciB1c2VkLCBzbyBjYW4gYmUgcmVtb3Zl
ZC5BbHNvIHJlbW92ZSByZWxhdGVkCnZhcmlhYmxlICdkaWdfcG9ydCcKClNpZ25lZC1vZmYtYnk6
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggOGY3
MTg4ZDcxZDA4Li4wYmRiN2VjYzVhODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKQEAgLTY2MjAsOCArNjYyMCw2IEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX3NldF9k
cnJzX3N0YXRlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKIAkJCQkgICAgY29u
c3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCiAJCQkJICAgIGludCByZWZy
ZXNoX3JhdGUpCiB7Ci0Jc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXI7Ci0Jc3RydWN0IGlu
dGVsX2RpZ2l0YWxfcG9ydCAqZGlnX3BvcnQgPSBOVUxMOwogCXN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAgPSBkZXZfcHJpdi0+ZHJycy5kcDsKIAlzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0
YyA9IHRvX2ludGVsX2NydGMoY3J0Y19zdGF0ZS0+YmFzZS5jcnRjKTsKIAllbnVtIGRycnNfcmVm
cmVzaF9yYXRlX3R5cGUgaW5kZXggPSBEUlJTX0hJR0hfUlI7CkBAIC02NjM2LDkgKzY2MzQsNiBA
QCBzdGF0aWMgdm9pZCBpbnRlbF9kcF9zZXRfZHJyc19zdGF0ZShzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYsCiAJCXJldHVybjsKIAl9CiAKLQlkaWdfcG9ydCA9IGRwX3RvX2RpZ19w
b3J0KGludGVsX2RwKTsKLQllbmNvZGVyID0gJmRpZ19wb3J0LT5iYXNlOwotCiAJaWYgKCFpbnRl
bF9jcnRjKSB7CiAJCURSTV9ERUJVR19LTVMoIkRSUlM6IGludGVsX2NydGMgbm90IGluaXRpYWxp
emVkXG4iKTsKIAkJcmV0dXJuOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
