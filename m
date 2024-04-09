Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4489D3ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39843112B60;
	Tue,  9 Apr 2024 08:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nKXmUCcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2017E112B60
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712650470;
 bh=tAZQCLWHbk1XtUITJjv7IhFZS1vXMF8e7R1IABod7lA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nKXmUCcr8ROm4ByRqkEnOQFedWUq+zcpSpsG2PyRwGVcFO0uMtZDWPkyccatg7sQV
 QiHq0fyfE4QyWeg7mi0QuxMIjmdWpw465szqdUHtaOq1YElc2QL1v2STtdfEXIiQKt
 3FPhAFvRCG4rXKAn0uslhsdbx2rnw8BYagb3qLuGQV+n6sHSeLe7I4ErpAY1OCh5Tq
 sV7iKon7YvoXTyyiTlakKMROi0OBj1sTD0NnKXsmClFnFVuGcI47o2MyjGm8NZqdG3
 5TtpCs91dwRLWD9+uT6kUjUfgogQQfeHfQrlhV7CnI6N8Bomd0o/pIOIPWKRPzxUTA
 Xgxuw9hR0FkLg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5550237820F3;
 Tue,  9 Apr 2024 08:14:27 +0000 (UTC)
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
Subject: [PATCH v6 3/8] drm/ci: uprev IGT and update testlist
Date: Tue,  9 Apr 2024 13:43:24 +0530
Message-Id: <20240409081329.472463-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409081329.472463-1-vignesh.raman@collabora.com>
References: <20240409081329.472463-1-vignesh.raman@collabora.com>
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

Uprev IGT and add amd, v3d, vc4 and vgem specific tests to
testlist and skip driver-specific tests in *-skips.txt.
Also add testlist to the MAINTAINERS file and update xfails.

A better approach would be to stop vendoring the testlist
into the kernel and instead use testlist from the IGT build
to ensure we do not miss renamed or newly added tests.
This implementation is planned for the future.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in series to uprev IGT and update testlist.

v4:
  - Add testlists to the MAINTAINERS file and remove amdgpu xfails changes.

v5:
  - Keep single testlist and update xfails. Skip driver specific tests.

v6:
  - Update xfails.

---
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
 drivers/gpu/drm/ci/testlist.txt               | 321 ++++++++++++++++++
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  25 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   9 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   2 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   2 +
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   9 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   3 -
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   6 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   5 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   5 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   8 +-
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   6 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   6 +
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   6 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   8 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   6 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  15 +
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   9 +-
 35 files changed, 532 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bc7e122a094..f7d0040a6c21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1665,6 +1665,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
@@ -6753,6 +6754,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
 F:	include/uapi/drm/msm_drm.h
@@ -7047,6 +7049,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
 F:	Documentation/gpu/meson.rst
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/meson*
 F:	drivers/gpu/drm/meson/
 
@@ -7160,6 +7163,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/mediatek*
 F:	drivers/gpu/drm/mediatek/
 F:	drivers/phy/mediatek/phy-mtk-dp.c
@@ -7211,6 +7215,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/rockchip/
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/rockchip*
 F:	drivers/gpu/drm/rockchip/
 
@@ -10739,6 +10744,7 @@ C:	irc://irc.oftc.net/intel-gfx
 T:	git git://anongit.freedesktop.org/drm-intel
 F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/i915*
 F:	drivers/gpu/drm/i915/
 F:	include/drm/i915*
@@ -18255,6 +18261,7 @@ C:	irc://irc.oftc.net/radeon
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	Documentation/gpu/amdgpu/
 F:	drivers/gpu/drm/amd/
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/amd*
 F:	drivers/gpu/drm/radeon/
 F:	include/uapi/drm/amdgpu_drm.h
