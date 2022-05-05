Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F951C436
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310810E790;
	Thu,  5 May 2022 15:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692EC10E790
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:48:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u3so6677802wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dz2crOFWGnc2tJ+5hQ8HTWioTwYzhB3xpGSgL65wUTY=;
 b=GqeinuOtqa1AEtAicabrscRJxIs3Scd/kwKKyrpshrbaEhyDFuuHVDUT9W0FjGH/O9
 Dzn3F7QwFZ9yUm5LYk7KJPIGzA6iGfQZGrANT/MBD8doRfwQQ9TM9gnFc4ef3A+Ykl99
 HVMn8HKN11pHoAedERmk/JBJwoXydTqvJfIByWYS1Wdm67oy+vXf0t9s3QSEyUAzAYbV
 kv0MVbjlMiO3JrZgfkNZs+5o67kMEW8ka9oCnjpEKkUotqQ4VobwaPHwEsoNRAncRzkZ
 q83vnji0w+UhEoNAhlOEZFEDDROEmoL9/+EqRAt2lpBWx7dPlj7kHW+YfcIJ4vLcf/SJ
 DSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dz2crOFWGnc2tJ+5hQ8HTWioTwYzhB3xpGSgL65wUTY=;
 b=LECxCqIZZfldk1c1KRc5ARkzPOVqfddGaelQH3K/aoX2sVQ6NjMRWjqM6Iiyg2rbfW
 9kGANNfy2p+e57Dh46QOlgI8KRuwDuUfr76T1ICASrTrFA9BURK+BrThiF66sY98e5Jo
 rsvJoErLNqQ5UdSoYdTRI8pTsmlJFTOilGdJvN8WvyIhcokJLY1pI4kCql3clq/KZdgZ
 Xjkep1JJ5v2fNEkpCBsoWf9dAM1LJ2js44GS3WIbp0+Qn+Iap3sr2kCOA4Lq5Y8nFX+l
 TMh0qrKSgO/8fOGtniV7M6jO/CuHPqTGQq7EJ4Bg90Mg5/1NsvelOn549N09gbgRTsqM
 +ipg==
X-Gm-Message-State: AOAM530rdP29TfnCeKU5mRyTCSZR8OegIN1MKeKRfuBTIPJcLVu13kzU
 v6+tNQUFlPzFbllaX6yflNXgIw==
X-Google-Smtp-Source: ABdhPJyhm76mmw60HuLdnLYEnXvHtF5RCkTbMn+Kpn9N0N4Ki2TPnopccaMJ6t3VUM1zDG+1gIrq1w==
X-Received: by 2002:adf:fd4a:0:b0:20a:cee3:5abf with SMTP id
 h10-20020adffd4a000000b0020acee35abfmr21761822wrs.522.1651765688972; 
 Thu, 05 May 2022 08:48:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c14-20020adffb0e000000b0020c6fa5a797sm1518956wrr.91.2022.05.05.08.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 08:48:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: qcom-wled: fix number of addresses
Date: Thu,  5 May 2022 17:47:01 +0200
Message-Id: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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
2.32.0

