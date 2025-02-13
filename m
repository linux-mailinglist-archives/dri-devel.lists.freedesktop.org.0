Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D5A349C7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BA410EB1E;
	Thu, 13 Feb 2025 16:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aIQNTeYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81010EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:28:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43961c966a8so6568545e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464084; x=1740068884; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FP+FtMNe1lFnPeWnPD6fxUhTtgz/aqut7IvXZcvqhII=;
 b=aIQNTeYJKim9G7sFeURmoIkte1nQteVcOvsuRx0aQHCvcXB+BO8nOh8aZG20mofKv5
 jTtTtFy8Tk18Wf+Z3Rg9DKSKf4hya6TJWD8/XOFi3qWM9jysZoxvPLNGA9f0i0Tz9KQh
 iGgLhcQhXiMDu2WANJNSzl700BrVjm2jcJMysjpL7huL3LShR7BQD8YYjaZLatT7S1yz
 zCkrQm6JGHGacTHYpTfZwpJcnhGYUCZ/WsBWTi+HVRnZJW5yDBKZGv4rbpjfdw/5zWQ2
 poCx5F1UYWIj6ZMvw2gEPu5rvfSVcETcHJ0Ndva8xfyr384GHGb7KdShZCM903+JUEtK
 UV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464084; x=1740068884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FP+FtMNe1lFnPeWnPD6fxUhTtgz/aqut7IvXZcvqhII=;
 b=q/BfTNihbHnLWImqgxP61Db3CzzWAfMcisKbJNTxdWCWGGCXSIXnfNlvkLwXcvZyzB
 Oj3a+gB2aPTVWeMQs6mZnZ5kYnLe/jQ1yFTiuoacrs/u2i2FyRjw0Jf5W4AYgnFlnrJ+
 3brQKxvDW5fYGzdM9lZr+exdRzORENItMqsS4FH6J/8Bv/b1JruDiEU1jp+4xZumColO
 F16VGZr71E+5l/xWbqskUZUMYc4U0bh8zZCoYTfyZorSXNcJcaxpTKDgKydydTrgmCwc
 5xbblJqfblY4yxgNS/dTWhQTG0EO9bLvCQgHGzrNp78VDEU94lzvhP1Hnj0BnFrBLmH/
 N/Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGuLVCQDgXXCK8gIZcshEUKVxF0nef5TS39PivLkz31WU7DdHtiu7csZNoAj6NLzskdQjiXuHKgf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlaroH0dEhbxM1KOPjLXwFs5q3i5sqSSKYZiM/R+LBQ8z3+F0f
 crQ0hLTmxQxyWUPf9dXSPKcM767EkuEm9iYSX/3TEw+PU5yfEHr0WIrHfrRAIVSAjrKOMnnCZ8r
 Y
X-Gm-Gg: ASbGncu+Ht0hD1PKpF+LoXzNHUmefK9Ajtm15x1qYYAcHrKW2M4OVdpRr3Dqj8xif2x
 ZlUIhdcQchLKOTlaEI/9z50fnVEkO8p67b88citirAgdzN+Krf+2wUlynIP1OSOWf03w5NCJOAQ
 hNwgUqr21kxSkTmmvA5y3kE+u+v9x1neh/oIbNFXp0ejGVWJ2FOxDg9WTCRiQDYJGxoepFuNgO9
 rvg89MeKIu52pnrBxI9CiRXsf4heQH1FtiIgX+RdhrqN5Q+oSiOz96uVL1G+86a581KHl+heoZl
 u/evoMlTsa3GhlyN6NNQLwg9NYwMVsyVJRLh
X-Google-Smtp-Source: AGHT+IHQ6I3q9aIGigFlfWf+LyS04BFTWKK6Eg4CfTu/NB2AigCXvjyjkqRnx8ef0HFPRw/1Ll5ljg==
X-Received: by 2002:a05:600c:3b16:b0:439:4a1f:cf95 with SMTP id
 5b1f17b1804b1-439598a4aa4mr91119185e9.0.1739464084211; 
 Thu, 13 Feb 2025 08:28:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:28:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:57 +0100
Subject: [PATCH v4 2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-2-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=octj0+UsdpLHHllK497QsSntIvQXkSpD3TXOS57G7FQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2Qe934QhIZsH0DV1g/od0XjnWFo0zh9wLYsOLh
 m5FpkM6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64dkAAKCRB33NvayMhJ0UlLEA
 CIwNbjXTbJ2YnIlDRe/YvGyKsEXCXasatnMI7Na/04mHOjYcX3N/5ckz6DnLW4Elai2FkeUVzmRj1o
 9lC0b8kuFSJr9m1N6NqJchfVxVTSUgejTXCs5ACO3//fzVzHXzf1aIKZ9Ux4XCIaU8JeTUWKeY6KBn
 XDZTl2CxgIe9PDm80johzFzVbyXnhWU5BFxo8ysbl6WlGQHbrJGPrr7iGCMp2tF4XxciTakqjjCeC+
 4huAO8fohgGA0vpEYkLJqm7EABFiYLmNQxF+xCBG5O9FPdSVAGXITduJUyJZJrwYnj6QjigBjtAS2w
 i8/Vc+Csc3kf+aUQ+Zo/hZgLoxSjAPOgVNq6lt8Ao2RyXiqz6LhBS+B3u66CB6ZnjOVrhPmhcUiEmj
 bFbMzqL51fW3FUsYNW84vdYKxG+UqccOZEn5fRuZNgXUDFsiy7oObuRFW4F150snJEhJ0blOU/WwWp
 fjsgOCerN+3ri2zZRdVFX4DwyZvAPfNXBIbrzP4YncnJ1ANgUmLtWgnujF/Lua2ju4eogC1Hn9BId2
 Rw2Zdwj2/LoguVtjd2KLCqlXYHAGwWKwIpdubug5dgdnkGzuN9zd7ptecrFuqtGCbJG/51ysGekADx
 JmlJ7Z/Hyml3L5seXKtuWr3NV4LdfPYTZWobBs0dEXS9JhzH3pICUS25zF8Q==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
paths and complete the example with the missing interconnect paths.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..a1c53e1910330af473a1e6c7827026e0770131ee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -75,12 +79,17 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8650-mdss";
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
         resets = <&dispcc_core_bcr>;
 
         power-domains = <&dispcc_gdsc>;

-- 
2.34.1