@@ -23303,6 +23310,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	virtualization@lists.linux.dev
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/ci/testlist.txt
 F:	drivers/gpu/drm/ci/xfails/virtio*
 F:	drivers/gpu/drm/virtio/
 F:	include/uapi/linux/virtio_gpu.h
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2f9a5e217f5c..d03d76692f0e 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
index 3377f002f8c5..8a5967a4b3bd 100644
--- a/drivers/gpu/drm/ci/testlist.txt
+++ b/drivers/gpu/drm/ci/testlist.txt
@@ -2759,3 +2759,324 @@ msm_submit@invalid-duplicate-bo-submit
 msm_submit@invalid-cmd-idx-submit
 msm_submit@invalid-cmd-type-submit
 msm_submit@valid-submit
+prime_vgem@basic-read
+prime_vgem@basic-write
+prime_vgem@basic-gtt
+prime_vgem@basic-blt
+prime_vgem@shrink
+prime_vgem@coherency-gtt
+prime_vgem@coherency-blt
+prime_vgem@sync
+prime_vgem@busy
+prime_vgem@wait
+prime_vgem@basic-fence-read
+prime_vgem@basic-fence-mmap
+prime_vgem@basic-fence-blt
+prime_vgem@basic-fence-flip
+prime_vgem@fence-read-hang
+prime_vgem@fence-write-hang
+prime_vgem@fence-flip-hang
+prime_vgem@fence-wait
+vgem_basic@unload
+vgem_basic@setversion
+vgem_basic@second-client
+vgem_basic@create
+vgem_basic@mmap
+vgem_basic@bad-flag
+vgem_basic@bad-pad
+vgem_basic@bad-handle
+vgem_basic@bad-fence
+vgem_basic@busy-fence
+vgem_basic@dmabuf-export
+vgem_basic@dmabuf-mmap
+vgem_basic@dmabuf-fence
+vgem_basic@dmabuf-fence-before
+vgem_basic@sysfs
+vgem_basic@debugfs
+vgem_slow@nohang
+amdgpu/amd_abm@dpms_cycle
+amdgpu/amd_abm@backlight_monotonic_basic
+amdgpu/amd_abm@backlight_monotonic_abm
+amdgpu/amd_abm@abm_enabled
+amdgpu/amd_abm@abm_gradual
+amdgpu/amd_bo@amdgpu_bo_export_import
+amdgpu/amd_bo@amdgpu_bo_metadata
+amdgpu/amd_bo@amdgpu_bo_map_unmap
+amdgpu/amd_bo@amdgpu_memory_alloc
+amdgpu/amd_bo@amdgpu_mem_fail_alloc
+amdgpu/amd_bo@amdgpu_bo_find_by_cpu_mapping
+amdgpu/amd_cp_dma_misc@GTT_to_VRAM-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@GTT_to_VRAM-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_cp_dma_misc@VRAM_to_GTT-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@VRAM_to_GTT-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_cp_dma_misc@VRAM_to_VRAM-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@VRAM_to_VRAM-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_dispatch@amdgpu-dispatch-test-compute-with-IP-COMPUTE
+amdgpu/amd_dispatch@amdgpu-dispatch-test-gfx-with-IP-GFX
+amdgpu/amd_dispatch@amdgpu-dispatch-hang-test-gfx-with-IP-GFX
+amdgpu/amd_dispatch@amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+amdgpu/amd_hotplug@basic
+amdgpu/amd_hotplug@basic-suspend
+amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
+amdgpu/amd_max_bpc@4k-mode-max-bpc
+amdgpu/amd_module_load@reload
+amdgpu/amd_plane@test-mpo-4k
+amdgpu/amd_plane@mpo-swizzle-toggle
+amdgpu/amd_plane@mpo-swizzle-toggle-multihead
+amdgpu/amd_plane@mpo-pan-rgb
+amdgpu/amd_plane@mpo-pan-rgb-multihead
+amdgpu/amd_plane@mpo-pan-nv12
+amdgpu/amd_plane@mpo-pan-nv12-multihead
+amdgpu/amd_plane@mpo-pan-p010
+amdgpu/amd_plane@mpo-pan-p010-multihead
+amdgpu/amd_plane@mpo-pan-multi-rgb
+amdgpu/amd_plane@mpo-pan-multi-nv12
+amdgpu/amd_plane@mpo-pan-multi-p010
+amdgpu/amd_plane@multi-overlay
+amdgpu/amd_plane@multi-overlay-invalid
+amdgpu/amd_plane@mpo-scale-rgb
+amdgpu/amd_plane@mpo-scale-rgb-multihead
+amdgpu/amd_plane@mpo-scale-nv12
+amdgpu/amd_plane@mpo-scale-nv12-multihead
+amdgpu/amd_plane@mpo-scale-p010
+amdgpu/amd_plane@mpo-scale-p010-multihead
+amdgpu/amd_pstate@amdgpu_pstate
+amdgpu/amd_subvp@dual-4k60
+amdgpu/amd_uvd_enc@uvd_enc_create
+amdgpu/amd_uvd_enc@amdgpu_uvd_enc_session_init
+amdgpu/amd_uvd_enc@amdgpu_uvd_enc_encode
+amdgpu/amd_uvd_enc@uvd_enc_destroy
+amdgpu/amd_vm@vmid-reserve-test
+amdgpu/amd_vm@amdgpu-vm-unaligned-map
+amdgpu/amd_vm@amdgpu-vm-mapping-test
+amdgpu/amd_assr@assr-links
+amdgpu/amd_assr@assr-links-dpms
+amdgpu/amd_assr@assr-links-suspend
+amdgpu/amd_bypass@8bpc-bypass-mode
+amdgpu/amd_cs_nop@cs-nops-with-nop-compute0
+amdgpu/amd_cs_nop@cs-nops-with-nop-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-sync-compute0
+amdgpu/amd_cs_nop@cs-nops-with-sync-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-fork-compute0
+amdgpu/amd_cs_nop@cs-nops-with-fork-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0
+amdgpu/amd_cs_nop@cs-nops-with-sync-fork-gfx0
+amdgpu/amd_dp_dsc@dsc-enable-basic
+amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
+amdgpu/amd_dp_dsc@dsc-link-settings
+amdgpu/amd_dp_dsc@dsc-bpc
+amdgpu/amd_ilr@ilr-link-training-configs
+amdgpu/amd_ilr@ilr-policy
+amdgpu/amd_link_settings@link-training-configs
+amdgpu/amd_mem_leak@connector-suspend-resume
+amdgpu/amd_mem_leak@connector-hotplug
+amdgpu/amd_odm@odm-combine-2-to-1-4k144
+amdgpu/amd_prime@i915-to-amd
+amdgpu/amd_prime@amd-to-i915
+amdgpu/amd_prime@shrink
+amdgpu/amd_ras@RAS-basic
+amdgpu/amd_ras@RAS-query
+amdgpu/amd_ras@RAS-inject
+amdgpu/amd_ras@RAS-disable
+amdgpu/amd_ras@RAS-enable
+amdgpu/amd_syncobj@amdgpu_syncobj_timeline
+amdgpu/amd_vce_dec@amdgpu_cs_vce_create
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy
+amdgpu/amd_vpe@vpe-fence-test
+amdgpu/amd_vpe@vpe-blit-test
+amdgpu/amd_basic@memory-alloc
+amdgpu/amd_basic@userptr-with-IP-DMA
+amdgpu/amd_basic@cs-gfx-with-IP-GFX
+amdgpu/amd_basic@cs-compute-with-IP-COMPUTE
+amdgpu/amd_basic@cs-multi-fence-with-IP-GFX
+amdgpu/amd_basic@cs-sdma-with-IP-DMA
+amdgpu/amd_basic@semaphore-with-IP-GFX-and-IP-DMA
+amdgpu/amd_basic@eviction-test-with-IP-DMA
+amdgpu/amd_basic@sync-dependency-test-with-IP-GFX
+amdgpu/amd_color@crtc-linear-degamma
+amdgpu/amd_color@crtc-linear-regamma
+amdgpu/amd_color@crtc-lut-accuracy
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-mem-access
+amdgpu/amd_deadlock@amdgpu-deadlock-gfx
+amdgpu/amd_deadlock@amdgpu-deadlock-compute
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma-corrupted-header-test
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma-slow-linear-copy
+amdgpu/amd_freesync_video_mode@freesync-base-to-various
+amdgpu/amd_freesync_video_mode@freesync-lower-to-higher
+amdgpu/amd_freesync_video_mode@freesync-non-preferred-to-freesync
+amdgpu/amd_freesync_video_mode@freesync-custom-mode
+amdgpu/amd_info@query-firmware-version
+amdgpu/amd_info@query-timestamp
+amdgpu/amd_info@query-timestamp-while-idle
+amdgpu/amd_mall@static-screen
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-0
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-1
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-3
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-4
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-5
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+amdgpu/amd_psr@psr_enable
+amdgpu/amd_psr@psr_enable_null_crtc
+amdgpu/amd_psr@psr_su_mpo
+amdgpu/amd_psr@psr_su_ffu
+amdgpu/amd_psr@psr_su_cursor
+amdgpu/amd_psr@psr_su_cursor_mpo
+amdgpu/amd_psr@psr_su_mpo_scaling_1_5
+amdgpu/amd_psr@psr_su_mpo_scaling_0_75
+amdgpu/amd_security@amdgpu-security-alloc-buf-test
+amdgpu/amd_security@sdma-write-linear-helper-secure
+amdgpu/amd_security@gfx-write-linear-helper-secure
+amdgpu/amd_security@amdgpu-secure-bounce
+amdgpu/amd_uvd_dec@amdgpu_uvd_dec_create
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode
+amdgpu/amd_uvd_dec@amdgpu_uvd_dec_destroy
+amdgpu/amd_vcn@vcn-decoder-create-decode-destroy
+amdgpu/amd_vcn@vcn-encoder-create-encode-destroy
+amdgpu/amd_vrr_range@freesync-parsing
+amdgpu/amd_vrr_range@freesync-parsing-suspend
+amdgpu/amd_vrr_range@freesync-range
+amdgpu/amd_vrr_range@freesync-range-suspend
+panfrost_get_param@base-params
+panfrost_get_param@get-bad-param
+panfrost_get_param@get-bad-padding
+panfrost_gem_new@gem-new-4096
+panfrost_gem_new@gem-new-0
+panfrost_gem_new@gem-new-zeroed
+panfrost_prime@gem-prime-import
+panfrost_submit@pan-submit
+panfrost_submit@pan-submit-error-no-jc
+panfrost_submit@pan-submit-error-bad-in-syncs
+panfrost_submit@pan-submit-error-bad-bo-handles
+panfrost_submit@pan-submit-error-bad-requirements
+panfrost_submit@pan-submit-error-bad-out-sync
+panfrost_submit@pan-reset
+panfrost_submit@pan-submit-and-close
+panfrost_submit@pan-unhandled-pagefault
+v3d_create_bo@create-bo-invalid-flags
+v3d_create_bo@create-bo-0
+v3d_create_bo@create-bo-4096
+v3d_create_bo@create-bo-zeroed
+v3d_get_bo_offset@create-get-offsets
+v3d_get_bo_offset@get-bad-handle
+v3d_get_param@base-params
+v3d_get_param@get-bad-param
+v3d_get_param@get-bad-flags
+v3d_job_submission@array-job-submission
+v3d_job_submission@multiple-singlesync-to-multisync
+v3d_job_submission@threaded-job-submission
+v3d_mmap@mmap-bad-flags
+v3d_mmap@mmap-bad-handle
+v3d_mmap@mmap-bo
+v3d_perfmon@create-perfmon-0
+v3d_perfmon@create-perfmon-exceed
+v3d_perfmon@create-perfmon-invalid-counters
+v3d_perfmon@create-single-perfmon
+v3d_perfmon@create-two-perfmon
+v3d_perfmon@get-values-invalid-pad
+v3d_perfmon@get-values-invalid-perfmon
+v3d_perfmon@get-values-invalid-pointer
+v3d_perfmon@get-values-valid-perfmon
+v3d_perfmon@destroy-invalid-perfmon
+v3d_perfmon@destroy-valid-perfmon
+v3d_submit_cl@bad-pad
+v3d_submit_cl@bad-flag
+v3d_submit_cl@bad-extension
+v3d_submit_cl@bad-bo
+v3d_submit_cl@bad-perfmon
+v3d_submit_cl@bad-in-sync
+v3d_submit_cl@bad-multisync-pad
+v3d_submit_cl@bad-multisync-extension
+v3d_submit_cl@bad-multisync-out-sync
+v3d_submit_cl@bad-multisync-in-sync
+v3d_submit_cl@valid-submission
+v3d_submit_cl@single-out-sync
+v3d_submit_cl@single-in-sync
+v3d_submit_cl@simple-flush-cache
+v3d_submit_cl@valid-multisync-submission
+v3d_submit_cl@multisync-out-syncs
+v3d_submit_cl@multi-and-single-sync
+v3d_submit_cl@multiple-job-submission
+v3d_submit_cl@job-perfmon
+v3d_submit_csd@bad-pad
+v3d_submit_csd@bad-flag
+v3d_submit_csd@bad-extension
+v3d_submit_csd@bad-bo
+v3d_submit_csd@bad-perfmon
+v3d_submit_csd@bad-in-sync
+v3d_submit_csd@bad-multisync-pad
+v3d_submit_csd@bad-multisync-extension
+v3d_submit_csd@bad-multisync-out-sync
+v3d_submit_csd@bad-multisync-in-sync
+v3d_submit_csd@valid-submission
+v3d_submit_csd@single-out-sync
+v3d_submit_csd@single-in-sync
+v3d_submit_csd@valid-multisync-submission
+v3d_submit_csd@multisync-out-syncs
+v3d_submit_csd@multi-and-single-sync
+v3d_submit_csd@multiple-job-submission
+v3d_submit_csd@job-perfmon
+v3d_wait_bo@bad-bo
+v3d_wait_bo@bad-pad
+v3d_wait_bo@unused-bo-0ns
+v3d_wait_bo@unused-bo-1ns
+v3d_wait_bo@map-bo-0ns
+v3d_wait_bo@map-bo-1ns
+v3d_wait_bo@used-bo-0ns
+v3d_wait_bo@used-bo-1ns
+v3d_wait_bo@used-bo
+vc4_create_bo@create-bo-4096
+vc4_create_bo@create-bo-0
+vc4_create_bo@create-bo-zeroed
+vc4_dmabuf_poll@poll-write-waits-until-write-done
+vc4_dmabuf_poll@poll-read-waits-until-write-done
+vc4_label_bo@set-label
+vc4_label_bo@set-bad-handle
+vc4_label_bo@set-bad-name
+vc4_label_bo@set-kernel-name
+vc4_lookup_fail@bad-color-write
+vc4_mmap@mmap-bad-handle
+vc4_mmap@mmap-bo
+vc4_perfmon@create-perfmon-0
+vc4_perfmon@create-perfmon-exceed
+vc4_perfmon@create-perfmon-invalid-events
+vc4_perfmon@create-single-perfmon
+vc4_perfmon@create-two-perfmon
+vc4_perfmon@get-values-invalid-perfmon
+vc4_perfmon@get-values-invalid-pointer
+vc4_perfmon@get-values-valid-perfmon
+vc4_perfmon@destroy-invalid-perfmon
+vc4_perfmon@destroy-valid-perfmon
+vc4_purgeable_bo@mark-willneed
+vc4_purgeable_bo@mark-purgeable
+vc4_purgeable_bo@mark-purgeable-twice
+vc4_purgeable_bo@mark-unpurgeable-twice
+vc4_purgeable_bo@access-purgeable-bo-mem
+vc4_purgeable_bo@access-purged-bo-mem
+vc4_purgeable_bo@mark-unpurgeable-check-retained
+vc4_purgeable_bo@mark-unpurgeable-purged
+vc4_purgeable_bo@free-purged-bo
+vc4_tiling@get-bad-handle
+vc4_tiling@set-bad-handle
+vc4_tiling@get-bad-flags
+vc4_tiling@set-bad-flags
+vc4_tiling@get-bad-modifier
+vc4_tiling@set-bad-modifier
+vc4_tiling@set-get
+vc4_tiling@get-after-free
+vc4_wait_bo@bad-bo
+vc4_wait_bo@bad-pad
+vc4_wait_bo@unused-bo-0ns
+vc4_wait_bo@unused-bo-1ns
+vc4_wait_bo@used-bo-0ns
+vc4_wait_bo@used-bo-1ns
+vc4_wait_bo@used-bo
+vc4_wait_seqno@bad-seqno-0ns
+vc4_wait_seqno@bad-seqno-1ns
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..30d3252adddf 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,3 +1,21 @@
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
@@ -14,7 +32,13 @@ kms_bw@linear-tiling-1-displays-3840x2160p,Fail
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
@@ -23,5 +47,4 @@ kms_hdr@bpc-switch,Fail
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
index e2c538a0f954..6e6200e6392c 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,23 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# Skip driver specific tests
+msm_.*
+panfrost_.*
+v3d_.*
+vc4_.*
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
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 59438e4df86e..55a8807711eb 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,3 +1,4 @@
+kms_flip@busy-flip,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index fe55540a3f9a..33369735c821 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -1,4 +1,11 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
index 3430b215c06e..9804805984dc 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
@@ -3,4 +3,11 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
 # This is cascading issues
