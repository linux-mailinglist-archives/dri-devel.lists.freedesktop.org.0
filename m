Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33577A8B1E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED3510E538;
	Wed, 20 Sep 2023 18:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9B410E538
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:06:17 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c09673b006so516225ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695233176; x=1695837976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lk5LMCrB1hlireITILa/a7+QS+B96DKq4sXjoXiXD7Q=;
 b=Ulubywaqz7LvaTuTRYVdofON8QOymw8lFXaoCPDeCzp2YxMgab/4iRmX/araIFWyVR
 Fut356tXzSpFxx8abHOyonkuP5XKuAZ1JW2Ra9sFVTmBUkgI1Z70LeCPcsrW6IMwm1IW
 FT3HoZjlKSl9lMzoU5SrXBfgjv7wMymkbd85bMtTQTls+kZEfdrRxm/P9HkBHcUMaJpQ
 CLhC2Lj8mX1uLLetMi8aj50oc4zwfFyoaP8Z5iVJV0AZAH/n+A5XCJk7obfD78YrMQIK
 8QO9R29iaZNE+lzJlKIRG/MQ/4uad9HDWws+x/GQs3MX/yiDIe+e1knpCArFrEoHHeTc
 RlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695233176; x=1695837976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lk5LMCrB1hlireITILa/a7+QS+B96DKq4sXjoXiXD7Q=;
 b=jkHyPPx/n9R81I52JY5zf4hAfles9JlxlI0vwwKcpa1RkLraT7J5iBqHpLqaA3Lt5D
 lZH+vTJVexnk0TouO/+KL7DTClo2psBst347F4Fwgszt9IhsATAR+TqfUgxeB94PXKNt
 v0ORGyW4jVHwv460f39Ydvy3/rdRvFieLNdwLr4GMTwTtkWEaZfMeXE8GJ0c/d8BnIwD
 HzHsO5G7dZXfHfWyyD0Hqxk8KST8yXbZ5f4glRTA92Ymv6pxxEhLBRu/2yoDhZLHeDDe
 so3uxyJYaBCg+ju4J5fj+Vxi+IdXhYZX34WwgZPRqq2hCHoDVoio9xt4J+LYf+uhYmPJ
 z2xw==
X-Gm-Message-State: AOJu0YyexcuMeZEq49boSGK96VfJuVePbLxf6iHL91bf4mSwWNqQCN26
 eYL35c8szRIkRS1q+rwPNk7HO0B44jjBtw==
X-Google-Smtp-Source: AGHT+IE9OVsfDxWS3wjB9H50IWbTtK8NuKIknyOygk/PJG01wNTPVNNiVAdA6HOhGIYFnaMX0hWhyA==
X-Received: by 2002:a17:903:2281:b0:1b5:561a:5c9a with SMTP id
 b1-20020a170903228100b001b5561a5c9amr3702357plh.39.1695233176268; 
 Wed, 20 Sep 2023 11:06:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902d50700b001a80ad9c599sm12142732plg.294.2023.09.20.11.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 11:06:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ci: Uprev IGT to pull in fixes
Date: Wed, 20 Sep 2023 11:05:00 -0700
Message-ID: <20230920180526.137369-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Helen Koike <helen.koike@collabora.com>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

There have been a few igt test fixes compared to the commit that we were
currently using.  Pull in a newer igt and update expectations.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |  4 ++--
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt   | 11 -----------
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt   |  2 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt   |  1 -
 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt | 18 +-----------------
 .../drm/ci/xfails/rockchip-rk3288-fails.txt    |  2 ++
 7 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2c4df53f5dfe..3ecb5879e80f 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 471bfababd070e1dac0ebb87470ac4f2ae85e663
+  IGT_VERSION: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index bd9392536e7c..bab21930a0d4 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,7 +1,6 @@
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_async_flips@invalid-async-flip,Fail
-kms_atomic@plane-immutable-zpos,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
@@ -11,9 +10,10 @@ kms_color@degamma,Fail
 kms_cursor_crc@cursor-size-change,Fail
 kms_cursor_crc@pipe-A-cursor-size-change,Fail
 kms_cursor_crc@pipe-B-cursor-size-change,Fail
-kms_cursor_legacy@forked-move,Fail
 kms_hdr@bpc-switch,Fail
 kms_hdr@bpc-switch-dpms,Fail
 kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
 kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 46397ce38d5a..2e3b7c5dac3c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -8,13 +8,6 @@ kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_bw@linear-tiling-4-displays-1920x1080p,Fail
 kms_bw@linear-tiling-4-displays-2560x1440p,Fail
 kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-max,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -38,8 +31,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_hdmi_inject@inject-4k,Timeout
-kms_plane@plane-position-hole,Timeout
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
@@ -53,6 +44,4 @@ kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
 kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
 kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
 kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
-kms_plane_multiple@tiling-y,Timeout
-kms_pwrite_crc,Timeout
 kms_sysfs_edid_timing,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6139b410e767..13c0a25fc627 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,4 +1,3 @@
-kms_color@ctm-0-25,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -16,3 +15,4 @@ kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_async_flips@crc,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index a6da5544e198..27bfca1c6f2c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -8,7 +8,6 @@ kms_bw@linear-tiling-4-displays-3840x2160p,Fail
 kms_bw@linear-tiling-5-displays-1920x1080p,Fail
 kms_bw@linear-tiling-5-displays-2560x1440p,Fail
 kms_bw@linear-tiling-5-displays-3840x2160p,Fail
-kms_color@ctm-0-25,Fail
 kms_flip@flip-vs-panning-vs-hang,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
index 410e0eeb3161..e59a2fddfde0 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
@@ -4,20 +4,4 @@
 # Test incorrectly assumes that CTM support implies gamma/degamma
 # LUT support.  None of the subtests handle the case of only having
 # CTM support
-kms_color.*
-
-# 4k@60 is not supported on this hw, but driver doesn't handle it
-# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
-kms_bw@linear-tiling-.*-displays-3840x2160p
-
-# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
-kms_bw@linear-tiling-2.*
-kms_bw@linear-tiling-3.*
-kms_bw@linear-tiling-4.*
-kms_bw@linear-tiling-5.*
-kms_bw@linear-tiling-6.*
-
-# igt fix posted: https://patchwork.freedesktop.org/patch/499926/
-# failure mode is flakey due to randomization but fails frequently
-# enough to be detected as a Crash or occasionally UnexpectedPass.
-kms_plane_multiple@atomic-pipe-A-tiling-none
+#kms_color.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 2a1baa948e12..15ac861a58bf 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -46,3 +46,5 @@ kms_properties@connector-properties-legacy,Crash
 kms_properties@get_properties-sanity-atomic,Crash
 kms_properties@get_properties-sanity-non-atomic,Crash
 kms_setmode@invalid-clone-single-crtc,Crash
+kms_flip@flip-vs-modeset-vs-hang,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
-- 
2.41.0

