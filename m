Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE82694560
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957D510E59A;
	Mon, 13 Feb 2023 12:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBC910E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p26so31218531ejx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
 b=eGCWScynR/KATjl4CR1NQ0awa37mNI8v0bJtA/rygcer1I0LVc7i04Jp43z2vUlwgn
 a+ODzt8JJtOMHJOwKcCsq7PmgRM4WcbMAMOhQTU4Ci90i6K301aHcKQZccfvxfyaNlVl
 qdpImCNac1yuuItnpKBJdB6tXjAMeE+rAK9UAEKMKsNuUjIwN5FrnvTlt+JfeE388AzT
 1WMdLj1Yy/arp6lE7YgTtFbdACRVTqZNkLGtqBdxfIyyiH5WVbvZ2iqgvpSSuTpYFMK0
 Rx7E/iMJySn0UCfGQ882aKjZRwOjoh6lAECPD324X5W2V2SMOjomSR8NJ8OIcKr9EB/k
 8PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
 b=w1tMl0j70DbadkdYizX35hia2ihrEXG+Vdy1dwFKdufvHH2xs9Of+xWI5e7/U5U//D
 iFTUL/NK9pX7mrIFFaTyy6XfzsFFpW/lghWnEDHseSsbLvjy4wELlIMzxL4mo/FUzefZ
 frufiHEJVYA0lXaTMcuXNYKqR2PiH9Uq//aAzWQHOXpr/st3R0Xb1ca2XReIiXaH8tP1
 +HMilPpwoc5mnO6rofvTUZbtuzMIV0K1Q3Z7R5ZAGPwFCt1zBjppeOewmi5PgFtg344+
 gqgtkTP9SAZ/klFwSpsstuSspoQsREomCleWMfDJZ2gJkshU+NPRoALSjIrNI4Ztl5HG
 a5/w==
X-Gm-Message-State: AO0yUKUkIe/oVt1oRGzZFz+RSFZ0R9daTGfE2DY4Du4hJYHi/ToPcFOn
 F97vdT9zy9bAVmyaAbe+7K1PCw==
X-Google-Smtp-Source: AK7set+oaFvbn6bdk7MKi3sYaFLAIXKhNo6TsrYTdMaZ19tEGQAs+T1gzlVpdLZijLrJ/9xVXmdmjw==
X-Received: by 2002:a17:906:988b:b0:88c:3a48:715b with SMTP id
 zc11-20020a170906988b00b0088c3a48715bmr26558712ejb.30.1676290239364; 
 Mon, 13 Feb 2023 04:10:39 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
Date: Mon, 13 Feb 2023 13:10:11 +0100
Message-Id: <20230213121012.1768296-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible for the DSI on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..f195530ae964 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

