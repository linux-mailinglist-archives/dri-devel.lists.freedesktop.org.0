Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D939E3CB9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78DA10E340;
	Wed,  4 Dec 2024 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFMd5SeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534B10E2AA;
 Wed,  4 Dec 2024 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733322678; x=1764858678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nay1gnhVbkiMLBv1I4wuTvkENs2han/NjHOXtQx7SIs=;
 b=MFMd5SePxLvcRlAgCaH284yf9kX8Tzenqtve85qYKwhDFewgwXwWIe2z
 sFm4gQqw6lNR0LUETFpV/Bog+X17oWFkLk07xnHWCaJ3kQuXW1lOJGX2f
 bCuIm9m3EQhDcRvHdqOAkLDne0diQM/YJXIRsBo17BFGiYqSySYsbNNo4
 hBHRvhKkdUK56qSqEZAjcfCAbmJasiX9xfQHitRg19i+/6lx09xT0D1+d
 lCYU0iFpyF5FiX527/qGIld25v4ONMRwPN7tIVuCIRZd3PwdhMB4OHYtQ
 6fPmzJRg3htj/HfM4/8PKly2sWc6qJis1N4VrLB8AnaBZjp/0wefQmYA9 A==;
X-CSE-ConnectionGUID: YG1w9DX5TcKyMJNUG2nx5w==
X-CSE-MsgGUID: +gq6QITARwy1UFWJ1Oqlfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44255512"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44255512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:18 -0800
X-CSE-ConnectionGUID: OXUL59ePTK6if2kv+s8f4w==
X-CSE-MsgGUID: S7NX28XMRxWXwWHN6J1N2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93963312"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/3] drm: remove driver date
Date: Wed,  4 Dec 2024 16:31:09 +0200
Message-Id: <cover.1733322525.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Resend, crunched this through more configs enabled to be sure.

BR,
Jani.



