Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DCAFE0B0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFF310E73E;
	Wed,  9 Jul 2025 07:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZwK7Ywp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731118.qiye.163.com (mail-m19731118.qiye.163.com
 [220.197.31.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9F10E73E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:02:24 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b799a;
 Wed, 9 Jul 2025 15:02:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 00/12] Apply drm_bridge_connector helper for the Analogix
 DP driver
Date: Wed,  9 Jul 2025 15:01:27 +0800
Message-Id: <20250709070139.3130635-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh8dTlYeS04YHR9IGE8fHhlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe02a503a3kunm3a7bcd50c83882
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Lww*KjEzQi8rFRVMI0oR
 NjxPCTdVSlVKTE5JS09PTkhDTE9MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0NNNwY+
DKIM-Signature: a=rsa-sha256;
 b=ZwK7Ywp5C+VjGI7jFlKvgIwk+1+l+e/7zKTo8xfobMIrnOsi7a2QU8ONWp4yynusrFZ+sJtHriTtrdJb38/HUkENYELRlSR7UJ2qy0bHUH2/KbsrnLVkLn+olHV8VIYm7s9U/838ajb8N3TGCodnJVASttHPQ/4vD0LCe9WOzJY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=+bjluHkW3SFP0xqLuvonF0izTiZCHO6le07wELtphZs=;
 h=date:mime-version:subject:message-id:from;
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

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
PATCH 9 is to apply a better API for the encoder initialization.
PATCH 10-11 are to apply the newly added API to find panel or bridge.
PATCH 12 is to apply the drm_bridge_connector helper.

Damon Ding (12):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Add support to find panel or bridge
  drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
    drm_simple_encoder_init()
  drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/bridge: analogix_dp: Remove unused APIs for AUX bus
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
 include/drm/bridge/analogix_dp.h              |   6 +-
 5 files changed, 217 insertions(+), 236 deletions(-)

-- 
2.34.1

