Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2DA2E7C0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505110E4DF;
	Mon, 10 Feb 2025 09:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kQti76WA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C01B10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so8370255e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179970; x=1739784770; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
 b=kQti76WALs13+88GNT5vo9r+U9IW4l2g4yIt0HwEYGRGul8Sn3NnU4EVC0rw1E2HaZ
 Vo7f4InNyYYa57PZJfRbrTpCFn46k0aea7BVjhDaZ5h6/RYltge8m2Jr17E6qj8yhoMQ
 Lq5Gk95NyAOf//jUuIRSdfI1KEmVGphLLTzn9IQQin8twkeNStbxMiKRmu2YXbTpwivf
 YXfBbIWUh6c3rfKYEShq2YT6uZQR6d65qDXGHkbXamvDkXuG2uXUUrkFdoDiODO0gAnC
 /ZJYCbQDvcDnzHlycSfhhYjr5lB/8cZNoRHkyhuzJhH0XCaNODG0mndhwCOUfePqddSj
 YzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179970; x=1739784770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
 b=Hh+8+jV/Hdoxa8hc7LkELOcxc23NIQ0o2x4sleOxkXIGvMNG+16ahYuiptjFkgl/Et
 9KZcG+D2LP/dHh3xd+gJ3vrI4ujZc+oLn61MnXhN0Ye3ojgdBsjhbPlShemkw63vIFTe
 JvYIIzoWWcmCnuWOgXqfQF3PtHSVAoH7N2xMEU3IUm7PIUhl2KPWz7P+Tes+Tm871DkM
 y8pmooeeEkTn5pigCd0trSDgt+vQ2A4fLH7ElqwV/kcPya8T8WTP8nZa6QmWUHXWMLAj
 g6+qBzRi5YUGxgcgSszpRSWShr1d7lwD7y/INrqZ9pyw5Z92JiCHoWd7Mj12G4EFihYw
 t7dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrbENMidRcp3LZuK9k0Eb3NEutO28gtyvXs35VxeRaf72pWVjTJZFVFT9RDWKHUGbE6HVY0iGSBFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz/Hiq8AUf5T7VkohSIRIoIrouF8/9AglGmhj81YGSWh7HFer0
 8Dq+zptLJX7CsgUMMLonCmkQZUtRYVcvt4ljQARinPZEEBIhBGBo+ALFek7mq8E=
X-Gm-Gg: ASbGncv9pbtYqu/DXg/mc0Fq6dRxqUMRZ3CwWk+YVRty6++PQdvzlt8puErHBglWFaE
 MIizUI2+WklE/6YiuCenfWqQBmbDpaiCxBIYw3X3ue/43bmfTR72SFENkHiqbDbmp+VQHtlOCAy
 E2Hrmg7CXVlrdOFkiNOKSy3vp2jjt1oUMbql0BaNGYefkaxSWMI311C4pM4m5Df1d5DynKq10qv
 rEiaAAf1qNNi9+iT01Tps8SHqQpgwbO7l5Qe98AkubYsDHy1eHJpa2CaLt8+TBmXTn0Xsl+t3kV
 DbolqU1HudoTbHUXCn8Dcdv/yLhxGpeSyCmb
X-Google-Smtp-Source: AGHT+IEwRlW2DrLkiktuMQW07Z2SL+sgeHovK/MRPd++QhDmgF5mqDzEvYPl7b2V7XAwAGPCMCGvAA==
X-Received: by 2002:a05:600c:1c28:b0:439:4825:727e with SMTP id
 5b1f17b1804b1-4394825731amr10547935e9.23.1739179969602; 
 Mon, 10 Feb 2025 01:32:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:40 +0100
Subject: [PATCH v3 2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lfPxQaMFtbZZ21l+5BkGf/b9VmjDtPXz4pGJe8td0xs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce81eAz97fUjAcEQoJORzuzKOeABTMSToiwQoHR
 qUCUVImJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvAAKCRB33NvayMhJ0fplD/
 0cYY7doqunfG1masd3Y/dnrcjJOQZun5jdN203atsgPQP4RpjN7SJwpQRjldFB3ECitFP6Ts3jXjJB
 Mzo/orhdxvng7eUp4tgvlgCFj0oRSFiJEq+bK3baw546MjZjqNE4Zdb8tJr9ZSVBbfRLyv5Cb2n4kR
 Ir5o69mjEbbqIoeEidhvOSycaPtbofamK4vlVAyksAYUHn8LFyl8VjFGVeB7MG//MiREqtb7s5Lvof
 9lmLQPrq7f5wV/iiWgyvNKoIQL66ASxQwHDKVEKiQ2ZINVkrs11Xq4NlRa8U2mPQDnSpWjPnV+sdzK
 I9giyxUJT9WRRS+coOa/ArWtE4kAd9khekWm4PLKfLeCp21zhKsv8zieZ8icHVMw7rSREy3TJj32zM
 0fBeAcICpneYHFJ2XY1aIyneMgjMzpkoApLjjuplu49EJ+l4IXgonehRtIUvuqWnk73vy9vzaFTIpS
 j9+G5Dg+ZC0CZyHp8JicLzUSZTXsGhDmN7a3yK3b7fYsIP9VblL9ScHfvZ+pX0B/jR+QLu9pGxdd4V
 qx0cAFnlkqmX5bxRgwQfcRkh4tSjBwkKUJB0G/Kte9ME0EjH1QQUqOM6NMt5C94Y3ZfyTj74St+jm9
 6vcTY7/gQWyaCVC+mVK2kP9KW7q4uJvdEMDB4cEnQoWVwKlww2yh4auzz7+A==
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

