Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0626F6F8F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 18:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88A10E494;
	Thu,  4 May 2023 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A0310E170
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 16:04:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f13bfe257aso791471e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683216271; x=1685808271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUrHKVDX5msA0+ZSoUiJisbFI5PV9IHCkeYy1I4vbUE=;
 b=dcEfCGWZ78S4KLbx2t+LfYLbl16CyrjzfZ2DKdSP3bsme1Txoa370NAXETeAKMXi0F
 vST4RAutiKwXnZz1YSnUxl5sW2bGupAFk1DH9BVDmqGKyhtAzZBURFJsFJ+SUNLtwW8j
 +2t/PExUXhw2wYg67YE+raK3OeAWvBpb3WsrchNf4Wmd11bx4uD8t1rXbXZrJQarIGDN
 2KHJp1LjUIVkW9NCXmbCrF3382yVjBvq4jRoIOPulqyC1tOsUAg8uFkLNDKbQYdhIh2b
 6nOtezg4qd8EM+YZN398RUebehhxhnQTh4B1AVtASZ0emdJ8S8/2WdcRmBMA4qdksWBI
 +y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683216271; x=1685808271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUrHKVDX5msA0+ZSoUiJisbFI5PV9IHCkeYy1I4vbUE=;
 b=amm/Z/V1H/fXGEQs3QUZ6lsQ1JA6oHOultPiYX5RxeTp0/Azqa18jUc2jUnvGqODOJ
 Q0T66NnNlqNsyG5hTG2HqWTZong3WQNJnLWt9KVH3K5Quit7eXoUpM8vFcSSZW33fptF
 P81hOydS34bbaSQ6EvfEEV1Pw8Y911Tj9u3xGTqyoH21G7s3WzHNFfJ3wzRSkI2OhnZJ
 z+J/BY5y5Ss/VaHdOL8rn8XtryURd3T6hOrK7OIyP4d07dB5zdy/5Evhcl2pyKA0W05v
 qhDn6am/nrf9GFg0TRCYBdizlCt7hjsEd4t5CK8rdZIaAd4Y7Zrv0tTCYtu9iWNCj0WV
 nPmg==
X-Gm-Message-State: AC+VfDw+9ziXvH/N89Xtwlo4HGnDV508qvf/3xuMgDnf3f7ybxlqTCCU
 /OaEJzBSMZ+yih4P/yLbGo+yJw==
X-Google-Smtp-Source: ACHHUZ4YVyJizo+z8okjSZYqFXP/T+RhY33v3Hmx+pmDhMMwP2W1e98wCI6+uArYkNwAnaeYzRYRow==
X-Received: by 2002:ac2:44ab:0:b0:4f0:219f:7833 with SMTP id
 c11-20020ac244ab000000b004f0219f7833mr1960192lfm.55.1683216271332; 
 Thu, 04 May 2023 09:04:31 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05651211f000b004edc5a39121sm6551583lfs.242.2023.05.04.09.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 09:04:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
Date: Thu,  4 May 2023 19:04:30 +0300
Message-Id: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as both lt9611 and drm/msm drivers were updated to handle the 4k
modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
utilizes both DSI links and thus can support 4k on the HDMI output.

Cc: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..4dea2c04b22f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -419,6 +419,9 @@ &dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
 
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
 	ports {
 		port@1 {
 			endpoint {
@@ -434,6 +437,31 @@ &dsi0_phy {
 	vdds-supply = <&vreg_l1a_0p875>;
 };
 
+&dsi1 {
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi1_phy {
+	vdds-supply = <&vreg_l1a_0p875>;
+	status = "okay";
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -493,6 +521,14 @@ lt9611_a: endpoint {
 				};
 			};
 
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
 			port@2 {
 				reg = <2>;
 
-- 
2.39.2

