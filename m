Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F5A59163
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1EA10E206;
	Mon, 10 Mar 2025 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ne1sjB72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49230.qiye.163.com (mail-m49230.qiye.163.com
 [45.254.49.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF54410E206
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:41:50 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id dc1881fc;
 Mon, 10 Mar 2025 18:41:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 00/13] Add eDP support for RK3588
Date: Mon, 10 Mar 2025 18:41:01 +0800
Message-Id: <20250310104114.2608063-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhLQlYfQ0hLGUpDH01JSENWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtLTE
 5VSktLVUtZBg++
X-HM-Tid: 0a957fa57bc003a3kunmdc1881fc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06HRw6GjICCCMfSjoYPT4e
 NzhPFDJVSlVKTE9KTUtISEtDTEtLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSU5JNwY+
DKIM-Signature: a=rsa-sha256;
 b=Ne1sjB72m8GlZHHq8D0kOPJ82+bx3HtiAzX0u7DXfYBwIzSyLB/KggtBK3YnavILVsalpf7wTM9KpH5lrVbwsuaJrhExWhUYOstp1YQI84ftUKLh5Resssmpk2cnHJd+enAMs2I5yGT+qXEjBOeSbT0CQ3onhcGjOX3NhhbSUtQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=lLXPPK6HZnhjRu30hi0LrwQfdstf2dQNmG/Lde/uOWM=;
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
https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
on RK3399 sapphire excavator board.

Patch 1~3   are preparations for the RK3588 eDP support on both Analogix
            side.
Patch 4~8   are to support to get panel from the DP AUX bus.
Patch 9~11  are the RK3588 Analogix DP driver support.
Patch 12    is the addition of RK3588 eDP0 node.
Patch 13    is to enable the eDP0 display on RK3588S EVB1 board.

Damon Ding (13):
  drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of
    calling disable_irq()
  drm/bridge: analogix_dp: Remove CONFIG_PM related check in
    analogix_dp_bind()/analogix_dp_unbind()
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
    from the DP AUX bus
  drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data
    and &analogix_dp_device.aux
  drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
  drm/bridge: analogix_dp: Add support for
    &drm_dp_aux.wait_hpd_asserted()
  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
    bus
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/bridge: analogix_dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |  25 ++++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  28 +++++
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  55 ++++++++++
 .../drm/bridge/analogix/analogix_dp_core.c    |  85 +++++++++------
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  52 +++++++++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 103 ++++++++++++++++--
 include/drm/bridge/analogix_dp.h              |   7 +-
 8 files changed, 310 insertions(+), 46 deletions(-)

-- 
2.34.1

