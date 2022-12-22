Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDF654DA7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9096B10E5F7;
	Fri, 23 Dec 2022 08:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8CD10E159
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 12:55:22 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so1757363pjj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/70G/iNRFg0+tqFbgre+zSYvcngTPI1dr+sS/6Z8gg=;
 b=JKAltLDQ3krQAXiX8vfnL7ROx6AVWxgu47kG7d/yv6i/PcLUOmDydXX8GFy0H7/AUo
 rHbbLRBbM5kbCSAE5VE7Q0xVGjFzsQyj7QwPAC1RmBbLdHV42VAd2ZqdRmgF5JMwhrMe
 GM9gtEHX18SQDz2xaMBEs1qA4O6UiFwQSXJK+fepF9E8FKJnZxbg7dl6fVRMYhfiljVX
 nX/jC3qN5dlX4sMnWAa6Z4+YguoeWz7t7OZa2Ct8ckw2nwb67nnH+pozxHCQVK4LMCQs
 ZZimW2gQ84jUJZB+LaQaXpaDkHoaZAHt8IXBTz4tF8hwfIPVEDAxlGy+9LHT7EpicHNB
 S6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/70G/iNRFg0+tqFbgre+zSYvcngTPI1dr+sS/6Z8gg=;
 b=BRlhi/tHVX1Vvsfbkl1LPScHYdxaRgIafMbSxTdm5YlpHB5YwgvqHcVGuknW8VY6f7
 bteKKkiZGyjaY9lSYz0r1zvdFK/zTBSkyadrG4a1Q31SEkR3WvjDeKjSIJxvr6nHqLox
 inPNwaP9BJnyC91RPpw4PBE+YsQUvcsGue2JkYpUtpjMoNsUyRSUtKqyI7fo273GuTCB
 TIxa0B6Xb+Tv6PhDN/Dv4a3PonELF4ZnHF1YECTcCU+s8eG97oMRvApqiWT99/k62fon
 dMNs1VIELrakqbz9d7dKad5tNifiqTpAKv/m+A2D8Qd6S/ZhrAh3zlQIZqtUlBAp3p78
 +/bw==
X-Gm-Message-State: AFqh2kobjhUjOGvRXtfQgjYikPP6vArGJhcNvY90C1pmeGTq6N+Yy26m
 v41ZnlVHhsE0P4eq552Hsvo=
X-Google-Smtp-Source: AMrXdXu+UkvaD+1wradcsdg55khU6E+1KfnZ/StEOvUkENC+h47PnAfvm4EN7g3Z98Nv8lvs2/Hy/A==
X-Received: by 2002:a17:902:b58a:b0:186:def0:66f2 with SMTP id
 a10-20020a170902b58a00b00186def066f2mr5511853pls.11.1671713722425; 
 Thu, 22 Dec 2022 04:55:22 -0800 (PST)
Received: from localhost.localdomain ([45.62.172.3])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a170902e84800b0017849a2b56asm503048plg.46.2022.12.22.04.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 04:55:22 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v3 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Thu, 22 Dec 2022 20:54:41 +0800
Message-Id: <20221222125441.1547-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221222125441.1547-1-lujianhua000@gmail.com>
References: <20221222125441.1547-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kinetic KTZ8866 backlight binding documentation.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
  - Remove "items" between "compatible" and "const: kinetic,ktz8866"
  - Change "additionalProperties" to "unevaluatedProperties"

Changes in v3:
  - Add Krzysztof's R-b

 .../leds/backlight/kinetic,ktz8866.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..c63c21bf69d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,36 @@
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
+    const: kinetic,ktz8866
+
+required:
+  - compatible
+
+unevaluatedProperties: false
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

