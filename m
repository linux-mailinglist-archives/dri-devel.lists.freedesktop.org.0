Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C6469386
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843D73E3A;
	Mon,  6 Dec 2021 10:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611746E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:48 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m27so13684588lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=kv2emZJWkJTujeoo/B8BstrOBYDbdGuc57GGc8hkUquVLVp7bDCUL0DA66kijcAH4d
 449pqpwpZ7zRfpKur2KGwMDOT83ItGf7l4k8LZqZ4+gDcYkwgJEYGmynkTnBe87KvUxb
 AH2KPgQUXa+hgf7DM4Gaz2mzuoRnSH5ncsgC/IEKy5ajMCFv/bWRMCsRshodRtdQkVJ/
 4v3Hc87NywbXLwSnsaPCBWits7Pn0gRwoi3FnE5VxRxLwqh9KXcGHwz0OzreXND/ffS9
 lGPytKHmoxALxblmGh6K0pZneN6lIvsGcYjrUHVyHyLo/kZKu+/r7aPdwnfNPl48nAGA
 iaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=VbADVP33lR87YskgHCYd9HQMTWvADV3oJM9s+KYP1rW6/RYvy3l68MjU23pMuOVZ6i
 aac3TrH8al2+722tTsx+6F0DpW+SExSoRp/z0Kudho6iJQaUH0CAKnLgWIHNIqqr6jnv
 aoXm+TspefU/jt5FvTXkLI/1YHVFkBIq2UsF5m4qzaE9LK4SSZRdwcy+cNnhq5k6Asqv
 75nuRCvfN/bgqq4nUQfxa8OOzdAP4nE/NZUpNArcyCtAJ0de6huv+phzDPP3ReJ8zyll
 7bgY67BfFZltDWiBtXzJlehPSP03z3Xba/YB8SPn571vZZd/Mc6QyOXeqNyaYZc9lg2l
 /nXw==
X-Gm-Message-State: AOAM532Ub2EBQhnbPg+hTq66SZOuCxdDJAFw3vCe4l7fAK6BMcU5Do0C
 HZNOJcWdszqyzNEo1Rk1Vho=
X-Google-Smtp-Source: ABdhPJxVyr80sNTp3Ra50xhUsVA8jhye5Uem6qk6wXJWErKHgo6ZLg3UwuWsCshEDUsQpvKkvk7WgQ==
X-Received: by 2002:a19:791e:: with SMTP id u30mr24186475lfc.539.1638628666780; 
 Sat, 04 Dec 2021 06:37:46 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 19/22] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Sat,  4 Dec 2021 17:37:22 +0300
Message-Id: <20211204143725.31646-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..72cbe32d0c1d 100644
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
+		clock-names = "out", "in";
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

