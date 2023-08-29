Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F778CAB4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D9E10E466;
	Tue, 29 Aug 2023 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24BE10E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c136ee106so606597666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329467; x=1693934267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBecglGDcBm3dfaewAdojWnpNSqkK3k2Gii0sDddaoQ=;
 b=XP1yHF+4eAQ1aY3Irua4+dW2toI3nREqhZP00I5y08G3PeXlSneut2EIbz1iiUyWwX
 oqwl0IrVqJlXw8D0vWuGDTyrdoLSF6KHTXDXSs31wyV9VuGK6z67UVY/eFMScIvbDQhk
 AWxkHAD+loWSGgfx1VWlfktCTr45eNKchRHG+KW3rJqfn2ABiuXlixsNlfqJH4K8907B
 2EKNWSQDvdUzlI8QOIrwc6gk5do/f2EOzTJFotT0gsVS0O39epzp1vuRXvDvXKa1YeTT
 AMG/Z1T/jQeGfabrDe574rkIXRPRYAaILQZRsmYVFod1hp4cHLYzNWJinQ2hS/f29LhS
 XOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329467; x=1693934267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBecglGDcBm3dfaewAdojWnpNSqkK3k2Gii0sDddaoQ=;
 b=W5trcp9LOWwbxwzRW8KnXGHeRfSk9ywaAnoegFD7OpqIZvrgPOKcTaq/qzpW66oZWG
 PD5UBngyYM8OEAlI60rbgOdcWrNVLNkhTQ/GZ3MTVVMWEJkgjhOwptCqqq31ehaIBf/H
 dE8TQOrvZJR4Po2u8Hf0rkcvv29kbtFPflTMJmt/DOUMNwMKUPFCuTp8jKB6x1qf16iv
 NjM2z2a5XXElFui18ivg2OgCaRBtMYrrYFoTeBTC+3QfM+dWKGXHTM0kGCfzZKQkFSxN
 pRUZ8BSlPRvUMI4WAUJIGcE88152ZBIODGYtqQwHJS8oAKtKOcrogQmze9U4NpIShVfB
 hVzg==
X-Gm-Message-State: AOJu0YxEZDqaUvtDTotnSp9xNiJu1d8sM6v7uaEr5nOwpfzQby/JQ0Lo
 /gqGYkFJ9sBMnMVymGU4Hg==
X-Google-Smtp-Source: AGHT+IGQSIHfyxWScSSaGtZgRmVAcjAeSYpIMFw2Pk7BPF5NMwiuJMreccIL2u+G9vwApRBvVAVtXw==
X-Received: by 2002:a17:906:31d8:b0:9a5:da6c:6518 with SMTP id
 f24-20020a17090631d800b009a5da6c6518mr497191ejf.37.1693329467128; 
 Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:46 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 23/31] ARM: dts: rockchip: Add 2-channel I2S for RK312x
Date: Tue, 29 Aug 2023 19:16:39 +0200
Message-ID: <20230829171647.187787-24-knaerzche@gmail.com>
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

Both RK3126 and RK3128 have a 2-channel I2S IP block.
Add the respective node for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 024d801a9792..ce3f03c3532e 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -351,6 +351,22 @@ emmc: mmc@1021c000 {
 		status = "disabled";
 	};
 
+	i2s_2ch: i2s@10220000 {
+		compatible = "rockchip,rk3128-i2s", "rockchip,rk3066-i2s";
+		reg = <0x10220000 0x1000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_I2S1>, <&cru HCLK_I2S_2CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		dmas = <&pdma 0>, <&pdma 1>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s_bus>;
+		rockchip,playback-channels = <2>;
+		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	nfc: nand-controller@10500000 {
 		compatible = "rockchip,rk3128-nfc", "rockchip,rk2928-nfc";
 		reg = <0x10500000 0x4000>;
-- 
2.42.0

