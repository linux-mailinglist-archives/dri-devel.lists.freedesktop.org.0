Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40677727EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F370B10E29B;
	Mon,  7 Aug 2023 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425E10E29F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:35:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso634152266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691418937; x=1692023737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IyTj/EAHU86MCmjIDTneVFZ/F0zuNFke5LJEBRUozL0=;
 b=d+b9Bgxt8jjhWPSZN8YGF+VhD2yHLtLkBYtZCPk9VS2usI+5pUfv1lOceCn2jCEhU3
 bIXRbL27djBDBnqqN6oEN6+zL5NYrceLq0i488o53TZCGQ9g+F5ut9NM7WVJghK8/Fw/
 /JKY5z3wXjvNJXPIKVJ7ZLq/o+GCim1f3WomPX3IWHCesbIGdoYgh2uynrRgvUZThunI
 VBZvOvrsOHt7Kw79NU8zNgc7dZtR4lngga+ZXSMu7xyzTdTwpA2Cv8OPxmnQ1md4kEQ9
 tNHTLcXku1SrjPQqHtGPMl9UCg74r3bE1LZXfXjSsVqaZaF/8z7yHDyd14E8WfburjHE
 AZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691418937; x=1692023737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IyTj/EAHU86MCmjIDTneVFZ/F0zuNFke5LJEBRUozL0=;
 b=CO3q7QY+8c6Fpq/vMjkwxn2Jyu6kKwwN2gBpQlBpElxZZGFhJeMFnYiiuCmLQDM2BZ
 NR6zSHnLAf7lgZ7c4zxOqUbmjzbaopknLGmfhdb5mBImoDGOOXOEB4mYYL5l0OLB6Gpo
 3TDrd5NQAOwIFRxjMvCDoK4mQ2fAJuuWtQsOg93a2BtCDyWnOHbRTylWGx7oRbsxnYZ4
 DhELFBDTzBXIrnkVzxLv3hfMNCgv9zCHDRGw8o6ncxv9YpfdTrNJaOHBzNYunUHnV382
 v9G5P6rISmZftiIvwiSeH24hY2pRy+NGs23GXuOM3c7a5kjz96PWc2dM9zLM8EAby13b
 MmwQ==
X-Gm-Message-State: AOJu0YySQs2CkSkAsfqxhCe7ySCasI/3dcIeg3jQNT76u3rWlZbdiDZr
 qZ12NfPBTTQY8vUdwESPUDE=
X-Google-Smtp-Source: AGHT+IEBOTjjQty4GTArfLewTs7sbydLqR0FAVIlgxNIR8H11ce7m0dYpelCzN4OBZskoCwE97nmYA==
X-Received: by 2002:a17:906:51c8:b0:991:c566:979 with SMTP id
 v8-20020a17090651c800b00991c5660979mr8427229ejk.36.1691418937036; 
 Mon, 07 Aug 2023 07:35:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b0099329b3ab67sm5323292ejk.71.2023.08.07.07.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:35:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 5/5] ARM: tegra: transformers: add connector node
Date: Mon,  7 Aug 2023 17:35:15 +0300
Message-Id: <20230807143515.7882-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All ASUS Transformers have micro-HDMI connector directly available.
After Tegra HDMI got bridge/connector support, we should use connector
framework for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra20-asus-tf101.dts    | 22 ++++++++++++++++---
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index e118809dc6d9..cd6acbea0318 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -82,9 +82,11 @@ hdmi@54280000 {
 			pll-supply = <&hdmi_pll_reg>;
 			hdmi-supply = <&vdd_hdmi_en>;
 
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -967,6 +969,20 @@ clk32k_in: clock-32k-in {
 		#clock-cells = <0>;
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index ead95306840f..9b658b3de7a4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -80,8 +80,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1494,6 +1497,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
-- 
2.39.2

