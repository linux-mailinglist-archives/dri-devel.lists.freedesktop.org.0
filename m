Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461D88A057
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3413D10E831;
	Mon, 25 Mar 2024 12:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NpZo3569";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0193410E831
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:52:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E33EE60FD1;
 Mon, 25 Mar 2024 12:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E81C433F1;
 Mon, 25 Mar 2024 12:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711371135;
 bh=X1kgTmpeXW5+7R6ZXqAP8cLUvg5M5Sag2AFv8K5YzgY=;
 h=From:Subject:Date:To:Cc:From;
 b=NpZo3569Ote5XSerZLkC4jsKXFmzou0YBXdVaNz44JDWmsaKjpbzwB28FfiVCJR/A
 T/tHUzEdCa3RVRCkVX0eA5ge4giJWjm3uX3Dv7kcu4NzklzkVyOGyTe+l7gXuHkBrg
 BGT9E11tm2VfoWg3hPhSizA9CLIGPryrLTELzb9MOXIXTdDwahG1HWijVAhldTpLqd
 PFoXsX67LB9/3gVN0qv2yUbycQGSUZyP/NooTUMywbwxOuUtPcYw3R5diW8jsBt6XF
 ZnwO/jdyurERPuSgcDNqiMM4F3LbGNzkMpwZG8qdpJh6SrKug9RQjGVJ7NwuqtoJt8
 rlC4NsZMjKWag==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
Date: Mon, 25 Mar 2024 13:52:02 +0100
Message-Id: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJzAWYC/x3MQQqAIBBA0avErBsos8CuEi0sxxoqCwciCO+et
 HyL/18QikwCffFCpJuFz5BRlwXMqw0LIbtsUJXSVaNa3A7BbT6D5wVX2i+Kgt5oY+rJuc5byOU
 VyfPzX4cxpQ/RgAC9ZQAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3079; i=mripard@kernel.org;
 h=from:subject:message-id; bh=X1kgTmpeXW5+7R6ZXqAP8cLUvg5M5Sag2AFv8K5YzgY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGmMxWVvBasK88NN61+x+paeeazs83DOkk979PiubmxOf
 KA4W+RIx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI/kPGhqtmwUsuVTXKbJ4Y
 rMIuuPZL1amJyoW1lcd4DT6d6VliIzlrgmTJ95hfXX/NUxxdcv8oMja83rZOYff5XVYiLfdnPGg
 94D1hv/8n1vdr25NbPrJ+6UuzEphonf75y4QPTzUK4xa+a5gHAA==
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

It's been tested by comparing the drm-misc-arm, drm-misc-arm64 and
drm-misc-x86 before and after this series and making sure they are
identical.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
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
 drivers/gpu/drm/Kconfig                          |  8 +--
 drivers/gpu/drm/amd/amdgpu/Kconfig               | 12 +++--
 drivers/gpu/drm/bridge/Kconfig                   | 29 +++++-----
 drivers/gpu/drm/bridge/analogix/Kconfig          | 16 +++---
 drivers/gpu/drm/bridge/cadence/Kconfig           |  8 +--
 drivers/gpu/drm/bridge/synopsys/Kconfig          |  4 +-
 drivers/gpu/drm/display/Kconfig                  | 68 ++++++++++++------------
 drivers/gpu/drm/display/Makefile                 |  6 +--
 drivers/gpu/drm/display/drm_dp_helper.c          |  2 +-
 drivers/gpu/drm/display/drm_dp_helper_internal.h |  2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c          | 10 ++--
 drivers/gpu/drm/exynos/Kconfig                   |  4 +-
 drivers/gpu/drm/i915/Kconfig                     |  8 +--
 drivers/gpu/drm/i915/Kconfig.debug               |  4 +-
 drivers/gpu/drm/mediatek/Kconfig                 |  6 +--
 drivers/gpu/drm/msm/Kconfig                      |  8 +--
 drivers/gpu/drm/nouveau/Kconfig                  | 10 ++--
 drivers/gpu/drm/panel/Kconfig                    | 32 +++++------
 drivers/gpu/drm/radeon/Kconfig                   |  8 +--
 drivers/gpu/drm/rockchip/Kconfig                 |  8 +--
 drivers/gpu/drm/tegra/Kconfig                    |  8 +--
 drivers/gpu/drm/vc4/Kconfig                      | 10 ++--
 drivers/gpu/drm/xe/Kconfig                       | 13 +++--
 drivers/gpu/drm/xlnx/Kconfig                     |  8 +--
 include/drm/display/drm_dp_helper.h              |  2 +-
 26 files changed, 155 insertions(+), 141 deletions(-)
---
base-commit: 5e842d55bad7794823a50f24fd645b58f2ef93ab
change-id: 20240325-kms-kconfig-helpers-f94991bdd6fa

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

