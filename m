Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA06D1575
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 04:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C910E0CF;
	Fri, 31 Mar 2023 02:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811810E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:06:50 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17aeb49429eso21803452fac.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 19:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680228410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pvM334uaDN62u5CXBwDPRhi1Ml5Rc/k9LOkZNPsfO9U=;
 b=OUha1buX9Iya3CjbsVobPGHSOMWmpDrZzKS4TD3RmS+O87YOx/sthAzdlI6Mpq6c2x
 uSD9IFLRH4VFtCWCAxURoqL0IG4NSpM4EueoLgGiZTipQjByWnk4Qo/h02rFOlYOzGsM
 HSviKdKTOdMu8KOcJV4AD4hZJS4OPmpsBKvppGrEIYPVUu0b3QX5IoLc4OzGLkHSwBx5
 rT2xr3XB3hifVhNdNG0LwszasFVR9vR7eO/1p+cHFUJwYkK7XNnRsDcsn/WFhbO959yU
 O5C8Uf+LWjM4gkF1CM4NBLcbFgJPAWMudClmTTablSrajbt1Bc3O7TLUL7Z9qyEmrDTy
 fyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680228410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvM334uaDN62u5CXBwDPRhi1Ml5Rc/k9LOkZNPsfO9U=;
 b=qeIkx4qbI9Ckup+qWxXCl2fWY9sePT3SalRaY3JdZziTg9y7xdY4D7LxkMS4zEf9PI
 Pagh/gvLUfKPeR8gjYCls2+4mPV3JmLwn3w7yhqrt9cmXHkidZdjx5o0XO+Zfvt1iQqq
 Ytllc7YCb3abqoIhcmFwhCfns2rU/Xjvu8wUQ0mSTqs4bmHEoatgXXbrkhh884nws0bh
 gE8jqYKY9sCLlzXBz9pKbcDy9694mQq1jwnUuRJ2ksZBSQkr5vzNNg+c3TNt5AUCqcFk
 1MqorQtYKTutsfNs5/zY2R8YYxtdvsM6Xq/lDppyKfWTE5gMLsdkEPH4KU/YlTzIn9o7
 OImA==
X-Gm-Message-State: AO0yUKUxzxA+xWbcoGUZYkF0IC2S+Vrn3y3cO6U2obDt5F9IQTnAufbI
 T5FHL/fRTrUl3ExWDST3k8Y=
X-Google-Smtp-Source: AK7set9SVdoBv4Z6z/5U2LbxssB3wFAqZk8t0GCibw/+1rXEmQsRBHijgZAq1yj9AKxTzVChxWYNVA==
X-Received: by 2002:a05:6870:3396:b0:177:c4c1:db8a with SMTP id
 w22-20020a056870339600b00177c4c1db8amr15470422oae.0.1680228409807; 
 Thu, 30 Mar 2023 19:06:49 -0700 (PDT)
Received: from heimdal.localdomain ([2804:431:cfec:20b3:d050:3c82:2c34:f704])
 by smtp.gmail.com with ESMTPSA id
 yv2-20020a05687c228200b0016e8726f0d4sm548177oab.3.2023.03.30.19.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 19:06:49 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Date: Thu, 30 Mar 2023 23:05:25 -0300
Message-Id: <20230331020527.482991-1-andremorishita@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mairacanal@riseup.net, daniel.baluta@nxp.com,
 =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.

Signed-off-by: André Morishita <andremorishita@gmail.com>
---
 .../devicetree/bindings/sound/max98371.txt    | 17 --------
 .../bindings/sound/maxim,max98371.yaml        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98371.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98371.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98371.txt b/Documentation/devicetree/bindings/sound/max98371.txt
deleted file mode 100644
index 8b2b2704b574..000000000000
--- a/Documentation/devicetree/bindings/sound/max98371.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-max98371 codec
-
-This device supports I2C mode only.
-
-Required properties:
-
-- compatible : "maxim,max98371"
-- reg : The chip select number on the I2C bus
-
-Example:
-
-&i2c {
-	max98371: max98371@31 {
-		compatible = "maxim,max98371";
-		reg = <0x31>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98371.yaml b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
new file mode 100644
index 000000000000..df0262473399
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98371.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX98371 audio codec
+
+maintainers:
+  - anish kumar <yesanishhere@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: maxim,max98371
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        max98371: max98371@31 {
+            compatible = "maxim,max98371";
+            reg = <0x31>;
+        };
+    };
-- 
2.40.0

