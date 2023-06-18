Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E984734597
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C33F10E10D;
	Sun, 18 Jun 2023 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF0C10E060
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 08:51:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-311367a3e12so654743f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 01:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687078267; x=1689670267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eioE0Dis/Lnd49iTib7LFRjx3tgvM39Dyou5eggWEA=;
 b=ceBN8iB14EtLu3N9xvBpe9SzqP7Os5abcLksAlPhYUzXLfD4RHOGOk2v6l4z6gb71k
 gxhqw4m+s7fo337qXycjAjAILc/sorK8GhXj5Kyc7NfI7MvETAtTe1JEeLDiBnV0OWDF
 TGuCXfO8ePw3M6AWjMzEcQdrEvGt7q+uZpr2eFJggEpn3jarFKo4i6MzEik9iXtQ0gps
 eP8AgN0n/PXiPihZtBGhBEDc0sgybtB8xyHkIaNHXAY25+kpPsF1WA9Tk1dwle1XdHgd
 HIvXd3wEv+lgzMR6cxOnMVtFqnmezrG7fn2iQ+i3qrA/i8GrJpUuSbLxKqKKLvGMhnBJ
 Rakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687078267; x=1689670267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eioE0Dis/Lnd49iTib7LFRjx3tgvM39Dyou5eggWEA=;
 b=cUjlkaNtYyK3HQZJofOXKTdj418UTotX7YAhwsijg+OqXC7IgDwAbHwdyXLoFPW4Ny
 e7d0g0C24kZboj8z+UH+yk15Mi6Ma0PqFvGlsy+0+8ds5tQ0BPro3KgSJ+ddZnTojVUU
 U5q7an4lMg7+rhjKy1R83/kEkWmp1EIF75764xYHXbjeQlleCr318bIWc7HbO2CTuB9e
 86lsPXsUZiiZV5lugfKD5F10POGNurR2mM9Cx0S4rZh4RVhucixSPdB+WwhqIuu6PR14
 d4hfPUMbGKiJXtECgPbqC+mtZeFaWlBoH/4LlUjVVTphv8YwsXFJHDImOxlzAnzwDzDm
 +zug==
X-Gm-Message-State: AC+VfDy05sxmJNuUzWdBQwjI7ZExiJ9X3gAwRZoBXK4PWjEspwJ3/GqJ
 HWHqQV9z0EG5Iz9mof7aQAJcRa+DU/IcYw==
X-Google-Smtp-Source: ACHHUZ7sQ0q3MRbhfTSqs8mEnL122mAB9a+9gkcgc+dp3fUXAmNDA3vWeeBZKNPeuH2w+FYy18K1oQ==
X-Received: by 2002:a5d:5751:0:b0:30f:c943:f925 with SMTP id
 q17-20020a5d5751000000b0030fc943f925mr5509586wrw.49.1687078266824; 
 Sun, 18 Jun 2023 01:51:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.79]) by smtp.gmail.com with ESMTPSA id
 i17-20020adfded1000000b00301a351a8d6sm6953550wrn.84.2023.06.18.01.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 01:51:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Date: Sun, 18 Jun 2023 11:50:46 +0300
Message-Id: <20230618085046.10081-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230618085046.10081-1-clamor95@gmail.com>
References: <20230618085046.10081-1-clamor95@gmail.com>
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
 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++++++++++---
 .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index c2a9c3fb5b33..97350f566539 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -82,9 +82,11 @@ hdmi@54280000 {
 			pll-supply = <&hdmi_pll_reg>;
 			hdmi-supply = <&vdd_hdmi_en>;
 
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			port@0 {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -963,6 +965,20 @@ clk32k_in: clock-32k-in {
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
diff --git a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
index bdb898ad6262..153d34a012bd 100644
--- a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
@@ -80,8 +80,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port@0 {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1492,6 +1495,20 @@ clk32k_in: clock-32k {
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

