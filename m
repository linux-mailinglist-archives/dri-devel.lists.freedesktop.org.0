Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969D0699553
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5BD10E180;
	Thu, 16 Feb 2023 13:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227610E180
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:14:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f34so2679817lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 05:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VVwCQxzpAEIpXPHUGXDu/BMLdh/4/iLGwabsMvVeo9s=;
 b=q03UgKpiEoJBmxNezi5NqpijnGwzNYxs5oGEGmO/NHMMDwx4dlrZVRvHQith9AcxGd
 +p0xzN/DvA1NpDiJUqGtbXEbqowlXnSPdVngC1rqUjrXIuoUYon7SYpu1eeC+feaZU/z
 0ES2jtb35DpDGqc/4bYzWGf6RJh/nTfH/jVcAgf2I9pSY1Me5MruXocXGdYMQElgOxgU
 +dWRVe7zZLJgEbuSbbsBTiGO/CONuAVO2mH2xPe0xKkFTzo+hmWlfYALMYfp8f4YCWsy
 TdUcE5xaHrFvih2uLcaqnD5Oc3Wfxdltob/6tIs4IgiuluW2QGH7wqsgGvFwC2HbqBEB
 8jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVwCQxzpAEIpXPHUGXDu/BMLdh/4/iLGwabsMvVeo9s=;
 b=SgwYWuUvSbI7+PhCenpVhNsDQzE7CjqKKTuPiBcZ6R1EIHXveLh+2tPaHCeSEFGM+g
 HCOt+zJpHWhcaluBK01ivdfx8jcLj3blI39hy2nBw8h8y7HuyHjOnE2qawZtWIdm0enV
 R6vpnNvEiJGKPZqRWQ0oz2NNMjF5V1m1jYfvYcvjgpF1uOTp8+2Sai4ZnmXyhk3BqB0Y
 gqi8Zh38p8M/E10SsvgVLUrbkEleTGi9ZuH+0Ljj1tQILB1aypgNw4uVU3w9tF5b9bdC
 75t+lCs+eB/eU0eKvcTB2s1kit4MegtvEB8yyK/xbaqta4LiQ1mV8SZT5fyJJcrlARnD
 m7rQ==
X-Gm-Message-State: AO0yUKVk65XKzgpxS8oldZVB6JwY4WCfPhBP/jyTxniKqiN4nHYmhZX1
 I0IvED6NscrjGQFeoH3x6r4/Xw==
X-Google-Smtp-Source: AK7set9PQdq/g/J4VmXzutAPqIkKGvuAGjNk9zhTJ0J8cTy2tvdj+6cVYtTdkp1c8gaa+9R44kCg4Q==
X-Received: by 2002:a19:f009:0:b0:4b5:b46d:e60 with SMTP id
 p9-20020a19f009000000b004b5b46d0e60mr1786545lfc.27.1676553269112; 
 Thu, 16 Feb 2023 05:14:29 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w7-20020ac25987000000b004d862e9b453sm290306lfn.196.2023.02.16.05.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:14:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm6115-mdss: Fix DSI compatible
Date: Thu, 16 Feb 2023 14:14:26 +0100
Message-Id: <20230216131426.3996378-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..146d3e36d1c9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        items:
+          - const: qcom,sm6115-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
-- 
2.39.1

