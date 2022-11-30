Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6163E143
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 21:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED7310E4DB;
	Wed, 30 Nov 2022 20:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAE910E4D1;
 Wed, 30 Nov 2022 20:10:00 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bn5so22182050ljb.2;
 Wed, 30 Nov 2022 12:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtbcVDOlSSICppU8bmiIzEOVnGi+rn0ffRRtzVm9HYM=;
 b=SZ5d6ev9r09CMO9NZ5TAAqxnvHGHw5iLAi67TfBuDpgAPToHeOTMHEt5FGGuqZ05fK
 tRuD1dhKOrKg467YlYTcyqyqKl8P+nLFsz9TbDbCgMKpRNUOaLm3TNwy0gYYhaq303oa
 joSoJWqcYob1I54np+894tqftUMhE1DfafMji4zK0cp9rQUpGeyKcwpjmBXsaKGeJSnN
 BNdJrA+U1IqpLJICLdJzBIgAHIOKJD2bDf275p+8mbjtK2Z8qrzekDuOrCn/t/WdstNE
 cpkjX3FcYcUmtit8BXo9SjOxJrVkPKoF3t/vL14vr+P7mjCBElZk4r6OdLbGyu/g5uff
 yjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtbcVDOlSSICppU8bmiIzEOVnGi+rn0ffRRtzVm9HYM=;
 b=3vu0jIB/E164gexOw7Q/afxjL9+0577+KGXCqIR3FWZ1/PQ2YctNkJ7HnqPHyTZsZT
 RJzufzqNdMdrZ8GFscpDwuVEg7yAq2Ap/Jw2v3dervkEjTxuNb5B1TfVRe9nmzkgQH98
 NRB+kwiW77YRqj3Uu6QgWFr9wH5kKeMO8nEDMk80OFVxtK1eUWMcBSmMOHLjsR9NCl2Z
 AaVYWuKF02Rc3HBS/Y7wvMFIVVKqAx9M1xwe4lXzd9KSTkae0NqeN4MTL/Hq7LP1CfZR
 9EC+eCCyoU/PI2mL7jv3faIVXJsLXSSp5IWJKlYo+j/CxieCzdqgLI7ZQYXvm8h8o/8J
 PWOA==
X-Gm-Message-State: ANoB5pmDPJxxf/QUXU1hPtTPmlNga8JQ7qps90DBsw/LB4YLMOv+3Rpg
 Sa0qCjqtdrrpm6q72wpExlM=
X-Google-Smtp-Source: AA0mqf7CPPdhD9/47NvmpJGuRSGX1fRLAxNTyYeYNqwuRejlvC9chRe92gvY63/gfDu3dgJIVFL30w==
X-Received: by 2002:a2e:93d7:0:b0:279:7294:5e42 with SMTP id
 p23-20020a2e93d7000000b0027972945e42mr13933762ljh.81.1669838998761; 
 Wed, 30 Nov 2022 12:09:58 -0800 (PST)
Received: from localhost.localdomain (ccy110.neoplus.adsl.tpnet.pl.
 [83.30.148.110]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056512201900b004b4e9580b1asm369754lfb.66.2022.11.30.12.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 12:09:58 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH v2 01/12] dt-bindings: display: msm: Rename mdss node name in
 example
Date: Wed, 30 Nov 2022 21:09:39 +0100
Message-Id: <20221130200950.144618-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200950.144618-1-a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow other YAMLs and replace mdss name into display-subystem.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index d6f043a4b08d..4795e13c7b59 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -72,7 +72,7 @@ examples:
     #include <dt-bindings/interconnect/qcom,qcm2290.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss@5e00000 {
+    display-subsystem@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
         compatible = "qcom,qcm2290-mdss";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index a86d7f53fa84..886858ef6700 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -62,7 +62,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
-    mdss@5e00000 {
+    display-subsystem@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
         compatible = "qcom,sm6115-mdss";
-- 
2.25.1

