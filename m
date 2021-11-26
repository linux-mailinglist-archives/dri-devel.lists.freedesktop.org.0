Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32245F1A9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F516F91D;
	Fri, 26 Nov 2021 16:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36676F91B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:58 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z8so19725788ljz.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=bdbspkD2uxc8qeriYgYo3urTgP3sVL8LPoyinGG3VjF3C7Lw0RK+XZckeGj0vFEJHn
 XQ4zadccolf5Ix433mkdFsT6vgImRa6Txk210jDxGGs2WztWVW5Y9CpKN8ks1hCa1VoP
 MxyOOSkQGswD28YdxKvlc2JDyMc1jj0NVGVovHOfgYq6LoJTdWVQXajaanCtGL1TdQ1i
 +WwdN6tfAhUArRz59d16jrN3THi5VHiu1P1uHM7Egb1SzwU0RYaOxhLHHfG3Uw+UoD3O
 LtVtusEJIBWcyT1kojXzI8gP4RLEwwLnfE9bWG5pUgcIpqyp/yhYbnhxT7suOiB95i7B
 AOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
 b=Y41w83EsWVAPPeOmnvrOskxLIUu7t1u16z4Hmg2effxWkD1VE45E1H+04Y1d3APFiu
 rmAi76dF3rzJJD7vzgC+9HnFVevDo+lTSX6snP7yv5UwwK50yapBWwZvrzk+aS5hpgeC
 omHMheJ8vx+Y8/R8Pu+mmH+2eOiDLxdLka+pVLy7kl9p/PZqDTiWCmoxNG3TVOJbkHFl
 6WvaIRmNsie0mfKed7mMHY4Yr/8xrCfOwK0Prf7w9GZXgyZ8LXeCYbtkwMY03nqr8/Tp
 gt6wqVbzJfVyjpwUIYxnRaSG08VUZqekqqTHzmHbnnLffHfircg8RdV+mBdxaShNNihp
 6POQ==
X-Gm-Message-State: AOAM530MR0QI0m0uUn0i10wEygZ4d3P0Go2dc0XN0rpdyL3PJPxoQ8h1
 bvaOChBWQdOaApVNQ86pNUk=
X-Google-Smtp-Source: ABdhPJxpm9nqKWKezaZcIWKSbgNt+5aswTDFHwGvFf90WbQr4/XEZVYSn1hrv8SDqgkyr4alLXIBbw==
X-Received: by 2002:a2e:9217:: with SMTP id k23mr31531018ljg.267.1637943597317; 
 Fri, 26 Nov 2021 08:19:57 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:56 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Fri, 26 Nov 2021 19:18:04 +0300
Message-Id: <20211126161807.15776-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..799da7dc929b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -197,6 +197,7 @@ hdmi@54280000 {
 			reset-names = "hdmi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
@@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
 		status = "disabled";
 	};
 
+	tegra_spdif: spdif@70002400 {
+		compatible = "nvidia,tegra20-spdif";
+		reg = <0x70002400 0x200>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
+			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
+		clock-names = "spdif_out", "spdif_in";
+		resets = <&tegra_car 10>;
+		dmas = <&apbdma 3>, <&apbdma 3>;
+		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
-- 
2.33.1

