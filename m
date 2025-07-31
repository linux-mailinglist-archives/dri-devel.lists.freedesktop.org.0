Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBBEB17760
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C4B10E7EA;
	Thu, 31 Jul 2025 20:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qu3j5fND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7210E2C3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:51:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b8d0f1fb49so398023f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753995097; x=1754599897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ei9qPm0AghIdMsWdkzn3tm12w3Iv4T6xpOfxLvDOo54=;
 b=Qu3j5fNDDfKrHL1JAtArbtPRrPNWAKqhXXeUQBj4zfvN9ETAFmW2puC5Aefyi7Nt7h
 FM3yplECE7EM1WG51gPMSNxcFHOxLkTxJptWUBbJ5GxN/NOffwsAA/fGAS/kpe34mAyB
 zeX9hxIzcUKYp/BGAwQoyAcQIkEd1Pg6yUu7B0soNSoTbbn/zs0kvfEbMYHEP5AKgnOU
 5ZZJDsYQMsyYkufe9h1GtRqIW62CDzZxXGeoyhxJcft1AeXM/70/TTlYzO8I1fF5JAKP
 y9LeCWLSgZVHjqRciBbKN0t1OJA+Zx/4vZ+FQOO4qLiMGfQnSsiWOvU9+dCv+kP8HVBV
 R5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753995097; x=1754599897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ei9qPm0AghIdMsWdkzn3tm12w3Iv4T6xpOfxLvDOo54=;
 b=ruQLtOhOVgTO5egSE86L2GwnszJX3I5EIR6GTnCQq6cqM5m1YF7yI0bSp/0Kb3mBEj
 4Ify/CEIAhZW6Q4NpAO5U4jqJpnLl4uSDU23dDxsJnsRael/uuvUtCpjmKTv4dF55TJL
 24qbo5/vy2ClirUrbSFQKiuWOcKpmndsdvocv90r9c247buBuCb3aXc1RI9fk/KTTRYG
 n+igTls5gRpRTQgyOEx27SXySzmQ0rv7HreEiziqtf6Bir6u1LbvJEYmfF5RylYEIc7x
 AL9FMS6f9riStGFpQ1UPbNSVFVdu3AqYKwrFOnq/gwr69q0pk5DFlT6ci1rPN8BcQrOJ
 y0LQ==
X-Gm-Message-State: AOJu0Yx4zWpCsWFp00GpQraOX/bLcntCS4uTd23TIw4vGIzjotNjmDHD
 HWcon2qCJc2Mdjko3cimXzdreHXwm4S5CoLW0i+OA2dDTAdsQtm3LA6Wm0KS8XaMbZg=
X-Gm-Gg: ASbGnctiJfHUgu53cxzgGX/V0DNMIKwBsG5HqnODLJITw7GZJ/1eEeumc3AnpBg1F74
 BFU38o/fbAENqxM4MAxMBCpIq0NRN17qc2MtKKlRJbYlt4MdE9pwkJ9HwhmB+MuDoh+EqDI0o06
 kxjDT8lcWWDS2z5O/rm/8QlIrxir/sK1PUkF394gDO2OqeGJ98F0GFW7zIGcfi27Zt3BTOO4uaA
 szEoBu3rkbMBtxmkcRtzLYF/7ER/fulwHZefw+XqhyQw0fYUYd2C0TQtPHhHn1h70+RQLjB16kN
 omK7zFsHxgDWQjBjxyNfygm0cU4f81zK+iJpbDh4Evg3YUSId+KHeormw5gnKWG2eiT5vPYMtg3
 CGG2ZlmqM1Rbl1ZIRAAdlTJxoHMrPAMCBk5xy1hrHccCoHgsGf7++Tj0WeUYD5XZD
X-Google-Smtp-Source: AGHT+IH+KHeZWb8a1D1rLbJA4G+v1vrxTCGhfDWrNtvL4qaj8u5TYdnSOR5Qo8hrL6uX7yBxutp8wg==
X-Received: by 2002:a05:6000:1786:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3b8d343b05dmr196772f8f.2.1753995096563; 
 Thu, 31 Jul 2025 13:51:36 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b9160sm3534633f8f.21.2025.07.31.13.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 13:51:36 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 31 Jul 2025 21:51:26 +0100
Subject: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=2IIOOJv4YbwpvL/BVb0O1hrl3nXkJFZe7UmfdKaEDFw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dWQLp6O5DslUOJC1AF4eOEKb3goQXj3m2jH
 al5BjwpQGeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXVgAKCRBjTcTwaHBG
 +NbDD/9jkYDOd15vrbb49+K+c8aKuJACyRfHhbGIGM40ARYVhOG9I8RPGsIegUMP0UbubhRmVgM
 eecrT62ywMcqveEqnK6faWVwyUUt3UIsa3t3kmdLACP++xo2RcG54vZK/Kqj2v/V1CHAyqXom+w
 abNJOlMFpZwpKLrOHdnMjDXz4UCpU6RjD8dkZ/4dil25UVFhst1oZcBeq3d/vq6zrSAWQ7x0vPF
 MiiqVMgHv5RPZifkYHXtNqThKhyDQmWA+kTli//acCH0iQl+IMz34PnTKqxgeWr2FmceuDmSvwo
 6SsJ8s0HjcpcQVxiRz2RPvew4pUmMPr8HGZpBaAZa4z6jn7N6wLZpYflIj+Mwj6ZcDLtPZopSJc
 vRhTv8rmbW1d8CayCldqITHONoXUSkwHjIHxrIWu7LKFnAlKR/BT5MYNPDiREOgG2Kkgv51GrIl
 IGCbQXOcA3jfX+OzsdT8a4lJU5KM8hlwn4nyKZN+k0dKW3Wm5C6GD2rv6J+SL5np1STH9SBrxKa
 sWzCV9P/Cf+g92czF9+CeiA2GTfRh9g31p9DFilpWHG6ehCM5atmtmhGcR+39t51sLYZafYUyoV
 CS8XGOdpAERq8xf3k3dP6pfBoI8173tNt6G7dx7zVvG3zWIzwXMX6/XlsL+Z3tIBbRFJ0T6iNaf
 cn7FU3+Z+iFkkfg==
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

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                      | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..c33dce6fec6746cc7fe2f7a1ab5e9f99feea5535 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1008,6 +1008,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..8efd045af778beb30831f3af5ad2b901a72d87d7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			edp_hpd_active: edp-hpd-active-state {
+				pins = "gpio119";
+				function = "edp0_hot";
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.50.1

