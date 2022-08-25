Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9255A112C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0F10E1DE;
	Thu, 25 Aug 2022 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFB710E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:54:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bt10so15131536lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EOx+15ISuVM78YfbcntTjxV0FVrXSMFcqt6tM497CRo=;
 b=yHP+BN/UKDYtDzYiq/rIXsIA18QX/NrZzsC/CPWwBgG5EYw9zcr1Hqre9vwCG5qBaZ
 l/WruHi0u2t/doB0slX0BRaM2q+F8Uzu5G+D9dEkoVwUQjxa7EHYXsNUkXiUIsBFQvbK
 MpWkZQZM02eStdniO3G14wGL/qxvf7RnFDfip2PHstqL7ii6tiX4wcQxz+w3NUZm39Ud
 2y4fZW3FhbHNBZROFpKRWESv+U/bKsGF7x3NK+C+6Nv3UFvZN6imHw5TujfY22f8Jirv
 YKQOCswFojEbNcErt+Ju+SSUnn9LJBC8jL45Tts0INAEq0s3ypoAa5k/qmwW8kDPFbvR
 GzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EOx+15ISuVM78YfbcntTjxV0FVrXSMFcqt6tM497CRo=;
 b=00FC2aVdWekj2j9fDcb04og1FlwKSSmwsmy8QRmn2cy7sXcLcoU07rAvaMZaqpcoCl
 YfnT2KOygnEpWSbji8gaaXVAbVblr8kX6F2iSpiwlCz2S1YCfHeHyLsLKmbNI8x16FAN
 /RF4i66nVYrZ66A02ZuEiqKcZ29M0NMO7gV4lb58o/B96EEi1zCteVKWC9puNBe9Q+4U
 /rcyULUpJRc20+jXh5SymvMERDCM3cZ6dw9+rbSawvXQMo0/N96Ej3qCoF9DButeM07U
 gzpjKRxivd7EYto0atUyjH/4dc6FwDU6Y7kbIRdoPUWhGbwajgofMfJ4pS1PNO/v6kj2
 ftow==
X-Gm-Message-State: ACgBeo2BrxofuZV4GPPCf7y6ubvx2BWdUH10AxTLo9Jj4/u1GGJyIJ0Z
 mWdjjctQMyH/HOLKOsMSYZUDMQ==
X-Google-Smtp-Source: AA6agR6BP1BgBSeSUEslZV2i7sVqW03Iw1CWgpxNG11S8Ggo1zhlJ2LC3F/gYAgRr4rC3hZIjeGYdA==
X-Received: by 2002:a05:6512:681:b0:489:d509:e076 with SMTP id
 t1-20020a056512068100b00489d509e076mr1279352lfe.618.1661432054902; 
 Thu, 25 Aug 2022 05:54:14 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512370e00b00492e3a8366esm494304lfr.9.2022.08.25.05.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 05:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND - dt 2/2] dt-bindings: leds: qcom-wled: fix number of
 addresses
Date: Thu, 25 Aug 2022 15:54:10 +0300
Message-Id: <20220825125410.232377-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
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