-kms_3d
\ No newline at end of file
+kms_3d
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 240ef8467c26..5d274066e589 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,3 +1,4 @@
+kms_flip@busy-flip,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 6d3d7ddc377f..e2c542d76e75 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -1,2 +1,9 @@
 # This is generating kernel oops with divide error
 kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 4596055d7e5e..4213a3156aab 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,5 +1,6 @@
 kms_fbcon_fbt@fbc,Fail
 kms_flip@blocking-wf_vblank,Fail
+kms_flip@busy-flip,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
@@ -33,4 +34,3 @@ kms_plane_alpha_blend@constant-alpha-max,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
-kms_setmode@basic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 4c7d00ce14bc..76d987f9b397 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -2,4 +2,11 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index 4c7d00ce14bc..76d987f9b397 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -2,4 +2,11 @@
 .*suspend.*
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 27bfca1c6f2c..01a0b6a889ba 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -9,6 +9,8 @@ kms_bw@linear-tiling-5-displays-1920x1080p,Fail
 kms_bw@linear-tiling-5-displays-2560x1440p,Fail
 kms_bw@linear-tiling-5-displays-3840x2160p,Fail
 kms_flip@flip-vs-panning-vs-hang,Timeout
+kms_flip@flip-vs-rmfb,Fail
+kms_flip@plain-flip-fb-recreate,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index 1d0621750b14..c27412db3041 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -8,4 +8,11 @@ gem_eio.*
 kms_flip@absolute-wf_vblank@a-edp1
 
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 967327ddc1ac..b405657a652d 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -9,6 +9,7 @@ kms_bw@linear-tiling-4-displays-2560x1440p,Fail
 kms_bw@linear-tiling-4-displays-3840x2160p,Fail
 kms_fbcon_fbt@fbc,Fail
 kms_fbcon_fbt@fbc-suspend,Fail
