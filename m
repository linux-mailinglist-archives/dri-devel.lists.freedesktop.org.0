Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF29FC8F5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D5710E758;
	Thu, 26 Dec 2024 06:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="AwbtMAWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11876.qiye.163.com (mail-m11876.qiye.163.com
 [115.236.118.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55210E756
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:33:57 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc511ab;
 Thu, 26 Dec 2024 14:33:53 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 14/17] dt-bindings: display: rockchip: Fix label name of
 hdptxphy for RK3588 HDMI TX Controller
Date: Thu, 26 Dec 2024 14:33:10 +0800
Message-Id: <20241226063313.3267515-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJOGFYdTEIZTk1ISkIYGUhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abf30103a3kunm6dc511ab
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nww6CRw4TzIITUwJNzoyKj0R
 F0sKChpVSlVKTEhOSkJPQ0hOSElOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSEtPNwY+
DKIM-Signature: a=rsa-sha256;
 b=AwbtMAWmPdEEWaR3+UAVen++kw+1BQKtiXQVfs9PN5qyO7Qy/jV0ckmtKONg9VdDbE1DuCJ36Ow6HOyJZvG5NcRsplpNj5QwnUDYNKHW5iL4dwBwShzdq/zxqkOaocOSq9u2ku9lcQV6ymf0f778svCxX72YiltH4hG91/b/ce0=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=DsE1WkVNoF+Jwn/u5/eTYNhUxfmsWFSRl9E2p5GwmYk=;
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

The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
and eDP Link. Therefore, it is better to name it hdptxphy0 other than
hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index d8e761865f27..7a1ae31cc535 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -156,7 +156,7 @@ examples:
                      <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
                      <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
         interrupt-names = "avp", "cec", "earc", "main", "hpd";
-        phys = <&hdptxphy_hdmi0>;
+        phys = <&hdptxphy0>;
         power-domains = <&power RK3588_PD_VO1>;
         resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
         reset-names = "ref", "hdp";
-- 
2.34.1

