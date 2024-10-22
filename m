Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED59A9EF5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A800A10E645;
	Tue, 22 Oct 2024 09:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KSGN3a4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360110E644;
 Tue, 22 Oct 2024 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729590358;
 bh=JnMTyAOGCNLsNA1LUqIJC7MD5sF9WLqrWyxOeUeWB3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KSGN3a4JcelZclW6GSRZIiNtSrNL2h5T8RPMhUOIR1WLqq8dhqAY+gAujjc0D2FqY
 +zJMjdKsv/g+b9+juNVsyzw/FERzo4l2KWlEoLh/wVxljMVemKh344jhbHDXj1c/ZX
 5mL/AohYTs4m9M/ATyD9cO2GGTXTODNnuC5yl89p/p0Wdk9QHu+nzVMb5afvZ1LcBK
 u3CPZAjArvxTXTx/IDC4XhFMm+x1+9jMe8FpDrKdxa4YtLEmgpyvyIAX768ADCaC1D
 GwFdR349B4yaU/YmhqdpTkpYuxZcmt2W8atbtizg9b37YmDuiLggZPO66mvJS67YpT
 KaEd1Xez1sKOA==
Received: from localhost.localdomain (unknown [171.76.81.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 24DDB17E13A2;
 Tue, 22 Oct 2024 11:45:54 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/ci: add dedede
Date: Tue, 22 Oct 2024 15:15:04 +0530
Message-ID: <20241022094509.85510-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022094509.85510-1-vignesh.raman@collabora.com>
References: <20241022094509.85510-1-vignesh.raman@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add job that executes the IGT test suite for acer-cb317-1h-c3z6-dedede.
dedede boards use 64 bit Intel Jasper Lake processors.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
   - Add gitlab issue link for flake tests.

---
 drivers/gpu/drm/ci/test.yml                   |  9 ++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  | 51 +++++++++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt | 13 +++++
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  | 20 ++++++++
 4 files changed, 93 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 09d8447840e9..d0bfe6aab58a 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -286,6 +286,15 @@ i915:tgl:
     GPU_VERSION: tgl
     RUNNER_TAG: mesa-ci-x86-64-lava-acer-cp514-2h-1130g7-volteer
 
+i915:jsl:
+  extends:
+    - .i915
+  parallel: 4
+  variables:
+    DEVICE_TYPE: acer-cb317-1h-c3z6-dedede
+    GPU_VERSION: jsl
+    RUNNER_TAG: mesa-ci-x86-64-lava-acer-cb317-1h-c3z6-dedede
+
 .amdgpu:
   extends:
     - .lava-igt:x86_64
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
new file mode 100644
index 000000000000..ed9f7b576843
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
@@ -0,0 +1,51 @@
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_lease@lease-uevent,Fail
+kms_pm_rpm@legacy-planes,Timeout
+kms_pm_rpm@legacy-planes-dpms,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+kms_rotation_crc@multiplane-rotation,Fail
+kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
+kms_rotation_crc@multiplane-rotation-cropping-top,Fail
+perf@i915-ref-count,Fail
+perf_pmu@busy-accuracy-50,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@most-busy-idle-check-all,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
new file mode 100644
index 000000000000..5c3ef4486b9d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: acer-cb317-1h-c3z6-dedede
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12475
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.12.0-rc1
+kms_flip@flip-vs-panning-interruptible
+
+# Board Name: acer-cb317-1h-c3z6-dedede
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12476
+# Failure Rate: 100
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.12.0-rc1
+kms_universal_plane@cursor-fb-leak
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
new file mode 100644
index 000000000000..1a3d87c0ca6e
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
@@ -0,0 +1,20 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^panfrost.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# trap_err
+i915_pm_rc6_residency.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rpm@system-hibernate*
-- 
2.43.0

