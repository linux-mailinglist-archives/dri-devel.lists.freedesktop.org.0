Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A578CAAA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C110E460;
	Tue, 29 Aug 2023 17:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA8C10E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so630054766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329463; x=1693934263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnJL5vGCg9h0fxl4SkoWxbvYNcnaANXMeYm5CGs278M=;
 b=N9JLdrwZAq0dUeDJhdp81+fN8VeIO0Za4lbwtH42uBm92k/4rin/At5jq6C6VCFzuO
 dSXTW+vgTl5x177w8ttFILgFZAlILfiKVvRuzS1z4asELiVuC3DYYCdK56ecFfhXCsyd
 TMJJToU0FtApXWJ3U0YLNQv0ynvlUo4zpADs/WWOOxk6gE8E4Ipu6I1bGLe9pTccOEUj
 7XvS8UctPQLlA9g1x7G9W6WX7ZNqYH0Job9qpR5AvtpWnNx8PSFeNHGKSHBmjf6Pg6YW
 IjeAQnYojYVaaKJ9Xb0TJ7NfKlBUu04Z1nTRU6SdpJirzWnObMR9dxl77hx3BRuTkVoP
 C/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329463; x=1693934263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnJL5vGCg9h0fxl4SkoWxbvYNcnaANXMeYm5CGs278M=;
 b=M5e/UZZuotsURC5BDbsm/r01jx4zRtV6VThsKl6Tw+EB8/lUUMs3g+xaOschdOcpu3
 B5/ARu/BvlgFzRgcIL1HA9qn6VKLe//TsRx0TM0xkTQvXDtVNtTJu38yssDTg6jADZTI
 g3Yo+Yi8jAK4UnAs810R+RXSePd2m/pOqztnZ6UX92xR19VnyED0R57SmLRK+JPGLrIk
 ESxZ3qQj/q4sO2Jxeqpx6V7OrbFVNBs9+QK9d5n30AemRPjW6ncZXRqB9GAEMIiuvJAS
 08RmHqxkFdaVxE9xv8eMj5WE8iSqrM/LJ2bLgCkPU6nDMUswClWAte6hnelkJsDF8lNO
 cLJg==
X-Gm-Message-State: AOJu0YyFHiek1X4MRdAShyJaMiX56B7es2WitYWaQSPiBxfDWTKpfadb
 wg7rMO8yEyC8JA0br757ZA==
X-Google-Smtp-Source: AGHT+IGUtSI+zxI+roO3fQg73Zix5xTmq8cVmyCvEK/LrKo7dzyudGQqYSeW+LtBceKZGkvV/0HzBg==
X-Received: by 2002:a17:906:8a50:b0:9a1:fab3:ee3f with SMTP id
 gx16-20020a1709068a5000b009a1fab3ee3fmr13114131ejc.40.1693329463292; 
 Tue, 29 Aug 2023 10:17:43 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 19/31] ARM: dts: rockchip: Switch to operating-points-v2 for
 RK312x's CPU
Date: Tue, 29 Aug 2023 19:16:35 +0200
Message-ID: <20230829171647.187787-20-knaerzche@gmail.com>
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

This will allow frequency-scaling for the cpu cores.
Operating frequencies and voltages have been taken from Rockchip's
downstream kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 43 +++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 08b953b005ff..93560c4cd16a 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -36,10 +36,7 @@ cpu0: cpu@f00 {
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
 			resets = <&cru SRST_CORE0>;
-			operating-points = <
-				/* KHz    uV */
-				 816000 1000000
-			>;
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -48,6 +45,7 @@ cpu1: cpu@f01 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf01>;
 			resets = <&cru SRST_CORE1>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu2: cpu@f02 {
@@ -55,6 +53,7 @@ cpu2: cpu@f02 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf02>;
 			resets = <&cru SRST_CORE2>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu3: cpu@f03 {
@@ -62,6 +61,42 @@ cpu3: cpu@f03 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf03>;
 			resets = <&cru SRST_CORE3>;
+			operating-points-v2 = <&cpu_opp_table>;
+		};
+	};
+
+	cpu_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-696000000 {
+			opp-hz = /bits/ 64 <696000000>;
+			opp-microvolt = <975000 975000 1325000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1075000 1075000 1325000>;
+			opp-suspend;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000 1200000 1325000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1325000 1325000 1325000>;
 		};
 	};
 
-- 
2.42.0

