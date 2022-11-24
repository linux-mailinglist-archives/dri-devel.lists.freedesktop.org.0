Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCD636F2E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8693710E675;
	Thu, 24 Nov 2022 00:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCF410E66B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so252890wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=N32F+OR79SQSbdzR9yWva0KCvzcWwerTV8JNMiYs6YGEtMsN2oSR0ESzOTYSJZRjCQ
 oNOZPF4RJP0nGRRwAuWrehizOTxtA5fHf30kEybQSz+3l/WqA07/W88RdUVpT9wBvUFG
 TUG56AkPQO7nkbzZeTkKl1itm7NWKdJE57xXL35iLg0VkgeDPihlrpQb5wua3ubXRfMQ
 3otFhGEi7HQJaZzaLVX+p93EnY6y1ehTvmiISj4f8Wg09ReGDGDu9i4wUio/rnirmNv3
 PIKagl/R+ib9xFiQYHNmgiy+f6B6H1peyk9L9f62q723vqhdDt3kWfGAQ15tAz+/s9Xl
 VjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=ksMsuGmexG3kCKQcgOKfMXsEBJE+f3jGXKvVXK087cdFiDBAWOZAtQusmvsmq21VrV
 f6wCwm8HWUVvHUajYlg5YQvgLDnjq0fXbyK8eWSQxyxPY+rjWhjocI+lWQJg/V5WO8ng
 hECOUiGuPo14uEaTRlgj0xSuTLJA7rRo3xP1Op68ojLMkf6IjqmuEw2Y5UdmCfEzKQNW
 zssS8izK5bSbhBQD7F/lU5lE6Fn9iwSTpKichdopr7oobzgEJkp1j2UrsbYxlddWWpFX
 noIwrS/2in5ZkTQA7qPSDj5VXJd5OteepeqA1vZDl8bbl6eeQH3O5+vjhRO4nixUnd9m
 6Uqg==
X-Gm-Message-State: ANoB5pk1nDGMWUqrpHGVf94I3f2OXrTsXPtxHCXWkzcrNUMnzZOtGvWa
 qxkr2PcgiZuT3II8cmkL9UA/Lw==
X-Google-Smtp-Source: AA0mqf4n6UAjOVx73G5DDWEIyanuAsi+GDm8ViisN1rp1gp8RC3B5/SOI1xrQeyK7p6Q4i2cyQVBmA==
X-Received: by 2002:a5d:4706:0:b0:241:e77b:a81c with SMTP id
 y6-20020a5d4706000000b00241e77ba81cmr4995736wrq.145.1669250888449; 
 Wed, 23 Nov 2022 16:48:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main: Rename qcom,
 dsi-ctrl-6g-qcm2290 to qcom, qcm2290-dsi-ctrl
Date: Thu, 24 Nov 2022 00:47:46 +0000
Message-Id: <20221124004801.361232-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will add in a number of compat strings to dsi-controller-main.yaml in
the format "qcom,socname-dsi-ctrl" convert the currently unused
qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..67d08dc338925 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,qcm2290-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

