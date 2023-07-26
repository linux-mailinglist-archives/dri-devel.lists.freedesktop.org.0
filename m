Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED8763785
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 15:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0344310E47C;
	Wed, 26 Jul 2023 13:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BA110E199
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:27:28 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso1048916b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690378047; x=1690982847;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8lxc77XWTDPTeWKbOVls7trvqC1maeRESKQ7JlGBAVk=;
 b=tzlf/K6lA2nbzCK73P1REKEDFjco9nWhyDMS8OpMrVB0n5mWFKtD++dNg2lByeu7m0
 d/zJYAKzFrMg3vWf5aU7sOnjhvN5QHBX0y7FQ9UYQgnKfr9xuvMsFHiYG2QDmHD7k+8q
 wvw/MD+Gf1t21AqrcccEsCI6otUTJ+XKxBvHL62rhWbUpKt55bqx0UCVcaZlogJ81HYp
 Tlhm31L8wPRXG3h53U/ofo4BB5wXwgYOqIGcj+szBaXFhZSG9s6mA/xAfsKweCycf+hG
 V4WdnEeL5ZPUsyVYERCtTl0/y3YymEbtIwL0xCguLZsY5qIrXdFrHUa1iF3dlgHOdJRZ
 vCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690378047; x=1690982847;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lxc77XWTDPTeWKbOVls7trvqC1maeRESKQ7JlGBAVk=;
 b=GoPOzzrOQgWcwBV+mLrp5t2jDSrhL2AJZrP7x+wcguJfsAWNMMmNyj9bjxIjzcaeyg
 9Z9lTk0iChE2ccpFS48dfQVHuurmu/W5RF574pWx1/x01M2ZtqsUmo2BwklKiP7Eo8Ct
 Zbg9jteQwmyfkL1eg/Zw0PHVfPGqQ8r95AfXBSe8KNJyoNlCiFvoZimPdZ+41EDymXo/
 7Z5g64svSxNaSWzoDahc0qNFz94or3a+ynhenLT0XauuVbq3sKTLFwCR9/Y3clcMHdWX
 eT7fww5/n5ivpPTwTCbME5cR/wWVBmv3nYK67QMJpvPAFMpjJebq1fj2nBvTQXSg/P4q
 RwDA==
X-Gm-Message-State: ABy/qLYyl0zGpx09DVsG+c6p3a14OgZm8M+wkFsMdpCFhnRB3nBDgRXv
 4dIE4Saw7+Oe/SJ8UWKrw9bIqw==
X-Google-Smtp-Source: APBJJlEkGaXvYl0Z4D2WNxjIzaFmZ0xG0IQslvweGeXL3npbZc6MEWn92JA3fL7KJSzJy2bGF2OmTQ==
X-Received: by 2002:a05:6a00:2d09:b0:667:e17e:85c1 with SMTP id
 fa9-20020a056a002d0900b00667e17e85c1mr2058353pfb.1.1690378047425; 
 Wed, 26 Jul 2023 06:27:27 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b00682ba300cd1sm11485918pfu.29.2023.07.26.06.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:27:26 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH v6 1/2] dt-bindings: display/msm: mdss-common: add
 memory-region property
Date: Wed, 26 Jul 2023 18:57:18 +0530
Message-Id: <20230726132719.2117369-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
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
Cc: dt <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add and document the reserved memory region property in the
mdss-common schema.

For now (sdm845-db845c), it points to a framebuffer memory
region reserved by the bootloader for splash screen.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v6: Re-sending with review and ack tags. Ideally this
    dt-binding patch should be marked for stable as well,
    like the follow-up sdm845-db845c.dts patch in the series
    but it can't be cherry picked cleanly on older LTS
    versions. I can do it separately if it is required.

v5: Moving the dt-binding to mdss-common schema with
    updated commit message and property description.

v4: Adding this new dt-binding patch, in qcom,sdm845-mdss
    schema, in the v4 of the follow-up patch for
    sdm845-db845c.
    https://lore.kernel.org/lkml/20230712130215.666924-2-amit.pundir@linaro.org/

 .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..84ed2757ded5 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,12 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
 required:
   - reg
   - reg-names
-- 
2.25.1

