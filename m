Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E07BFCA7C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DD610E7D8;
	Wed, 22 Oct 2025 14:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WkLfQX/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93FB10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:49:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso64328115e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761144580; x=1761749380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
 b=WkLfQX/bGVFHjLqOUmwavr7lb6D6vignoYBbmv7qO+OpQyO8EInCGgvwaz5NVJG0X9
 esS0ywkx3cW/wbA3z+Ao2doBfwZH52Ij4JkvsZOyHcqELwT0432sKsyWlph4//AGqrwg
 McDjp9gaBuyYGfG0VUYDTYIG7P0Gr0KTF52+Ns9y7azbf4d8nxo6QThtYcnVBJubcS4Z
 AQTp2uCbvGtccVUcL48cJX6tgkpc7yy7Ga3eKxVOnNVnJSm92xXN5/E5VdptkqukHut7
 ngL6IwwmLrKAuMrkAwT7ywjSbEW5R2EOWEQRPhwj0HROlefTVkA/9p6DIETOzQEyKSTE
 iRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144580; x=1761749380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
 b=Mmn7AAo2RLeee1CMmjhFx8mWZmdBC9SngQFB7KjDQai5vxLjgKlvY52s6MvE1s1mBR
 vsX4kPe6RMJ9Xrr5xWI2whEEzqQ0ff7TzrWrVhc4t+BS2fBJulDsxxRqMLk87DqCD5MC
 Gx5vF1zjbnU34fU28If8HSxvuV2fYRRa0ws7DkTldSNfofxdCErHGIxQ7ff3PEFiNklm
 Ty5mbaedzFqNOeuI0YBlDf08PEGkk8ZdjhGEmxAKOwFUNb9eN8wXPWdGPAlaPC+PiMh4
 QZfav/ldv5ShqUD5oR5524WJoC/L7VtyIsxDZ5/1yEQxjpVplDmfbZKq7o3J0KZPVJJ/
 F+yQ==
X-Gm-Message-State: AOJu0YwOwwRNzcc5yyo7RljMUrY7XBWIcWC2bEx7eD+5RteLA6rzGuxY
 d9mHNnPIhqE37BhXwpTjEMsU+7vRDMFoGDQxGaORjYAbWf/nG3lA0zeW
X-Gm-Gg: ASbGncsp/rRqkKJL79baGXP7v+Juq9MTc9XWJ9wgNvo6jriZ+1NvEalxjSztV1ew4vZ
 bdqZgwPPcaSuHMXg5QOJtrZFbT/9NG+iolkE746ozpbXEMCX4CZh70czZxQ9gIdaBb1W6o9bXhz
 TW5s6FW9nTLTRbId6x+Ab+6SEZK1slM5unDiwdLS+1IJ5qxjw7jsgUIhDJar1hRsY38JM08Wf5C
 6YJVxDGjk/cvZEM7JWLIkr4+d0c0z2iPgjHXj/ODAf9KCSqksZvIc7WTh+3B4f5BKvXoWaOpoXO
 SylIHYs2oGO8e39KjnIQ13KtFSu/3hx6qTJsMzdvP3mrSO2xrytnPqwFa1+dY8Jt27LEQhTmgHL
 gASuEhEDCA74voObMaW3r0nO/ekMmBEKdgLzH0C6An8U/hA5ujMhHosrVjWUTTcMPhGg=
X-Google-Smtp-Source: AGHT+IFQPTCWm/+rvvBIUt0UXHZaN56MajrHW+8ZDd5b9VAy+C4orsub3LKR2q3U+XbF/HSoJxwJiw==
X-Received: by 2002:a05:600c:3488:b0:46c:d476:52f3 with SMTP id
 5b1f17b1804b1-47117907a6bmr159176745e9.26.1761144580197; 
 Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:49:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:49:29 +0300
Message-ID: <20251022144930.73272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
References: <20251022144930.73272-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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

