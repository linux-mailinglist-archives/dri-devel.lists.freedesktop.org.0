Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5764662E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 01:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40D10E450;
	Thu,  8 Dec 2022 00:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5FD10E447
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 00:55:02 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p8so31334189lfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
 b=dcXN8CrIwWj+WhiIr+k4CEInsAx52ZiTtEKU5oKIVxc2m0Oy6WhpOehgibHctHVcPe
 DYzdhAhDj5JG6Qg3RYEy8W6T06IQC3MOwAirjDcicnZMSdlZojzybp1sFvBvsX/RdT9a
 A7uxfuWg3nPriYSn+ZPCOxX+caIWkvto4J4zkM2EKiyVOs7yB1lYRHCtzlVGJvjSboWb
 ezWCnD1Ndo/Y17pW/Nc7PwMx8DEpxFXCwxQTtzg6eAZduWU789oiH6wsD7uHVwy6ClJz
 TViLnME8x6O6dkVyqGMETlcrK6fTc/vM/sObQ7hK9iB0nI90etAaLOTMGThqmYiTqZj4
 9QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
 b=TVU/HrKfJpq78mAgQF01zDhi6358wvSca4jOGYfvux7cyxOobHU5xQgtr/i1ODURsT
 Qf6nyIle1WZGH6NNMiIG/f1aw2HQLIxchjyyAsWVnoMC1FfaI6AchZV2ZxjkFJixaMKo
 ko6uebv9kB5ekaGQX8oG9rVsuV0vGpqUmC7xxJCzyiS++LoX77p804PYmvZf4LjvsDcR
 +CLctPAfjbkxIHABxXnym5nMuvVeAJizxB+W+cs86D0KkhJUKJ9Qtth1wU2G0kyqwUIQ
 Pc9oTkaMuqrlm2VvT8zKix6VQl4bmkfrza5zH34eRUJULosiwHKHpEoOybJN1RE4yWky
 vofg==
X-Gm-Message-State: ANoB5pk1H3N7gIsA3+D4x0YgUyfd52jjDr3y9VhWFZUWfWT1IWAqY+G3
 oDTofYzPRuZBnBtB5OHzJSeyCw==
X-Google-Smtp-Source: AA0mqf69gi2tQR9aBLCUz9azAEFIH0hbuGn9WAjHGko/R2B+a4Gqgt2JoRfRWtg7+JlcT2aKX43k2w==
X-Received: by 2002:a05:6512:12d1:b0:4b5:869f:420a with SMTP id
 p17-20020a05651212d100b004b5869f420amr3049175lfg.353.1670460901051; 
 Wed, 07 Dec 2022 16:55:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:55:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: display/msm: add SoC-specific compats to
 qcom, mdp5.yaml
Date: Thu,  8 Dec 2022 02:54:56 +0200
Message-Id: <20221208005458.328196-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml       | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..a7a97a4c46b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,24 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+            # msm8998 should either use old single-string compat or new
+            # qcom,msm8998-dpu
+              - qcom,apq8084-mdp5
+              - qcom,msm8916-mdp5
+              - qcom,msm8917-mdp5
+              - qcom,msm8953-mdp5
+              - qcom,msm8974-mdp5
+              - qcom,msm8976-mdp5
+              - qcom,msm8994-mdp5
+              - qcom,msm8996-mdp5
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
-- 
2.35.1

