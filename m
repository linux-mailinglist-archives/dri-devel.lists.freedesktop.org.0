Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661BA1A173
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8810E7A8;
	Thu, 23 Jan 2025 10:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YDvqwG/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973195.qiye.163.com (mail-m1973195.qiye.163.com
 [220.197.31.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324210E7A8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 10:08:05 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 9818ae40;
 Thu, 23 Jan 2025 18:07:59 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 00/14] Add eDP support for RK3588
Date: Thu, 23 Jan 2025 18:07:33 +0800
Message-Id: <20250123100747.1841357-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08YQ1YdGEsYQkwYGhgfHxhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
X-HM-Tid: 0a9492a204aa03a3kunm9818ae40
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6Tyo5CjIPEiwjQyofFCsX
 URRPC0JVSlVKTEhMTUlNQ0NLQk5IVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0pJNwY+
DKIM-Signature: a=rsa-sha256;
 b=YDvqwG/Q1FhQMVKavXBLI65yc3eXPOLDhrADB9rLTpbd37yZ5A86ITwsCdS3/ahnDDqTMS3A88QnTfJ6dZqPaNRruK5aeka+dclD933/XnV/HqssHiw91rBpBt7n5rcX8YbMYh26yNJhwtVrDxpOIT72phKJxjbgdGnFFVCrLRs=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=YoTZBDtBpqVXa3pjx+96Qdz9xq3sfd8lU4+udrm9R7k=;
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

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=923593

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
on RK3399 sapphire excavator board.

Patch 1~4   are preparations for the RK3588 eDP support on both Analogix
            side and Rockchip side.
Patch 5~8  are to support to get panel from the DP AUX bus.
Patch 9~11 are the RK3588 Analogix DP driver support.
Patch 12    is to add the power sequencing delays for panel model
            LP079QX1-SP0V.
Patch 13    is the addition of RK3588 eDP0 node.
Patch 14    is to enable the eDP0 display on RK3588S EVB1 board.

Damon Ding (14):
  drm/rockchip: analogix_dp: Replace DRM_...() functions with drm_...()
  drm/rockchip: analogix_dp: Use formalized struct definition for grf
    field
  drm/rockchip: analogix_dp: Expand device data to support multiple edp
    display
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
    from the DP AUX bus
  drm/bridge: analogix_dp: support to get &analogix_dp_device.plat_data
    and &analogix_dp_device.aux
  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
    bus
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/bridge: analogix_dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  54 ++++
 .../drm/bridge/analogix/analogix_dp_core.c    |  76 +++---
 .../drm/bridge/analogix/analogix_dp_core.h    |   1 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 ++++
 drivers/gpu/drm/panel/panel-edp.c             |   8 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 238 +++++++++++++-----
 include/drm/bridge/analogix_dp.h              |   8 +-
 9 files changed, 401 insertions(+), 89 deletions(-)

-- 
2.34.1

