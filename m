Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851878CAA0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0143C10E45B;
	Tue, 29 Aug 2023 17:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF910E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:44 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso70769211fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329462; x=1693934262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feXb8mBBSxHC2Wg38x6bXprPMxa/iS7sxw36h6E5GW8=;
 b=h4PyqX0xtB7S2T6VFiGduqml3wx0qswAzQccLxwPFbM0Qk7fnZ8sK0BmODYagHvSJg
 dN0Gkz34UcQ5dALUAS7qkreaFpaJH1/HqwEkvHL6nhuwbhwsUlvgNhtu0JWR/t+byarI
 jO/zOGwOmY8ILY7Yn5zt8RSPxT4JW03j5Tykw5RFZbIchdbUVag5NZphZtJVw8SKgyXA
 StVAmKygz3dt8cdzSI8lWcVBevQXPpttS6lu7dJtB3bq4a2IVYMqqSDw4EMZGzaYGz8o
 MWk29pok/xzUj/XYqYYzaN6bwBumz3ddYzcgcpDsm6KdIhLN5lyBSD70ZFbaayj7BLKq
 o/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329462; x=1693934262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=feXb8mBBSxHC2Wg38x6bXprPMxa/iS7sxw36h6E5GW8=;
 b=PUP0QEBOoGpVmmIJt11e9Q7Z9zzPy9QlpKtKlwKDcs/ST5KU56wqMn0D8aQFj0LugU
 Gweyji7HJZ7WTuAB35/FkXr+dKJH2JWWM17cNN+qFfbfwcgNI2qCrcUkzRazPxinz0bO
 3DSxZ5upaGk34cBpB3IWFCPuBm6N6RIg3uA4JUgvQ++ywOCZKvaLBAibqhwk/sfIYbd5
 EGRf20rBE3foXYik1B983BhFGFsnTOyJAMZRjwShBX0Kc4Mu6o3BeMIYKP+O2UK9UH9W
 Zd644P6HHYOVma1WNSsh601WOndUO5MVHM78nQncFBB5S45oaDyk7moU2z+IDUuAKIL7
 H78w==
X-Gm-Message-State: AOJu0Yxk04gWb7s5nBGyeG3t5LZzhcZgh7aLJAJFXnKrUzCQyH38YelV
 8oFTMlRJF8GoH1XWCcdfLw==
X-Google-Smtp-Source: AGHT+IGy6ebumFaH6aO1ynQk+aNb6IThAySOcLcWyoeDCRfh26m8xsK1Szz112EbWkaHyFlntA3M6Q==
X-Received: by 2002:a2e:9cd8:0:b0:2bb:bdf0:caf2 with SMTP id
 g24-20020a2e9cd8000000b002bbbdf0caf2mr20698676ljj.25.1693329462298; 
 Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 18/31] ARM: dts: rockchip: Enable SMP bringup for RK312x
Date: Tue, 29 Aug 2023 19:16:34 +0200
Message-ID: <20230829171647.187787-19-knaerzche@gmail.com>
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

For bringup of the non-boot cpu cores the enable-method for RK3036 can be
re-used.

This adds a (small) chunk  of SRAM for execution of the SMP trampoline code
and the respective enable-method property to the cpus.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index b195ac525c37..08b953b005ff 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -27,6 +27,7 @@ arm-pmu {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3036-smp";
 
 		cpu0: cpu@f00 {
 			device_type = "cpu";
@@ -87,6 +88,11 @@ imem: sram@10080000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x10080000 0x2000>;
+
+		smp-sram@0 {
+			compatible = "rockchip,rk3066-smp-sram";
+			reg = <0x00 0x10>;
+		};
 	};
 
 	pmu: syscon@100a0000 {
-- 
2.42.0

