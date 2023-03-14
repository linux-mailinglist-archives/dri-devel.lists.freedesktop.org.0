Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870826B9304
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E315510E7A6;
	Tue, 14 Mar 2023 12:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AB410E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x17so3600080lfu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796062;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RWw370fgLD0HuRvp3mvzxHwlUz7uiZNuT1LLG7WatHE=;
 b=BR8ArhoapVcMZY0cxumbwhT+4XFfjagIBWxWW7+ZT77+kP39rOZ4tZVylbD1D10w+Q
 bGEfqWNKHW1IPM9CpeRIVNdBZVv6HpuUAXTvPlrFm4rexBJZSFfBr78zsdDJjkESwLCq
 X7jTQphjo/TZ6ktmsE9Dfqgo5nLTUW8eMdaACXn1rYqw3tu+6a06udcObap9xDEvetil
 Yt2xJNhb7/12kt6pAHYqi32iAGAwrRlX5bAmZffMKrcJI5rFhf/x82q7jotQRocFtiL/
 8eXKBXD1TcKXxhcqoVPBJJF04CrPxNua6rL9HfXNbyYRRvs/GppEu6Fq+mfPG9jsrQVJ
 ilpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796062;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWw370fgLD0HuRvp3mvzxHwlUz7uiZNuT1LLG7WatHE=;
 b=m4UAMuV/Sk7M9/5MgYiddNgLVH3GXgfajjCB9KJ5gG7iAdSPvXSrshBHj5ikAkfP0K
 VdLIUrrPItq30rCqL6aZ0oPcqQq5IDIdyL/Jp+YDkkdNsnZz6sx1zWLmwyid43aNBIiP
 ZsHTklrV/WXiC1B32jLRLIQ5KxF25mi0vGMosSXj9sIgnEo3nFDtDIOdvec0UBljSSWH
 lXaStDCgoa51zXZGg4XZi00iM8GbaOzzZ/rl/GSDTEdVZ45mAlghsDu011KNzonafFtI
 ChYpeZVNVTaXYxZeHXD3GhvzttOFWvbJOrGcNzLl0fP1RSJ6Q6ABBnKSYMgWWtfkEXSI
 1l/Q==
X-Gm-Message-State: AO0yUKWXF3NxJNvmgLvMhdjRbtqLg37p8CRH7MHhunWxKF6Z1KuZ559p
 EoouPM9z8BOOGNQe7rfKnbaPmw==
X-Google-Smtp-Source: AK7set+172hSpy52PLzeDpjRg5xVEmg74JjZc1Tx+uPWqEXPab7FQ1Uhtw85j7Tiwx/TkZDOfqo4jg==
X-Received: by 2002:a05:6512:21c2:b0:4dd:a785:83aa with SMTP id
 d2-20020a05651221c200b004dda78583aamr622076lft.31.1678796062249; 
 Tue, 14 Mar 2023 05:14:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:46 +0100
Subject: [PATCH v4 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-8-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=1205;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1EfelHpNhZt1wPf/IjMVjhdrSdK64CK4dz3kGi3pPQM=;
 b=okBWwdgQUh8QE+PTDW404ps/EZPQpW+e2juB8VF46sCJW23XqUwNzrji/vbQ6+8M3/zhirNWv8uQ
 9XvQ1DHWD7rj0uCKWdYDtlOQZwfr07hGb/0Ec5qoo8PWjvJ/0f6A
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..94f4cdf88c95 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -34,7 +34,7 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

