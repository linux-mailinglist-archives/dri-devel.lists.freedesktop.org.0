Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1DB57BB7C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD68A8FA2F;
	Wed, 20 Jul 2022 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFCB8F95A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 16:37:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t1so31084463lft.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kp8iCiN1Lxt5s2kzJFzxbS/dwJfrlU9B2NVr6P7nJY4=;
 b=cw76WH5XkBndt8XkuIVyL5Z10zdQ9KgHP3PcvXoTiEC3ELZK8dHW/cgRWjpusfaNAP
 yr2HqqYHUgj1WnflMsZa+nxp5qe8ACM2Ao4tsH4SS8NpGRvCJmD3c3XMcSmZoa5gTRV6
 FjF9mG5o4Yui7CqgkyMTD88qrKxhaqwDCbQZrcR/4+kCVj+G3EJ/CfYeiLW2aBFlyVbU
 ffFnGFK9K9hfUS60ffYlTfbs/LSvvZrYWtYzeatqJO3tTxCdQWV4ozrBljSo+pgfrddy
 lKyaQA4mxWe/AYbAYWemtU8efbW921gTgT1oKA/kcWdf0HkrNTVkUmxsDnvXfA7DGrHR
 oZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kp8iCiN1Lxt5s2kzJFzxbS/dwJfrlU9B2NVr6P7nJY4=;
 b=d3ayl5mn6w50KfkE1cZ6f+HKjRQTFhgfIkAepaAbgK5jflk0N0s8bZOwtoF3Z5LKkZ
 8D/RgLgjZfkMnxPJWQJjq/5W8PhKxjcyPcZZ/yB3SOwDlfG8ZmrC34p9yF1g3oV6ZE88
 HrC1B05NSgl3kuSpJ6h9e/hDnM0cg5RbfWKUaqxwY8tLKVPypUNLDzP/HFzAcjBThXv6
 UmSs7ETBN9cChhWLOi5Zp79FnjN0Bbk2Kn2nYIarPX+H+ctjfnAsz/tYd15DWfiUC0+b
 J/fFEWirHMEdC3SoXMx4WR+/q931jzBPa4jTBIuxb4L7XUjndTCLj+A38G5XpVZiGLqG
 NKgA==
X-Gm-Message-State: AJIora9e7TwgY6N79e9uHww9MypUDZK5vrIdm2uQMPFXNOEuGZExtThl
 eGKs5NWYbTIPvN5yfYeuTkLg+A==
X-Google-Smtp-Source: AGRyM1u7LbBSTLIdP8XMWj8CWDvGif493sK4UA0Un1erHq3+g9Xxi6JABJUt6y0RHWcWjfA3cBeN+w==
X-Received: by 2002:a19:dc06:0:b0:48a:103a:82ee with SMTP id
 t6-20020a19dc06000000b0048a103a82eemr19275725lfg.87.1658335050731; 
 Wed, 20 Jul 2022 09:37:30 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
 by smtp.gmail.com with ESMTPSA id
 27-20020ac25f5b000000b0047255d210e4sm3913409lfz.19.2022.07.20.09.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 09:37:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of addresses
Date: Wed, 20 Jul 2022 18:37:20 +0200
Message-Id: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
also fixes dtbs_check warnings like:

  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 5d66c3e4def5..4c15693f7a01 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -26,7 +26,8 @@ properties:
       - qcom,pm8150l-wled
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-brightness:
     description: |
@@ -171,6 +172,9 @@ allOf:
 
     then:
       properties:
+        reg:
+          maxItems: 1
+
         qcom,current-boost-limit:
           enum: [ 105, 385, 525, 805, 980, 1260, 1400, 1680 ]
           default: 805
@@ -189,6 +193,9 @@ allOf:
 
     else:
       properties:
+        reg:
+          minItems: 2
+
         qcom,current-boost-limit:
           enum: [ 105, 280, 450, 620, 970, 1150, 1300, 1500 ]
           default: 970
-- 
2.34.1

