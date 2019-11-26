Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26850109F7B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FFE6E3EB;
	Tue, 26 Nov 2019 13:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0291A6E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:47:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C874AD45;
 Tue, 26 Nov 2019 13:47:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 4/7] drm/udl: Set preferred color depth to 16 bpp
Date: Tue, 26 Nov 2019 14:47:04 +0100
Message-Id: <20191126134707.22385-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126134707.22385-1-tzimmermann@suse.de>
References: <20191126134707.22385-1-tzimmermann@suse.de>
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

VGhlIGN1cnJlbnQgZGVmYXVsdCBjb2xvciBkZXB0aCBvZiAyNCBicHAgaXMgbm90IGV2ZW4gc3Vw
cG9ydGVkIGJ5CnRoZSBkcml2ZXIuIEJlaW5nIHRoZSBuYXRpdmUgZm9ybWF0IGZvciBjb21tdW5p
Y2F0aW5nIHdpdGggdGhlIGFkYXB0ZXIsCjE2IGJwcCBpcyB0aGUgY29ycmVjdCBjaG9pY2UuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCmluZGV4IGIzZmE2YmY0MWFj
Yy4uZTZjMWNkNzdkNGQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwpAQCAtMTA1LDcgKzEwNSw3IEBA
IHN0YXRpYyBpbnQgdWRsX3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNl
LAogCiAJRFJNX0lORk8oIkluaXRpYWxpemVkIHVkbCBvbiBtaW5vciAlZFxuIiwgdWRsLT5kcm0u
cHJpbWFyeS0+aW5kZXgpOwogCi0JciA9IGRybV9mYmRldl9nZW5lcmljX3NldHVwKCZ1ZGwtPmRy
bSwgMTYpOworCXIgPSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgmdWRsLT5kcm0sIDApOwogCWlm
IChyKQogCQlnb3RvIGVycl9kcm1fZGV2X3VucmVnaXN0ZXI7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21v
ZGVzZXQuYwppbmRleCA3Mjg4NGNiZGExMzEuLjFiNWE0NmE5MWNiNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21vZGVzZXQuYwpAQCAtNDEyLDcgKzQxMiw3IEBAIGludCB1ZGxfbW9kZXNldF9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJZGV2LT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0gMjA0
ODsKIAogCWRldi0+bW9kZV9jb25maWcucHJlZmVyX3NoYWRvdyA9IDA7Ci0JZGV2LT5tb2RlX2Nv
bmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsKKwlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9k
ZXB0aCA9IDE2OwogCiAJZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZ1ZGxfbW9kZV9mdW5jczsK
IAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
