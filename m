Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A673B75C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4944710E5E1;
	Fri, 23 Jun 2023 12:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EE010E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 12:33:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fa71db4208so6694385e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687523580; x=1690115580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qKu3Asg/SoO8zazL8mfwdhVcyG7zeze59hq7qPtEbdE=;
 b=fyDwJPug3BqaULyR8VN+c6NZetMBHKDYnk+da2tih9w8a1iBYC/K7qcIRGeEycC2iR
 k0S3GHF3yO9crvH8UYu+z12M5IU+Pz//WgcJAOpW4YQsCJDLSikuFEyb3PO/cwGqRYRQ
 Firo5v2auy8ZQ+1R+rSeavOeulczX0YWsWxBZK0Uu+ovTK0lYk5KeZLZwuQt8WfsKt6g
 KRyH7tpyKpsNb4MbS3XzQkP4A+edWwdpEXa9gfrC6rpxoOjlQg6rDBnC5HNEsmbsTa7G
 kmLwPKLb/Vh4GrG2zhx1cYWivS/SUi75S9a0a8rbfEff9vwM9vAOu+aL5siTiM1RgfDI
 h11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687523580; x=1690115580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKu3Asg/SoO8zazL8mfwdhVcyG7zeze59hq7qPtEbdE=;
 b=cMA4XcXx85tD1x8Kof/jVotNaxdaqMqqIPbpdYwRCZAlt/AfKfrMCG+qVkI7J4uXYy
 +js2q7hmmOMXiOtbnkd8XYhRoF8lbGubqym+7wpnD47vDf1+R0nxagzanqMbAV2o0crq
 9p/OxpT9idmKcIZ9B99ZLRGXuGDh08pYVy3MOfqXqm+BQkRyc4B0iferC9+Tu90remQZ
 wp/HGgADSda0raAKIpbt7rIUkzh1gGgujnz7Qs03Fr8OnFbstJxSTDkj2dzQcoyo/b1q
 +JhDzo6ee1+XwgybbSYwWPL7/QMIc2HglD1D8qAPKaDyoXiVN5aoKv2imQxBpIJoHoeu
 sXyQ==
X-Gm-Message-State: AC+VfDw+D+a0v8mWx6QfiCGAAYLIhRLGyOcxi3sEy0E3cYlri/UmVSOx
 r/ZaMfDHee6Pj9TWryU22R/GSQ==
X-Google-Smtp-Source: ACHHUZ7bU81T+88a0MZhjBG/h+wDoj9sRWgkbsoQKe4dkIZwCXHLd3e/M45PBrJ8P8lzCAxscUstFw==
X-Received: by 2002:a7b:cd89:0:b0:3fa:7991:52b3 with SMTP id
 y9-20020a7bcd89000000b003fa799152b3mr1911948wmj.5.1687523580433; 
 Fri, 23 Jun 2023 05:33:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f91e32b1ebsm2228105wmi.17.2023.06.23.05.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 05:33:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 23 Jun 2023 14:32:55 +0200
Subject: [PATCH v2 3/3] dt-bindings: display: msm: sm8550-mdss: document
 displayport controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-3-733ed383f6b6@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+gKeJlRXpLRqD+znH4Johi2h/GuV34UsbIw5Q0Ic9jo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBklZD3dffl2a0DHKBeY92wLbSr4u6DigwRysgCWhTB
 GfF0GRaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJWQ9wAKCRB33NvayMhJ0aOfD/
 0Szo5tE8zaz/C/a92osk59QxwO/8/JJypPJDr7pmnEi0h/1G8IUTnl+M1YCu1XEJAKNw6nA8ivlJSf
 JxqO4TRABDEZZrdTyaBE3osQ/gjS0TcIIJZJQSKMm12fqIvg3VEOcyzDercafhgwQhhfYkr1r8kDro
 /QVu3/0wwYuXOXoaKl1PGvSH2Bblk3rhDVwst8Ii36d/VLjKrpXUxT5+mY5YbNUg9MPZ1OJ/mmXGd3
 SzowYr7y5R2NybIGOOLuhe2GLbixErGDfvi3wLaE9/hXURHN6NsyNJ47ZTJP3HnT2TtJiK0t1SiI6y
 yzDHW22lhXBnJngQQqRoLP6nEZUb0aqjivSW8gw7cL/RHI4CJRcrmsl+wfawMvkOgrvNEVKCTItTU0
 uBYaAlqATVVKKxr2GTDQr0rkTT8Gakqr+u0bIFou0gveh9uV5uxAa8cWGAGRWa7ZePN3PxV+Xmx1Y5
 4wCp+8kR3GpUw4YUPWGJ12eIhxqFm2UiNFezHGFIxepy7VMF5xQRyTXd/kkB+yt7rbR5AI9F56z0v2
 sc8G1JzIpox56pV4/kK0+E65Ypx4EeU+dbUyoFyPYas4jCkpw/T6mAwLWNUoRrzkQ32myt44VdHPT1
 VhmHcLE1970xLLjutAoC5wCMwRF7rzxbSPtujFOW+mYzwoE5rbJoaK6cQsow==
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

Document the optional displayport controller subnode of the SM8550 MDSS.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 887be33ba108..70ce7cb7a80d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -42,6 +42,14 @@ patternProperties:
       compatible:
         const: qcom,sm8550-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8550-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

