Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215726520D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6A10E3E1;
	Tue, 20 Dec 2022 12:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1B310E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so8101680wma.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=O9ARsqeRlkHqlFnRGCHa2dOCBlZCTEEToZrHu+6qz0OfBUJFX9Eot4K8S7utWQ/yJ1
 ME9jgXI2WWeKhbGPNAGIPaQIhTNdVHWaoaxdy2fsSucCXHdhc4tpGmKC5+J8ALRMcYRK
 /fBTXmKh4PJMs+tn27WR+vrO8QX/3mGmgJlYE6IL7tKZD2eTK9j5I0RrzAHVHWd24rmV
 wTq/fWL4pUhevnKQzdUSF6psVU3yDvVzIOpF8H+2FjgJaUmMH1Lo7E0F0SLaQS4bxTb/
 Iv2j7ldZ/kcAVxmBUYxYEldS9MON7Nvu3+PhCamN6hNs8vWyknFoMxleSZ026GhJIQBZ
 2RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=hHmxS0cKKRlml4I1s0zNj2B9k+eDOtoqbiO5pCcVYYGxdesPJaPY9ofIVHhoblmMf5
 iWvHG1SPFAqaoV6wQCaX5nk47tUWrS7qyPRDgOvM8SKCd7u4+bayt046Ek3eGAb6UncU
 BnYkfTnc8O4H03rIhTbjke1+HjTK3HABg0s2U3dwj6Cwyg+ttI39RivxspSUMTNGx7UU
 cMiT0woWS4X9uAp1nuK/sUKKxja60bJbzMBRgUJwWq4zUO2JBV9jYpiUXDsAdQ1U6cWc
 Ehb/ci8ck6n73zJWLa/Z8fRR8+h5NLt0bhDWXqxlfi4jniTLjO/QXb1jIDFM1VnDw/Th
 Iffw==
X-Gm-Message-State: ANoB5pk9hQdRp9Uaxa1vMTrL3R258Ub9ivfeaJ3Y+bwHLWGQkTj2dAmk
 /1jJIc+ul4EFvDq2/CnI9trt+Q==
X-Google-Smtp-Source: AA0mqf4NXA4SWHt2nfjNUNn8kBNAzpqqphrFZ89q8nt0gHH8Yeya7czTmnjuIooMSUSU9Z6PAkWGgQ==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id
 k1-20020a05600c1c8100b003d1e90717cbmr34576993wms.1.1671539812355; 
 Tue, 20 Dec 2022 04:36:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 13/21] arm64: dts: qcom: msm8916: Add compat qcom,
 msm8916-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:26 +0000
Message-Id: <20221220123634.382970-14-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a9..ffb4ce8935b37 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

