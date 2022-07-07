Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268A56AD89
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526EB11B60A;
	Thu,  7 Jul 2022 21:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090111A864
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s14so23856073ljs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
 b=D3idN/ahpbAGCpkBL2rzgaEyQ1TIrb1+uPATnXA2dqwS8zUPdqYqe4CPzf1a3Z7AH6
 efTjks/bwKfxavNw8+z2KSteIFR9KodVqjk+zSzps7jbYdJh4OCF9OITA80xsjcYeqn5
 bPm39Et/XN0vGI1kgnFeJlgx4hT0CKt8jQWkIjUL+PFUWzlcJyfc455cdMH46UhZMGir
 cziZp5RhdQaFUHPaei/WbNnP9I3tVbZiZCvRV7Am5HC2ltPDhseamHHO++jyXH++5EDz
 K5Uu/E4rs8cow2D6MT3xTBUj5O/dn6e/4JsAI7V5X0ReuRbLYlAEPbSsynQzPyu1tbqo
 Sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
 b=hmLtPzIT11VkSLptvTEuie/KtFQoro+1WVvmS5Nq1IQxJHT+BLrL5XVlvkSk/DAleX
 68z+NY9WP65w4foEi8tFQCvamwbOi9fN4dCZCPyjdKCliN5goMMHhOTSeGB3myzkpFYr
 JuUO5XPdTRw2WdRixbXe1J0tfLs6I1J/hKBdcfWH6i5vpJKIkCgAZFqEwG+7n0Up3ZNQ
 0CGyDcMjzP4Bg++z2K/WpiL97prYLt7j1FEsQKkSPa1zpxDTZ6DIcpxsXTf+18Z/5ADW
 iSHP9sLQGx8H5kxfjMuy/7y6eME7JfJ6roe+3TBWv08L5cKd5yQN6UjfUZQ671/QNusn
 ZZcg==
X-Gm-Message-State: AJIora9ENinzJm9gqQqdaZw3qI/3ONW2GVEBvQIvmd5Ub/SykiQAYTgb
 O+BPrBPcu9Ds88Be37gMyqTALA==
X-Google-Smtp-Source: AGRyM1sacladqzbG8GlUA/pcU7R2qRjDGR2pawi6m/WmFWatggQdqeMK61Fa9aR5YjMaV1FMKOVW1A==
X-Received: by 2002:a2e:96c1:0:b0:258:e8ec:3889 with SMTP id
 d1-20020a2e96c1000000b00258e8ec3889mr33145ljj.6.1657229526635; 
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Date: Fri,  8 Jul 2022 00:31:56 +0300
Message-Id: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The p1 region was probably added by mistake, none of the DTS files
provides one (and the driver source code also doesn't use one). Drop it
now.

Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..d6bbe58ef9e8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,7 +29,6 @@ properties:
       - description: aux register block
       - description: link register block
       - description: p0 register block
-      - description: p1 register block
 
   interrupts:
     maxItems: 1
-- 
2.35.1

