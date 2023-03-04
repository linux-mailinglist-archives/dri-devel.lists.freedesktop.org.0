Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45E6AAB02
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 16:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF51892A1;
	Sat,  4 Mar 2023 15:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBFA10E1AB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 15:55:49 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r27so7306870lfe.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677945348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UUfSWCmSqctfdIKxSMclQIa/UdA2xHO3GVwbTIGP+Jw=;
 b=PL4hOCXwcQwhChwJLWuT40JgbydMXX1w1Ok3GV2HcRNUnf8zEduVQ/ZjNa2m8PJtTc
 ntvKxL1jXYvoPFEflMcaOIiVGGXo+Hy2uVPCFAmW0AMcGFv58IzOkAco1KipXGQg0mqv
 h5/bRKwQxiCdTPOb45qWWQm+iKloXx+qcLDPc9PYgbdRZUBWblZalBGwXxCLsI8V6pwB
 rlgh6ZsAeHIQGkmEnM9BR/mUateJU96S6iV1/PFQ2pbG6M99Is17JFnl6WC9a/PmNqc8
 6Wj2Xp6uCCpeU3xJajRTwbaOl3ZHTF03W2hBxVDxCtA15G4USoni4GXQa9GcUQc2crNG
 QG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677945348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUfSWCmSqctfdIKxSMclQIa/UdA2xHO3GVwbTIGP+Jw=;
 b=oAilNInq2wrPLkh8Q84LbBWcjgO33QolCMHFXOU7dGvJ+6utlVK2qxyzmZnKwqlB9I
 lhDrQB6qSKTxlBKeDaU4yOm4jYziUmuFpKsQ4yYY/D5/PNnGyy8QRRQ180fAY1a1RWgi
 V85kUp4lM0W4UJyA7axqX9DVOAttHAy43jXX7YIpLg26TiOWD2U35rNjMpN3nqUbf7Dx
 scoFAoSgs7NN0e5r3cOHpvOJpVDMQYnrMTl0lSrTORz+h+yPV/Rbuq0o0m8muGLGLKcp
 6dfhpod34mjX4zWg2SOvFEa6vv1PM1Z40ObB9jTZM2akszplMktmaIuuH+Y+FTWzdqMt
 S/bQ==
X-Gm-Message-State: AO0yUKU1Np/cFTIv6o7d5mYv5NRi3Gt2GFwFzKXn7GDPUiND1pxd1WKV
 djMex41LcgOCSOJo3ViL99PkGNTma334Mek+yBI=
X-Google-Smtp-Source: AK7set+voqdIxWURE/9hVlo/PHV3DGjojAixNk3U856OsXfzIgpki790/QTv3mY0chnqmCbFMMlI4Q==
X-Received: by 2002:ac2:44cb:0:b0:4b5:a207:8d70 with SMTP id
 d11-20020ac244cb000000b004b5a2078d70mr1400947lfm.5.1677945347847; 
 Sat, 04 Mar 2023 07:55:47 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a19550a000000b004b40c2fccfdsm864128lfe.59.2023.03.04.07.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:55:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 04 Mar 2023 16:55:35 +0100
Subject: [PATCH v3 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
In-Reply-To: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677945343; l=1143;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+hbEivqnmBNoExWXUNGA4lvz7CNdOA406GKFbpznxOI=;
 b=ydR3fv88VhonRdoeqjo/P/BmNkD3Hjtm9lvD2paCBN6qQhef8xWMXJHwtprfDhE1Ur8n9Atfsmr4
 +zHVz7G7CvQfmi+rtosB8Q9ZQLtAr9zDvdNU9gNF2m8p+ZO16iRF
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the DSI autodetection is bound to work correctly on 6115 now,
switch to using the correct per-SoC + generic fallback compatible
combo.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..605b1f654d78 100644
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
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.39.2

