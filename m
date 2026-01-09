Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0BD07AD0
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5B810E39D;
	Fri,  9 Jan 2026 08:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Mvd0brfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB39C10E39D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zf
 YsLgNdTlE9Go/BF7mYN0S2al1B+Ygo+YQhsBcW/eM=; b=Mvd0brfbiTGiKzXeH8
 O+OR67nivV6PJvkuWSiDJ2vwb7ykQlYfxE9gISutXFsI5aVJRv8Z4gmzbWJUt3E5
 3Y/e1BUwzZZYR8GYtWWPHi6PYM/mHqb5zPZkYzYdyLIqsOPpZn6qTijbbXlis868
 RKhprNd7Nke5aSQ2uGtcfhQlk=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDnzlW4tWBpx1iBFA--.64397S7; 
 Fri, 09 Jan 2026 16:01:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	dmitry.baryshkov@oss.qualcomm.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com,
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 5/5] arm64: dts: rockchip: Add DisplayPort dt node for rk3576
Date: Fri,  9 Jan 2026 16:00:48 +0800
Message-ID: <20260109080054.228671-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109080054.228671-1-andyshrk@163.com>
References: <20260109080054.228671-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzlW4tWBpx1iBFA--.64397S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4fZFWkWw1kAFy7GF43GFg_yoW8GFyDp3
 ZFkrZ8X3yxur12qwnxt34vqrZ5Jan5AFs0krnFqryUtr1aqry7Kr13Krn3Aa4DJr4UZ3ya
 vFsavryUKFsFyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqa0PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7gIQbmlgtcLy2AAA3G
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

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort on rk3576 is compliant with DisplayPort Specification
Version 1.4 with MST support, and share the USBDP combo PHY with USB 3.1
OTG0 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index a86fc6b4e8c4..a153c3976cb3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1446,6 +1446,34 @@ hdmi_out: port@1 {
 			};
 		};
 
+		dp: dp@27e40000 {
+			compatible = "rockchip,rk3576-dp";
+			reg = <0x0 0x27e40000 0x0 0x30000>;
+			interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
+			assigned-clocks = <&cru CLK_AUX16MHZ_0>;
+			assigned-clock-rates = <16000000>;
+			clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16MHZ_0>,
+				 <&cru ACLK_DP0>;
+			clock-names = "apb", "aux", "hdcp";
+			resets = <&cru SRST_DP0>;
+			phys = <&usbdp_phy PHY_TYPE_DP>;
+			power-domains = <&power RK3576_PD_VO1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dp0_in: port@0 {
+					reg = <0>;
+				};
+
+				dp0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		sai7: sai@27ed0000 {
 			compatible = "rockchip,rk3576-sai";
 			reg = <0x0 0x27ed0000 0x0 0x1000>;
-- 
2.43.0

