Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4AE725436
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6912010E42B;
	Wed,  7 Jun 2023 06:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C9710E42B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:31:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso69694675e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119505; x=1688711505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=g2j6/JCVxK3TnZWkCdaosIWVIMAC/i6nhFtyu+Re5bfo/RS+chFBZPxNyozCfc90my
 23Oir7AD/urej/TP3IhFf5y8O5uP5ydLyWw1O9546HsHgPevZM/lEEMGM6pOckKnQ070
 c9O9Krxv0kQzUEMbJow7q/8nGkkAEmplFUkco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119505; x=1688711505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jBqOeBntw2+ThpWf4KE8BMuMRq2HYj3RR0u0oHiddc=;
 b=K3DzN5PRAeML9cp4hIf8TTu3tGy0qXVR0fTzpC2ywqrc+KX2PuRC1zOHDPWPAy1m5A
 V/Je81B+lIhNND+HkGcGlQoHBzk+LUxJXZgtJahYyMtnuEJ8IAS+iiibbGeA84tkVOs3
 7gPAzGme8jOea1uka48w4D2f26d85jxim7OfeFoE/vDDg59j/xuZN1jApfGB4vbNcps0
 X+Ylkl1sMBbwf+1jhMQHxWyzSBKl04nQ3nrWa8GnJLNdlsf7wzBq3+pC6BWcnql+/NDr
 SQFOHnCUYccU/rE9Ha/jvx509r509ZlU3cBIDReUETySdlWaQC384qTimmpPEQQ7EsuP
 HICQ==
X-Gm-Message-State: AC+VfDwGVG3XGNNvUDAg637BCru/BcyuXyntaJLr44m4xBGvFPd3YjqW
 zC9wmmqbuoqW2xmXmNam+ZfkbA==
X-Google-Smtp-Source: ACHHUZ7swwk8nHZHRKO2QFZgoHwZJa+Z94Ki4ZMTiNvDjHj307W1KcYe3A0JolZaW1dRw+WElacJZQ==
X-Received: by 2002:a05:600c:2158:b0:3f7:2e57:d3af with SMTP id
 v24-20020a05600c215800b003f72e57d3afmr5795147wml.11.1686119505366; 
 Tue, 06 Jun 2023 23:31:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 1/6] ARM: dts: stm32: add ltdc support on stm32f746
 MCU
Date: Wed,  7 Jun 2023 08:31:34 +0200
Message-Id: <20230607063139.621351-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add LTDC (Lcd-tft Display Controller) support.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f746.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index dc868e6da40e..9c4ba0b7f239 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -507,6 +507,16 @@ pwm {
 			};
 		};
 
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+			status = "disabled";
+		};
+
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
-- 
2.32.0

