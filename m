Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876478CAB1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB0210E467;
	Tue, 29 Aug 2023 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52010E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so2621566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329470; x=1693934270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCJom29YNAbeZrXkmUSy8bqZVMtySFQVpTmPU7p9fpw=;
 b=BwZxCj4tycBA0cAASNX2rKlNNQ4F85+7OzyOYRgBDcR/r1Rxn3+MRs1cYfJAT1Zw8s
 qzWAc5yCqfuc0FTy+vR8EoxzaVsKwcdFu1OVG8l0nfbEo5kI8FY9U/Yuay5+reM0eeID
 AW9tlmAaDtkLRRcZ+ES8GvOMi5e9uryVYwybOK20XtSY1pFWthL4sX9RAosS4UFFtvRi
 vcSn6VZlfeLJC137N6nXbPmyzbnaRfN2F4CT5bn9HnubxuG3JSvNVW5zEK4VZhV+QNrD
 urnjeTvh5oCBWV8gIrgJ8Ad4xqk5gFbUI+NxC92NqJda/xBtAHf5rIg4y55fDg/WwoTo
 Pb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329470; x=1693934270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCJom29YNAbeZrXkmUSy8bqZVMtySFQVpTmPU7p9fpw=;
 b=Z4VBLM+OEzT9pi7jHtQF3pe86+stb9dvjhhXFL97BD9EUnugMO/wb8bJ7xGfydfYlS
 9JKa8IFYyYG3AENxmyb4JsUjFA9DoDaC8n1cC1kcjPElIR23maIunPWhfsPSBm1RMdww
 3Uo7CvfXVYieQctwKD1y3JCzxlvGsybvgz7H7aOLK18FSoxaX7iCcMfcXn0OuthhnRqZ
 SEdcftT7ILjz1MEVwV7GGnBJcFiH2jkJcFD7DStRxkUvfWjasw2As4ddCaYRFBFbTE/N
 lSDNPMCCA3Bdt8WoXIV6hvTwNON+N3mPGzaxMBa3dJI/3XC9Z3FCx1/Sa1NxWOZbLR/E
 vUcA==
X-Gm-Message-State: AOJu0YxiY3vL4dILyv08T9p91NBwJXiNWbAJK7aBh8uw40uDQKn0yYh8
 jWSeIeLQ0qChPhFbhuXTBg==
X-Google-Smtp-Source: AGHT+IE5VAqTYu0TpR/gEgBTX4rVF0ZLvuyk9o8kotWD9Y3byxkS/tgqtwzcFS28p1DgLC1+EPXD9Q==
X-Received: by 2002:a17:906:11e:b0:9a5:a543:2744 with SMTP id
 30-20020a170906011e00b009a5a5432744mr4088667eje.33.1693329469971; 
 Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 26/31] ARM: dts: rockchip: Add gmac for RK3128
Date: Tue, 29 Aug 2023 19:16:42 +0200
Message-ID: <20230829171647.187787-27-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the gmac node for RK3128 SoC.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 874c97297c63..54a2768153c0 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -63,6 +63,32 @@ uart0: serial@20060000 {
 		reg-shift = <2>;
 		status = "disabled";
 	};
+
+	gmac: ethernet@2008c000 {
+		compatible = "rockchip,rk3128-gmac";
+		reg = <0x2008c000 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq", "eth_wake_irq";
+		clocks = <&cru SCLK_MAC>,
+			 <&cru SCLK_MAC_RX>, <&cru SCLK_MAC_TX>,
+			 <&cru SCLK_MAC_REF>, <&cru SCLK_MAC_REFOUT>,
+			 <&cru ACLK_GMAC>, <&cru PCLK_GMAC>;
+		clock-names = "stmmaceth",
+			      "mac_clk_rx", "mac_clk_tx",
+			      "clk_mac_ref", "clk_mac_refout",
+			      "aclk_mac", "pclk_mac";
+		resets = <&cru SRST_GMAC>;
+		reset-names = "stmmaceth";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+		};
+	};
 };
 
 &cru {
-- 
2.42.0

