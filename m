Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5943AE41F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6F189DFA;
	Mon, 21 Jun 2021 07:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9FF89DF9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:20 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id y14so2007549pgs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wE0EtFYsjB5vlJwRJRnVD3mRJGbikL6A/mq3nMXEQvo=;
 b=EXV22jysZtFBGfkOj6eka+mm+ScqN1Gb+9Drg+5vhkPlVJF+YFq3khisQeIp1MwM4k
 5+bruQxYxg1/hjhUZnCxLAXEl9Cc23GXlH0C4wty7MYRQPvGJBeGK7jU3QNvRNf2pqaP
 5Df8uMr4bfWCrKq4/osNjUUK3c5pmy/xMWy50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wE0EtFYsjB5vlJwRJRnVD3mRJGbikL6A/mq3nMXEQvo=;
 b=WviAGYa/Xuci8Spm8e7ZsN5HVugy5JEWTe22+NRfq+KN5RFqEpukPfCOKFkRk0r7up
 3nLhL0edcU25tPLT748WLOjuhhVLGpWTbF2FPRbwrvlf0nNQrH4zcKBe9ts4duGYDw6r
 oyiyL/ZFLQt1pXqQEkNy9GSL1bXU1gxvzcspMZ/pZJOLJCIBYwkE+qkOFJMKvcxkBCbY
 VaSDCeVxIIkXt2cpB706sY4w+DvWLiwxaadXUCk3CEuy0iWtHfKZIG/ad6XNRBueNZ37
 mOa3SLS8U5OzAr3EwhkmNFoOx4b91IBwOZC0hmaTDEIyziOAchtoxSPdbMbzFGDPF5W6
 Z18A==
X-Gm-Message-State: AOAM532Mz+5lQx+4mJ1ij1iMQdnCFh+8xh4ao0mE+x4Ugx9mWSTxeD0E
 oLL6PEKN6ZROp1Ywn9V+DexerQ==
X-Google-Smtp-Source: ABdhPJzRHoAtTRbTlR5W+aeNHLX4JpicPLn++ox7Da1Q5l/obTH4wW4HwzGNFYk/GzMiTBnG3OWONg==
X-Received: by 2002:a63:4915:: with SMTP id w21mr22619815pga.363.1624260320470; 
 Mon, 21 Jun 2021 00:25:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:20 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 6/9] arm64: dts: imx8mm: Add display mix blk ctl
Date: Mon, 21 Jun 2021 12:54:21 +0530
Message-Id: <20210621072424.111733-7-jagan@amarulasolutions.com>
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

Add display mix blk control node for i.MX8MM.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 849dd0250ba9..fe5485ee9419 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -663,6 +663,20 @@ pgc_gpu: power-domain@5 {
 						resets = <&src IMX8MQ_RESET_GPU_RESET>;
 						power-domains = <&pgc_gpumix>;
 					};
+
+					pgc_dispmix: power-domain@10 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MM_POWER_DOMAIN_DISPMIX>;
+						clocks = <&clk IMX8MM_CLK_DISP_ROOT>,
+							 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
+							 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
+					};
+
+					pgc_mipi: power-domain@11 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MM_POWER_DOMAIN_MIPI>;
+						power-domains = <&pgc_dispmix>;
+					};
 				};
 			};
 		};
@@ -1016,6 +1030,18 @@ aips4: bus@32c00000 {
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			dispmix_blk_ctl: blk-ctl@32e28000 {
+				compatible = "fsl,imx8mm-dispmix-blk-ctl", "syscon";
+				reg = <0x32e28000 0x100>;
+				#power-domain-cells = <1>;
+				power-domains = <&pgc_dispmix>, <&pgc_mipi>;
+				power-domain-names = "dispmix", "mipi";
+				clocks = <&clk IMX8MM_CLK_DISP_ROOT>,
+					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
+				clock-names = "disp", "axi", "apb";
+			};
+
 			usbotg1: usb@32e40000 {
 				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb";
 				reg = <0x32e40000 0x200>;
-- 
2.25.1

