Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B117C6D2E02
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 05:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9749910E2BC;
	Sat,  1 Apr 2023 03:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CDC10E2BC
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 03:58:52 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17683b570b8so25193332fac.13
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 20:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680321532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2U2XsDHoLzpn+9gItu80aF7GJfiGDWT6BnwKoZhBKk=;
 b=P17LuxdfVhQ828hU9BHWbH9FWZHsiFYo/ELy7uKQQC40YXCaOVwca1RwfDs/BlQTJs
 Eg9LzC0pNJCFdOxuaS2VJGj35NpWIRjlL/RcM3Yy1gPN+cdEN0zM3ajbxyAOBavK0byu
 c7NBAGqO6LxR0ba5DRdQI7ASh2kcyc+WeVpDj+utfio8F1k7ldyQnp5hUkmmJm9BlWKa
 iuauG7pQ4ERMd11czXkXk5UhxE3qZeZ7tPP0af9hK0WdDIC5RyO619B+PPWImL6eW/bu
 lRs2i5jM9S/y6m+yrfOAh+9EZWPUIGtmDiSfPf9jhxi5DaEdKivJvBdLNV4U9JFqBmOQ
 /Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680321532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2U2XsDHoLzpn+9gItu80aF7GJfiGDWT6BnwKoZhBKk=;
 b=p9w44os5dc+tgrltNlryqy1HFFO4/BlRnxPtns7tW/Z39Y+/kd3u2eOBb4OkYIOQLk
 e6aYrXAoU1lh2QF35ko+SBT2ZsESkVzV551bRUwytVXdvOzLkC5ylnBj33SMusuPlqCL
 Gy9sBBtDfprcqe9sHRo0gO65WmZ5FKD2otDXlZfUHwdMf9MVZCcdhb6HbE2uLryaYNLI
 IpNCcuz4wrg7HsiQeyWXsFMBnEBNDXOSpHa9XlQdaOrpZiQDCCUOEHjDLl9aC4FRny7E
 ZzLllhoiWemyzu8sjeaF0o33qOeQmLbo5t8ATL/NwfLXe8T7tazRLAHno1FfQl79eBDV
 A8Pw==
X-Gm-Message-State: AAQBX9dFquQ0XevUQnjgmjKE9cfyyIMAmw8uzKO2IqO+Yc7DbzNHQfr3
 2Inz1RgEZL467W/PEZ1i1Q4=
X-Google-Smtp-Source: AKy350YkXdYUmmYhpswBXz+/2z7ssiOIinB0jx2wQCZKq5zKmY7eC7HkeqBQ+BIXkp8JA6MXqUPuYQ==
X-Received: by 2002:a05:6870:560c:b0:17a:d2ab:aeb8 with SMTP id
 m12-20020a056870560c00b0017ad2abaeb8mr17985248oao.33.1680321531834; 
 Fri, 31 Mar 2023 20:58:51 -0700 (PDT)
Received: from heimdal.localdomain ([2804:431:cfec:79f0:85a3:2af2:a6f4:1842])
 by smtp.gmail.com with ESMTPSA id
 ug13-20020a0568714d0d00b001727c3bf124sm1593845oab.31.2023.03.31.20.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 20:58:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: maxim,max98371: DT schema improvement
Date: Sat,  1 Apr 2023 00:57:54 -0300
Message-Id: <20230401035756.856752-1-andremorishita@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
References: <20230331020527.482991-1-andremorishita@gmail.com>
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

Improve Maxim Integrated MAX98371 audio codec bindings DT schema conversion

Signed-off-by: André Morishita <andremorishita@gmail.com>
---
Changes in v2
- Generic node names - codec (Krzysztof)
- Drop label max98371 (Krzysztof)
- Add sound-dai-cells in example (Krzysztof)

 .../devicetree/bindings/sound/max98371.txt    | 17 --------
 .../bindings/sound/maxim,max98371.yaml        | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)
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
index 000000000000..14fba34ef81a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
@@ -0,0 +1,42 @@
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
+        codec@31 {
+            compatible = "maxim,max98371";
+            reg = <0x31>;
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.40.0

