Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B072D7FA470
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0D410E2EA;
	Mon, 27 Nov 2023 15:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF310E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:28:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54b532b261bso1805040a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098933; x=1701703733; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UDUaT/KJ/VNfco6RB2vLVEnszdzFi1oNwuTEuo9Y8w0=;
 b=WkYm+oxUdZz8aXsJitm/Gf7g8mwEqYTTmKGupi7LIrEgBORcmQrcym3e34NPnC3Sll
 qHU/dIWeGkYPXpJbY0I4a+XIozoBAV05IhGNMU5csflEVgfKxLfxFb3Zk/x3LAsqR5Ae
 0wHBNh+CiCkuOHrHwrWouk/CPt/vTgJ73dZ+tdOW0KAt9harb3avCencEQBTgLYMUCmu
 bbsOvud3jBSmPX0jF3VOvog81mgz9Qk42XwdkDrrNyBvUbY99wb+ZMFy2UdxfIRUYXr/
 Sp7GsYu2kBhhTUbx86fa8wGBVY+6fH04knAzicEnPD8U4TUBLkMDyi/+eUID2ddgEtM9
 8MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098933; x=1701703733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDUaT/KJ/VNfco6RB2vLVEnszdzFi1oNwuTEuo9Y8w0=;
 b=g5La+X0Esf+NbhvJME+xIzBWdSjVR7EDhoDxt1Pu0QVwWPJd+0a8HWGr9vRW/RE5S3
 1Vz5eLzO6OaXApsuTsT2FFGOj9vM3E30dNiTYbaRUJ5nMrnOCpzXHSDIhvlelZRPBLK3
 iY7uQe5qBGV06jTAqV2vYxHbVuszyzm3XvxGlz5i6KSeyh3FBY5GVJCU5ORLsjGZ/7rS
 GrP8jRAz4y26m/bI5tGrSZRiEtHrFCqe9H4arLwZBo52a7sdmLwGOtuMaW28Y3cBBrDz
 2CU1auvBArMGr2pDdGhYK/p5B5/qOi4/6ppi+Tvrg/JeLAEoPMPBGhPYyYRQ3wdQka8Z
 laAg==
X-Gm-Message-State: AOJu0Yy17BJ900h8iaCqTB8lH7doLzra62WVTpKQ7a8Uj6j1XNsm0BFc
 z3NCsIes/t6EOZdYyLjX32frQA==
X-Google-Smtp-Source: AGHT+IEzmMDYeClli0bsqBMCQzev/3yzgw7HjJl19gGbvndSUAHwGg0er0pMbvZpi1YMHIF7FhqcWA==
X-Received: by 2002:a50:ccc2:0:b0:548:4da2:fecc with SMTP id
 b2-20020a50ccc2000000b005484da2feccmr8744965edj.3.1701098933173; 
 Mon, 27 Nov 2023 07:28:53 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:28:52 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:41 +0100
Subject: [PATCH v2 01/12] dt-bindings: display: msm: qcm2290-mdss: Use the
 non-deprecated DSI compat
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-1-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=1474;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=StOyqUBN12uWXGz5VxyIVjZXe8BbnbVf9Pwbyqv47+8=;
 b=2AvUROB7bo2pn+OEKisCdCRJFBG9VM6cMv+CV/oyTrlgWcVcR2CBpCZ+93Xw3LHZ0rKPc8zwJ
 YESXk2ZQrZpBDMG0mpAz8rh1T4OM3ctfOJ1lfQm20vjIxYEWsctWK1F
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "qcom,dsi-ctrl-6g-qcm2290" has been deprecated in commit 0c0f65c6dd44
("dt-bindings: msm: dsi-controller-main: Add compatible strings for every
current SoC"), but the example hasn't been updated to reflect that.

Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 5ad155612b6c..d71a8e09a798 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        items:
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -136,7 +138,8 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,qcm2290-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.43.0