Jani Nikula (3):
  drm/xen: remove redundant initialization info print
  accel/ivpu: remove DRIVER_DATE conditional drm_driver init
  drm: remove driver date from struct drm_driver and all drivers

 drivers/accel/habanalabs/common/habanalabs_drv.c | 1 -
 drivers/accel/ivpu/ivpu_drv.c                    | 8 --------
 drivers/accel/qaic/qaic_drv.c                    | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          | 2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h          | 1 -
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c  | 1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                  | 1 -
 drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
 drivers/gpu/drm/armada/armada_drv.c              | 1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c          | 1 -
 drivers/gpu/drm/ast/ast_drv.c                    | 1 -
 drivers/gpu/drm/ast/ast_drv.h                    | 1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.c            | 1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c          | 2 --
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c        | 1 -
 drivers/gpu/drm/gma500/psb_drv.c                 | 1 -
 drivers/gpu/drm/gma500/psb_drv.h                 | 1 -
 drivers/gpu/drm/gud/gud_drv.c                    | 1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c  | 1 -
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c          | 2 --
 drivers/gpu/drm/i915/i915_driver.c               | 1 -
 drivers/gpu/drm/i915/i915_driver.h               | 1 -
 drivers/gpu/drm/i915/i915_gpu_error.c            | 1 -
 drivers/gpu/drm/imagination/pvr_drv.c            | 1 -
 drivers/gpu/drm/imagination/pvr_drv.h            | 1 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c              | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c         | 1 -
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c              | 1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 1 -
 drivers/gpu/drm/kmb/kmb_drv.c                    | 1 -
 drivers/gpu/drm/kmb/kmb_drv.h                    | 1 -
 drivers/gpu/drm/lima/lima_drv.c                  | 1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c            | 1 -
 drivers/gpu/drm/loongson/lsdc_drv.c              | 2 --
 drivers/gpu/drm/mcde/mcde_drv.c                  | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 2 --
 drivers/gpu/drm/meson/meson_drv.c                | 1 -
 drivers/gpu/drm/mgag200/mgag200_drv.c            | 1 -
 drivers/gpu/drm/mgag200/mgag200_drv.h            | 1 -
 drivers/gpu/drm/msm/msm_drv.c                    | 1 -
 drivers/gpu/drm/mxsfb/lcdif_drv.c                | 1 -
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 5 -----
 drivers/gpu/drm/nouveau/nouveau_drv.h            | 1 -
 drivers/gpu/drm/omapdrm/omap_drv.c               | 2 --
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 1 -
 drivers/gpu/drm/panthor/panthor_drv.c            | 1 -
 drivers/gpu/drm/pl111/pl111_drv.c                | 1 -
 drivers/gpu/drm/qxl/qxl_drv.c                    | 1 -
 drivers/gpu/drm/qxl/qxl_drv.h                    | 1 -
 drivers/gpu/drm/radeon/radeon_drv.c              | 1 -
 drivers/gpu/drm/radeon/radeon_drv.h              | 1 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c    | 1 -
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 1 -
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 2 --
 drivers/gpu/drm/solomon/ssd130x.c                | 2 --
 drivers/gpu/drm/sprd/sprd_drm.c                  | 2 --
 drivers/gpu/drm/sti/sti_drv.c                    | 2 --
 drivers/gpu/drm/stm/drv.c                        | 1 -
 drivers/gpu/drm/sun4i/sun4i_drv.c                | 1 -
 drivers/gpu/drm/tegra/drm.c                      | 2 --
 drivers/gpu/drm/tidss/tidss_drv.c                | 1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 1 -
 drivers/gpu/drm/tiny/arcpgu.c                    | 1 -
 drivers/gpu/drm/tiny/bochs.c                     | 1 -
 drivers/gpu/drm/tiny/cirrus-qemu.c               | 2 --
 drivers/gpu/drm/tiny/gm12u320.c                  | 2 --
 drivers/gpu/drm/tiny/hx8357d.c                   | 1 -
 drivers/gpu/drm/tiny/ili9163.c                   | 1 -
 drivers/gpu/drm/tiny/ili9225.c                   | 1 -
 drivers/gpu/drm/tiny/ili9341.c                   | 1 -
 drivers/gpu/drm/tiny/ili9486.c                   | 1 -
 drivers/gpu/drm/tiny/mi0283qt.c                  | 1 -
 drivers/gpu/drm/tiny/ofdrm.c                     | 2 --
 drivers/gpu/drm/tiny/panel-mipi-dbi.c            | 1 -
 drivers/gpu/drm/tiny/repaper.c                   | 1 -
 drivers/gpu/drm/tiny/sharp-memory.c              | 1 -
 drivers/gpu/drm/tiny/simpledrm.c                 | 2 --
 drivers/gpu/drm/tiny/st7586.c                    | 1 -
 drivers/gpu/drm/tiny/st7735r.c                   | 1 -
 drivers/gpu/drm/tve200/tve200_drv.c              | 1 -
 drivers/gpu/drm/udl/udl_drv.c                    | 1 -
 drivers/gpu/drm/udl/udl_drv.h                    | 1 -
 drivers/gpu/drm/v3d/v3d_drv.c                    | 2 --
 drivers/gpu/drm/vboxvideo/vbox_drv.c             | 1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.h             | 1 -
 drivers/gpu/drm/vc4/vc4_drv.c                    | 3 ---
 drivers/gpu/drm/vgem/vgem_drv.c                  | 2 --
 drivers/gpu/drm/virtio/virtgpu_drv.c             | 1 -
 drivers/gpu/drm/virtio/virtgpu_drv.h             | 1 -
 drivers/gpu/drm/vkms/vkms_drv.c                  | 2 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h              | 1 -
 drivers/gpu/drm/xe/xe_device.c                   | 1 -
 drivers/gpu/drm/xe/xe_drv.h                      | 1 -
 drivers/gpu/drm/xen/xen_drm_front.c              | 6 ------
 drivers/gpu/drm/xlnx/zynqmp_kms.c                | 1 -
 include/drm/drm_drv.h                            | 2 --
 101 files changed, 138 deletions(-)

-- 
2.39.5

