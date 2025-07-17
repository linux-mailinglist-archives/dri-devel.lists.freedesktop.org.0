Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE7B08EFF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8410E834;
	Thu, 17 Jul 2025 14:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVzxP4r7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109D10E830
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:22:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-55a28be32eeso907906e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752762128; x=1753366928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4jzyEI3ac/uOo6smhtFQv3Lt7kPNZfLb7UDBGDyA0w8=;
 b=cVzxP4r71WR38eGwH/9Snjc+d0bsoJqhrrd6A6GtfyvTmjENpcLtSvw9mMnqbbx3aS
 F/Tv2YcGzbxOSCJGhGPm4dZJTQAjjp6rFnRMMWwaHCTD59792Bra3wTJhoYvDHvNRDuB
 8SDf1T2yYOWIbEOiW2H5YJyS/Nokg4OcGY306MlumRX7y4In3lLy1QHfdjDiraytrIjB
 tNTxNHaM9NV2ONS7WbZ5GY09bXGIFq0htB0CmQ0WtC1/3G3u4AlcAfFNJjRGKfOaWgq+
 5cDmVpHDd7HGw71AjXWUd0IUpmKZVF3TnoJjXLTw/yzj5TU+uNFcGqi3wcGlaGiLxQF8
 7B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752762128; x=1753366928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jzyEI3ac/uOo6smhtFQv3Lt7kPNZfLb7UDBGDyA0w8=;
 b=KMJsiDiUVMFqn94P1PI0eCVp4DF9fDZamT6IyRJw+r0LDnQu02/NPlr3YQcg/uQFf9
 5LnJeFI3WbPZ+qLIc9ZBZboFYXfYnsyEf+CJIce+Psxy6il/M1Ko1xlMMiWQoSECUmDA
 OGEvVDzAz4aDGoM1Rhgw/jaDqw6hopMfT68DdZTAFW0nd07AEXVJ6bGqlnEw3ck0cQM6
 VjDjV/NntPNBFpJWmCInUKP+x0/wpjb7UO+/q4gkAd1Ep7unSWACfF8paO/YrOyiiPRY
 yYsH6S81jRR7CTWsAHkH+3zuuRPEeoXpJ1lNEdFZ8KObq7qnSB5rEWnyNfm88rC7WsjM
 vGpQ==
X-Gm-Message-State: AOJu0YxagWpep2mpUBlnKoqjg3oa20c7OiOEfxbLv/SA/7qby59aPe4F
 VoO7nJkPoVsy7vlXipM+gTP4il8kzxp0dBVFLe83w3hjLBglp/pTv0LX
X-Gm-Gg: ASbGncvuhz7rbWyqg4IZlBpU3Fr2JyIOr74fPl/IP2AChTImazkk0WbBCu5aM5vPE4c
 Lzu3rrUV9X1WS4pZ2kb/3+w5UrCdACRIO/AAD+BLqEiEIHX7kCVVOnQvC8z0869sKvk2q3ZUZFc
 6xckOYwAUAzVdNEj7gLrqTR9Z+eCR5TrpJqwmqSSpmFbhRjTURrf6RLFrgoxi8GXrqaPsIyJ3HF
 3w/8MDD1HgzXx4iBLMpUQQlsJN+uAiz8O8gL8lp4UQf/aBqWk27i0bfRvv6/00edyLcwlpxzFmC
 r8HUY3WW4jpwC1HDBYEmCHtCrA01UmdfQWOPOJgl1HDYMzLMjGgq45OB2a828Tx+ErDhjZ2MgjL
 WwYoAHeO/IWJcPSHv3x2i1XGt
X-Google-Smtp-Source: AGHT+IESYH2Sz2RGJLeVpKp3IKX4ZOErGb7b+04X70EABSWL+fmITawGH+Sfa4Vm3XmfnZhj3gzEDg==
X-Received: by 2002:a05:6512:3f25:b0:553:314e:8200 with SMTP id
 2adb3069b0e04-55a2958fc8emr1141661e87.8.1752762127827; 
 Thu, 17 Jul 2025 07:22:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 07:22:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for
 Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:39 +0300
Message-ID: <20250717142139.57621-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI calibration device node for Tegra20 and Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 92d422f83ea4..521261045cc8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -74,6 +74,16 @@ vi@54080000 {
 			status = "disabled";
 		};
 
+		/* DSI MIPI calibration logic is a part of VI/CSI */
+		mipi: mipi@54080220 {
+			compatible = "nvidia,tegra20-mipi";
+			reg = <0x54080220 0x100>;
+			clocks = <&tegra_car TEGRA20_CLK_VI>,
+				 <&tegra_car TEGRA20_CLK_CSI>;
+			clock-names = "vi", "csi";
+			#nvidia,mipi-calibrate-cells = <1>;
+		};
+
 		epp@540c0000 {
 			compatible = "nvidia,tegra20-epp";
 			reg = <0x540c0000 0x00040000>;
@@ -219,9 +229,13 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 50b0446f43fc..c52ad3715505 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -164,6 +164,16 @@ vi@54080000 {
 			status = "disabled";
 		};
 
+		/* DSI MIPI calibration logic is a part of VI/CSI */
+		mipi: mipi@54080220 {
+			compatible = "nvidia,tegra30-mipi";
+			reg = <0x54080220 0x100>;
+			clocks = <&tegra_car TEGRA30_CLK_VI>,
+				 <&tegra_car TEGRA30_CLK_CSI>;
+			clock-names = "vi", "csi";
+			#nvidia,mipi-calibrate-cells = <1>;
+		};
+
 		epp@540c0000 {
 			compatible = "nvidia,tegra30-epp";
 			reg = <0x540c0000 0x00040000>;
@@ -321,9 +331,13 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -334,9 +348,13 @@ dsi@54400000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 84>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

