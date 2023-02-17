Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E66669A9FF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49F410EF65;
	Fri, 17 Feb 2023 11:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6168410EF65
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:13:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id be32so1070714lfb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hs8Yxp1MVlT0I86oaYY4unW9sTOxwBrv4kqwbTUdvms=;
 b=CGC563MdG5ZK3KHRue7aFJyu4Qnz5uziqhEbG4CsGGHsvLQEojFDL7WA+mLIDUIYhi
 /bFndr3aVqCYYfFvbp+nWjTxYHkp7/r35T07SX4F/p4FWasT9dOMUFDg4Xda1dglXy9F
 PGC48gU7jQdiXLtBlm/U1tejAbRSQIc1GcusXhTSmWJKO8lKbCu7lygQFsA8EkqWasQi
 kmjY8YfAwEoSxdNE0+et+Pr2zriuPlpXO5w5ps4Kd7jerOZ53+45+96+CffC/ZoAyniQ
 GupQVFTR6ctOzUXuh0LryBWoof8+SpejsVhrH8XshLe3J5gkEaNape3WO0jJwMLagK/q
 fxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hs8Yxp1MVlT0I86oaYY4unW9sTOxwBrv4kqwbTUdvms=;
 b=hQ4fq78cY0nG62EqW760Y7/Z17xZj0d2oH22joQ1y0vj2zNfPW+9WziVPVQQJGu1wT
 HSsPZg52KzaVjt+H1+wkii+hw2MFlsBHFrT7cb4vG1/JmGI1cuhAbPBIfYq99deQMZh0
 6EraiZ4umxV6+oKBEPcRgV7FX1w4cQkp6AU34B3Px8m3IlV5pxXKm5SITpzoPemMzLaZ
 ZstDliQqtx2gDXUjEJue206Sp0RGphzi8h9u0ACyrUtInqy0iBR2gF2oz52EYuiw+vJT
 8njGFMf3put3kE+En7Axn45Bp6fFmOb15ULGc0iHTQ8Ohj5HiXyO+PhlKcWOTQxCg3mD
 gO2w==
X-Gm-Message-State: AO0yUKVHZSyqGFFjOlMcbZ34/SHTGSNU8KPbJ1rGpDVo/gRJjW9EYYdV
 KMpMg4zaJCZKO5WdUAUMRs7Ggg==
X-Google-Smtp-Source: AK7set8ZhdFUqbXhgL08rWxQqCGaftiy0CrErLGx8HogZOY2K9jf5KtkaFsV9HvhIdLZFYbGXK9viA==
X-Received: by 2002:a19:5202:0:b0:4cb:430b:c6b with SMTP id
 m2-20020a195202000000b004cb430b0c6bmr172623lfb.29.1676632401630; 
 Fri, 17 Feb 2023 03:13:21 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac250cb000000b004b564e1a4e0sm642683lfm.76.2023.02.17.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:13:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Date: Fri, 17 Feb 2023 12:13:16 +0100
Message-Id: <20230217111316.306241-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217111316.306241-1-konrad.dybcio@linaro.org>
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the DSI autodetection is bound to work correctly on 6115 now,
switch to using the correct per-SoC + generic fallback compatible
combo.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on (and should have been a part of):

https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

v1 -> v2:
- Deprecate the old compatible instead of removing it (Krzysztof)

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..6fd1703e415f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding with separate driver logic, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
-- 
2.39.1

