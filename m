Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF788DB9F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565F110F9EF;
	Wed, 27 Mar 2024 10:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DwGjZP68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242B810F9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0DFB2614FB;
 Wed, 27 Mar 2024 10:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A56EC433A6;
 Wed, 27 Mar 2024 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537032;
 bh=GmrFbMCCs/WBfARhSq8qJ42ysValbs34EHno9YMSOuw=;
 h=From:Subject:Date:To:Cc:From;
 b=DwGjZP68j6lug5RhvqstGPNwlHy1FHRiIoMlT1sYYyn0b1G75N8H0fkwuHFhhsE/I
 xhNA1cGZWLGyl5lcz0zw3nT2pSVodZYULoMxYwpBo/mKgPLFlgusN+F/0r3/nAQRdz
 fEdZuALOAFqE+/kndMCaxsTCjEeTtJ+4aBVB1rm9K3rFSwJar3P648gtiukdyO5IBh
 gOiLt4D3p42WN3r2oSIfxdFPDwv0T5rXHXg06MSt3eC2n3cmSHUNyrRLl9hw+5Hdf3
 BkkuTzWNDrKvEDoV3O6JZ5msh061Ff2P8N0hAJ5OrJkkf1diDIwGZsUTw9z2+BO0i/
 WlgFyxqsLtruw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
 depends on
Date: Wed, 27 Mar 2024 11:56:55 +0100
Message-Id: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHf7A2YC/33NTQrCMBCG4avIrB3JT63ElfcQF20yaUNrUhIJS
 undTbtSEJfvB/PMDImiowTn3QyRsksu+BJyvwPdN74jdKY0CCYqJsURh3vCQQdvXYc9jRPFhFZ
 VSvHWmNo2UC6nSNY9N/V6K9279AjxtT3JfF3/e5kjw9aSrgtslJaXgaKn8RBiByuYxSdS/0ZEQ
 WTLGiKSQvDTF7IsyxsVxE2p/AAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3952; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GmrFbMCCs/WBfARhSq8qJ42ysValbs34EHno9YMSOuw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv+u/KbR2f7cN0vvzL07q4pKnG5fUPH5Q+e3h/TeW0
 bKCLR2+HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiT30ZG6ZeDflvtav0VVSO
 +qy9RROqQ7c9XLe/gvnagwstTT+DmQz+/frfdUuh4ESh6hXv3EzZcMaGL9VW6Qe2s/9Kv3LSPvx
 BxlYNnYO1224oPPM+mXclWEsq6N3V0417bu0Ult6gxq+jJxIEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

Jani recently pointed out that the Kconfig symbols are a bit difficult
to work with at the moment when they depend on each other, and that
using depends on would be a better idea, but no one really did the work
so far.

So here it goes :)

It's been tested by comparing the riscv defconfig, arm
multi_v7_defconfig, arm64 defconfig, drm-misc-arm, drm-misc-arm64 and
drm-misc-x86 before and after this series and making sure they are
identical.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Fix a build issue for DRM_DW_HDMI
- Link to v2: https://lore.kernel.org/r/20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org

Changes in v2:
- Make all the symbols that used to be selected enabled by default to
  prevent defconfig disruptions.
- Fix typo in commit log of patch 3
- Link to v1: https://lore.kernel.org/r/20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org

---
Maxime Ripard (13):
      drm/display: Make DisplayPort AUX bus Kconfig name consistent
      drm/display: Make DisplayPort tunnel debug Kconfig name consistent
      drm/display: Make DisplayPort AUX Chardev Kconfig name consistent
      drm/display: Make DisplayPort CEC-over-AUX Kconfig name consistent
      drm/display: Reorder Kconfig symbols
      drm/display: Make all helpers visible and switch to depends on
      drm: Make drivers depends on DRM_DW_HDMI
      drm: Switch DRM_DISPLAY_HELPER to depends on
      drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on
      drm: Switch DRM_DISPLAY_DP_HELPER to depends on
      drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on
      drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on
      drm/bridge: it6505: Remove useless select

 arch/parisc/configs/generic-32bit_defconfig      |  2 +-
 drivers/gpu/drm/Kconfig                          |  8 ++-
 drivers/gpu/drm/amd/amdgpu/Kconfig               | 12 ++--
 drivers/gpu/drm/bridge/Kconfig                   | 29 +++++----
 drivers/gpu/drm/bridge/analogix/Kconfig          | 16 ++---
 drivers/gpu/drm/bridge/cadence/Kconfig           |  8 +--
 drivers/gpu/drm/bridge/imx/Kconfig               |  4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig          |  4 +-
 drivers/gpu/drm/display/Kconfig                  | 75 +++++++++++++-----------
 drivers/gpu/drm/display/Makefile                 |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_helper_internal.h |  2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c          | 10 ++--
 drivers/gpu/drm/exynos/Kconfig                   |  4 +-
 drivers/gpu/drm/i915/Kconfig                     |  8 +--
 drivers/gpu/drm/i915/Kconfig.debug               |  4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                |  5 +-
 drivers/gpu/drm/ingenic/Kconfig                  |  2 +-
 drivers/gpu/drm/mediatek/Kconfig                 |  6 +-
 drivers/gpu/drm/meson/Kconfig                    |  2 +-
 drivers/gpu/drm/msm/Kconfig                      |  8 +--
 drivers/gpu/drm/nouveau/Kconfig                  | 10 ++--
 drivers/gpu/drm/panel/Kconfig                    | 32 +++++-----
 drivers/gpu/drm/radeon/Kconfig                   |  8 ++-
 drivers/gpu/drm/renesas/rcar-du/Kconfig          |  2 +-
 drivers/gpu/drm/rockchip/Kconfig                 | 10 ++--
 drivers/gpu/drm/sun4i/Kconfig                    |  2 +-
 drivers/gpu/drm/tegra/Kconfig                    |  8 +--
 drivers/gpu/drm/vc4/Kconfig                      | 10 ++--
 drivers/gpu/drm/xe/Kconfig                       | 13 ++--
 drivers/gpu/drm/xlnx/Kconfig                     |  8 ++-
 include/drm/display/drm_dp_helper.h              |  2 +-
 32 files changed, 171 insertions(+), 151 deletions(-)
---
base-commit: 5e842d55bad7794823a50f24fd645b58f2ef93ab
change-id: 20240325-kms-kconfig-helpers-f94991bdd6fa

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

