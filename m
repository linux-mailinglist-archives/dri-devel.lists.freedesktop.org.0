Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C5550E47
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 03:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC9113092;
	Mon, 20 Jun 2022 01:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A38113095
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:03:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d19so10235894lji.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
 b=rsI0vlVTzQzpkdIbqpbf/7eqtUrBOHQcOmH/dDKHYQyv5w5BnNiuqXzOQGLDDGvNzS
 fXsuP66NJgPfGZbfopbYc87BIePz/YSODREPdzBXbhEJdIfIa0niozFq4mWuxf/whC7b
 Sn/Juaqe/sNT4rPQmcvOnABx6ltNxCPc+v0DQHCFjEqw5fMeiLN1t8kCLiRvZvw+U8fF
 l4ULH8eirH7Mo2IWeDTh9SwJ3DB9GFLDnDPzigXv4D9TggLZ2RxZ/V4ZrtM/De2MbVDn
 l7g5B3ov5FA9Dt06RaAnUetHRjDdOifIlcTDrkSvVabk6cglPvixLhS1uP2B8Z6RpVzc
 Sjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4q2wCt0JYx6qaJhRwDPoSmA5b4OihaTxL4gA7npr16U=;
 b=OjUw6DfBnByv/U0yXt0BE1xYtkinl57ABluibxK14DQsbLCq3XUAzMT1BSg4xVElQ0
 jTImziWBIWss+TWlbcgc9FRltd4ZKD2fB785qaCtSSz0PSQhzuwee1qAFpwFLH8AzKMu
 5gMiLTnzpjzgdI4Hzea43VQTCmJtln8+VHNoOV90nO/sW0YtJfw/7jQrOsxDHe7A2hsd
 8E39SGU3+WH2MG3SsFZNYKS2lSb6UkhonJcqxlXTzRHLgDKJ+tyRBKvlnssHljjPw3NS
 CwCsRuD2/FHn1BgKtmyL3DSHqUHeyBQkOB+3aasrcTS0T89rJH8A369umuUFzFLXvTMr
 H0eg==
X-Gm-Message-State: AJIora//qgaD9r+W3JDmUiQ8TMsOBlDUiH2XIN2eMXYkYnwTQlO/Zam4
 PYp0krgKm0M8RmCUSlevSmXaeg==
X-Google-Smtp-Source: AGRyM1tdp2xX6YI5PZBzkZwM6r8spgP1XYPDAPFEGuYiS7i9XQ32d7gqAd9JIP49mvbblK054b7l8Q==
X-Received: by 2002:a2e:a553:0:b0:255:9114:dbff with SMTP id
 e19-20020a2ea553000000b002559114dbffmr11077244ljn.208.1655686986055; 
 Sun, 19 Jun 2022 18:03:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 18:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Date: Mon, 20 Jun 2022 04:03:00 +0300
Message-Id: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock. While we are at it, also add the XO clock to
the device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..c0def6dd7f00 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -960,9 +960,13 @@ hdmi_phy: hdmi-phy@9a0600 {
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