+kms_flip@busy-flip,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
index f3be0888a214..e2c542d76e75 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
@@ -1,2 +1,9 @@
 # This is generating kernel oops with divide error
-kms_plane_scaling@invalid-parameters
\ No newline at end of file
+kms_plane_scaling@invalid-parameters
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index ef0cb7c3698c..640da02e508a 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -17,10 +17,7 @@ kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
-kms_force_connector_basic@force-edid,Fail
 kms_force_connector_basic@force-load-detect,Fail
-kms_force_connector_basic@prune-stale-modes,Fail
-kms_hdmi_inject@inject-4k,Fail
 kms_plane_scaling@planes-upscale-20x20,Fail
 kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
 kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
new file mode 100644
index 000000000000..f1a96db6a64e
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -0,0 +1,6 @@
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 67d690fc4037..2a09c88c0702 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -11,3 +11,4 @@ kms_plane_cursor@primary,Fail
 kms_plane_cursor@viewport,Fail
 kms_plane_scaling@upscale-with-rotation-20x20,Fail
 kms_rmfb@close-fd,Fail
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
new file mode 100644
index 000000000000..beb8d37362cf
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -0,0 +1,5 @@
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 56a2ae7047b4..9e7c9683e74c 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -14,3 +14,4 @@ kms_properties@connector-properties-atomic,Fail
 kms_properties@connector-properties-legacy,Fail
 kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@get_properties-sanity-non-atomic,Fail
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
new file mode 100644
index 000000000000..beb8d37362cf
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -0,0 +1,5 @@
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
new file mode 100644
index 000000000000..83d9bba9cafd
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
@@ -0,0 +1,5 @@
+# Skip driver specific tests
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index cd49c8ce2059..66b7fde54bd1 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -1,2 +1,8 @@
 # Whole machine hangs
