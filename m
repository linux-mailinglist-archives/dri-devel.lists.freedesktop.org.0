Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081877FD694
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74D610E537;
	Wed, 29 Nov 2023 12:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010DD10E536
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:19:34 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9992D6607349;
 Wed, 29 Nov 2023 12:19:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701260373;
 bh=/+sdprsWkKCN5CJr21VSx0uUyY/KGPHXt0II8sDgBEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c6fI4hK3s/zcF8LNqjM8q71cX/vCgNayrKVEDVc28lLt+JkDhIeID/Qrcf9L4pJIE
 SxY7jqPRAiDmCR7x1zZEnwtzOjd077mWKFC/qn2iBJXRnUueh4STX4YLvIC8tfPjO3
 E2NxEiqZtvB87ewg3j9MmoYW1LRMD1zpkCNi9BgCvERNiz6xtfqX5/4iZvajgIX0QP
 AdnMwQF9cez2OfUPQjLQoQzLWi1MbqXXvul40RNIoc+YBvWn2BU6DHIzFWjppl+TPu
 xyDoWj/agKP+wbP8Lw3v1auhnxjz6iIwlwoKh5nbMmf4xwlthJ6GAbsjefxj/aYG7E
 yRCMMVnB5J7rA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v6 10/10] drm: ci: Update xfails
Date: Wed, 29 Nov 2023 17:48:41 +0530
Message-Id: <20231129121841.253223-11-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update msm-apq8016-fails, mediatek-mt8173-fails and
virtio_gpu-none-fails to include the tests which fail.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

v5:
  - Generate fails and flakes file with the updated xfails script - https://www.spinics.net/lists/kernel/msg4959630.html

v6:
  - Generate fails file with drm-misc-next

---
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 13 ++++--
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 ++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 46 +++++++++++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 671916067dba..ef0cb7c3698c 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,5 +1,4 @@
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
@@ -9,13 +8,19 @@ kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
 kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
 kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
-kms_force_connector_basic@force-connector-state,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_force_connector_basic@force-load-detect,Fail
 kms_force_connector_basic@prune-stale-modes,Fail
-kms_invalid_mode@int-max-clock,Fail
+kms_hdmi_inject@inject-4k,Fail
 kms_plane_scaling@planes-upscale-20x20,Fail
 kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
 kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
@@ -27,3 +32,5 @@ kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@plane-properties-atomic,Fail
 kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
+kms_selftest@drm_format,Timeout
+kms_selftest@drm_format_helper,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 9981682feab2..d39d254c935e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -6,10 +6,15 @@ kms_cursor_legacy@all-pipes-single-bo,Fail
 kms_cursor_legacy@all-pipes-single-move,Fail
 kms_cursor_legacy@all-pipes-torture-bo,Fail
 kms_cursor_legacy@all-pipes-torture-move,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@pipe-A-forked-bo,Fail
 kms_cursor_legacy@pipe-A-forked-move,Fail
 kms_cursor_legacy@pipe-A-single-bo,Fail
 kms_cursor_legacy@pipe-A-single-move,Fail
 kms_cursor_legacy@pipe-A-torture-bo,Fail
 kms_cursor_legacy@pipe-A-torture-move,Fail
+kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
+kms_selftest@drm_format,Timeout
+kms_selftest@drm_format_helper,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 9586b2339f6f..007f21e56d89 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -10,6 +10,49 @@ kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2560x1440p,Fail
+kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_bw@linear-tiling-4-displays-1920x1080p,Fail
+kms_bw@linear-tiling-4-displays-2560x1440p,Fail
+kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+kms_bw@linear-tiling-5-displays-1920x1080p,Fail
+kms_bw@linear-tiling-5-displays-2560x1440p,Fail
+kms_bw@linear-tiling-5-displays-3840x2160p,Fail
+kms_bw@linear-tiling-6-displays-1920x1080p,Fail
+kms_bw@linear-tiling-6-displays-2560x1440p,Fail
+kms_bw@linear-tiling-6-displays-3840x2160p,Fail
+kms_bw@linear-tiling-7-displays-1920x1080p,Fail
+kms_bw@linear-tiling-7-displays-2560x1440p,Fail
+kms_bw@linear-tiling-7-displays-3840x2160p,Fail
+kms_bw@linear-tiling-8-displays-1920x1080p,Fail
+kms_bw@linear-tiling-8-displays-2560x1440p,Fail
+kms_bw@linear-tiling-8-displays-3840x2160p,Fail
+kms_flip@absolute-wf_vblank,Fail
+kms_flip@absolute-wf_vblank-interruptible,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@blocking-absolute-wf_vblank,Fail
+kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@busy-flip,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@dpms-vs-vblank-race-interruptible,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-expired-vblank,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
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
 kms_invalid_mode@int-max-clock,Fail
 kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
 kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
@@ -22,6 +65,9 @@ kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
 kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
 kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
 kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_selftest@drm_format,Timeout
+kms_selftest@drm_format_helper,Timeout
+kms_setmode@basic,Fail
 kms_vblank@crtc-id,Fail
 kms_vblank@invalid,Fail
 kms_vblank@pipe-A-accuracy-idle,Fail
-- 
2.40.1

