Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B269A73777
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A9F10E927;
	Thu, 27 Mar 2025 16:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kMMoT2ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4DA10E926
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:57:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so502180f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743094632; x=1743699432; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3bQS2dVHkXmrt/VYBQF6fRPY9BltaVPlOzaCvehejKU=;
 b=kMMoT2raAaQPOsUbWHgMdZGEO2LBopvyGue4MGNVtOQEKn7fLOZKFDhXKzm5aC37ld
 VRzbaPFAJCLfcShvMUKGEC7OQZds3m8CsrMQaiKsL9ZTsmcefEbQLeWA0RusjAR0otZ5
 +uxI5sROukjDuvDuraWa8ZAxp7oguVSqT89felbGg/xxxVnocP8x2LAhq3J+4VGtY73d
 feXrx/cRkWhoREWqtlX2ApVKfqNSjePxsLAluj4gz0rZvNOZYBHwjvlAWR67f0C8tCPP
 kId93oMz7M7jHuPEr9JZ//1sxs5gkpG22PSkMPgK7UOaeAVdn2kI0qXkXiz7saR/ksje
 5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743094632; x=1743699432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bQS2dVHkXmrt/VYBQF6fRPY9BltaVPlOzaCvehejKU=;
 b=AjnzwzTykVUhf9aeMAUynsiUGM2ouf6Is8Os/NnXdkUocN7orBat42xuaMe3ZqG2k3
 OtGPozwtWOetRC8NtpDqig56Meawo+tqMGocEdrlGs05Ep45ySaw36wr6hd951EoVIDT
 4pq//niVQZFTV4ht5i7BUU7v/lXpYViUTsvkCLwUmhNeM35DhKQF04MeqLtFlC5rSUie
 YwvqMxi5qTbKuYueNAwFB/HoQb0q1h0jXT86ohiQt4s5oxY+ZEjQGwkksyIoPNyv/WRx
 vZWATu2G4LZtRlC3rNmXONBIzC+qB6Y+qyJnwOQJWKw+ZtsOfmYu1cJ9mQBlXXX6lvTg
 lkNw==
X-Gm-Message-State: AOJu0YxPTxqWpf2n0L28rSsQ7xphqlR+Pxartw+5YdwzJbvJ1V4eu3vv
 F50LbPJXs4v7zM0IW2tXGmuh/dC+tArVgoBnduNQTQu/lhszYLzgeEN+U96LBqw=
X-Gm-Gg: ASbGncvAVydGpqKnVX4gs5xYjeCbqJDhWWmxjxrlnU1YxI+W/NeP+6BBLwrjXL1kzaE
 UgMqFGYaqb54nndN1YgjsvLSFuTChC1aKXmAHPcCPv7yHErymfNU/d1r82SgQSFA2/bco4FpPar
 vJZOyzIyzwUG+Ni6ARvbOLdpCd9Z0S/KfsRxChEEOvYLV4de9pFo0sGQT+Mw4uItYrHxl73y8jO
 V86Pe+OCqy/mNFLsUQR2ntBya5Gu0PhOWdZ8GQ7Rl5YkRCMM4YG9gcyUiMFgc/6dDT7/zubcyUk
 dfwA7NG/NeSTUQBND7OntGxCPhZlNsRG4SffLDbg9p5ZIR2ySMu2FNu0
X-Google-Smtp-Source: AGHT+IE624zLhan3Ico9kT8SzImQL6pNaOSeeMSfoq6G2YAdMGFLyy5+kDtd8oVH06T+DQICTxZj6Q==
X-Received: by 2002:a05:6000:400b:b0:38f:28cb:4d35 with SMTP id
 ffacd0b85a97d-39ad175bf01mr4343485f8f.13.1743094631550; 
 Thu, 27 Mar 2025 09:57:11 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b663623sm65304f8f.35.2025.03.27.09.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:57:11 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 16:56:53 +0000
Subject: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
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
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=hki2XRHAm+6qSdDVA5w1j+cxg3SpI/NClnIYUfpbEVM=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5YNmzhfFY04qzeR1a440ouQxIaIVV1dMaG0e8
 oG0Fpz+WA+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WDZgAKCRBjTcTwaHBG
 +JnWD/9qet0c+c0pd6YLZzQunsHfWWMNROD08J5vAaKHNYeZVD0mtTJfp2btbxUzCM59x6RsoYV
 VkQbln0O4il13Pe6XXxPNGsDPOzy47Ra7kfifQDCl6s/xplmR/et/NELmHFy/5RD8Qdp1SFr6Bs
 GtZkNc3ReqLIieTjnn49FT+wMhXglxItzeoTNI7zOeT836bsu1uEuL1E3HYVIslMqsd2VUjia6p
 tfZ2xlnKt4tzWz0Yr7Tf4FuAOdESJde8WAs9+wQOWAHjeK8eiF26a+yIQrHToN5Gft5H9qzxB5l
 hkhwAefnYNb8ununTnEBNkqgh6gip0cqxCIH7DgCRdjoOiVGMQA76KbMQVbBVDQQDR2VpW4nHAc
 vjK+fIm62BopVgolq2cHFaLD8J45l7a/trrFarPtsiUmlf+PY9Huccv9g1+v5WhL6IAaYF8jkyW
 SW8QL7v3dSlx7Zrq0dmRDA+A+I6gUQU9zmGJ+kkmR3t7oo0gL2DeVqCQJEZ7+qCREpwuF8qI+CQ
 NkVVEB9Ypdt37zDucW98ZP7JEftMwQKL5NxcimQMkKiPweI+ri0Lhr1LWio8cNEDfgp8x8AEWBE
 VetKRDj+QV+Qzc1sVhbjgfb7JsX2UUbpcSCeVO8Excr8S+oRX6cohm5jo411AZQfxsLCnurUY53
 +msSzAqjLEAF5VA==
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

The eDP panel has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO property is used in
both the OLED and LCD models which inherit this device tree.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