-kms_cursor_legacy@all-pipes-torture-move
\ No newline at end of file
+kms_cursor_legacy@all-pipes-torture-move
+
+# Skip driver specific tests
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index 327039f70252..57beedbbedf6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -1,2 +1,8 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 327039f70252..57beedbbedf6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -1,2 +1,8 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
+
+# Skip driver specific tests
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index 618e3a3a7277..5018fc3f0495 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -5,3 +5,9 @@ kms_bw.*
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
 # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
 msm_mapping@*
+
+# Skip driver specific tests
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 90c63f519e9e..282817a22cf8 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -52,3 +52,4 @@ kms_properties@get_properties-sanity-atomic,Crash
 kms_properties@get_properties-sanity-non-atomic,Crash
 kms_rmfb@close-fd,Crash
 kms_setmode@invalid-clone-single-crtc,Crash
+panfrost_prime@gem-prime-import,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index f20c3574b75a..3e99106e50e0 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -49,4 +49,10 @@ kms_plane_lowres@pipe-F-tiling-y
 kms_cursor_crc.*
 
 # Machine is hanging in this test, so skip it
-kms_pipe_crc_basic@disable-crc-after-crtc
\ No newline at end of file
+kms_pipe_crc_basic@disable-crc-after-crtc
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index d516d9c1d546..32ca7f29472e 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -73,3 +73,4 @@ kms_plane_multiple@tiling-none,Fail
 kms_prime@basic-crc,Fail
 kms_rmfb@close-fd,Fail
 kms_universal_plane@universal-plane-pipe-B-functional,Fail
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 10c3d81a919a..bd0bba0d8477 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -3,3 +3,9 @@
 
 # Too unstable, machine ends up hanging after lots of Oopses
 kms_cursor_legacy.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 007f21e56d89..5b8cbb28b25c 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -68,6 +68,7 @@ kms_plane_scaling@upscale-with-rotation-20x20,Fail
 kms_selftest@drm_format,Timeout
 kms_selftest@drm_format_helper,Timeout
 kms_setmode@basic,Fail
+kms_vblank@accuracy-idle,Fail
 kms_vblank@crtc-id,Fail
 kms_vblank@invalid,Fail
 kms_vblank@pipe-A-accuracy-idle,Fail
@@ -82,3 +83,17 @@ kms_vblank@pipe-A-wait-busy,Fail
 kms_vblank@pipe-A-wait-forked,Fail
 kms_vblank@pipe-A-wait-forked-busy,Fail
 kms_vblank@pipe-A-wait-idle,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-dpms-suspend,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@ts-continuation-suspend,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 78be18174012..4e4a087ce49a 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -3,4 +3,11 @@
 kms_cursor_legacy.*
 
 # Job just hangs without any output
-kms_flip@flip-vs-suspend.*
\ No newline at end of file
+kms_flip@flip-vs-suspend.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+panfrost_.*
+v3d_.*
+vc4_.*
-- 
2.40.1

