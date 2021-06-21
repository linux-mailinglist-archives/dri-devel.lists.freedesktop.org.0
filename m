Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BC3AE424
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4389DFC;
	Mon, 21 Jun 2021 07:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C5489DFC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:27 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id i34so7803866pgl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJ2BOKG4ZuRZzTmg7DTj1V1Pqbxgkeavbg3ssOxVb6g=;
 b=fX1ZJt96WAd4vRX3HAW5JB6IFaEpc6ds6BifeNqKd67P4GhSIaHwUwMKGYfTQubqaO
 rYNb3xKyLfMQbmIYkKZ6ZLncSewZGnbevs5wAd69cCJ/1og7oi2rD6xdDjOmjmod6RJk
 tKJXDL3Bt7X1qd46HFdU0XHLwqlgoUqlK4qD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJ2BOKG4ZuRZzTmg7DTj1V1Pqbxgkeavbg3ssOxVb6g=;
 b=K2ISXatg9XojyLDVRZS9+d6VXeOJBuiGlUk9e5y1677+vDQ/qPs6CY15MNuDgYZQwV
 FwMBslXqkiPKuEkr2DUBf28ySXHtjMMLmWyfequiSig5u0uMVka9uV2jZjPVbtb4HapF
 peS/N2E6QWm7oDfv78Scr9RUo9mf3qoDzuAwpOOz2NhZuWGMAE2KYCUPyuGaHHK8bNXL
 BQIt9nHxE+lyB3W0YPDpGTLGZ8OIvAJxfgar98jBrZTudMGwYf2G7ipQyE2WgYLXHgLy
 1vTJUOGl17OPXRKqWkNSdFbB6aIkRtrya0XBU/Ds6EPwIMXcJMHG+GzGc+HnVeV0F+eG
 uCaQ==
X-Gm-Message-State: AOAM5324DAmsbFZ+9wi/NMn65EsZ3P127TFM4GwgoZBzJdDqSFbRQbDq
 3/l0mHEElnqZKR0iy5aoJhtQ2A==
X-Google-Smtp-Source: ABdhPJxO5ope055OQIE0W7ZNCvoDUKS4owJmThC4DHHcVxxsn4DRsp0AP4Iw8Hajh4T0x7B8NxDxow==
X-Received: by 2002:aa7:8615:0:b029:303:4428:9dbe with SMTP id
 p21-20020aa786150000b029030344289dbemr4319621pfn.17.1624260327279; 
 Mon, 21 Jun 2021 00:25:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:26 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 7/9] arm64: dts: imx8mm: Add eLCDIF node support
Date: Mon, 21 Jun 2021 12:54:22 +0530
Message-Id: <20210621072424.111733-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add eLCDIF controller node for i.MX8MM.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index fe5485ee9419..5f68182ed3a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1030,6 +1030,25 @@ aips4: bus@32c00000 {
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			lcdif: lcdif@32e00000 {
+				compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
+				reg = <0x32e00000 0x10000>;
+				clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
+					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
+				clock-names = "pix", "disp_axi", "axi";
+				assigned-clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
+						  <&clk IMX8MM_CLK_DISP_AXI>,
+						  <&clk IMX8MM_CLK_DISP_APB>;
+				assigned-clock-parents = <&clk IMX8MM_VIDEO_PLL1_OUT>,
+							 <&clk IMX8MM_SYS_PLL2_1000M>,
+							 <&clk IMX8MM_SYS_PLL1_800M>;
+				assigned-clock-rate = <594000000>, <500000000>, <200000000>;
+				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_LCDIF>;
+				status = "disabled";
+			};
+
 			dispmix_blk_ctl: blk-ctl@32e28000 {
 				compatible = "fsl,imx8mm-dispmix-blk-ctl", "syscon";
 				reg = <0x32e28000 0x100>;
-- 
2.25.1

