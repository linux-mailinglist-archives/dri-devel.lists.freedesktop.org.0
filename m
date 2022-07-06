Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AE568BC1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A710FD2E;
	Wed,  6 Jul 2022 14:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955D810FB24
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:52:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a11so18772630ljb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWYa/JkrXaVyDqQ/AUIdjm9Zadu3uW7Es8evksI4JMM=;
 b=nERqmQSL/Sc95hbch1fUd+1YIJJKoAoxd5LsP6r7mwfI8nOkG5rzaw00oL/4prG7NW
 Mh2X4WCl6FTODYsm+9mEAVMgTWjDNeXWB+vKiwEtOeDe5QFq5dOQi4LHz0bjbnl/59HW
 iPdgDNyuPofN9+LkhhhCVEOfSu0FNzHNomDtkjVXJcWMztTGTZkAvwspoZYDKXu4mVcT
 zhfmWfvOf58fIT1Jr6PGC7Znm3KcqgKcGWbjAjQ1lZBjdJjccwTWrGyXc43FT5A8RyE/
 gSkA2r6BQVSaAB7SFPquNl/o99zqvuyRz6pd46abT+i4L4bSQUQDbfIBRUPVmduLygWR
 4XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWYa/JkrXaVyDqQ/AUIdjm9Zadu3uW7Es8evksI4JMM=;
 b=6N2A61SHbpFC/S1rPjRp7gEUD8R/YtpWWLJYTQZKiB7AZQIJe9jGOkpg2zx+opa1pc
 ePtu6X6BI7KRA1uBpOIDgOUBUQdCrqtqGhufj9glQtf4y2k9i4VrPbArtbn0t6prrmXq
 846ZjGJaeff9Hs4AQJLsNsMMzSdCwQFu3/CxIcSwuARS+tPXzq3XxshItjHLhehzz9UU
 ZrI5ndrJk0su3QLm8s3UeEKo/I1NUO1sdb16R6BedZ4YoJHtUQPDTfM2qLgHbkyJmQ+O
 Sd2PImzDGbM5AB7mmZyPXwJJ3ofeL7XUgfB7KOWJ/5jnl2HjBZJICJncZxsFuDn4dHSS
 11QQ==
X-Gm-Message-State: AJIora9JtBbQ3BbMxCEh+km0NpZ1FC6VYc51GfYKt8VK0GgFWYfABVGQ
 k35Y6mb7/ZB8dd9hVwv0uDvtoQ==
X-Google-Smtp-Source: AGRyM1siQ8prPMCEpPsf2tjnXe3IHRkBfsg1LyW8G4wrbodaZchvocP37Mu2sxympGNIK81TjehE8w==
X-Received: by 2002:a05:651c:1798:b0:25d:3043:58e0 with SMTP id
 bn24-20020a05651c179800b0025d304358e0mr6628027ljb.310.1657119146681; 
 Wed, 06 Jul 2022 07:52:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:52:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/4] dt-bindings: display/msm/gpu: document using the amd,
 imageon adreno too
Date: Wed,  6 Jul 2022 17:52:20 +0300
Message-Id: <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
have been using amd,imageon with newer (Adreno) GPUs to describe the
headless setup, when the platform does not (yet) have the display DT
nodes (and no display support). Document this trick in the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 346aabdccf7b..e006da95462c 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -16,9 +16,13 @@ properties:
       - description: |
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
+          Optional amd,imageon compatibility string enables using Adreno
+          without the display node.
         items:
           - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
+          - const: amd,imageon
+        minItems: 2
       - description: |
           The driver is parsing the compat string for Imageon to
           figure out the gpu-id and patch level.
@@ -148,6 +152,8 @@ allOf:
                 description: GPU 3D engine clock
               - const: rbbmtimer
                 description: GPU RBBM Timer for Adreno 5xx series
+              - const: rbcpr
+                description: GPU RB CPR clock
           minItems: 2
           maxItems: 7
 
-- 
2.35.1

