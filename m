Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27457634B3A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34B710E4AD;
	Tue, 22 Nov 2022 23:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090A910E495
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a15so19624794ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
 b=fPpiLqPI806jm8YPMkw1hWfsfu7fkbK/dGLtFK0YimCA9reWwAmU5dmkW5N/Y8Puvz
 HW7clDd3O/0vNf9wWehUp4xiJwkOm6hwaxuuiVEMjE48kRB0ipYaT5n1FtPEu+Vsx5su
 G6Z2V6NEZYLvm5fBmdvuoEficjMDlD6RABF7HwUfwXCt9A9bppvZrGdrfQ2SIA97djWN
 LCP9U5UJ/zzqpSpICwbFNne+69OkhAS3SQyyseeVLX0hwqb/qTu88q9o3KmHYro25skI
 Hz5JD5nDEo9tMLIVPp3MBShR5gy4wrjRPXpYqD9VFXjrU5vY/MKaYz8NQeVewFLky03T
 G2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
 b=eJ6gQYZj6VFiUzj0UE4mt72W7JCGhGHFsIl1Bb1Prni+RXUnfb1TpTjeasN6ZDQys5
 5bd+SEMVi0VXEuLQHp3JKDpPV+rwCyfrAWbfZLAtK1d+RkbHtWcSPSgGCfJFZSiuULcY
 ysOhdBwvrPuo2VxDz/jexZef4JTXxo0kcZYsmtihSOtf+xMQurudBHqP7fgYlLMWGSGs
 Jl0LUH5FQiZaYkh0Wbj4NjXhKW90muX2ja0uOeuXMwACD2xVwJB3aBacqWuL5jupeWv2
 t8+UcKqFMv2sxeboVf+77mw6+edy/TYzj872jvzCP64Om7HxiufeKJv6WBaPJuMVSxnF
 H00g==
X-Gm-Message-State: ANoB5pne4zUOxHuR5Y9EcmRWZ83wDZq+mFq1VBrRWiVqGQgHWZ/Yb2Gj
 FeilL1ldxCSmO3jYKWh+XpQA9Q==
X-Google-Smtp-Source: AA0mqf55ZYf37eIMcQj+RS7jDuAKKcv1Lzm98k2aIlZO+llxYLLijwT6AOAf6KcsrXk/Yx5Z9F4rbA==
X-Received: by 2002:a05:651c:220a:b0:277:2428:3682 with SMTP id
 y10-20020a05651c220a00b0027724283682mr8835362ljq.291.1669160224548; 
 Tue, 22 Nov 2022 15:37:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:37:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date: Wed, 23 Nov 2022 01:36:59 +0200
Message-Id: <20221122233659.3308175-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 6b6dcd0e0052..709cddaac781 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -393,6 +404,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -405,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

