Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A955819EB8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074C10E582;
	Wed, 20 Dec 2023 12:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D456010E582
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074336;
 bh=MflLEurTiGg1PBiiaFa9nE+oeb3L1txjVdY0QpC+lio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dQdgu0L/EjGSalNDFbRZEFOXNAWYzWa90D4aJC+8X7zyXVUjXdNIuT8nqo1MlJ0aN
 B8r4FeJyn7+0d+T/h0F2nlXnnWd/dA+UDapzvU/DcF/kiWF4ux0kdjGUFspFM9o6SI
 Ozdb8oMs6+T9z2T0QE2wxNVumgpnJeIJ+6XzMnKRgkAODifMOf11hoVIs4hLDigRgA
 3+v2ibfuz1x4sAReOv1yhIhVhnDHVvMjydcpG2gC9atZY4eLCsuXJwkGoer1lVh22c
 6Kp7SvLGBgfG7GyD+Lat25hkgqiBXZ5Ma1UkTyS1VXeDFpC5Vnp6gorPuuQI4cpMI/
 yJEHjcf8MVZRg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 74FD93781FD5;
 Wed, 20 Dec 2023 12:12:11 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 8/8] drm/ci: Update xfails
Date: Wed, 20 Dec 2023 17:41:10 +0530
Message-Id: <20231220121110.1441160-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-rockchip@lists.infradead.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david.heidelberg@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add fails and flakes files for mt8173 and mt8183 mediatek-drm
driver tests. Add fails, skips and flakes files for rk3288 and
rk3399 rockchip-drm driver tests. Add fails file for meson-drm
display driver tests.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 .../xfails/mediatek-mt8173-display-flakes.txt | 13 ++++
 .../xfails/mediatek-mt8183-display-fails.txt  |  7 ++
 .../xfails/mediatek-mt8183-display-flakes.txt |  8 +++
 .../ci/xfails/meson-g12b-display-fails.txt    | 13 ++++
 .../xfails/rockchip-rk3288-display-fails.txt  | 15 ++++
 .../xfails/rockchip-rk3288-display-flakes.txt | 13 ++++
 .../xfails/rockchip-rk3288-display-skips.txt  |  8 +++
 .../xfails/rockchip-rk3399-display-fails.txt  | 69 +++++++++++++++++++
 .../xfails/rockchip-rk3399-display-flakes.txt | 20 ++++++
 .../xfails/rockchip-rk3399-display-skips.txt  |  6 ++
 10 files changed, 172 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt

diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
new file mode 100644
index 000000000000..64b30c092c85
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: mt8173-elm-hana.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Below test shows inconsistency across multiple runs,
+# giving results of Pass and Timeout/Fail alternately
+kms_prop_blob@invalid-set-prop
+kms_prop_blob@invalid-set-prop-any
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
new file mode 100644
index 000000000000..bfa2f92c907a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
@@ -0,0 +1,7 @@
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_prop_blob@invalid-set-prop,Fail
+kms_prop_blob@invalid-set-prop-any,Fail
+kms_properties@get_properties-sanity-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
new file mode 100644
index 000000000000..5885a950fa72
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 100
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
new file mode 100644
index 000000000000..f123fb0cb820
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
@@ -0,0 +1,13 @@
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
new file mode 100644
index 000000000000..8e763195defc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
@@ -0,0 +1,15 @@
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_cursor_crc@cursor-dpms,Crash
+kms_cursor_crc@cursor-onscreen-64x21,Crash
+kms_cursor_crc@cursor-random-64x64,Crash
+kms_cursor_crc@cursor-sliding-32x10,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
+kms_prop_blob@invalid-set-prop,Crash
+kms_prop_blob@invalid-set-prop-any,Crash
+kms_properties@get_properties-sanity-atomic,Crash
+kms_properties@get_properties-sanity-non-atomic,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
new file mode 100644
index 000000000000..2ee69be541c4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: rk3288-veyron-jaq.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/bdb53650-1888-30b8-93ee-2290d020af4a@collabora.com/T/#u
+# Failure Rate: 50
+# IGT Version: 1.28-gd2af13d9f
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_crc@cursor-offscreen-64x21
+kms_cursor_legacy@flip-vs-cursor-legacy
+
+# The below test shows inconsistency across multiple runs, giving
+# results of Pass and Crash alternately.
+kms_cursor_crc@cursor-size-change
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
new file mode 100644
index 000000000000..627bf03f3c78
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
@@ -0,0 +1,8 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Machine is hanging in this test with linux kernel version 6.7.0-rc4, so skip it
+kms_cursor_crc@cursor-onscreen-32x32
+kms_pipe_crc_basic@disable-crc-after-crtc
+kms_pipe_crc_basic@pipe-A-eDP-1
+kms_bw@linear-tiling-3-displays-2560x1440
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-fails.txt
new file mode 100644
index 000000000000..e7c1a7e5b1db
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-fails.txt
@@ -0,0 +1,69 @@
+kms_color@legacy-gamma,Fail
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-64x21,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursorA-vs-flipA-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@dpms-vs-vblank-race-interruptible,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
+kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@modeset-vs-vblank-race-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_rmfb@close-fd,Fail
+kms_setmode@basic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
new file mode 100644
index 000000000000..ac8badcb6e07
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
@@ -0,0 +1,20 @@
+# Board Name: rk3399-gru-kevin.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/bdb53650-1888-30b8-93ee-2290d020af4a@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_color@gamma
+kms_cursor_legacy@cursorA-vs-flipA-toggle
+kms_flip@dpms-vs-vblank-race
+kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@flip-vs-absolute-wf_vblank-interruptible
+kms_flip@flip-vs-wf_vblank-interruptible
+kms_flip@modeset-vs-vblank-race-interruptible
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
+kms_setmode@basic
+
+# The below test shows inconsistency across multiple runs, giving
+# results of Pass and Crash alternately.
+kms_cursor_crc@cursor-rapid-movement-32x10
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt
new file mode 100644
index 000000000000..cf5577b7720c
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt
@@ -0,0 +1,6 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Machine ends up hanging after lots of Oopses with linux version 6.7.0-rc4
+# rockchip-dp ff970000.dp: AUX CH error happened: 0x2
+kms_plane_multiple.*
-- 
2.40.1

