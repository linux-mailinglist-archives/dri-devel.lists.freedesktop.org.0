Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E723645135
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD8710E169;
	Wed,  7 Dec 2022 01:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B32D10E178
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d6so26393894lfs.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usZC8CFKIGNnvjFpBH+SET7VsIUOeyE2acRZh0YmuAw=;
 b=sfndZZ8LPJdrMvH71iPAy6zfrtiZRSGV1kuYFJQVisH20EjFlZyBt0qbSiF7M1ZCE3
 Ad0zmflQQJqNlTlziMyiYQdRalgMHFJn+FAKbM9xRwdpI7YB3EFGbyOKyLPBrD29sWwW
 ABGMADJE/XL7HxA/P8hU22at5gMewpcKhdTzfIQRuu/YYb2O/3qNfDNzr1WZeDbDxzx5
 IeZ+FtNX/Y/gj+YDQIR62AhuCKucelw0wDjFCRyHS3Lu63cy2kZrhte/FKv4XT9FFUTg
 V2QCCGQF/lehjLJsnfRriVswxolFkGmth0okcgh69dd3uP0hifKZhcHoFQMSNlSAbam5
 AT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usZC8CFKIGNnvjFpBH+SET7VsIUOeyE2acRZh0YmuAw=;
 b=RvV1679lj2nLSZBUwOI2d4cPYeI3zGv/ZuEYsVIW3vhsbNPiebpuONs9LtcT5MQBX8
 Ecg2Jgg6neR+NEbZ2Yyym4BQwnLBj9qYyAJQgYNZVn9rYkbtLkcAqj0xT2GOQ9qVgwBa
 E8/oANnC9MA10H3UOF5NkdrBbkqwORQRHWFArndZ8KHJcbPz1U3iXoIBKbxMUVT1nyXn
 wTgIszx/Ev79Gc3tgtLcQcL9iA2ly2oEVWxMfCDzr/CvElZt7Q7kvCH+ezR82enB/jFE
 2ZzIyJep1i+BMbwHbhbpAQWHvJuqwZ7R6JN7Bjxn2IxHGtrx52E+0fY1DHGdi2DhV4qP
 yK1w==
X-Gm-Message-State: ANoB5pn1P8TZqHs972RfZ2H/VzyySUKLi1H53pRpy4mQ1OWZeKIx+7te
 8khtANrWTxUL052r7jyoxOnyCw==
X-Google-Smtp-Source: AA0mqf5XUSJd46BzRdQjE/d0PZsIJxwKuDRCp9/AXcfACW+MK0n5DxetfpDGRxbrEShmiMzspu2VQQ==
X-Received: by 2002:a05:6512:32b2:b0:4b5:2dc:8107 with SMTP id
 q18-20020a05651232b200b004b502dc8107mr17295741lfe.209.1670376488647; 
 Tue, 06 Dec 2022 17:28:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date: Wed,  7 Dec 2022 03:28:03 +0200
Message-Id: <20221207012803.114959-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>,
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
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4f345786352a..166458963c2f 100644
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
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -392,6 +403,27 @@ lt9611_codec: hdmi-bridge@2b {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
 	};
 };
 
@@ -404,6 +436,11 @@ &mdss_dsi0 {
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

