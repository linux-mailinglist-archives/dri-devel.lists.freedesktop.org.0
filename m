Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C76C3CCB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7210E235;
	Tue, 21 Mar 2023 21:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DB310E235
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 21:36:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y20so20918755lfj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679434567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
 b=HygJVWLJQYQZzv5qKjvJmDNkHdctvMuXyb5WW+Szi1sbR0fCUv2Tb5kL2qWEFlLjxq
 Onl2baFYfm7n857a0DVCwVyr6TpeVkmg9s8vk14GaL394coBZtbSqRSutIFUdqKGrzuw
 P5YcVMeYFIG5D66Z77S1qRV8busNsX1apl7Gq0Edpdf15NbtTtDNC5um4zP97/fRi1Ct
 2Qr/3UJ9qLRgha30++4X7M/1HO2ApQ3CEsykXpAy+DuJ6gJr6iO5n3R/LNn25nhqi4m6
 Qm1bUbW81MHQUToYOdQ/2zg9UjrMwyCX9MOXxwvh/ygj3MCPSWedvtxaIlE2uA76wpRY
 MD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679434567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
 b=4kflq3AmlHedyVgp1wQvJnXJfh3tIYbjxgXNT9HeL2rN1/WkjfRX3n6Vk3e+rdtPlI
 6wDnMKTZYmO7vh4eZxeZYvXMlBpG2H3COZlTM/DgC8NqewRR13AIDGv1nubcXAw8UyZN
 ZIncAlh6IuCVcgLI8d7ESv5c9p8tqS7w/w6MwXu087tWBwiNWqU3OtHMpuqAlzobDbth
 7aOSECDKL9Fdya/C36e/H18lbLx3a6pdYjnWjSWY6SbroQRumP+rPwBFJJuEykXnLHQu
 Ikr4hL1kjWI2rR5JXDpvMn726ieqbVsZ751drECTSaegkeGjXOi0+jrYyblvbNqGoUTE
 R89A==
X-Gm-Message-State: AO0yUKXUDxIOvsRI7c/AcT9Wx7ep0hr2JeIqdaHNO1JZ24lHiv7s74Zx
 aCB05xT2GhDWCnjNUexoXARdnA==
X-Google-Smtp-Source: AK7set/KwCx7+18m5if4fSBoPJCV6gjU21k1/n3wZtbtG6AVFjcu/qxY4/gwTtP4iZ9QQAPQ+znOBw==
X-Received: by 2002:ac2:5544:0:b0:4e8:3fc7:9483 with SMTP id
 l4-20020ac25544000000b004e83fc79483mr1339983lfk.23.1679434567543; 
 Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
Received: from localhost.localdomain (abym238.neoplus.adsl.tpnet.pl.
 [83.9.32.238]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b40c1f1c70sm2324628lfb.212.2023.03.21.14.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix DSI compatible
Date: Tue, 21 Mar 2023 22:35:56 +0100
Message-Id: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 4d94dbff3054..79a226e4cc6a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -64,7 +64,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8350
+        const: qcom,sm8350-dsi-phy-5nm
 
 unevaluatedProperties: false
 
-- 
2.40.0

