Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375663B28D4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C06EA36;
	Thu, 24 Jun 2021 07:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515306E986;
 Thu, 24 Jun 2021 07:29:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78F6C21966;
 Thu, 24 Jun 2021 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EUVgQWZjNSlPOwlQJU4bzYuB/YGQiDl3S47gswQlIkM=;
 b=wglcSBsLTBQ3ei6BxYK5d9SydJ3e5F+a66G6BOyOTZLEwKvHbcKirhkaVkn4HGdih7Jkuv
 lm1BMokphzYz7V1K+KM1ymEyHRMfFtGQeVAZ09yEBlWAn/dJ/UjhXzGC3T2SZ+Bfi8Tzu6
 MfrG1ShNojJgurv+fjncCU2DgW3B+uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EUVgQWZjNSlPOwlQJU4bzYuB/YGQiDl3S47gswQlIkM=;
 b=D758gxqI1uHlShUSzY4ZWAkhFsDHW/tqXNK29CYpEb5M/mK2EKbmmiPOUOndQe3D2qVknN
 LMsG8ZKa3NvPvnDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4F58611A97;
 Thu, 24 Jun 2021 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624519760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EUVgQWZjNSlPOwlQJU4bzYuB/YGQiDl3S47gswQlIkM=;
 b=wglcSBsLTBQ3ei6BxYK5d9SydJ3e5F+a66G6BOyOTZLEwKvHbcKirhkaVkn4HGdih7Jkuv
 lm1BMokphzYz7V1K+KM1ymEyHRMfFtGQeVAZ09yEBlWAn/dJ/UjhXzGC3T2SZ+Bfi8Tzu6
 MfrG1ShNojJgurv+fjncCU2DgW3B+uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624519760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EUVgQWZjNSlPOwlQJU4bzYuB/YGQiDl3S47gswQlIkM=;
 b=D758gxqI1uHlShUSzY4ZWAkhFsDHW/tqXNK29CYpEb5M/mK2EKbmmiPOUOndQe3D2qVknN
 LMsG8ZKa3NvPvnDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dLt+Ek801GAJfwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v3 00/27] Deprecate struct drm_device.irq_enabled
Date: Thu, 24 Jun 2021 09:28:49 +0200
Message-Id: <20210624072916.27703-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove references to struct drm_device.irq_enabled from modern
DRM drivers and core.

KMS drivers enable IRQs for their devices internally. They don't
have to keep track of the IRQ state via irq_enabled. For vblanking,
it's cleaner to test for vblanking support directly than to test
for enabled IRQs.

The first 3 patches replace uses of irq_enabled that are not
required.

Patch 4 fixes vblank ioctls to actually test for vblank support
instead of IRQs (for KMS drivers).

The rest of the patchset removes irq_enabled from all non-legacy
drivers. The only exceptions are i915 and omapdrm, which have an
internal dpendency on the field's value. For these drivers, the
state gets duplicated internally.

With the patchset applied, drivers can later switch over to plain
Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.

v3:
	* update armada, i915, rcar-du and vkms as well (Laurent)
	* optimize drm_wait_vblank_ioctl() for KMS (Liviu)
	* move imx/dcss changes into their own patch (Laurentiu)
	* doc cleanups
v2:
	* keep the original test for legacy drivers in
	  drm_wait_vblank_ioctl() (Daniel)

Thomas Zimmermann (27):
  drm/amdgpu: Track IRQ state in local device state
  drm/hibmc: Call drm_irq_uninstall() unconditionally
  drm/radeon: Track IRQ state in local device state
  drm: Don't test for IRQ support in VBLANK ioctls
  drm/armada: Don't set struct drm_device.irq_enabled
  drm/i915: Track IRQ state in local device state
  drm/komeda: Don't set struct drm_device.irq_enabled
  drm/malidp: Don't set struct drm_device.irq_enabled
  drm/exynos: Don't set struct drm_device.irq_enabled
  drm/kirin: Don't set struct drm_device.irq_enabled
  drm/imx: Don't set struct drm_device.irq_enabled
  drm/imx/dcss: Don't set struct drm_device.irq_enabled
  drm/mediatek: Don't set struct drm_device.irq_enabled
  drm/nouveau: Don't set struct drm_device.irq_enabled
  drm/omapdrm: Track IRQ state in local device state
  drm/rcar-du: Don't set struct drm_device.irq_enabled
  drm/rockchip: Don't set struct drm_device.irq_enabled
  drm/sti: Don't set struct drm_device.irq_enabled
  drm/stm: Don't set struct drm_device.irq_enabled
  drm/sun4i: Don't set struct drm_device.irq_enabled
  drm/tegra: Don't set struct drm_device.irq_enabled
  drm/tidss: Don't use struct drm_device.irq_enabled
  drm/vc4: Don't set struct drm_device.irq_enabled
  drm/vkms: Don't set struct drm_device.irq_enabled
  drm/vmwgfx: Don't set struct drm_device.irq_enabled
  drm/xlnx: Don't set struct drm_device.irq_enabled
  drm/zte: Don't set struct drm_device.irq_enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
 drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
 drivers/gpu/drm/armada/armada_drv.c             |  2 --
 drivers/gpu/drm/drm_irq.c                       | 13 ++++---------
 drivers/gpu/drm/drm_vblank.c                    | 16 ++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
 drivers/gpu/drm/i915/i915_drv.h                 |  2 ++
 drivers/gpu/drm/i915/i915_irq.c                 |  8 ++++----
 drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
 drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
 drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
 drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
 drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           |  2 --
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
 drivers/gpu/drm/sti/sti_compositor.c            |  2 --
 drivers/gpu/drm/stm/ltdc.c                      |  3 ---
 drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
 drivers/gpu/drm/tegra/drm.c                     |  7 -------
 drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
 drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
 drivers/gpu/drm/vkms/vkms_drv.c                 |  2 --
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
 drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
 31 files changed, 40 insertions(+), 123 deletions(-)


base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.32.0

