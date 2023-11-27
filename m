Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EC7FA47B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DCE10E2F5;
	Mon, 27 Nov 2023 15:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4B10E367
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:29:05 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54af1daf6a9so5861127a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098944; x=1701703744; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dsjff4lo1TEsrq1gFW/fhWlByzdhetZPF5yWDTWUZEA=;
 b=Le3UUuqh50iJU6w4W+icBr5jHYQ7U/bCBxc1dI9btPmnagkrs8cMk27Wy+gThv4Gun
 GxV+7d0ApnIs7TWl/GMN/lL7+8n+t59UcPGwC2BEsp4wteVs3svi7sumKzBY+sDJrVZ7
 Zloam124Hs6G4fXNOyZWt4Pb9+EaxtLcpjdN/8VYpxIciuVDAvGu5dJGb/kbz4boLe+M
 OpiBLU1/MoUARTQaccydJC5oRcV8eN9S7WWtCzLBHYySLE1PnV/Smwuno9cdOSpaQPsn
 W87gXiWS9vhJwQTyMfBFfvaa22uRd/3MCMZyc00PCgbQyww9jUuYsUQW6eCJEWkJ3qUY
 Lwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098944; x=1701703744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dsjff4lo1TEsrq1gFW/fhWlByzdhetZPF5yWDTWUZEA=;
 b=eWfqOB34hZvbDh6ylefbOJolrtic5mPpVVjXf+nCp+fotxji5TujZpuuag/GeuRQm+
 1OA3LF2UdR+lVQTgoZvpnnE2uKBEhm8Nro9I1XFWLsZXVUNxiy/vmAHq1TjorxlDUXfp
 yCL0597Nr10m2BEor5hhDnuwI+fxPril9H/UryXmhu3iK9ANHEau2JMsZkzd2P/TAxHx
 IK2jYeSrUasPsM1Ppl0vQs9aHniFQbxR8ufeFW/WMfzIyNsAkECzE8KgcguUjsdV+rlY
 h8jOoxmzDmM9BPv383MfAYRmaskTA0ZnLinoD9r5uf454FUvtay2Fqkx1dPc9PsQK2Qb
 UfeQ==
X-Gm-Message-State: AOJu0YzRg5gfVCF/v+4rKD8avu5+0FeU4NqSpSbmnuxEiBJUR6YysE6f
 iXEhgIi1NCsTqHdrtuxtxFjbBg==
X-Google-Smtp-Source: AGHT+IFOyIrlG3K4TKUYS2ME/41gHY9uKSnDmZkZO/xmnu/DRtbRQqQLfmFgD0DWgrRTWqt07Bphiw==
X-Received: by 2002:a05:6402:b08:b0:54b:35f1:905 with SMTP id
 bm8-20020a0564020b0800b0054b35f10905mr5607319edb.3.1701098944044; 
 Mon, 27 Nov 2023 07:29:04 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:29:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:44 +0100
Subject: [PATCH v2 04/12] dt-bindings: firmware: qcom,scm: Allow
 interconnect for everyone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-4-979b28f35e4a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=1156;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ATWzTDawV1rfiW1Rmh2AEVyFtBtlEoO5VeMvQ1CdaLU=;
 b=d2uxm8koLiSmmdjKdjpShjLXryrZ+gjNkqEkIxKGxUdhaPhhQ69YN5mCvINv/crH2NFSPaxwY
 vbIbYzQoWl8CAPM339TI9Ayh67M741P51t4zrDzpIG103JKmvS20sDA
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

Every Qualcomm SoC physically has a "CRYPTO0<->DDR" interconnect lane.
Allow this property to be present, no matter the SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 0613a37a851a..f3a87a8426d0 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -178,21 +178,6 @@ allOf:
           minItems: 3
           maxItems: 3
 
-  # Interconnects
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,scm-qdu1000
-                - qcom,scm-sc8280xp
-                - qcom,scm-sm8450
-                - qcom,scm-sm8550
-    then:
-      properties:
-        interconnects: false
-
   # Interrupts
   - if:
       not:

-- 
2.43.0

