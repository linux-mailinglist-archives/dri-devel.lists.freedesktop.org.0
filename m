Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F6565C11
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706FE1123FF;
	Mon,  4 Jul 2022 16:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C5D10E1B1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 16:11:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s14so11636863ljs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIUu3Mrd87z3G3m4XzJVsFhhK3Sg+085T4JDYUEl/jk=;
 b=ZSTExc85IrAGJ/rW+vr8WpE2t9QKV6hD6GSEM0kBXEmwHxB78S3NezadIBajKSTIUN
 yU4noebePlvhDLMOeymiPHlc5SSefcYxMfHum3pVnK4UhtElhJsUiQ/FDlT0hW1pQYtK
 WTfSCOft25zdS2u+cy/K9Kah3DaIGYlJmdz4urHGeZeG0pC1DKCrdRXDPCzUd9skV9RO
 O9RPaDiABZtnZ7l7r2uyMqPZQ6bvmWdykudEaU7BUVEO6BWcYBRzu1fIzSrJJ1OY2RDj
 j81p4T7Qgzs4m/E7vtC57W1PgZAKKG+TRlUQhf+f2x/RT+cSfP4Oz35nAEeteI2VT+64
 tnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIUu3Mrd87z3G3m4XzJVsFhhK3Sg+085T4JDYUEl/jk=;
 b=nA21h4RsiHNJmxENmzhL19QdkCmT6mFxeQCMC/xf+JzMXsdkH7xULdgcdXz5PiZf3P
 6dtlyrDJSZu3dAnbY57rddxCNBMdB4GLsLYMANEQ99tvassGZDwFTADeV6pA/yB91fRi
 wiMo5imSRrC/USfezwrhB7hm+gyJMcRQruEYecewO63L5Zq6LhXb5ZU3Qfhtm+yXqApi
 UBq/T3mjzHWBq0E9W17ugMdhLwg2G/FXV3cJSRR0ezzvEuXbaWDwChRfPXo3wx6qlKZo
 i/lW31A6S4LqTUg2dYCTpm4aOWCIVxxDtsvwqmNc3C8EO5V6DN8hykVYWPG7C90ZGvvd
 9yQw==
X-Gm-Message-State: AJIora8eZk7/ynQYPxnC+ilaRBVemj6exO5N1yiirKFUcic0bqHfXFGW
 M+TEdAzmBSrVnMSHYPJ9SxS/ew==
X-Google-Smtp-Source: AGRyM1tvtojLhxu1Ji7ca6nmQ7FH7hsqjwPTL0DGC0s3+tnnbpoth/ZJkxivFg5Gi56gOzZKOVlvcw==
X-Received: by 2002:a05:651c:1989:b0:25b:e6ac:4055 with SMTP id
 bx9-20020a05651c198900b0025be6ac4055mr17272197ljb.3.1656951112885; 
 Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Date: Mon,  4 Jul 2022 19:11:48 +0300
Message-Id: <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock. While we are at it, also add the XO clock to
the device node.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 25d6b26fab60..b72385ffecc6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
 					    "hdmi_phy";
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
-					 <&gcc GCC_HDMI_CLKREF_CLK>;
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&xo_board>;
 				clock-names = "iface",
-					      "ref";
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
 
 				status = "disabled";
 			};
-- 
2.35.1

