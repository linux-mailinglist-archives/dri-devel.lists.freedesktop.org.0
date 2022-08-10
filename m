Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BC58E616
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 06:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0D8E7703;
	Wed, 10 Aug 2022 04:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262F3E76EE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:13:57 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w28so2165540qtc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 21:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc;
 bh=7Z8E1tRy8DEO4L44K4+rES+Wo27HhEwi3F5Zd1Y62lo=;
 b=Omh2cHOc9YzBsiCv5UIi/fmV5MSwotRu0fgS64CeaZn640zaZByRqtRgW1f8abDe4S
 YgWmwwY6PwlhMaQTBNwnWlqtY4fNBYBGTe5cGKoezSij+hO0fXW+2Fo8I+kJxMTTlH6f
 vEcXI8VOpV6NwveWlSmXvaLHBATKJEL9yFuuyjbGdI1uNzH6MfI/TRh1ejIKEIGGTlPF
 NdZzskbkoT1zHMSiI0pJpujBvXKqE7PgG8CU7uGkpIhBjoip26ix6RBTULQM4z4PV0v6
 sTEjG41ZIlt4dU7gBXtqT63Jk1FovO4eUpzKFxn8fIIP9FBL7+bB+dPwEun79f2BKJ0q
 MMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-message-state:from:to:cc;
 bh=7Z8E1tRy8DEO4L44K4+rES+Wo27HhEwi3F5Zd1Y62lo=;
 b=T5wWREldnpeDeWJ7xWR0b2/6vzBZpgBvE+T+NNE+0Bz6ADh8/LEzVE5FPajH2Qj6U1
 81XnJKNJnVUTJqyzXQ13uXxm6pVfbcArp6RpadVoVLSQYOJsLeozybxOWbMMrvHgCBUt
 8DuIw7FDhlpHtx9DVLQ6HuXVINYEG1bPR7T3R7eNCLb1CnPrhGYtxa+NFm1bhwe+VMtq
 0Zqwak2pH134sc/7hUPc5cSwTksGk8mdlRmftOz8RgoamzgVQpJvvFS+RAfyKjMFa3Wa
 S6UX8u6S5FjdZrnp+EP6X+FPw0OVdYDNREtBO86xrBySWZdSsJ4Y0/5EcSeSHZA87prX
 KaUA==
X-Gm-Message-State: ACgBeo3oJUvKwwOUyOTQdRPmCVOuArLt/599zEB41LLfw+tLXdXzDKgn
 8pBj9bSj2oUcTSKFXsN/+6k=
X-Google-Smtp-Source: AA6agR6waT3oAVnaEr8qa9BZnbHjoNMUkqD1Co1VFcDx22E7UewBgzLHIlEvdmIgk8KAATEoUYGsbQ==
X-Received: by 2002:ac8:5891:0:b0:342:e991:e89b with SMTP id
 t17-20020ac85891000000b00342e991e89bmr17813674qta.406.1660104836808; 
 Tue, 09 Aug 2022 21:13:56 -0700 (PDT)
Received: from localhost.localdomain
 (2603-9001-6802-6005-37b9-aa24-2dc4-90c5.inf6.spectrum.com.
 [2603:9001:6802:6005:37b9:aa24:2dc4:90c5])
 by smtp.gmail.com with ESMTPSA id
 bl9-20020a05620a1a8900b006b905e003a4sm13741422qkb.135.2022.08.09.21.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 21:13:56 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 thierry.reding@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] dt-bindings: panel-simple-dsi: add Tianma TL057FVXP01
Date: Wed, 10 Aug 2022 00:13:53 -0400
Message-Id: <20220810041354.691896-1-julianbraha@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds the bindings for the Tianma TL057FVXP01 DSI panel,
found on the Motorola Moto G6.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v4:
Fixed makefile entry.

v3:
Fixed kconfig dependencies.

v2:
Fixed accidental whitespace deletion.
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 2c00813f5d20..1b3d5e5acefd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -57,6 +57,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
+      - tianma,tl057fvxp01

   reg:
     maxItems: 1
--
2.34.1
