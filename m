Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68BB48E8E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F7D10E52A;
	Mon,  8 Sep 2025 13:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CE8bi7js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6664610E526
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:31 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45de6ab6ce7so5765575e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336670; x=1757941470; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BDyuAKF3Y98UqjyyRF0OYRaWszlGNwULvWxPJjSxWt0=;
 b=CE8bi7jsWW/ywHzcoAavh7hgJO8kRvT0eEspCWhHY7LZWUzW4HunOLWHlowWQSY+2i
 iq1olZb41Iu9TlxZq7+X33gZygO4hO4cbzPKzF86iq0bCMkQgqqcYbB8RS62ytEuUjM/
 wwh7bZHED1YdgqxKRZw7jugKkG4xIAVNJHuM9G6NYSOSyBqYxKi93oNV0C/berCAxPiv
 Px6dfKkBjTcAgIqd0daQBfLvbCilWVoEzjPuopdgh5XGzBt+6L4Mc6CdoR6AWB/XLtuH
 TZ60D9wmw5H0QO8cfQRKL3/ZUk2jUFQVoBaaP8Z3dp6bzef+7GucJMM5p1lLg6Q2mI6l
 jryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336670; x=1757941470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDyuAKF3Y98UqjyyRF0OYRaWszlGNwULvWxPJjSxWt0=;
 b=LYPm15sRSughu7ySsoEPKXL/VHcfvsBtHfQiNB3T4+WDMyWYDkNoomuCtXW3UqkeAr
 kc+DIkKzOv272uAuYolpysCEasjS9JKm7WDMw9qaPgl5pIR41H4k04QS3AJxodl+WK24
 +3KXRdkZ8A0qirMvc3j13oVzh7g4ytSjYSIxnNySbXxu+5FUcr9bEgcG6fMg/JEYX2IK
 kBWnwcmH4Vsk0f6GcmWY+cc2vrZpxJy9hMvn+Tc6bHRhBaI/3/qBIHj/dmbX2IlfTLJh
 6qw0cY+Hpnc47TfFvWTq6mb5vubN0QD5uLX+neeqJCVj0u3GsLvu3I6zzsom1Rk4mHbW
 Aklw==
X-Gm-Message-State: AOJu0YyY5cgtAjJ23JlVQy9b/ruAQezYLIm/LkP+/mn4vyefDzhBCgxm
 pC9EtNHkvYea3wuacpxvBvxsebbx0QQP7oeGSgZ/hB6h7LjbstIFvwUm+X8xAXfBrFE=
X-Gm-Gg: ASbGncuK+oPKkb4Dgi6L0rV0yLu/M8sy+fKZAFP/q/Q7Xs5QhFRqx8nyXsznzYieZkH
 mUVp80564bl6AXvE7tURoBlA2QqvfAS8BYZ14NdJhRUIuxRUNAA5/W+LirVEOtny8roUM+OW9yd
 h+xkIfGGEB5wgVOefWKMak5lyQJjzuk17tb+vuu7fU3GMIDkfli9l5I9N8n8W6G5nJvwG6d9L17
 +bbbBkVMW3cSWoI6/1/qYCSGN8lqOJDZ9n1JIVe47xkk/ZeNio76saRrRyauBGWseMuTK6EqL3b
 lYpLEY5bDEWQRvVvr43d7aNeVMkAv6OEdtZMildveIsd8fn/I2/7FV38rW8NV8zrAXhZ/qm+aoo
 +nHB2isBa8bw7XVCchsUbbzrTD4Ix2jpWwLfFEtOlabD6DJcPhanZng==
X-Google-Smtp-Source: AGHT+IG0ZjbfMijZhAL81qHoPX21zRJo3pFZjpyCCWzSjGWv7KwJCCXF42mhC1fWc6KxMzh5zfhfmg==
X-Received: by 2002:a05:600c:4f0f:b0:45d:e211:da8f with SMTP id
 5b1f17b1804b1-45de936287amr17504015e9.36.1757336669870; 
 Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:22 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-5-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HrSq9QX+rRZZn6/cR+hy9Izp3f7Ikd1Wm8zLBwjaDxk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRXCAk1A5GYFI4lxepbD+HCSVr8CgQQq0D8xcF8
 d7k3yNyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVwAKCRB33NvayMhJ0ZhND/
 9lclVjyWMFDPeiGeKHHbcI/xMBqTcupaELGi1+5gFDGmiPkp8eH6QbIIJ1DPYYTItWggZzNNuly0KB
 8Ckq16igtfaJ5uoR9hBVOedkbGSKSiAu7Nb3YyPtoOQl54qhHGbHd52ASn+Y8RhSOzlHS2CfIAkMyN
 unEnHLMqqAa0VFgl3ozr3LHnXfxadl6MVzWEyy5anAjGdEkjaXGlYQC57tMrytmh5AYHpFVm6juUTf
 +sDJ72wrulwWLk1A5wGa6Fe8m+afxHNlcIjnXQVTDRiOL/sag4vIgoA/5Smi5p8vne01OwzP28CHsC
 bIa5GHL2z6xNLILOB/Z+NFJAsTa58hU/ZksNn6Sfcer3c8zEyK3NVVWbgiwUyJoTy2MweOJuYSgB7u
 OdgyxMNC5T5VyjdNuMqdAvAAAD+AJyPRTk+fLJA8B8iSkaF/ZPXRCHH0JYi9cRlV8wy43jm2n27ua9
 Vf3xlxoQ2VxvLg5shxJTMBTvTdah6X6iSBeKyoCrXDLEUYOrwxr+t0Vv0M4LkWECuqtdDf7pnVgYDp
 VmDOE/Fp74Ehyw1XsUtSXPyqzm+P2THYGrSrsmM66wpRVVjA9B8CAigmjMLqIvJOaKIPiMW+KAP3bj
 FMItlozn2k37M726g5Gh6rF9TzxG+0mUKCmQynfFpwxgld+0E8Gft0j+J+WA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

Add all the data routing, disable mode switching and specify the
QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 23213b0d9582822e9503e4acf18c62d5c8c7867d..077aa71e79b548cb1f7c76d297a6afae717f7663 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -62,6 +63,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -1005,6 +1045,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1264,6 +1312,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";
@@ -1487,6 +1541,34 @@ &usb_1_ss0_qmpphy_out {
 	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			/* No USB3 lanes connected */
+		};
+	};
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.34.1

