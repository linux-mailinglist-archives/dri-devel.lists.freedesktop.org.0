Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA7654305
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8D110E4F8;
	Thu, 22 Dec 2022 14:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7CB10E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:29:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gh17so5302985ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pi/zW9ZbZ2y3Vmz+VhVdwqmrZ+im9awqcNyirOkOP0A=;
 b=SIHkzQDb8actKpbGFNrDzDtjv07ZcEvqgQsi91YYto7dlSqKtJuTWM9eWXhFfzEtOK
 /Djxnhewcztw3xbUu8706lQLpR+KeW/5T2OTy2TYZOFw8NNoJYKROaTfvjjfn8bR5esh
 tapj9l4G4mwL86/Km9gaZ7jvhhFMK22yEiMI7tmtilNAvldi6eyXMIvo3mOk9122bepd
 gil4Sroov5gNB1YHInWygahj8pu59nhfJ3lBkARjIiQB2qzdlY24SQfRC7Wyb+yr3Bw9
 4I9P8kX0ap0bEFCSUFK8zeEmCmxgPWHmaeqPoBEVXR4dv0sl6IQM08BNQ7NeleKnueML
 TO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pi/zW9ZbZ2y3Vmz+VhVdwqmrZ+im9awqcNyirOkOP0A=;
 b=2KbYvOqpycSDFofvTNBf+y6wkJoG108LyV9boJXNPwuqW8OzKbWXnSNOebjQ7dt7UF
 UVzSuaHCNtWjoAXHxL4jdM2BVX8iJKfwxTe68ZVpJ6D9hFR466a0DIql24Bg+wXGNwD/
 vrG2H8ydYI/jKpQaYHsI5jWbyI1SoeHo5df0kCm+iT+0ZZ/WSaV8qB5wBdBhdJb9+yZ4
 cV4j3+DIg86UPfG9++EP/xSEz43CvuIs+iw5An2kVuJiW588qz4gM7cVV41W3myO1XOY
 4tHNf+Y2OvJJuAna0UiKzvRswT2+G9j1U/YYKDLab+OY62gDy7Wy9gnNR38G8GxsyWh0
 GLZg==
X-Gm-Message-State: AFqh2krHHD65z2Id1h6hIssledxyzyLNNaV45plEZ76gmNaNAx/bboyo
 xa0q53Cr9Ci7kKNQ88h7Ev8=
X-Google-Smtp-Source: AMrXdXuU4xfEXsY11FaCnzLlU/Z1jib1TkYCwj5+OE+uQ+v+/lDj62VkRFMRFO4PFzk3Iusi8H2E6A==
X-Received: by 2002:a17:906:7fc3:b0:7c1:10b8:e6a4 with SMTP id
 r3-20020a1709067fc300b007c110b8e6a4mr4310354ejs.19.1671719376736; 
 Thu, 22 Dec 2022 06:29:36 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 bx16-20020a0564020b5000b00477626e3e42sm420987edb.84.2022.12.22.06.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:29:36 -0800 (PST)
Message-ID: <f3edcbff-4aef-1d24-8d65-e519c9451cda@gmail.com>
Date: Thu, 22 Dec 2022 15:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 09/17] ARM: dts: rockchip: rk3288: fix dsi node
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic node name for rk3288.dtsi dsi node.
With the conversion of rockchip,dw-mipi-dsi.yaml a port@1 node
is required, so add a node with label mipi_out.
Also restyle.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V6:
  Restyle
---
 arch/arm/boot/dts/rk3288.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 487b0e03d..fbb174729 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1114,7 +1114,7 @@
 		status = "disabled";
 	};

-	mipi_dsi: mipi@ff960000 {
+	mipi_dsi: dsi@ff960000 {
 		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xff960000 0x0 0x4000>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1125,18 +1125,28 @@
 		status = "disabled";

 		ports {
-			mipi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				mipi_in_vopb: endpoint@0 {
 					reg = <0>;
 					remote-endpoint = <&vopb_out_mipi>;
 				};
+
 				mipi_in_vopl: endpoint@1 {
 					reg = <1>;
 					remote-endpoint = <&vopl_out_mipi>;
 				};
 			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

