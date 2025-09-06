Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF027B46F60
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD7B10E391;
	Sat,  6 Sep 2025 13:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjuZ16v6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E3010E38E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-55f6f434c96so2745635e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166877; x=1757771677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
 b=GjuZ16v63gZsSEKYp7YOAmmHgc/MDT7BpndLAgzubQAwL8wddU9ZrmXaJyVCG074kL
 5JWGQn/XX4j5WRlayTpOZAdcfEaevufgtvCvVMZWHqDSeEa0UIb+LW/vD/5gr8np5aWh
 4Uqj56lD+BlrXV7VkxyswCwil7AcSyGK8T8inmPG43M5zWIuzSB2K29RnZBBXqszWTsj
 4Nx74GCaLXbxnhnryUrv7C5VjMbFXqRskcxJAyApUcpp5T3RglmaiCnP90ZRNmB1I0A5
 CugFZu4Te2yRYZVu9K/6or8h8pMpVPDLAdOgXO1aVy1p/yP9hJWBTUCyc95WBaVHNDGw
 xDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166877; x=1757771677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
 b=q1IxzLjIVIGbj/R837yJTOQZYoQ3rCO2gOZLwBVJoCndoX/YyuraOWtbaVbEZKtOlR
 jYLyBAeQjCBKTyF9nYKuPUnneciYXLmNLwX8+nv9fyu1tAg+r+UgEnLzVkIaSepzJHQ1
 TwBgN/IJ8KZ6vAY5iZyvVBElr+JaPU9FJp7Tbo2m+SXemcrf+VY9z4WRtSud5ebG2s9b
 Dc23cdE2TExxBV8yLth09ggyVtdjK0FnDrL3qVh8cLfbOJ7+j4Rd6F0fAi+n0PPmDxSm
 bZT7SixxPzcpiNIDCeSQNYNiw2Kfcp6sX9GaVnrOxm0HlHMsNlEYsLjXLvNS4io0Glcn
 bp8A==
X-Gm-Message-State: AOJu0YyqH5v9/Jz+SjtiZbjYiF4rrWf4v6J7UA0ZGdjRt45UYoxb/tOj
 IflTgv1dwwurJo7W4RtRB9n8u1CWNpfn+hBnBH+wDiC1k4FghN+ulsF0
X-Gm-Gg: ASbGncsKMm9L581Qk05E29Mti51NwXzx1Jz4TtlmokI/8UjeBfyHtXqmihBbp0hb7aN
 MV3hi1nxl3tC9TxdV9q634EigpF5rkWQRtmUEODD6TgH6NvVepLs7Qsp46ce4VdrjGxNb1c+TAK
 mE5TFvA661qLWXtwLJ+NuUsLXs8aOyisXGaxiYJdvbpVbYCSz1cJOoEtbVC9UqyvoPbYFQSTq1G
 5xFVKsoKtHVElTKJVkHi5vxYgOgtSVbZS0hQr0CiOzkHJvoR8XBWaQa0WB3hu9FhHl5LqX8N1Rn
 KCZ4ui9RWKRAMGfaOIHOtxme0OyEuezEYYbbfBpjPuYpCjqGGz62W6jBr6cQN/UUyY3WSeN97wL
 xjjQrrFfOvgQtcg==
X-Google-Smtp-Source: AGHT+IHatIGh8G0J1UikQfxdTFIXqQbQiWvindT5F63RkEZZAi8sPudRZamp4DbTR3zgvoJJlfk9bg==
X-Received: by 2002:a05:6512:1455:20b0:562:d04d:fa0d with SMTP id
 2adb3069b0e04-562d04dfb1cmr352888e87.30.1757166877046; 
 Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Sat,  6 Sep 2025 16:53:43 +0300
Message-ID: <20250906135345.241229-23-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1

