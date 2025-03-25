Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B3A70A29
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488E910E5DC;
	Tue, 25 Mar 2025 19:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gq1wh4ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199EE10E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:21:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43948021a45so52641665e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742930503; x=1743535303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NX3X2Lw9o8HyqDve0bpkran+lwUmFVl0q3xx6EdvBX4=;
 b=Gq1wh4raTV9VJlNQC5HkIkSXVgRm8d/c8LmbQOmDOkEyN01ZZ+bHwHWzMHbrYvrBlH
 iCn6FMR4Sk0+XAeEQpP/cPhdHezOG62qY13etIo+O6EEtqcXN0VDxojkMD/KslX5uHDF
 caSK79/+WYqG4COaKj9gVA2ugnIZrm2sSwOfPlekhyqrc5CaZC0J7jW8L0hYajpwpinc
 rRb0fJ27LJp7jdG4g7uvbhTlsowy1MyMt1kQbs0JHRzku3kcFPrKhhMDbIdanIWFkRwE
 OZiHCZEbvuZUQr9fhLPLIFfgul/gY+f1diA7gUTt9DtukOCeX2yG0103HJR01LxdHY4N
 hg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930503; x=1743535303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NX3X2Lw9o8HyqDve0bpkran+lwUmFVl0q3xx6EdvBX4=;
 b=gu+9cPyRHZh1hu0iz0PiQLrSqjgp2utdhzJjQJFtwkyVtWCr+EQ8XgUuIBQ2wR40Io
 SYVHt4ao8DBU0bMEpIPsDtM6yQnPHZXIdIy90WlGPuTppUo0w5JPs9ap+g4Pr2eF6quY
 d+BlGsmJCUfoa6S1dAfU/uKvDcjFkbtQkHGpNYrxrrDipsMcwwfKD8My90SPjIf3YYB0
 B8XCvD98RPM2nu/+DLpIMMQs+5fwiRVt4RTPFe5uCCfSs7gwX6pfPBe2EbCslj019laO
 kUhEB+oIPS9FJPVTy7U5A6o70knjD+4/CFWaW8yQZ0UDC+QhqPwgTzfZD9pcLYvYle0e
 Odhg==
X-Gm-Message-State: AOJu0YycSr9S4+FPeijfNuShXQ8QN/x3YFmoxnp2UTLDK6ym2KlgQG+k
 EvQIUPgdHlUEiN7LdMD4RBQj5kwhF+Ctd3tBMSXPwH9e9yWR6CKSQIC/bclgvh7QuFemA+FX/XM
 Hek8=
X-Gm-Gg: ASbGncvknhE+/1bJFEuXBAGN6J1smFBKcXd8fim2Q5vZxys6kajieeIOaCKekD3Q6CD
 I0g4/z2OglAs9LTX5H0ffUiwCnaFZCyHeYuidRo9btYrGpktoZl8vWBd24RLVYnXJMQ44yBk/vc
 ZY+eOcTfHuC+h/rfeankUDhcyLOz7/FmSiDlQom/eH58a1kVaR3RW/S2hx3GDTi2V7m+K9su2Sf
 6tgyb5YHSDvy28jZfPzVtDB2+Tt0qV1Cx4WGvBUrrNkp5Qqd19ZJa/dqmG8+JYDpXjKwXKvFVxo
 XgVLYVXTBq31JcX4uRZq4X4YcWsWZRU8cqJein1yrw4a9ZAfc+v2w9CElH2HEwoRckg=
X-Google-Smtp-Source: AGHT+IHJrql0z1/Oqero5ZGyDYqpm792+Y1VSees9b0ZQC0BjriRq7qtGyhraVJ5zsff8nRKEETpPg==
X-Received: by 2002:a05:600c:12ca:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-43d75886820mr10210845e9.12.1742930503539; 
 Tue, 25 Mar 2025 12:21:43 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d43fdaca8sm213330615e9.28.2025.03.25.12.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:21:43 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:27 +0000
Subject: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Nthaz0NG4GUzoxW0ejlW+T4NO4kSTaE/go27pedcyso=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJFj2X98t0uiYe+j1XPDXnRw/zysHE5UWqp9
 uWjnbfunrGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +JOrD/955KOQMYKGtxljAeIGHuWcjZ/P6LUTLpHgKDYqJKaM1/qzI+OfEzxDXv8lAUEz6+p/sQ7
 2jd0yryGySf26uxgE3BSbey1ETdbGTpjGSuR4t5SQyyYwM3A4kXFTZWcdCIKLO8IqOr/RzAL4vV
 vPN/pBcgjf7sgC5+Kw5MMi0MpgNf/b8SG8aOgOsDOLqUP9jJr976gqMSNJ4VkFamqYO9PkOSxME
 AVznSLYk7G8WB50xbnZ28hagju3n2WfXzLrGCmHLs+XM6fj2C5VhczeYVCO0zbA/nSb9UQvzQfT
 V7nIm4fYZh2BAJ/+++624WOpJjDaGigsZ0EplgXHA59yO3gxk2LDVkfXZURyZFUn5mGv+4nMfBl
 WW7hS7rfxc36vo5rAbSSUBFamyQ6GTEXYMFDNnPUVXPPduvSNqeWSbC4WWKyGVziWONuyd93B2B
 owKQqdtIPDr1cRf9jd0WWClG/uzUTzGY76XLY2gNKN20EN/xRsMylfjsg+a1ISyrZNGVDsq7xDF
 9lHJsZibfyaGzYZujO9zMT42/YP4fH4ByREnqqOdK9t01FQJEQjzA7QvnGEhLT+jOqzKifGd2jQ
 +kfCfPPgK8NsNVH+3+kNJUI+NqIsPEzVQ7KF+XTtBE40CRSWaGj5Ce8YXZhSWAnDd2Foz4aVTK3
 WGWgvoArKHax4Jw==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

The eDP panel has an HPD GPIO. Describe it in the devicetree.

Unfortunately I cannot test this on the non-OLED model since I
only have access to the model with OLED (which also uses the
HPD GPIO).

I believe this could be split into two patches; one adding the
pinctrl node and one adding the hpd gpio to the T14s devicetree.
But I will wait for your comments on this ;-).

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -980,8 +980,12 @@ &mdss_dp3 {
 	aux-bus {
 		panel: panel {
 			compatible = "edp-panel";
+			hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_hpd_n_default>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	edp_hpd_n_default: edp-hpd-n-state {
+		pins = "gpio119";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.49.0

