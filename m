Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4978CAA2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A98210E45C;
	Tue, 29 Aug 2023 17:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3A10E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso602426166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329472; x=1693934272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkvURmq2cbKlpQEevUHV3n2DL6VzUfl6w6/QUHqY58A=;
 b=mh8CjGx2AHkgqd0uSoIKqeT9Tx6k2Ul0GOWg1kjbkiddzhSqVBM1nD4aYXZydED6H+
 kWK+uS1baw/rCdfglAdVxz+J7v7YlDKV0ueFoYNvYQZ/07I8e34HSGQRfE5Pn4X9nzZp
 IG/sINaLFwKvTfuxWfyfmNaQNcQ/tiVUFJdycaBVaRRyoOlUB0nbZpFAkDUwkmUAprwH
 kdBDs78wbMXS2p6rqK+rwKDETklEowDB0LPP6XtEtCx5sTvze9IlfS2B9HFExdu2ZDQz
 aE2Wba9Fb0V5phmR9SwmII3cBtdclPmYCGSX+M0CWij4M4ICfmFqNvoGeH+pWTWKGM5P
 kyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329472; x=1693934272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkvURmq2cbKlpQEevUHV3n2DL6VzUfl6w6/QUHqY58A=;
 b=DfQbEvzN4JFwvNBocfjOBvcEu8CWYtnr1edYywy4Hio+5gg0bePJuuYkHEmaoco9EC
 eseSGmivyfgvRPollubE3M26SlBvJE0IsyHvQ4yJyyvM4A9WbG3WXGOlt5qNN8qif/JE
 LpqZMP4XwGlNM9TQ+B4PnOy1F9j2EoLVQs3HR24uhIj2l3QpypY/Hhj409Z9Soj3Ibbq
 i8N7I4O+rkQ2NYF7T9AIBz+IO2F3FLRdqSM5gzJn0AsMXwgH0ma/8x7GmJGpm367b2XA
 P4oM0IiXkvV/h0YLBvQmxXQhZnkCJZzeXGwyiY3QmRW00/L/Y0JG3NrHN9d6S2BnRZLG
 kG1w==
X-Gm-Message-State: AOJu0Yw4I6uToAqGEj3ONphNktq7eko2ycyhxYE9xhhCkcp4eMkKjGGU
 osuQoRcWHj/Lvjhx60fH3Q==
X-Google-Smtp-Source: AGHT+IF8xlfihuxSv7bVK1cLtxo53LQXa5+OykLNbJpUofa4RUl/ax3u6GyAuJkTQpRKAMBEGM1X+Q==
X-Received: by 2002:a17:906:220f:b0:9a5:aece:13b0 with SMTP id
 s15-20020a170906220f00b009a5aece13b0mr5390216ejs.36.1693329472292; 
 Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 28/31] ARM: dts: rockchip: Add USB host clocks for RK312x
Date: Tue, 29 Aug 2023 19:16:44 +0200
Message-ID: <20230829171647.187787-29-knaerzche@gmail.com>
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

Add the AHB clocks for both the ehci and ohci controller.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 019aa92c0cfa..b13957d55500 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -292,6 +292,7 @@ usb_host_ehci: usb@101c0000 {
 		compatible = "generic-ehci";
 		reg = <0x101c0000 0x20000>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -301,6 +302,7 @@ usb_host_ohci: usb@101e0000 {
 		compatible = "generic-ohci";
 		reg = <0x101e0000 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
-- 
2.42.0

