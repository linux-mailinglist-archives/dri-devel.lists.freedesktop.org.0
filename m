Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B82652DFA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B6610E442;
	Wed, 21 Dec 2022 08:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8998910E420
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:02:41 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 o31-20020a17090a0a2200b00223fedffb30so1200800pjo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 23:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iLhpvJLe8wUwjMWhjGdcbiLSvV4O6C2uFJ++EfmUmG8=;
 b=ZWhyIykfGczTmN7iY79uBrF+cj5WfVjL/MKp0+3TaG2jXVOlJvJ9e92gGZ4MWjw6of
 l9dpblwzn3TABsiiuhvmhoU3UlbaT9+l6LkP7UdpMxtWPzbr8QOMYjDbrD+U943p3lHi
 VqF/NCLdFt0peRCyMJSqQKFotKsMQxwTUHFndN4f3Y7RojjP9Z8mKTVXec/K995fzOzR
 CqgzaaN5qxydD+A/doTMb+RyoxvQhVpfYbb74Y+xBZSN34kzZDc0QmhKXaPlvI98Izax
 yYu1kI4AS5AX+AlPteOCp2AAZDyDO1Vo1QHkONUOSINTR2ndBL+rokF+KMg1N9tky34C
 8MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLhpvJLe8wUwjMWhjGdcbiLSvV4O6C2uFJ++EfmUmG8=;
 b=XR6l154rKGqhXjV79Er4hrnq0DIB1BmDLQ9WAZKbFrvNR39yQWQy4upOtDxTttKzwq
 6HD/nw80XJiwqUm/Dghg0qldGJU1xSdITBmPgRiSyZlgu8bL19Jvw7cqbtK+e0YjzIDD
 aYg4u/UAClPyu9rxyvbC25M6M7DCBD4IFxZgYIkPlWfBQZYIAAfinXVVJKAV2ceqeRbZ
 wO5ctUhElllmQDrmsSrXJntpeX0OmcZqGxcvUxhGr+qjV97BxrloP0L54sxct0NuquMw
 e+EGnpnMsb8THziKizwlZAqxJGmrI7f5pFuRn93ubqcc2eTMO5BPszNqRTm35bCHxyVN
 gK7w==
X-Gm-Message-State: AFqh2kouDbKQaR+9FYM9iH+XgyjwCCO7Vhg/SWdIESI2160ZvcQMKDWz
 7SjxFO7Iwx1/aOonTGK0wsU=
X-Google-Smtp-Source: AMrXdXtuhzounO8Sea7pU0k8a4F9jEl+j9/DmNWNDZTp4WEhskn10OkAmn5yVWLpiVhqsY8RSI3iww==
X-Received: by 2002:a05:6a20:12ca:b0:ab:e8a7:6137 with SMTP id
 v10-20020a056a2012ca00b000abe8a76137mr1634889pzg.3.1671606161142; 
 Tue, 20 Dec 2022 23:02:41 -0800 (PST)
Received: from localhost.localdomain ([117.189.239.185])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a631f54000000b00476c2180dbcsm9134146pgm.29.2022.12.20.23.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:02:40 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] dt-bindings: leds: backlight: add binding for Kinetic
 KTZ8866 backlight
Date: Wed, 21 Dec 2022 15:02:16 +0800
Message-Id: <20221221070216.17850-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
Cc: devicetree@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for the Kinetic KTZ8866 backlight driver.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../leds/backlight/kinetic,ktz8866.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..7286c3fc7f5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTZ8866 backlight
+
+maintainers:
+  - Jianhua Lu <lujianhua000@gmail.com>
+
+description: |
+  The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks led backlight
+  with dual lcd bias power.
+  https://www.kinet-ic.com/ktz8866/
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      const: kinetic,ktz8866
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "kinetic,ktz8866";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&bl_en_default>;
+    };
-- 
2.38.2

