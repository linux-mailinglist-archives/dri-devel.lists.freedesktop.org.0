Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9378CA9A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02CA10E459;
	Tue, 29 Aug 2023 17:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BA410E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52a3ff5f0abso6194859a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329468; x=1693934268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rxQ4tL3N96YVekC9Q3F0L/yW2/LZMHRKh1BzDPVBfDY=;
 b=W/Ba6mCAi3EsvONs3oStI9qe3lO+rjKO8eqd6OeC8WOC74KB45sAbS9gwOsR0+B1ZB
 PwL13BHOhzqel1D0V2oej1RVUSQf5DoDYJYciJbLHJvwSoNC+cFkvwhDSfHRmcPMZII1
 neyUEn6Ja2qOg4YUvTVZ7Qm5OnlDoGd4gaQoZ9OeHUAkmF3iXPTA0HVdbNjvlrlGBGtR
 5eNVr3wvN+laOQRMTLthwwYCoQMvNZkMJW65SUwC9uk1SqiX2ZbtwK00+7SLfSJmr8hY
 cUiUL63YWqF2ZNiaqWzuoT8C5DWWgLL5LEenq3unErWmHO6zR0MxN11SwAIWSEILorFr
 OfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329468; x=1693934268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rxQ4tL3N96YVekC9Q3F0L/yW2/LZMHRKh1BzDPVBfDY=;
 b=QlVOcUY6yHt+ZCoxKrNGCt+/wl5ImATKkNZXnZRaauVvLQGOJrofBjzie1yvzLA50y
 jcLOqGhI/anH7JmTmlOoze4PG9iW6LFvnNAwPCpqR6U1QTPKuP4iRXzzzHNQ3qHR5GFU
 IDN0ge9pq38krWtTLEx7uX1+pVGF70Dn8XZ3mMOk/o1/ux57SwyWBzSPDEcK/3v+TDHj
 Qemv6WeAmH2XTzM1ZKMTs0U7nli25pp7HEg33yi7uza8m1f8YCuwWjmcQUuaiMYXbamm
 FTxIluQgnMckBUJDazm0g1vq1Z47ViN6JfoKpFflqANwe4FYm7iLvClbnNwDlus3poFT
 VXsQ==
X-Gm-Message-State: AOJu0YxSMvHXLacVBY/BjryfmKMeKoG9WAAmJNpecnJLMs1HARUP8oOT
 k1sLGKRpNmwaMHdU8Kw9sQ==
X-Google-Smtp-Source: AGHT+IEP+Kiln5uLUvH0vUDxEPIVhi+RtKwR8SCN3T7Y1jAiZqj1OOnREaOOEVkkHwHkpcNqHLAI6A==
X-Received: by 2002:a17:906:18c:b0:9a2:1e03:1571 with SMTP id
 12-20020a170906018c00b009a21e031571mr12264491ejb.15.1693329468081; 
 Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 24/31] ARM: dts: rockchip: Add 8-channel I2S for RK3128
Date: Tue, 29 Aug 2023 19:16:40 +0200
Message-ID: <20230829171647.187787-25-knaerzche@gmail.com>
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

RK3128 has a second I2S block with 8 playback channels.
It's internally hard-wired to the HDMI-TX, thus only usable with it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 4c5c9728179e..2339232ae2d7 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -7,6 +7,20 @@
 / {
 	compatible = "rockchip,rk3128";
 
+	i2s_8ch: i2s@10200000 {
+		compatible = "rockchip,rk3128-i2s", "rockchip,rk3066-i2s";
+		reg = <0x10200000 0x1000>;
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_I2S0>, <&cru HCLK_I2S_8CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		dmas = <&pdma 14>, <&pdma 15>;
+		dma-names = "tx", "rx";
+		rockchip,playback-channels = <8>;
+		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c3: i2c@2005e000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
 		reg = <0x2005e000 0x1000>;
-- 
2.42.0

