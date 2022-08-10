Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3095D58E5BF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 05:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAC28BAF7;
	Wed, 10 Aug 2022 03:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618B0E663F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:38 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10edfa2d57dso16479102fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
 b=wZnC4appiqNUEiQGmLWSwEltHJUt+9QDq46haOzM+ed0GT2SVOeWxlwCGYGOAAr9Ly
 u4WzjVgE6vTJI3VlWMbdo8iq5hE8Tsu4wUoWaO3m0PoSJoQ1EfYGIdUbtZIY02vB4t29
 1z9Gs1IwzuzpKJ9jGqIXWKqCzFPLzu+wC1Nz+fdIAytGCkyyjWsQRZeBib7Ra95+sFac
 eyhw9vzbJmqEqy2hZ7XtmYSKxDvOcVlAVFs04yDetvqqnsX3YIJ1a63zAhb6/SzYah0F
 GexPGZ/Am0SsnZQ/OQTN/62QJgzI9BJ+KEtwl/pNKxM8cjzOY5pCXvVOOm3ExIjIhjL/
 FBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
 b=0VbNU+aJjd0k5UrkGSEGFHpjCTnXJ7JUzysEmhN7UV8s0l3HjSxArVmOLkwxtFRLRd
 ozYrPp2EAeFeo1q5+uaVBHWs1fpIF/ATQMSUGQEOnJl47j5U6WeOVst9tzwQPInFWeE/
 mYa4H2I+GcYrTzvBewDAghvYe2DNWI9TtXx+Wq7zDMR/ozHxxFe7QkSnBoruTETfTY8w
 PlsRPHwJFjcahfVPy0zACddEhUIndowIQSEOqqLsPFKaQU58NU7Ve8Jx3Oz0kDyokXVm
 ZBmx+CrLiXM5ia85sPov23LqLPf4cGB+wocYfEeHCdY0Ggqw+xjGwBvT/SpZogx2ujv/
 zGPQ==
X-Gm-Message-State: ACgBeo3IVTnnznnfe0XsnwehXNp4fgfZLkrtzCe6kTDHMSufyyEeYYpz
 6/BlyLCnwxEIdO+GaRfZFkJL0w==
X-Google-Smtp-Source: AA6agR5Fu2RRDv1UHVCEFfelP9y7yZj87HztXn4G3e065ctAs40MSp5H03fK49MziNwWhwN8ZkUhCg==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id
 f41-20020a05687089a900b00101d81de970mr651827oaq.43.1660103257025; 
 Tue, 09 Aug 2022 20:47:37 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:36 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
Date: Tue,  9 Aug 2022 20:50:07 -0700
Message-Id: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
Qualcomm SDM845 and SC8280XP platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..90f9302d1731 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -16,11 +16,14 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sdm845-dp
       - qcom,sc7180-dp
       - qcom,sc7280-dp
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sc8280xp-dp
+      - qcom,sc8280xp-edp
       - qcom,sm8350-dp
 
   reg:
-- 
2.35.1

