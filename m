Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA89737EF0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746A10E428;
	Wed, 21 Jun 2023 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDDA10E425
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:26:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f9c2913133so2823855e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687339592; x=1689931592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VG9qCKvekYoYgR4Fl0peORs6WrpDzePjez0ReZU/eVI=;
 b=xQESYjL4gW6Io7gbTKsEXRQ8/CpdNIXOBuDG3JUhaOFlzoppGV+5OdFgHiwAJC3epk
 ZHClsNRFnRbabFhaovMpFfMaBODei/Isc4Bpt68KnQoTK42nsknP3LICATYnMfHC+UQ5
 7wzMu7dSfMet++/e5wqPTh+orUNzicgV3xnJxXVbheQcZT1I3EDXf8m87cTKDRIOdBoD
 uCIgcxWtNLh1kWF/qcro/TeVoH+n27IIiI3V54NrEigBZqsM3FWhPwdOVm64chuI0jGm
 acdqDhZD3yiL5KWfr9krEO0ubp+bTruMLn+fm/Qn+QUTOXllvx3AS2dZ21uUTpoUWrWf
 VosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687339592; x=1689931592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VG9qCKvekYoYgR4Fl0peORs6WrpDzePjez0ReZU/eVI=;
 b=OxEI1OQ2LVg/K+HLzW50b0eFh4y3ISjeKcGO+jXYyBXGaSohezB64hGAJhnNybjA/C
 /fBLtAWklbpD0i6NGhzLKrbxQLM0JVXqsc+951gtTYW4OolSyy1Mm1PeQ5jAJaAi/5Rp
 R3Q9k6L+Jh/mq0dgrs0Q0PyuIU4hwfr46JmIi6Hdcr0zBUq5JHbsacDWZBXfalQG6OYK
 5rxjS9hVwfEaMyklVR1+Pxo2aSonKcg8ULFyvvhBySRpRRv4ExBQnMF8OdULGOZN9Wni
 7esXhxWUd6SSMmwT54DWV6lTr6L2NKSOHNyZJRVwiWMVqsatATX7aqct3463Q0Uh/waW
 69fg==
X-Gm-Message-State: AC+VfDziLCbdJIjEPPR9K/IbL5G0oopIXfYll/gNeQdag/1r6W7X0+yo
 92qDjfGjSB/+mFo/UX3q1vgZpA==
X-Google-Smtp-Source: ACHHUZ76qDL0JPGb4BAfepy4QIinWf6vA5aG9heOM2nB+6kfh7t7vrhlEdyUFRtNteZskvZUuQkciw==
X-Received: by 2002:a7b:c045:0:b0:3f7:b1dd:9553 with SMTP id
 u5-20020a7bc045000000b003f7b1dd9553mr10904437wmc.14.1687339592026; 
 Wed, 21 Jun 2023 02:26:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 02:26:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jun 2023 11:26:27 +0200
Subject: [PATCH 3/3] dt-bindings: display: msm: sm8550-mdss: document
 displayport controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-3-8bf386b373eb@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OJLy9BOcYtfmScZM3DtWEAFi/hUxNEeYncZLHm7ar6U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJD6P8+2DIjZZuy4odgtDdmcuanRr0RVltXqACF
 3dixsyaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQwAKCRB33NvayMhJ0aasEA
 CIw1on1qij6mV/QegVshdcgWDNEBHwXCtfLomZ9fxodct2WSOziNhiAn7o7fUP2U2CXS57K7h3JD/b
 5DdWW1OYk3hLVZgFOoKQ0/RqxzIKulddUnaCA49ScYAvCrghj8iOn8abGBrEYseXJmZoKCkVRKJ6Qd
 m02qXNfrPtHYm++FfR3NB0z3zuboKzncbnf7DbSUD2cUGIOOIdYHCZNKQopgZW3VpHOHvro8lC3zjX
 CijhwuMCyZoqDYkRXHulx+pSnTvykNCaNqQe6At+qQ0Jvx55tkdO0xr7lo+UEzBt2Y1tuKjfandjrJ
 O1dKxzkrOdVN7f6FG0zqLrp3hx8iQe/8y+WTcGevIdew5V5Zpe7g9nXAOV6q+hdwFDBM4ZImVvtpN0
 8xp0Jp5Bk60xAhsQluHYpqlkp53227XSGKuP+4SoQ9Hq/3/dTErV3dC60dtzFji71oLvBiiY5RNh5A
 q2Ag7aDw5HEaECHvgYGnf+4F5MDhMFw4XxPUk2hRcg1qf8eb50iAq1COfMspp5cjPJYUdsc7iCBMfd
 dWY6f7HclsSO08vRySXDhRqqlQk5E1JQxGIGz6fxk6tCxR4En4F42+929J9OAUJuIfa6b8/mIzJia8
 iWc6gfCvRVtjQa/hKZpnz20oVG8I/AZAc3vrHgFyJofaST2TPyaj2uSVQT+g==
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

Document the optional document displayport controller subnode
of the SM8550 MDSS.

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

