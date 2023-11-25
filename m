Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994377F8B5E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 15:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C2E10E0E6;
	Sat, 25 Nov 2023 14:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFA210E240
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5441305cbd1so3678775a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921873; x=1701526673; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oCxJjrmz0z+H04UIqC/ZDHtTQyFYGs6I+ck9k7G4Dco=;
 b=ROqtgS3Tsji/oE3BgFE06L8l6OyL8znSsya5SxKFscHZLTwUeXK3i7oCcrxinjwbtZ
 G6RSoArTtL0pDKSkVAZvY8GeuzWPDiReyyqHluSsrhU9uzwR96KrBmiEJfc/K3lzRd3l
 vv6KWiO3roM0oj5BijY9dIGiY2jC+9FyUa73NnXkeRHV//DQOtEPOKL2GvsjUENYCSwx
 hZIYsbH9x3hCtMPOG382DDQKNu2Dl5S5lWfDajEbuS4GDTTP1qMZ4tMzCwXIagV2eQje
 142nDyLhXdJuk52rRKA1CU3Fe60LNErovdHpaSjBPjbRAz1A+6Xs6DwdruQdwnqru6XE
 Sptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921873; x=1701526673;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCxJjrmz0z+H04UIqC/ZDHtTQyFYGs6I+ck9k7G4Dco=;
 b=cP8IKF+f11ILD0QMJaT9a/1VH11j+K92SALMeZE0Ps8OVWsFiT/kZnbbG3qzhKFdY/
 mjW3bPRnihjJ7IlPPU41QfyZTNP43Rpe92JdhVJV7YfWch/2RZnmBvFOaEwGda0o9rqN
 A9+lvvbIjAT02c2srsc+GFgbqq1oS1kKNuN2d0gPr2uSJrDe9VzhE1g7rQNuELpYQaHW
 cADMA2q6vb3uUSS1iykaSkQTbjx3M36AvlwO2/0jl2wgwq5MOcW+WeTcqCACRklRkwoK
 W5i4HVDvSZ5z2P1HSPzkX1/czUlfUYSqdJ/ObIk3W9xOnKsotlblpHV3RCv6th8wC9CM
 E8Tg==
X-Gm-Message-State: AOJu0Yw1DZBomRn5jWWIij1zVV+0nQ8M75lR684TFH1tDQcK2ynbeaDU
 OZIDmPi4MkWzfPjbb+xUNJtNCw==
X-Google-Smtp-Source: AGHT+IEbr7GDBeTPnW9gDDdo6VkIGH/WLIKWJrPZjcT5euLmhj3AB5FHgBzeyAAMU2jqxkCAgOefqA==
X-Received: by 2002:a17:906:b796:b0:9fe:57b3:bc08 with SMTP id
 dt22-20020a170906b79600b009fe57b3bc08mr4394797ejb.41.1700921873218; 
 Sat, 25 Nov 2023 06:17:53 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:52 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:32 +0100
Subject: [PATCH 04/12] dt-bindings: display: msm: sm8450-mdss: Allow 3
 interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-4-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=865;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=deb9D2Xe1g6rHblNJhukz7PgRHVCdj6e1NcVucThHsI=;
 b=04VTSyTWm5dlypXw+GdRqYQamBFxd0dqxWXQAZG+T+kAWcdfLMeRvfERanmuPSleYxvb1DvOc
 JNDbEQ+SZ00DtKtwDgvwPbS3PZP48Bpj+WwtQ3aYwSNN8E5K2QOT+y7
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

In addition to MDP01, the cpu-cfg interconnect is also necessary.
Allow it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 001b26e65301..e94e8630cc85 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 3
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 3
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.43.0

