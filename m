Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4936520D9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8E10E3EC;
	Tue, 20 Dec 2022 12:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC7310E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso8697045wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=b1dMW0eG8mZGJmDlBetQlxHLiE0Qn+BOZ4Yiqj2P2HY+eeZyTVUkuaE9LI8wTW0/R7
 d11X33T1puXL3C3ciUi56+uJqJbDYt2Lp63iU/wK7LnZkO4s8oUNzjkwTVKXgZb7S+lh
 1NRzK2rR78GrDsXIc24rLm0nmOFQbJ3UNzO0znW+RcUv+exmqAieDdV1DbWDKu++mqp/
 /yntMXb1LdvBWeS9i1UBamyFe7bWXrf6BW2/UrzrfknK8XRc2leCR4hIWMnM7Jx+Ka6B
 R91j/xBLSl70E9b1RZ10Hd6kwYsFTDbK8MMyKReEbBRE8U/ByM1cTESbDKYNbOVWxgTl
 BzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
 b=eY+XcZNkh/sgtPaBQSOvb/0aLDmJZ/a8qm0G+bJ2+j14+xVBUeFEnXycbDS9NmG4NZ
 oMBwZuUkV0Ot6VCT/Vm1MqAQmU4rYJ6nhlj9Z4jVQj7+c0qXjaeTAcmb+HGU+x6sQQEg
 5+Yn5KIzsAzEDAWsPwcnkq30CuPWga6YbE6C8NQOLsD6VmHtu2AEKtrhVGhRHb3hg5HC
 Az8zCW3Ce8t2s/B0qdsv3A8iaxtQli1I37pLz8VstsEN69OqeupZqg7rI9bwt8Qz07Wv
 n/LGfhfBz3KLiyqA+cl0xPY7IMJCFpjA9lFr0y85EXoX7bKU7pTdF/auqXMEPNpTMRFE
 e81A==
X-Gm-Message-State: ANoB5pm+a1wsJdOsCQjGxGKQyEY6UKBX2jM0c/4dNfsrxtkXQylHSRHW
 UJLncrWSEZLEDv2dCkBmAZn7/w==
X-Google-Smtp-Source: AA0mqf6iHwbVHyEvGsTvVxs6wi0sc9SsG8Enzu0jPcef+MYUCXf6kyphBF1kj3CaYio4HGgb2Wwkgg==
X-Received: by 2002:a7b:c005:0:b0:3c6:e63d:fcfc with SMTP id
 c5-20020a7bc005000000b003c6e63dfcfcmr37476117wmb.35.1671539818399; 
 Tue, 20 Dec 2022 04:36:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:58 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 18/21] arm64: dts: qcom: sdm630: Add compat qcom,
 sdm660-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:31 +0000
Message-Id: <20221220123634.382970-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sdm630 can use the sdm660 mdss-dsi-ctrl compat. Currently it has the
same set of binding dependencies as sdm660.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27c..8b9c7421bc0c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1572,7 +1572,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm660-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

