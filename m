Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0DB3F95D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEAA10E60A;
	Tue,  2 Sep 2025 09:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="znD6r/Gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09010E60A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b87bc67a4so16451925e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803638; x=1757408438; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zx3flAD2tM7boXAz2/Brkk0fygpQR/lnc3aW0wO9axk=;
 b=znD6r/GjTSSWTtHZ+hc6t8ubcq57EYstem4BjzoBGJiVl6lHU90EP10kQGurSzwcAP
 pzpUB9yQKdzoF/aWCdXYeKxwiEIkl02asT9UlzGO3m+fBWc2zur/FtsHXjxg3nMwXt+J
 qos4mgZ0DdYUTVKcaOFrQ8AOyn80rOK4G2iv5s7mne+1HC7Gl9H34yVed/tzamCmVD/W
 vwHj2RK83rCHwnRpdtVF4tpm09yMTzFZswwdAwKfJTXZKzMmCzzI4U1iWivh/sH3V8Ov
 QCbZ+UOqJwH50GamMZJqtyEYy8/JIcs7klx8+3kvnRrcXbJ2w2oiyMtWkAHcIvCQ+y6f
 cgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803638; x=1757408438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zx3flAD2tM7boXAz2/Brkk0fygpQR/lnc3aW0wO9axk=;
 b=kDKX3hJwD0Gq13ergN4hHhIJ+4wky/XEdUMDz+uQTWxSXu82OxSeqm91THNETJcYvn
 N6aNlXuUYPxgp2C5iqs2di8v5ZII7zRtDld8L6hxWNxVZusWTFfv47XKgQHWeuviBIM1
 vBmTB+cargg4XujBrcI0TYptNcCbgTm+49HfQkH1W4CBz6FmxzvhS4wKGzenNzWo9Yfe
 f2zmRXSpXmYoieOYLeXudsC/1+R8ciTnfix28fswmFzIQ1Bh2vDsLI6nNx+Kp424iy1B
 JjDDu84L/nKXsBE9h4ioGOIOWBI3Lz1jRf03hNB0PgodIgcsYPwFKqPJPvBD1/b8SMmQ
 Am5A==
X-Gm-Message-State: AOJu0YziwWZFGyr3hzhAbmU8Wdld3L3+PPl2Wh52lXM7jd47W2RH7CNr
 oVpLmzhvBe6k4wTInpgooMPRB1uMfcYa6eZpQUUyFWX7nwTeHKoNJyYP32hCb9q27Vk=
X-Gm-Gg: ASbGnctZdVOiNbmewybusw4AwaEyTlFXcnT59xBE2tjLxEDkIzRLuY2R0oCdQj5o574
 XnSsnojVacb3Js78p8Y4BppFQ/n3e/kFmNkYN448J6B4eHLwJw+Mf5iLuUL+ernZtz2laN+1aap
 qCvtBh0AiX+thb30T/84BaFu+GNQmbJCxo+GbLwXRhAFGq6uOrOMfG9G+NRsgG72n8SHdqnVZTw
 kQ+skRpZ7PfSVjNpinZoOM+wvbN84vOTL8SU3WgeMENWJYY4YfAEU4QPQicP8wiFOBxkmHBDxzM
 uyb8ve/H/+QldJPml6jvGfXTMF33DADE6LqPJMrzmo7tyHSmatv38TRNUGRQAgvdfqaP5C40tac
 ujTlcVzARJgP03ApxsyH6a50xzwny5c5+03ip0nqZe7kXxA+egt4ZGQ==
X-Google-Smtp-Source: AGHT+IGij0ie2Kz1Bgob+LBfjmeb9ZeUV3Yq9N4Ha8C0Mceh6P8zBrbcRv8Ri3pPkr9v5oW9bYbvYA==
X-Received: by 2002:a05:600c:1f84:b0:45b:7ce0:fb8a with SMTP id
 5b1f17b1804b1-45b8559bd2fmr85788675e9.35.1756803638238; 
 Tue, 02 Sep 2025 02:00:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:32 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-5-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9hYVY7VJpLHKc+fjiw16Zkq8W4WOmrto8l6+8H9lR/0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIwu0sNoblRGMg/0v5iPuw5a57X5zTkoD58YXhD
 q564EnGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayMAAKCRB33NvayMhJ0XORD/
 9YQAu9Ntnbhk0gv94yL4gdqIpoyK9YjqPgH7Y+GJklbEO52Lll1leq/BaEKzlZDHqFiyyQourvx5JF
 nkOXgQTvLJdVdrVSuDv3RihURsY3n5Fnk4vU14gOEf9ApYAM2SHSKOjmtleeGq3jVcEIGunbg8ERAS
 ntOpRLIcNv2nSbFwuH8/ArwkrKFiDD2TOvCZQPKS5AuZFihTs4SWH+X6qTyaze7kAcCcKD7g5wFINp
 Yq06J9ieaJB8GbPDUGqXmhr6GUlviK55y7AuwCEt7T+FwtmPNu4jvqeCU9f00S0LyzeZljHh/Icob6
 CkfSTeaDYjdvNsTzHwYQOulsE+zTjEZKCobCuGG7fyk1W4vTx2hRiFIgirktwJ+B5UQ28x6IibUUh/
 Cy7dBhLpt0M3OQTQx4JBGxcCDy7ONh3aTGA2Sr9cHkbParyVoo50GhNqhG3mm9TYI2wrIiJy4ZkNyS
 E3EFhTw6YGf3qtxoBAy5VBgq/Rql1ep80JvWVUmtGqEqZ99Oc2MX2uub64Zzd1xOp38LHMgc5u1laB
 XpunOut8RFkj9AkbZC/bOdgnvGQ0G5FwoWsjTpKCCipb01c2jhHCe3eDnFz4mK3rF5jPh1awFYr0L8
 K6wWOLuuo61Cja1Toh2xw2fXMXh+s4mvhjZ2WymEILU2KBhsEzcpeVjOjJjA==
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
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..1ff183844a48d67888a0f4cf8342575ce7f7af47 100644
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
+					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
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
@@ -1007,6 +1047,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1263,6 +1311,12 @@ &tlmm {
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
@@ -1486,6 +1540,22 @@ &usb_1_ss0_qmpphy_out {
 	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	qcom,static-lanes-mapping = <PHY_TYPE_DP PHY_TYPE_DP PHY_TYPE_DP PHY_TYPE_DP>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+};
+
+&usb_1_ss2_qmpphy_out {
+	remote-endpoint = <&hdmi_bridge_dp_in>;
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.34.1

