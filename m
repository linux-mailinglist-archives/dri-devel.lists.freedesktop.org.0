Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7888BFF8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B57710EE3B;
	Tue, 26 Mar 2024 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iffmbgb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DD910EE3B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:56:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBA79601D9;
 Tue, 26 Mar 2024 10:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FD0C433F1;
 Tue, 26 Mar 2024 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450595;
 bh=J8lrQuyleqZ3Z0oKznw7gUrImYq9vEmcBPSBiPoc0us=;
 h=From:Subject:Date:To:Cc:From;
 b=iffmbgb+NEZhzB/8W0hC21J1VkIcZ68GVxGY3yXowZ+Num8kg6Eetzv1jgSnThpBL
 l5t2wTWs+RxADn7nGC8vHQIgmzfmkv3hMLrsIgWg0zvOOA1FTiGAze0gTlNLwOyqRR
 CL71xrC/ShhfzHMQ0I3VoG6JtGO13yjK0qs7X+BPy38WAPYQ6M2Fjho6+2FgGCyT64
 EeQ5gn8C1UtETdUSKvPdcm2o0HSsCd8JsnQx0Y+nbsyjOXWxoMlAcnM3S5XBGJFOvn
 lQEPezin5Wq8IioegzRMdr6D1lc/pUM90xUxejGZPnY1u2zt/C1XkDn/TQo8TSYN3l
 uy+tecThsjIyA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
Date: Tue, 26 Mar 2024 11:56:13 +0100
Message-Id: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2pAmYC/32NQQqDMBBFryKz7hSNVkhXvYe40GSigzaRSQkt4
 t2beoAu34P//g6RhCnCvdhBKHHk4DOoSwFmHvxEyDYzqFI1Za1uuDwjLiZ4xxPOtG4kEZ1utK5
 Ga1s3QF5uQo7fZ7XrM88cX0E+50mqfvZ/L1VY4ujItDlstakfC4mn9Rpkgv44ji/aDbXgtwAAA
 A==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395; i=mripard@kernel.org;
 h=from:subject:message-id; bh=J8lrQuyleqZ3Z0oKznw7gUrImYq9vEmcBPSBiPoc0us=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK6884PXasCJZVORkzI3FhxdvP2h64wED29MHzxilm
 fqDT8062jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAm4iDP2DBnvbyy3PSvW0te
 PFup4XGnzfTFFrZne7QPzNOc+ylf6YET1z6dnbP8vBX0Nrr98nn6ZC5jwyX23Glfz4i7X/o1f/O
 iye5XpX8X+VpcWThvWxHPY90VYineb6a7v7t9sHkjVwCzgkBNHQA=
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
Changes in v2:
- Make all the symbols that used to be selected enabled by default to
  prevent defconfig disruptions.
- Fix typo in commit log of patch 3
- Link to v1: https://lore.kernel.org/r/20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org

---
Maxime Ripard (12):
      drm/display: Make DisplayPort AUX bus Kconfig name consistent
      drm/display: Make DisplayPort tunnel debug Kconfig name consistent
      drm/display: Make DisplayPort AUX Chardev Kconfig name consistent
      drm/display: Make DisplayPort CEC-over-AUX Kconfig name consistent
      drm/display: Reorder Kconfig symbols
      drm/display: Make all helpers visible and switch to depends on
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
 drivers/gpu/drm/bridge/synopsys/Kconfig          |  4 +-
 drivers/gpu/drm/display/Kconfig                  | 75 +++++++++++++-----------
 drivers/gpu/drm/display/Makefile                 |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_helper_internal.h |  2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c          | 10 ++--
 drivers/gpu/drm/exynos/Kconfig                   |  4 +-
 drivers/gpu/drm/i915/Kconfig                     |  8 +--
 drivers/gpu/drm/i915/Kconfig.debug               |  4 +-
 drivers/gpu/drm/mediatek/Kconfig                 |  6 +-
 drivers/gpu/drm/msm/Kconfig                      |  8 +--
 drivers/gpu/drm/nouveau/Kconfig                  | 10 ++--
 drivers/gpu/drm/panel/Kconfig                    | 32 +++++-----
 drivers/gpu/drm/radeon/Kconfig                   |  8 ++-
 drivers/gpu/drm/rockchip/Kconfig                 |  8 +--
 drivers/gpu/drm/tegra/Kconfig                    |  8 +--
 drivers/gpu/drm/vc4/Kconfig                      | 10 ++--
 drivers/gpu/drm/xe/Kconfig                       | 13 ++--
 drivers/gpu/drm/xlnx/Kconfig                     |  8 ++-
 include/drm/display/drm_dp_helper.h              |  2 +-
 26 files changed, 161 insertions(+), 142 deletions(-)
---
base-commit: 5e842d55bad7794823a50f24fd645b58f2ef93ab
change-id: 20240325-kms-kconfig-helpers-f94991bdd6fa

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

