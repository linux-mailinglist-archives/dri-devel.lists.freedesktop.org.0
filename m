Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24761974A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644C10E764;
	Fri,  4 Nov 2022 13:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FC410E74D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:07 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h12so6269584ljg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
 b=cexTu/LwfVUpWlSdlSLDgE4GFfg/djgwgRyKeGrqIN8mtolRgv3UF4yX7RfKlRb3rR
 DTLbwGvOtm8A4obZzAxRJGHoYhKU0EYUnW9RSi6FTXr5VS+0VK1KdkRBw4nf1a1DB29j
 kGsrI0cqmImzNzLmVEaLQl+LIWGeKFpWuLj0/6m6XJg2B8BSyKH02gImud3SequMf9QO
 ///lHGUvjAcCNZLj8zbuJ5ht1QyJgXU/vwrWymLnFq2CWvPyr0DoI+80LdgtRzBFylAP
 MW+XdTjterdFG6R1tOcXeKUTh7s1lEo8Nh6xQimaJrvP8R4WrgQDW5E/KqJrqBO7WyEo
 PB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHU8hrHc1OdY4ACUIuU7p6ODVXbXU6UY27yzizf7x4o=;
 b=7pS8hZIJsM8HmNNp6HSefQpLcKlAhYgWW7f8iHw8DKJV52Uwlt7I11QdYMUVkVMoLz
 sCBq8EtqPA75k4OLpYT5Lj582K5VuYzXz9blAGAQOx75+yjGA4GTSJKAukRAa4+18XqE
 nJWt1r8cY69nNwLGOF2P2aYdygmsEd2oxwWVnfIZfDPih5A2gjSbKA+rW9ax9qlbZWXL
 kHHkStqPtGq++27zln/zKSPuWlwefz4yDahw+Q8ftN3B5CjK6YOxB8om2j+9Bv3eAU3w
 O2V+P5VGxG2kDH9+pMknPiEGsm6srb2L/QWQmrUCdDXXeimp4zCFgqA9XmQyA0HlbVEO
 wH/A==
X-Gm-Message-State: ACrzQf0tq3eNlCi3W/npVxWGFXJ1nq/58aDYic2TnDwYIVnvczirtO3g
 iASJDJpR5EWpLeli/mbRY8Mk4g==
X-Google-Smtp-Source: AMsMyM5VwoYUrsY1mgVbYrFymCEiknDJJHc0p6AbopTAAL3arUhx0ALhD5G5mbHBL0p2Ccfrpq6ehQ==
X-Received: by 2002:a05:651c:2104:b0:277:4656:2c95 with SMTP id
 a4-20020a05651c210400b0027746562c95mr2036784ljq.440.1667567645337; 
 Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date: Fri,  4 Nov 2022 16:13:58 +0300
Message-Id: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9522dd29a38a..f37f226e9b11 100644
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
@@ -389,6 +400,26 @@ lt9611_codec: hdmi-bridge@2b {
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
 
@@ -512,9 +543,23 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&dispcc {
+	status = "okay";
+};
+
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l6b_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+
 };
 
 &dsi0_phy {
-- 
2.35.1

