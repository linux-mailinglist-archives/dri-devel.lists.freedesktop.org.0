Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A344D4E1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285036EA5D;
	Thu, 11 Nov 2021 10:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0BB6EA5D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:15:15 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so4223102pjc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 02:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmAR2r824mQlySNSu51pCpbMoZygwoXpZuJUsTXAJjI=;
 b=X7UxPIRacek4rIzKl6scYdcsM8ZB8t8k1R6xVw/FSffcZ3TyuZKmZurz1ZMlS0UL7V
 p66er6Lr3mr0M+9WgOSGXkzDqN1dK7CrZPHHRIyV3jWj+X//rzAtWU3/Vruj34zOSzEB
 LV56nFTX9Y7PllriHO52zr0RDF/uCyNPNyFYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmAR2r824mQlySNSu51pCpbMoZygwoXpZuJUsTXAJjI=;
 b=KFw/UyE+hJcVrL/nQdXv+CVmgb6FTDwoy3Y5zZ43btgHzaoD6n5pRArQJRPdMLyf1O
 vZQJExb2sCFTcSt9JXS3Y07z9levhNRk2kuHEo2uCTG+pVB6iL8ieArTgL6Yg2v2lT99
 Mu37w03A1cmeeuIzRkGMEQCzIWex5bmr7FYtpyUpX6aD7KprXjn4onBhzSifvoIcX+Qf
 TcikTWrwzLYuqdjxqtf36F1F2t1BMXBn92N8cGP1oAib+R5STl3DQzL5KrfV9sPBfZX+
 xYdAxOAmLjWKkwKiSjHZI5F68o+/GzyJfx8RdOcdLNeJtx02zdolsENW+5eca77lZ3hu
 OddQ==
X-Gm-Message-State: AOAM530jrAH8k7vfusp7TGkLVhrG9AuQJJXedpFMnSZ32r5WzIo5FbJK
 TFhar3HGNBWDyNOUqWEhbfQX7w==
X-Google-Smtp-Source: ABdhPJyBWVnW3u1HyJFgCnA8z70Ir4ps1qLkNiAShrLP3rpA4BV30jACufrTssJFHFFgURZH0rHkBw==
X-Received: by 2002:a17:90b:4b86:: with SMTP id
 lr6mr6847752pjb.98.1636625714755; 
 Thu, 11 Nov 2021 02:15:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id t12sm8035667pjo.44.2021.11.11.02.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:15:14 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [RFC PATCH v2 1/3] arm64: dts: imx8mm: Add eLCDIF node support
Date: Thu, 11 Nov 2021 15:44:54 +0530
Message-Id: <20211111101456.584061-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111101456.584061-1-jagan@amarulasolutions.com>
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
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
Cc: Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add eLCDIF controller node for i.MX8MM.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c2f3f118f82e..caeb93313413 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1068,6 +1068,25 @@ aips4: bus@32c00000 {
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			lcdif: lcdif@32e00000 {
+				compatible = "fsl,imx28-lcdif";
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
+				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
+				status = "disabled";
+			};
+
 			disp_blk_ctrl: blk-ctrl@32e28000 {
 				compatible = "fsl,imx8mm-disp-blk-ctrl", "syscon";
 				reg = <0x32e28000 0x100>;
-- 
2.25.1

