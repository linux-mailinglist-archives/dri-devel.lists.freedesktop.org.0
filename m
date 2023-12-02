Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE023801CC2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0FA10E1DB;
	Sat,  2 Dec 2023 12:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B0C10E19A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:02 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1a2615e909so206143666b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521521; x=1702126321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGS3uiiSRjNFmcXcLobVydkfz1z0YWeEIsOnLuIOTtk=;
 b=EAeC3/lKbOMR8IZ58Pty7xpcQI0v4hEXIPzHGfNSlVtxPSHkFRy7lbbR6JrkEwuPRE
 mVPnq9qYzzR92UXW+b/9kDNC44bs52M+Wc2zyQgtaWbuWOoTfDzFkTXoQcCej5zWuAHQ
 qFCsyTXx7z05YTpzhkVoOcaroHy8kPl39fyCwN78wk6CZWG8L5Dm7dF/s+v+0/Nekc1c
 elzXzoLRUdqIbRUcUT/aKKUn9OAJNkacYgVhqPpsUozYgbKVvkOoQOo7avlKOFPyQ9b0
 +itE677pnLy11sBdnxqoU2VrPVOK9t8D3DrmEsRUM01WnlsO5hvc0yivSGUpo35T2xB7
 JGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521521; x=1702126321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGS3uiiSRjNFmcXcLobVydkfz1z0YWeEIsOnLuIOTtk=;
 b=VY6lHE9wLmX82BI2mG1Qc+Ow8fu2GrnMWzZ/CczlAAJAeRsKWEWaxW6FIl1DM0jKyE
 nDCOLLprxFyIEM/MuiPkMFXi01jss52xqv6PTgEvHAPh1N2mK4LUzF+JgPsefPlNJOGg
 7oEOm7E7zQT0k50Pb5LwBpiYpV7hACnzDiGGs0HW2D07/zyka3RpMhQKEs8Q4pGFoKhw
 1VxiFDpVee8cB3m0ksXKi60OOhXfg0DnXEJyZ9F6D1RdI1q/v9S7glonMfouzzBHHDLX
 f2kbm5ryA9l914+XTuLCzs0JAmiBXzHxh7rIhZl4Jp+XJFn2zZWwlAK7n7DL2pUHV/6w
 2wFA==
X-Gm-Message-State: AOJu0YykdSMHjM8b4BLyp4YbOs4dlH1bvAksFNNPw5Qn2OAhcD8tAWWw
 P0jHkICmYWf4/ENZrG/4cA==
X-Google-Smtp-Source: AGHT+IFQCssdJ19Dhg4av1bEqGzWCJHnq4HF6friZV69W7kUuaniNiFQHWBT6X9GqTCcTQpVcwkvXw==
X-Received: by 2002:a17:907:a18f:b0:a19:9b79:8b47 with SMTP id
 om15-20020a170907a18f00b00a199b798b47mr814246ejc.88.1701521521158; 
 Sat, 02 Dec 2023 04:52:01 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:52:00 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/5] ARM: dts: rockchip: Add power-controller for RK3128
Date: Sat,  2 Dec 2023 13:51:41 +0100
Message-ID: <20231202125144.66052-3-knaerzche@gmail.com>
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

Add power controller and qos nodes for RK3128 in order to use
them as powerdomains.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 4e8b38604ecd..b72905db04f7 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/power/rk3128-power.h>
 
 / {
 	compatible = "rockchip,rk3128";
@@ -133,6 +134,106 @@ smp-sram@0 {
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
+
+		power: power-controller {
+			compatible = "rockchip,rk3128-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			power-domain@RK3128_PD_VIO {
+				reg = <RK3128_PD_VIO>;
+				clocks = <&cru ACLK_CIF>,
+					 <&cru HCLK_CIF>,
+					 <&cru DCLK_EBC>,
+					 <&cru HCLK_EBC>,
+					 <&cru ACLK_IEP>,
+					 <&cru HCLK_IEP>,
+					 <&cru ACLK_LCDC0>,
+					 <&cru HCLK_LCDC0>,
+					 <&cru PCLK_MIPI>,
+					 <&cru ACLK_RGA>,
+					 <&cru HCLK_RGA>,
+					 <&cru ACLK_VIO0>,
+					 <&cru ACLK_VIO1>,
+					 <&cru HCLK_VIO>,
+					 <&cru HCLK_VIO_H2P>,
+					 <&cru DCLK_VOP>,
+					 <&cru SCLK_VOP>;
+				pm_qos = <&qos_ebc>,
+					 <&qos_iep>,
+					 <&qos_lcdc>,
+					 <&qos_rga>,
+					 <&qos_vip>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3128_PD_VIDEO {
+				reg = <RK3128_PD_VIDEO>;
+				clocks = <&cru ACLK_VDPU>,
+					 <&cru HCLK_VDPU>,
+					 <&cru ACLK_VEPU>,
+					 <&cru HCLK_VEPU>,
+					 <&cru SCLK_HEVC_CORE>;
+				pm_qos = <&qos_vpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3128_PD_GPU {
+				reg = <RK3128_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3128_PD_CRYPTO {
+				reg = <RK3128_PD_CRYPTO>;
+				clocks = <&cru HCLK_CRYPTO>,
+					 <&cru SCLK_CRYPTO>;
+				pm_qos = <&qos_crypto>;
+				#power-domain-cells = <0>;
+			};
+		};
+	};
+
+	qos_crypto: qos@10128080 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x10128080 0x20>;
+	};
+
+	qos_gpu: qos@1012d000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012d000 0x20>;
+	};
+
+	qos_vpu: qos@1012e000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012e000 0x20>;
+	};
+
+	qos_rga: qos@1012f000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f000 0x20>;
+	};
+
+	qos_ebc: qos@1012f080 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f080 0x20>;
+	};
+
+	qos_iep: qos@1012f100 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f100 0x20>;
+	};
+
+	qos_lcdc: qos@1012f180 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f180 0x20>;
+	};
+
+	qos_vip: qos@1012f200 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f200 0x20>;
 	};
 
 	gic: interrupt-controller@10139000 {
-- 
2.43.0

