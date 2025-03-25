Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0EA701CD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB2310E55D;
	Tue, 25 Mar 2025 13:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lSMIlPKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 646E410E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XjB5C
 GDy56iSBUj/onMIQC1Fw0WRXap96Du59NyDvPE=; b=lSMIlPKBaavnVZ2+ML+uR
 sMEo+rGV5CvITGeiAufzj/GX2TxZ0m94rvlK8Bu6zxgsIx1vLIbpeNJanvOFLON5
 CRJFXKa50V+dEkyR2P3t34H985oSIW/pOeznLZguap7Q/WcDmkOpu/m2Z6xwg4/f
 wySlR1QbqSEbJB0LDkzvSA=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S7;
 Tue, 25 Mar 2025 21:29:55 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 5/6] ARM: dts: rockchip: Add ref clk for hdmi
Date: Tue, 25 Mar 2025 21:29:39 +0800
Message-ID: <20250325132944.171111-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xJw4kAFWfZry3tw4xWFg_yoWDWFX_t3
 WIgw15GF4fGrZIq34Dtr4UW39F9w4fC397XrnYqr4UJF9aqr4UXF4kGayIyry5Jay2g3sx
 CFZ5Xw4aya1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Jrc3UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkB4bXmfirygTGgABsB
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

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be
enabled first before normal DDC communication can be carried out.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 6039a0908af1c..22685cd23a708 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -403,8 +403,8 @@ hdmi: hdmi@20034000 {
 		compatible = "rockchip,rk3036-inno-hdmi";
 		reg = <0x20034000 0x4000>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru  PCLK_HDMI>;
-		clock-names = "pclk";
+		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+		clock-names = "pclk", "ref";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0

