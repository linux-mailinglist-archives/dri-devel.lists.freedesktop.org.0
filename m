Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19478CA95
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB20B10E453;
	Tue, 29 Aug 2023 17:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C681710E452
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso8755966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329458; x=1693934258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPphieGb8xL4eR5mTMzLTUQW79Ts5+jV8h+GajjCpv8=;
 b=quQnZpWw6or6fie8z5ubbmxM55Bytgiala1DelHI7M9QoFouTtJpb+r/z7WKTckLCQ
 s27g4GGrB3PTo5xE2RUriC+L9YfMtpNKE7jvb3K+kDEZ1x0pN81T08AKwd7lyvc5WTwi
 E0VlW2SWCjk+m+ZlMDthp2jj2ip4rI29D66fNluYtmmzPG1ng4tQtR4vVPyfbhj6hzPE
 IfLYjJLg5ZAyui29/lVGiMulhneQ2qlIucQq7RU3Wb/AjaHhjwCPOWyBjTcMIgFdpUur
 Dj1oKgapCVe4VXprV4qRAEcXJP2lwLiJiFPESF4O3CPjjSKEQaFqJQuadeWfxv9maNnj
 Nbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329458; x=1693934258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPphieGb8xL4eR5mTMzLTUQW79Ts5+jV8h+GajjCpv8=;
 b=krs16YgESZwb6bO/d4vlx1txOEwA1yaGK5WYrevu3qDPZDnmBnn+N0NcmADEYNPYPc
 auE3Q391hiHf9Fp1LBeASlfQJzcLUphE36dOVzTmDElGklgUPNIGVcmDxWhdz2GyDVLA
 fdOJlUzV7mOSWh570FrOvB908lLpEzo11cJALIUU9E0pKO5GFjqYPKwj7s6o7thOC1Au
 PtYVS+cyFunsZzSom8A/JGCwlX/kYz/wCXHkuBynRaUvX0UJzCy74zQEBGDDwY5GTE25
 +Gi4mPMIvxB8gOJF8fQXrohc46g5Rvw1eXQAexdjoO+GS+RJiwixuiaUr1a9yAVKSnDe
 /t9w==
X-Gm-Message-State: AOJu0Yw+Rl9xQJN6CfG9D07JJxoYdOCbJK+Ohq7LEg2ibEqiZAYojomM
 v3egL9hZdQ59Bk8xPMtVKA==
X-Google-Smtp-Source: AGHT+IGSTrK9d7vStZC0bzy2T16uTrrd34R83QYESq2KKcyDTtiuTq+EZyCdPP7zwxTKL8JMYzopcA==
X-Received: by 2002:a17:907:d1e:b0:9a5:b247:3ab with SMTP id
 gn30-20020a1709070d1e00b009a5b24703abmr3596972ejc.19.1693329458114; 
 Tue, 29 Aug 2023 10:17:38 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:37 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 14/31] ARM: dts: rockchip: Disable non-required timers for
 RK3128
Date: Tue, 29 Aug 2023 19:16:30 +0200
Message-ID: <20230829171647.187787-15-knaerzche@gmail.com>
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

The Rockchip timer linux driver can handle a maximum of 2 timers and will
get confused if more of them exist.
RK3128 only needs timer0, timer1 and timer5. The latter is the source
for the arm-timer and its clock is prevented from being disabled in the
clock driver so it can get disabled in the device tree, too.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 88a4b0d6d928..f3f0788195d2 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -252,6 +252,7 @@ timer2: timer@20044040 {
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER2>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer3: timer@20044060 {
@@ -260,6 +261,7 @@ timer3: timer@20044060 {
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER3>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer4: timer@20044080 {
@@ -268,6 +270,7 @@ timer4: timer@20044080 {
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER4>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer5: timer@200440a0 {
@@ -276,6 +279,7 @@ timer5: timer@200440a0 {
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER5>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	watchdog: watchdog@2004c000 {
-- 
2.42.0

