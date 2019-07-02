Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FC5CA46
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A1389AA7;
	Tue,  2 Jul 2019 08:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02F289A4A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 430D0B171;
 Tue,  2 Jul 2019 08:01:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com
Subject: [PATCH v2 3/5] drm/hibmc: Update struct drm_driver for GEM object
 functions
Date: Tue,  2 Jul 2019 10:01:37 +0200
Message-Id: <20190702080139.21814-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702080139.21814-1-tzimmermann@suse.de>
References: <20190702080139.21814-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdFTSBvYmplY3QncyBmcmVlIGZ1bmN0aW9uIGlzIG5vdyBjYWxsZWQgdGhyb3VnaCBzdHJ1
Y3QKZHJtX2dlbV9vYmplY3RfZnVuY3MuZnJlZS4gVGhlIGZ1bmN0aW9uIHN0cnVjdCBkcm1fZHJp
dmVyLmdlbV9wcmltZV9tbWFwCmlzIG5vdyByZXF1aXJlZCBmb3IgbW1hcCdpbmcgR0VNIG9iamVj
dHMgdG8gdXNlcnNwYWNlLgoKdjI6CgkqIHNldCBkcm1fZHJpdmVyLmdlbV9wcmltZV9tbWFwIHRv
IGRybV9nZW1fcHJpbWVfbW1hcCgpCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGli
bWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZHJ2LmMKaW5kZXggY2U4OWU1NjkzN2IwLi4yZjY2ZWMwNWZlYzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCkBAIC01MSwxMCArNTEsOSBA
QCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgaGlibWNfZHJpdmVyID0gewogCS5kZXNjCQkJPSAi
aGlibWMgZHJtIGRyaXZlciIsCiAJLm1ham9yCQkJPSAxLAogCS5taW5vcgkJCT0gMCwKLQkuZ2Vt
X2ZyZWVfb2JqZWN0X3VubG9ja2VkID0KLQkJZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fZnJlZV9v
YmplY3RfdW5sb2NrZWQsCiAJLmR1bWJfY3JlYXRlICAgICAgICAgICAgPSBoaWJtY19kdW1iX2Ny
ZWF0ZSwKIAkuZHVtYl9tYXBfb2Zmc2V0ICAgICAgICA9IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVt
Yl9tbWFwX29mZnNldCwKKwkuZ2VtX3ByaW1lX21tYXAJCT0gZHJtX2dlbV9wcmltZV9tbWFwLAog
CS5pcnFfaGFuZGxlcgkJPSBoaWJtY19kcm1faW50ZXJydXB0LAogfTsKIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
