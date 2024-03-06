Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FEC872D46
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DCB112E45;
	Wed,  6 Mar 2024 03:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VHUeSDrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10656112E48
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 03:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709694490;
 bh=c6Y8Gn/KQZwmp41qAJ+VlWSo1aO0mr/SX98YmYuvIH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VHUeSDrPCf7Rmf13q4kHhIqc5+ir2MsjL300vwNTw16H84DrWp2Z6pE0pphloxzPU
 cIhWY2NtqXSV9M/snCkVDaqoffUIbkq2NIOLLVceuWpsMuLgDd1B0qM2e2WpcRiOCr
 +23v2W6O3gApCLn+T4T+hZnAgPmjiFPetwLxvPE8b6IF30NikuxIM9KXst98UrgrHB
 3pWWyxDev8AKOSaXm3B0vCkzJ6eRkE1ybB/x+kpCCKd4FOWeAAvPnIyQjx+XtENbdR
 zcTgvYP2tdESkMx1Ru6968ZPjC67Qb8HpfvVU5icr2AoZoBGLalWaZ24yTGgROpX4/
 ERsItJGgWicaQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D88F437820BB;
 Wed,  6 Mar 2024 03:08:06 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/11] drm/ci: amdgpu: update xfails
Date: Wed,  6 Mar 2024 08:36:42 +0530
Message-Id: <20240306030649.60269-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
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

Update xfails with the newly added tests in testlist-amdgpu.txt.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v4:
  - New patch in the series. Run tests with newly added tests in
    testlist-amdgpu.txt and update xfails.

---
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 26 +++++++++++++++++--
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    | 10 ++++++-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt | 17 +++++++++++-
 3 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..537f942f54c4 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,7 +1,24 @@
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_assr@assr-links-dpms,Fail
+amdgpu/amd_deadlock@amdgpu-deadlock-compute,Timeout
+amdgpu/amd_ilr@ilr-policy,Fail
+amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo,Fail
+amdgpu/amd_plane@mpo-pan-nv12,Fail
+amdgpu/amd_plane@mpo-pan-p010,Fail
+amdgpu/amd_plane@mpo-pan-rgb,Crash
+amdgpu/amd_plane@mpo-scale-nv12,Fail
+amdgpu/amd_plane@mpo-scale-p010,Fail
+amdgpu/amd_plane@mpo-scale-rgb,Crash
+amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode,Fail
+amdgpu/amd_vrr_range@freesync-parsing,Timeout
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
-kms_async_flips@async-flip-with-page-flip-events,Fail
 kms_async_flips@crc,Fail
 kms_async_flips@invalid-async-flip,Fail
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
@@ -14,7 +31,13 @@ kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_color@degamma,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_cursor_crc@pipe-A-cursor-size-change,Fail
 kms_cursor_crc@pipe-B-cursor-size-change,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -23,5 +46,4 @@ kms_hdr@bpc-switch,Fail
 kms_hdr@bpc-switch-dpms,Fail
 kms_plane@pixel-format,Fail
 kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
-kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index 6faf75e667d3..c5085c5571eb 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1 +1,9 @@
-kms_async_flips@async-flip-with-page-flip-events
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/903b01f7-3f0d-18b7-a4b7-301c118c9321@collabora.com/T/#u
+# IGT Version: 1.28-gb0cc8160e
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_async_flips@crc
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index e2c538a0f954..8420906f6cd5 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,17 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# GPU reset seen and it hangs the machine
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+
+# Hangs the machine and timeout occurs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+
+# Skip this test as core_getrevision fails with
+# Module amdgpu already inserted
+amdgpu/amd_module_load@reload
-- 
2.40.1

