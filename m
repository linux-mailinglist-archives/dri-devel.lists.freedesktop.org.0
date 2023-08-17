Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5F77FA04
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965D110E4D3;
	Thu, 17 Aug 2023 14:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9238510E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:59:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99cce6f7de2so1046245466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692284385; x=1692889185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/n1mPlA3bD3cKDjIc3yPs+tXQOFq+U4vZNdJ+L1Dn4=;
 b=occYa08R7Z8nic08JlcWH5Dp/uUHr/UUyYkQ5rR96hz+WnhSp3hTVSt18E9+OTKYId
 eNIvG3goXUCgEe4LJIg2m0xQEGA7wF/MCbh5/UmYV0peXxZlTHR5p0K69Q+HeCjo1LAd
 0K/xs/epr0cIoixBNOK49GgAIuhUC9UVziTFJARX3rCB5bcKiC/1B62Wf9861kk6ONnl
 EIp2iuSpKMOc3d5oOFvgQ/ptJOsF43Ms1wDwjj6+kaOAAjANAt0EX1HpAHYXvtp4Szie
 FXlusP89ctKEA9XoGdNcH8ZsuclQaAX8nj1rdtbEAUCWMWbZolqNwfDgARTBUUZMldGe
 F8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284385; x=1692889185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/n1mPlA3bD3cKDjIc3yPs+tXQOFq+U4vZNdJ+L1Dn4=;
 b=W9y7MR3Hxd/YwHlULpYT+/R5itXoBv31yMlzhdRBjH1eGhyInISUWtyPCoqBnRtG2D
 F4LPq5wuCxecsIiE8FnY1/2lHBDIoxVqdRImmGTd4n5dOslrmqZrLYqywyZaMPFJzsI5
 ANIvxuL62trf/1yqmojhZHD8SoOEWcxnJDLOFEXElp2WLJryLOjCM2kPKfKoOklGxs9C
 RPhWkfehkX6U8sDSl2olMPapn5CODlUF0iFoI3/AUYneDUYTLzWahReGKx2LOXyVl7hK
 OtbSwe6Y0oCxGWfHq9sU6zIfIEYcqTa5fdo1tHtYUYHwKDO5CQcO9kot2ptT2T/rJVcn
 2Cvw==
X-Gm-Message-State: AOJu0YxzleeX+pw8HfkNgd4+EshUMhrLXqZ+RezSaljvvmLmymHshF/7
 g2knUvwAh+bQ0XsFE65JeyHEXQ==
X-Google-Smtp-Source: AGHT+IF+0w+BKzzP8jEXAsFRgeM+qRBGveKGDzw5Xwja5f2AaVKGn03Fm1DGa0sPRL3l6q5Js1Wc9Q==
X-Received: by 2002:a17:906:1013:b0:99c:f966:9ea2 with SMTP id
 19-20020a170906101300b0099cf9669ea2mr4459381ejm.25.1692284385125; 
 Thu, 17 Aug 2023 07:59:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 07:59:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Date: Thu, 17 Aug 2023 17:59:38 +0300
Message-Id: <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the nb7vpq904m, onboard USB-C redriver / retimer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 303d07f9c6e5..a4f7a9f9c22c 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -610,6 +610,46 @@ lt9611_out: endpoint {
 /* LS-I2C1 */
 &i2c15 {
 	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_s4a_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_usb_con_ss: endpoint {
+					remote-endpoint = <&pm8150b_typec_mux_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_phy_con_ss: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				redriver_usb_con_sbu: endpoint {
+					remote-endpoint = <&pm8150b_typec_sbu_out>;
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -1299,7 +1339,7 @@ &usb_1_qmpphy {
 };
 
 &usb_1_qmpphy_out {
-	remote-endpoint = <&pm8150b_typec_mux_in>;
+	remote-endpoint = <&redriver_phy_con_ss>;
 };
 
 &usb_2 {
@@ -1388,7 +1428,15 @@ pm8150b_role_switch_in: endpoint {
 			port@1 {
 				reg = <1>;
 				pm8150b_typec_mux_in: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_out>;
+					remote-endpoint = <&redriver_usb_con_ss>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&redriver_usb_con_sbu>;
 				};
 			};
 		};
-- 
2.39.2

