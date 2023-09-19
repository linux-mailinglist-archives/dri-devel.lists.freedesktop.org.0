Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2C7A6A9E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2910E220;
	Tue, 19 Sep 2023 18:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42E10E1D7;
 Tue, 19 Sep 2023 18:23:16 +0000 (UTC)
Received: from ginger.. (unknown [191.33.115.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C75A5660319E;
 Tue, 19 Sep 2023 19:23:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695147794;
 bh=MIhVHMuMS8iI5c/lxHJyWBy4zZOfp/8Z+Dcp2sjs9HE=;
 h=From:To:Cc:Subject:Date:From;
 b=iuLqsyfB8fSIgvACmga4IETDB20ZBCSv6kG9g0vdiSY90VLIoO5vB+mCeuaQ797AG
 deeVUmA7lrgGv9vjb8L+n9ivv+BYXlQ97hOgJAcc8oUfPQUvVg0rqJy7YT2p0ropxM
 2B/0usnIHgzo7dCz5jDoNqOyNoRd5QY2SEUV0+MMsYIJjLCwuMy/JEwmEh8EMfcZfM
 bNg/j+rwyOlY8WCVavlnK0ME2MfX5iaG6KDEMfbzUN94thOpuwPGD2Fezw7ILuMv23
 b49RvWTo0OYFhrlHd/RwJEkbQuRt/xr2bn62owJXsXY4flp6K4/13XbOBBK0T9zRSM
 O2mMc1ScM99kw==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: drm/ci: add entries for xfail files
Date: Tue, 19 Sep 2023 15:22:49 -0300
Message-Id: <20230919182249.153499-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, michel.daenzer@mailbox.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, airlied@redhat.com, alexander.deucher@amd.com,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM CI keeps track of which tests are failing, flaking or being skipped
by the ci in the expectations files. Add entries for those files to the
corresponding driver maintainer, so they can be notified when they
change.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

For reference: https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg463165.html

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..740a2ce2689c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6614,6 +6614,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
+F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
 F:	include/uapi/drm/msm_drm.h
 
@@ -6886,6 +6887,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
 F:	Documentation/gpu/meson.rst
+F:	drivers/gpu/drm/ci/xfails/meson*
 F:	drivers/gpu/drm/meson/
 
 DRM DRIVERS FOR ATMEL HLCDC
@@ -6994,6 +6996,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
+F:	drivers/gpu/drm/ci/xfails/mediatek*
 F:	drivers/gpu/drm/mediatek/
 F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
@@ -7034,6 +7037,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/rockchip/
+F:	drivers/gpu/drm/ci/xfails/rockchip*
 F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
@@ -10476,6 +10480,7 @@ C:	irc://irc.oftc.net/intel-gfx
 T:	git git://anongit.freedesktop.org/drm-intel
 F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
+F:	drivers/gpu/drm/ci/xfails/i915*
 F:	drivers/gpu/drm/i915/
 F:	include/drm/i915*
 F:	include/uapi/drm/i915_drm.h
@@ -17862,6 +17867,7 @@ C:	irc://irc.oftc.net/radeon
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	Documentation/gpu/amdgpu/
 F:	drivers/gpu/drm/amd/
+F:	drivers/gpu/drm/ci/xfails/amd*
 F:	drivers/gpu/drm/radeon/
 F:	include/uapi/drm/amdgpu_drm.h
 F:	include/uapi/drm/radeon_drm.h
@@ -22846,6 +22852,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/ci/xfails/virtio*
 F:	drivers/gpu/drm/virtio/
 F:	include/uapi/linux/virtio_gpu.h
 
-- 
2.34.1

