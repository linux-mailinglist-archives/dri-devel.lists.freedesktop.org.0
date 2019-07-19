Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B06E185
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46A6E598;
	Fri, 19 Jul 2019 07:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8656E488;
 Fri, 19 Jul 2019 01:46:10 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CF09970995D2006834BB;
 Fri, 19 Jul 2019 09:46:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 09:45:55 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <imre.deak@intel.com>, <madhav.chauhan@intel.com>,
 <vandita.kulkarni@intel.com>, <chris@chris-wilson.co.uk>,
 <ville.syrjala@linux.intel.com>
Subject: [PATCH -next] drm/i915/dsi: remove set but not used variable
 'hfront_porch'
Date: Fri, 19 Jul 2019 01:51:36 +0000
Message-ID: <20190719015136.103988-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pY2xfZHNpLmM6IEluIGZ1bmN0aW9uICdnZW4xMV9kc2lfc2V0
X3RyYW5zY29kZXJfdGltaW5ncyc6CmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaWNsX2Rz
aS5jOjc2ODo2OiB3YXJuaW5nOgogdmFyaWFibGUgJ2hmcm9udF9wb3JjaCcgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5ldmVyIHVzZWQgYW5kIGNh
biBiZSByZW1vdmVkLgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pY2xfZHNpLmMgfCA0ICstLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ljbF9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaWNsX2RzaS5jCmluZGV4IDRkOTUyYWNjZmFhYS4uYTQyMzQ4YmUwNDM4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ljbF9kc2kuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ljbF9kc2kuYwpAQCAtNzYzLDcgKzc2Myw3IEBAIGdl
bjExX2RzaV9zZXRfdHJhbnNjb2Rlcl90aW1pbmdzKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNv
ZGVyLAogCWVudW0gdHJhbnNjb2RlciBkc2lfdHJhbnM7CiAJLyogaG9yaXpvbnRhbCB0aW1pbmdz
ICovCiAJdTE2IGh0b3RhbCwgaGFjdGl2ZSwgaHN5bmNfc3RhcnQsIGhzeW5jX2VuZCwgaHN5bmNf
c2l6ZTsKLQl1MTYgaGZyb250X3BvcmNoLCBoYmFja19wb3JjaDsKKwl1MTYgaGJhY2tfcG9yY2g7
CiAJLyogdmVydGljYWwgdGltaW5ncyAqLwogCXUxNiB2dG90YWwsIHZhY3RpdmUsIHZzeW5jX3N0
YXJ0LCB2c3luY19lbmQsIHZzeW5jX3NoaWZ0OwogCkBAIC03NzIsOCArNzcyLDYgQEAgZ2VuMTFf
ZHNpX3NldF90cmFuc2NvZGVyX3RpbWluZ3Moc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIs
CiAJaHN5bmNfc3RhcnQgPSBhZGp1c3RlZF9tb2RlLT5jcnRjX2hzeW5jX3N0YXJ0OwogCWhzeW5j
X2VuZCA9IGFkanVzdGVkX21vZGUtPmNydGNfaHN5bmNfZW5kOwogCWhzeW5jX3NpemUgID0gaHN5
bmNfZW5kIC0gaHN5bmNfc3RhcnQ7Ci0JaGZyb250X3BvcmNoID0gKGFkanVzdGVkX21vZGUtPmNy
dGNfaHN5bmNfc3RhcnQgLQotCQkJYWRqdXN0ZWRfbW9kZS0+Y3J0Y19oZGlzcGxheSk7CiAJaGJh
Y2tfcG9yY2ggPSAoYWRqdXN0ZWRfbW9kZS0+Y3J0Y19odG90YWwgLQogCQkgICAgICAgYWRqdXN0
ZWRfbW9kZS0+Y3J0Y19oc3luY19lbmQpOwogCXZhY3RpdmUgPSBhZGp1c3RlZF9tb2RlLT5jcnRj
X3ZkaXNwbGF5OwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
