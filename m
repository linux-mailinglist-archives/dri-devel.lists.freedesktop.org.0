Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DC808D98
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32ED10E93E;
	Thu,  7 Dec 2023 16:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786310E932
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:37:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c09d62b70so13653865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701967049; x=1702571849; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c8PEt+QfDDJ5QY0VRS7lu7uvP/+wct3MkvhUCwWW9fM=;
 b=tcI64LzTqwkNrxrGztdfz+nVo2PbnTEzPYyD+ScW2yDqA/DGdja/Vaus/pnPglRD5h
 51m083BCp/L+oXkEaGqwfZVYDQe+GQoUyHeE4/X41gHxjzys8LuRlHUdRZLo4wk5ltJe
 RDKHyQaBlZXjBKzU5iZ9xpi0/Fx28JAJC/9CxIlv0t5Ehrs/qozRJyo0YWQ1uLmZJRMi
 YFPt5xXr4MGP/gR7WzwUFtnipKcnX9WeGcMvT6z0ZuxXLDClylwoVRpKmVCM8Ukn5GYu
 ThBqXOLBmAdZVxPK6Jld/hNvnGXYyqCYCi0st0L6NfgJlrgAJRVWcu1Yona5pt2GYctu
 wC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701967049; x=1702571849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8PEt+QfDDJ5QY0VRS7lu7uvP/+wct3MkvhUCwWW9fM=;
 b=KeSMt51ld8Ymumnq93+fz4xBV8c7dyELERAOVKOLHmD7qtJPLdJc/SK8C8nP1Uj0nY
 AKXYhAMctR600RpChH71R7/zLeU53gTlZkY+lUnbSrnrXQOu336Kdg20P2lJodclis8E
 Y0+gvrm6g61cJCXqyRLDaVfhrGpSPpTW3eYFaM8umn3teEUKzmVc2fc2P1ay2vbJIdUz
 5rQOtvRZi3BuAEwKRd83pyQC2q+0/kKah2a5WuUfTib34qMzC13NA+/1ru8tj8j7TNPp
 rVdaDvpL56hplx3aUk8p7EmPu4euravmg6vBRURvS+4bQAKiSWbReTMg/GqkqJivgf+e
 /+Gg==
X-Gm-Message-State: AOJu0YxzDilJnpC4hQ5f7huzEGWaw34YBQfu7hqhXhTH5nptoILthBn5
 yAtVF/jVlHmO8xKKfyCBKPpt8A==
X-Google-Smtp-Source: AGHT+IFLCN6F2mzcIWhVdSq3m7tUfYJ6ZWDTbU4UbdvqJr3nk6YfRX/d2qwCQlkaks0I8MeS786c/w==
X-Received: by 2002:a7b:cd06:0:b0:40c:26cc:370b with SMTP id
 f6-20020a7bcd06000000b0040c26cc370bmr610848wmj.235.1701967049265; 
 Thu, 07 Dec 2023 08:37:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:37:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 17:37:17 +0100
Subject: [PATCH 1/3] dt-bindings: display: msm: dp-controller: document
 SM8650 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-1-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8Em1kNoxZRedKPhl74utUuPSMeYjKFMJl1aSIOBqFzQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTFRGvf7rBDBItsfhtoUApeP/mdVguFO2qHon6S
 RGsSnoaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xQAKCRB33NvayMhJ0SgDD/
 0f950v6sK0PIkIQ0ybLTR/EWENY1vCiQIHZq7mENWMLMtcDzsPiiVoj/4/IC/eQFVuO34BKcnL8jOA
 Ijcy4c5jL5p1DnYEMLnJXGsGvawAlQ8JCGTVRqG7MsAnb4gyn2e+EpYz7QxBun/nsJy6CZVFULIRgC
 u1fpGFXW+od5wh+nW2inWfloL3ls9BrVMvlqDhjYxyk8QIs3vKfUg8I5lBKtuRqUTfBHdF3R6vbTEq
 +GEA4wQj2MlS1NZ1kLBeFGuSsGL7p3de2hO2biUcpsOnz5YGaS7iOu2NLRM+314s1FN33SuM4NX7eQ
 PVMvxsjDXvGYeoCZT1W1C0M0AIyT0CZ2kZL2nqyrq9/YdW5E3QGDJUMDXOubOhztl5wH7fnmp6M/6C
 Vh9zVSTQCz0WSi4YoYPMz1mnKh0zb6swuuNKkdiyX8utXeeEeRVGkMYIDDz+JGLNJXVNsGjNGb9/9y
 wa9bBLR+umKkm6CtIxYlYdBegkf067dz1hljRN8wxcWqAJsgxcacyLGFloS99PkjB7eEP4ilXBnhs1
 1CkYDJtMKku+nw3r7pB1+aJzhgTj0s6SpJnAk6xAvHdyXQaPNdVfh7OP4HQ30eP0V5ME67iSFRo20F
 QAz9TBSZF+6qEttJSALe+6tBPkmaFiP/4f4+rFK/MecdiQ6oNdckgNitj89A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DisplayPort controller found in the Qualcomm SM8650 SoC,
the Controller base addresses and layout differ and thus cannot use
the SM8350 compatible as fallback.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dbe398f84ffb..93ded71c52d7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
           - qcom,sm8350-dp
+          - qcom,sm8650-dp
       - items:
           - enum:
               - qcom,sm8250-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 5638c1ea692e..bd11119dc93d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -41,6 +41,12 @@ patternProperties:
       compatible:
         const: qcom,sm8650-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8650-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

