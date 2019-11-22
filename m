Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE4106827
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 09:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2C6F4E8;
	Fri, 22 Nov 2019 08:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0C96E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 08:30:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82940B3A6;
 Fri, 22 Nov 2019 08:30:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, sam@ravnborg.org,
 kraxel@redhat.com, hslester96@gmail.com, yuehaibing@huawei.com
Subject: [PATCH 4/4] drm/hisilicon/hibmc: Export VRAM MM information to debugfs
Date: Fri, 22 Nov 2019 09:30:44 +0100
Message-Id: <20191122083044.6627-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122083044.6627-1-tzimmermann@suse.de>
References: <20191122083044.6627-1-tzimmermann@suse.de>
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

VGhpcyBjaGFuZ2UgbWFrZXMgaW5mb3JtYXRpb24gYWJvdXQgVlJBTSBjb25zdW1wdGlvbiBhdmFp
bGFibGUgb24KZGVidWdmcy4gU2VlCgogIC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3ZyYW0tbW0K
CmZvciBhbiBvdmVydmlldyBvZiBob3cgVlJBTSBpcyBiZWluZyB1c2VkLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJt
Yy9oaWJtY19kcm1fZHJ2LmMKaW5kZXggMTEzZDI3YjhhOGYxLi4xMWQxYjA3NjFjOWEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCkBAIC01
NSw2ICs1NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBoaWJtY19kcml2ZXIgPSB7CiAJ
LmRlc2MJCQk9ICJoaWJtYyBkcm0gZHJpdmVyIiwKIAkubWFqb3IJCQk9IDEsCiAJLm1pbm9yCQkJ
PSAwLAorCS5kZWJ1Z2ZzX2luaXQJCT0gZHJtX3ZyYW1fbW1fZGVidWdmc19pbml0LAogCS5kdW1i
X2NyZWF0ZSAgICAgICAgICAgID0gaGlibWNfZHVtYl9jcmVhdGUsCiAJLmR1bWJfbWFwX29mZnNl
dCAgICAgICAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2R1bWJfbW1hcF9vZmZzZXQsCiAJLmdlbV9w
cmltZV9tbWFwCQk9IGRybV9nZW1fcHJpbWVfbW1hcCwKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
