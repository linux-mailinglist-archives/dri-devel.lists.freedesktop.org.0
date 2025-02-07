Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D123A2C464
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718BB10EB04;
	Fri,  7 Feb 2025 14:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WgGicJEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BCF10EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:02:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso15179455e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738936949; x=1739541749; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+t0PeRcRiGWGlq2DudmFu4wvPO0Qc0iTCeH5AgQYu0k=;
 b=WgGicJEw2+aDtCs9ANrkjKpxbpnPVyZkPJgotujoE8u8sPp/M3fekD1+7T7cmNAqO4
 5PfJPxtJPjDFiWsEUUbUp+Vb+FMElYpOQSsOXn1MHt+6eEFQ88AboXAyA12+0ZhcfbGz
 MrHiZMFBA8yte2tiUEPFPx5GIHxYaamdkmDFj3vofkb/E+kOOcaLgLNYvajXrEb8jA9o
 xczOlAcOw+/oYxelIXwLz8CR6ZVKCwNQB3H5e/VAcgmqPIPewX5ukMCb0XvZeOPIGmHH
 iqPtZIh7wzwwemS8LbH/o4aBbA5x9p/r6ioBVymDdQjbqfBHUlPHM63au9FfcRKQagEU
 FeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738936949; x=1739541749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+t0PeRcRiGWGlq2DudmFu4wvPO0Qc0iTCeH5AgQYu0k=;
 b=Snc4BI9pQzdYtQ6OOHFtAIXg3iun2vpppwLmlWI1HtLEeAag67i8s6/MLKs2bkX6so
 PFR+eqQ3E9FVbJ5OIeZ+9R8FBs8KVXT6H1Gu/zn4Ax/NgIghZD3OV2OqhjajFH36l8ZQ
 8CUD3GrdH2DEk3ENE85ElHlc7ABfl7HY0SNraQiffUZB4NjQQFywlO7QzPuzbuFHSt2O
 nSfHstjp8v7pMyfvc5Kn+55fbvM+I1gxm5IRiHJOi6oQEeGhnEvoPLLbRIyc+HF85Ie5
 K2CRb3WsStveuNwmzQc0PIYM+JHJcNhKEfmnje4V8AFVdBWz3zasjAnF1OJQqGYJfVNe
 gzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc0OON64PP3ktPbaD8Cn0sKL/ffwmQcPLghoSnXeAn3OaHCcvGM0aBFuD/aoV6cOsUCaDpdBEKkJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhBsH03I+nPdAtvshcas2cJrgBz+4hCkViUTWyYpIn4RkqHYQK
 DelX2ACL09VgsUUHpkAuoonty4Z0di+/3ywUR//z57TJhgtrd49cnHQZTQhLoew=
X-Gm-Gg: ASbGncv0tEVRapDcxd37MdOwdY39NPTi4udJU8RRk/FR3a28+M2c6L6+pGgn+IlSpUk
 gOLI7GCNhFTFban0J8W7pJPgLE6IzwJRN96tKV9OnZ9dL5eXo2rg6y0iXe9+jrhqVWNIwAcMNar
 195lay5eKBbIOg/0GkGjMuW41ZhFduelFPltnIEDx5V5OjERRmNWAvTHD1uJVH3VWV0J05L3fXX
 0G7VSNZHDApedA1pWPFpwisgSSJ9XhBRgDlW91VDGgkmyEh7k187kl051gQ4PA9nH9+19C/YM03
 xBOllaMLbhaomZ/jKztqZwxu6dGREulXWtFY
X-Google-Smtp-Source: AGHT+IF0Kfmf/PwEzCNegLbzDTONXpBMWhSLTuNeh60qPhqC5TyM8mWAKMBSCB9PUmIinuW/+wiCEw==
X-Received: by 2002:a05:600c:35cb:b0:434:f917:2b11 with SMTP id
 5b1f17b1804b1-439249b2b99mr23312925e9.21.1738936949368; 
 Fri, 07 Feb 2025 06:02:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9652bsm57384605e9.2.2025.02.07.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:02:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 15:02:25 +0100
Subject: [PATCH v2 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TcDVf7iIOl+k8slgEJNXrVsMAuZkLgOUD8RsgAfG3OQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnphJyo+NERuJHQbRXvuofD/Lg8Z58aE+Lc+D7Tps0
 T9gSRoKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6YScgAKCRB33NvayMhJ0S6eEA
 CzMMqK956gONtZcEyWLIdpW851mCXU/HbQLiPU5tYUWwcaT7KEbVp8Ac3EYh4czEGOt5AMgpIt9X0K
 Px8UYk6ASwesv0OgkVz95wNNryHI4AH40p+zfVtCUUDAGcImca2Jf0L3cUU95NVDwTdPWNOh5AiznE
 KhnqMWp4xzm/0yV0AHStb5ph/Y4bjwOKThwbyc/QIk3hJrDKxbgjsrIj90EmwQbIuIED48vXAbkzR/
 wOn6/h1gL/zWv1PHniAJvTxzi7TIOhFRqnyBggpp9igt8Fo33XHkRjjAfZ+pCmC3E86jKKD3FJtXFu
 ze+d1mrfRCvMFxmEzgcKYupLotLZhPdf4TI+0fzLu0NcKD6i1XB/4TXwQeYaKaKk7uIzblgmxSCrdr
 nqxBHjC7ygZcmV3zBqwjethUT80+bcIQ8kMjV9p9lnNh+npY9FjHTfoJhFuCc1e60tFnUbOqUtRUZq
 WZdBPhKPA0zcTfmJgVD+VyH4LtzBVZ63mXsOhXqz2/MvPJ+162jxCAnpNpQU9+OMC3DFzy2yeLcA2Y
 rNhR4rF1FiDeckHfnwUeIGSv0sgxoyT1CRv1XvggUU0i5qORa82H6HiznnmShFu1j5M6Et98RnQFvh
 CbueXYNX84Ncw+RxrbE+RMBwbLLw+vwFisX8OaI5i/7c22V28zC0KzdcEn8A==
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

The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..9631fe11c152449f3dfa0b8f8f53feeba721c950 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +91,8 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "mdp0-mem";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1

