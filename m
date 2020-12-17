Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D582DDFBA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1D89BF5;
	Fri, 18 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883306E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o13so36630893lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kj7GIF+uJIxlrnFvjrN1VqMHS/QleXXRwa7p10T8PcE=;
 b=kP7PHY6U8z1UY31KMv3z/cd4fSHYhATI3ExPOUCA2tZru2WKCyeTd2UP8TlwgAp1M6
 m3gKgbjGMcs+s5oOOkkKRg5uLBYrKlTd+fICyDzeWlVMS8TJLKcBOPihhJWpu+AU9087
 BB/WHFvb13FuPmlwTMx7QgLcXn2/Ad1/eGMuph5p4IXpPVqJSz4M2F28QQ7j5D3NT9Pe
 SKPb+8KyQFL1FQLuLtECc7uWAD8qFTVYL6Rf2IuNbEgYvORPTvGDGfDYaX2QnYwn0Rgx
 FmpTg2+9oH4Y9ij9LQu4ybJ+DxcuDbYI0ihxUQcWcjKPtcTSS6c8GDtx5aNyj2kNgujh
 8knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kj7GIF+uJIxlrnFvjrN1VqMHS/QleXXRwa7p10T8PcE=;
 b=Wpre1U9JU5aCrdRYNzeC719WVFcrNUVtP4Vve9G+Q6P6Awe85dOy6PKvJJfM5CbARw
 GFdKFZLMGl9Q6zMR2Z6T1arQrB1TcssVnylDXWzrgGVWpBkBOhvGsfdRLq3ptj67EVpW
 OCY1L3ELh5jo+2M8RdR8cUUsG6H0lf+UGwRXtDxRbGD+GJ0jTK+nT41Ch7JkwAIl5Pvr
 HBuwknXq2ytpQ3jLpxThc8CLYk5svT20pC0jYzEAwteurMPcpjnuME32/I2pbwsrgr9h
 MKW4qGlQo5XqP95EA+MF5gfA8Ei5G0yFGN5xF7XB775k9tXSpviiidUcnCMhAegNeldx
 8w/Q==
X-Gm-Message-State: AOAM532shv34Z0I6j9UBSRAwQrvTZXhWRlhJu/x79wIdr36wSXH0W367
 Iiu6jX+rtHo1+4ycq4di+wa2/DLhIGE=
X-Google-Smtp-Source: ABdhPJwIfOmllgVrz8dHRr+2J5z3WatJHYxi2dLPJpEQkNdVwjNkmxMLIP17neNyCZHg4jvjqXoFpw==
X-Received: by 2002:a05:6512:32a2:: with SMTP id
 q2mr7511267lfe.625.1608228446970; 
 Thu, 17 Dec 2020 10:07:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks sub-node
Date: Thu, 17 Dec 2020 21:05:56 +0300
Message-Id: <20201217180638.22748-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document "clocks" sub-node which describes Tegra SoC clocks that require
a higher voltage of the core power domain in order to operate properly on
a higher rates.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.txt     | 26 +++++++++++++++++++
 .../bindings/clock/nvidia,tegra30-car.txt     | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
index 6c5901b503d0..353354477785 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
@@ -19,6 +19,16 @@ Required properties :
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
 
+Optional child sub-node "clocks" should contain nodes matching the clocks
+on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
+
+Required properties :
+- compatible : Should be "nvidia,tegra20-clock".
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- clocks : Should contain clock which corresponds to the node.
+- power-domains: Phandle to a power domain node as described by generic
+                 PM domain bindings.
+
 Example SoC include file:
 
 / {
@@ -27,6 +37,22 @@ Example SoC include file:
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		clocks {
+			hdmi {
+				compatible = "nvidia,tegra20-clock";
+				operating-points-v2 = <&hdmi_opp_table>;
+				clocks = <&tegra_car TEGRA20_CLK_HDMI>;
+				power-domains = <&domain>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra20-clock";
+				operating-points-v2 = <&pll_m_opp_table>;
+				clocks = <&tegra_car TEGRA20_CLK_PLL_M>;
+				power-domains = <&domain>;
+			};
+		};
 	};
 
 	usb@c5004000 {
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
index 63618cde12df..bc7bbdaa9d3f 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
@@ -19,6 +19,16 @@ Required properties :
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
 
+Optional child sub-node "clocks" should contain nodes matching the clocks
+on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
+
+Required properties :
+- compatible : Should be "nvidia,tegra30-clock".
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- clocks : Should contain clock which corresponds to the node.
+- power-domains: Phandle to a power domain node as described by generic
+                 PM domain bindings.
+
 Example SoC include file:
 
 / {
@@ -31,6 +41,22 @@ Example SoC include file:
 
 	usb@c5004000 {
 		clocks = <&tegra_car TEGRA30_CLK_USB2>;
+
+		clocks {
+			hdmi {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&hdmi_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_HDMI>;
+				power-domains = <&domain>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra30-clock";
+				operating-points-v2 = <&pll_m_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
+				power-domains = <&domain>;
+			};
+		};
 	};
 };
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
