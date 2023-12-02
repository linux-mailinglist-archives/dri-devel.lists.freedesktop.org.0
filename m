Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065EB801CC9
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FC110E19A;
	Sat,  2 Dec 2023 12:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A9C10E19A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a187cd4eb91so388395866b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521523; x=1702126323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HR4GQ7+5atR3ar2YrCztGhjSeU/LO6OVqwoc3hEbrC0=;
 b=k9WW6nU2WEYI14j1Zlj5Cq0GLuKeL6PGO9qfFza6kLlhNtIyNwe0yOMSTJOYur3CDY
 bIJ3jko9boFKrs+8NlabXl7+jea5Y1sgVWoweICN3bklxc8oPE5whMh5OxNI11w+SkCV
 eQVF1KgYm1vHQOPO3vPueM5l0t7nH0cABKs4ATvd7GelpmspUqwFeq7I3m6vn7OuV6Fp
 q/N33QwexhCnkJNeSN8P4r9Z6S6jKJvUxuUrairgvZT6clhFRZwNqs7pZWXKJ6UVTkCa
 0Wz3O7wCerppWFfvu9aTHCB3vU3VEfrL/2/DaTJlINZAIHHPVxXuW2ae1HwYZdDeyoBV
 sKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521523; x=1702126323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HR4GQ7+5atR3ar2YrCztGhjSeU/LO6OVqwoc3hEbrC0=;
 b=dmUzbeJxuFFMlFYaTYcL074ufEAtohrspoXHBNx/0x2uCqbmbwctUcdXdTsQYNuDzg
 CWk7BKpz0bV8mVa/cmk1R4EbsP0AlYFay7w2t7F4namwkP0J7ww+ldc6Jok3xxse3K3T
 OoMQdRENnUlyznjJ3Sg6YvfwJUJP/eUYMr0+Mt3HwtPQPRKWUnWTFy5UWuhFaKGpywaj
 NcEpTYFMzFiDVB2ec3w1Xm0kI0OIoSweHSBQnFJXe/XaFuWdhUVPi/GZh/Uuk/Qz/mZB
 OY0r4RR9nF+/os+fUwauvpcRTgri2npJYXCPiS6kHLDi+b3pXCL+BepfZ7MXqsGEz/sd
 1sPQ==
X-Gm-Message-State: AOJu0Yz/WYtCPtRQvA5LwZazw5TCgtMdh5ljWxQgtypbz2vaT53jjftU
 tTRrr5yyRO4wfVikdCjAKQ==
X-Google-Smtp-Source: AGHT+IFsV7yIlBBzkDPIYNDCqw3wEkc8AQ/SUwRG3frSQ5X+KzW+68Zbs/ntALcZcfg6t9TIXCXl8g==
X-Received: by 2002:a17:906:35ca:b0:a19:a1ba:bacb with SMTP id
 p10-20020a17090635ca00b00a19a1babacbmr891820ejb.113.1701521523169; 
 Sat, 02 Dec 2023 04:52:03 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:52:02 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/5] ARM: dts: rockchip: Add GPU node for RK3128
Date: Sat,  2 Dec 2023 13:51:43 +0100
Message-ID: <20231202125144.66052-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202125144.66052-1-knaerzche@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RK3128 SoCs have Mali400 MP2 GPU.
Add the respective device tree node and the correspondending opp-table.

The frequencies and voltages of the opp-table have been taken from
downstream kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index b72905db04f7..b05ee3d926aa 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -101,6 +101,27 @@ opp-1200000000 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <975000 975000 1250000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <1250000 1250000 1250000>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
@@ -131,6 +152,29 @@ smp-sram@0 {
 		};
 	};
 
+	gpu: gpu@10090000 {
+		compatible = "rockchip,rk3128-mali", "arm,mali-400";
+		reg = <0x10090000 0x10000>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp",
+				  "gpmmu",
+				  "pp0",
+				  "ppmmu0",
+				  "pp1",
+				  "ppmmu1";
+		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
+		clock-names = "bus", "core";
+		power-domains = <&power RK3128_PD_GPU>;
+		resets = <&cru SRST_GPU>;
+		operating-points-v2 = <&gpu_opp_table>;
+		status = "disabled";
+	};
+
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
-- 
2.43.0

