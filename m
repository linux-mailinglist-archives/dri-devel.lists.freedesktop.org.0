Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184CCF9167
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C64E6E484;
	Tue, 12 Nov 2019 14:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084026E441
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:04:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28E82B20B;
 Tue, 12 Nov 2019 14:04:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v3 1/5] drm/udl: Set default color depth to 32 bpp
Date: Tue, 12 Nov 2019 15:04:27 +0100
Message-Id: <20191112140431.7895-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191112140431.7895-1-tzimmermann@suse.de>
References: <20191112140431.7895-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHVkbCBkcml2ZXIgb25seSBzdXBwb3J0cyBjb2xvciBkZXB0aHMgdGhhdCBhcmUgcG93ZXJz
IG9mIHR3by4KQ2hhbmdlIHByZWZlcmVkIGRlZmF1bHQgdG8gMzIgYnBwLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCmluZGV4IGJj
MWFiNjA2MGRjNi4uMWY4ZWJjYzU5NWRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9tb2Rlc2V0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCkBA
IC00MzcsNyArNDM3LDcgQEAgaW50IHVkbF9tb2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIAlkZXYtPm1vZGVfY29uZmlnLm1heF9oZWlnaHQgPSAyMDQ4OwogCiAJZGV2LT5tb2Rl
X2NvbmZpZy5wcmVmZXJfc2hhZG93ID0gMDsKLQlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9k
ZXB0aCA9IDI0OworCWRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMzI7CiAKIAlk
ZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJnVkbF9tb2RlX2Z1bmNzOwogCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
