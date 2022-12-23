Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5469654AF3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980610E5F3;
	Fri, 23 Dec 2022 02:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138D10E5EA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id ja17so2750654wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7tCG2RVp+L8qHK6ZCOnqZpsqAhvGiGNti+CNMhR8tY=;
 b=XpO2l27EmfKRAdLkoWUa00n8PEcJtoqnibEi5ihkSxeCznmTcPkWe4dfL8DtIZJbdN
 OUWXZUHSpHmG20JOQwr50XRBeiZOEUMVfOScyxZGKREqSG+Z8HbD8cPTItcozsgrpNsW
 S4ghDUZWp9GB9FIYrGF26agID3pR32qgUA7RBMYloQvlnUAQ0yC4dFyY/Snn+W0Ff7YW
 Ulf+TODP/cQ/pZXRR9q2OlbDWzb0LLRPP1A79vCAICpAPCGpkorYW8xLHPFzcuurx17V
 7okyIRYbI1Hx2EeS3Cp9eJtpD5bdH4sAqGkxyQKNuCvE6f9HrWd5tK/YD9hOaFW//qAM
 vawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7tCG2RVp+L8qHK6ZCOnqZpsqAhvGiGNti+CNMhR8tY=;
 b=aPoCQvI7mru3WmTJhKY/ZKIPz+RUS6fHcYUc1Ldy4iHavb8/wc9Ao8gdvpcWDbxINN
 0qyZXRIq2tIvBAK379YqxtWv73EZlLwY3S2RRK7MbsYTYrHT+auW0os6U37yD8zUGoHc
 dGl5DJFdbMC5+3Rdqzt63v/VF7r3+0d6UqU/YcP/dFUcvRlTQh0UuLU2R1MMiJkSQ6T3
 A1dllv6oEiE6nKdsBIvRPjVGSaFm5qaWvYfJSJdbOraa9FvyMSVWLLQSofIBcp70t5+0
 lmA+gM9c2kbfoRNdvO9AZKSFVXe8NjwyuiZPWG1o9G2DKxZnvWDLbKV2/QJ/RqU43OAo
 KcDg==
X-Gm-Message-State: AFqh2kr0Y3ofLKGzLoyi9ABorll1j+OBWnX5navG+qenvZrwDZ2hAyU5
 T3gv77EgAkg1+wqWqeNuV2envg==
X-Google-Smtp-Source: AMrXdXscQ2YCy04SKsOId4OsLJX5iBr6uNz1PZSH8I+aVEvdWEBlVGq1TELm/MLSb5gDqbXCFv6ODA==
X-Received: by 2002:a05:600c:512a:b0:3cf:8957:a441 with SMTP id
 o42-20020a05600c512a00b003cf8957a441mr5868404wms.12.1671761440308; 
 Thu, 22 Dec 2022 18:10:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:39 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 11/18] arm64: dts: qcom: msm8953: Add compat qcom,
 msm8953-dsi-ctrl
Date: Fri, 23 Dec 2022 02:10:18 +0000
Message-Id: <20221223021025.1646636-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8953-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8953 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 32349174c4bd9..acbe100d9b5be 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -797,7 +797,7 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@1a94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x1a94000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -867,7 +867,7 @@ dsi0_phy: phy@1a94400 {
 			};
 
 			dsi1: dsi@1a96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x1a96000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

