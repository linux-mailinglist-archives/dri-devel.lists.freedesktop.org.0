Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDBBCC5FE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C14210EB9B;
	Fri, 10 Oct 2025 09:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Y6HL/dLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70CA10EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 09:38:07 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-3322e63602eso2623477a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1760089087; x=1760693887; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNBktTywzCZ2Vs1/6SHXtaO1WSRmT9/nVppLgw97l1M=;
 b=Y6HL/dLUduJepP8exdPxKhpzVEL7x9Je6IcBW1Rl2GoTNY1J6CNr4ijh1XriuY4Ai2
 xCBtX6F+t5rUZT57DB9HCeYdDrL5rXJig8B7Sey8R3i7nb6nYxmp9wmrtsrhNCd309mx
 /50o7v/HhlY5j2OfZYAyswnWkbfs9iIXbBSc5xu7J4dgW6LqLrJ1Me73JJEUW4+RrM8n
 4begxF3oBAcZYN0Rkn+WABsWNlZG9SvsT2+3XyeOprPi22RmFOWSvsOH8NkJLP5KR19O
 MJEFdC+3aA2LAILXGsnZLwvVMMgXUz4SxH6DJiAW86GLtMikQiczk4S9in9SEFAXvaZq
 FUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760089087; x=1760693887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tNBktTywzCZ2Vs1/6SHXtaO1WSRmT9/nVppLgw97l1M=;
 b=UP4zmPrEtQQlCFV9SHtpcFcLWzFQc+oL8sb+5iQVcGLxP6NrBYHcf/5fjsZTV8U5Dh
 lqkqZM58hX8bRAk3i2BDgVh95+nelMebhNSLrTZXLRGAXZ5n3mpuMsu83nHA8Myyn7Uk
 Wy4DtzpVSY3wHBRe/gjVX+eGpG+4eYwaS42fI3aSBSvnocW5qDt5N/YDz6qZA15ahCW2
 GH5m5Sb2eM0GEIklIM8XXe121DVQEsHXrjuAdMtOYD+93HrY6HYgYTXIE4Rw3jXzFNJm
 fJzG7/NS1yoCRtzX3lCvlYt5CXQ4bMt0DDverhI9X9QAUBC1dJhovGoagmUEqX+v6kv3
 rbDg==
X-Gm-Message-State: AOJu0YylJwAqcQZh40fKZ2ankWitlqHFbJfD5oAbePLGrJ9YniJXLpgP
 EtK2Y7BAvticFoiAPmMccclTYmURd8NGraTkdRoABZYIByM60/RyNuZU334jPc5p3yk=
X-Gm-Gg: ASbGncvDMcFdTC0r5gNv28tO3NN7vhWbl9FBBGel/ZCqJUb1QiKJuYYgWmm4xNgQPhy
 7nmPEFkpdm1+8ivdf7jMFs/45avRZvI/cxTiAXJLu4MzXDDrR7jsJm9ztXvmtpG+cx0ytu5RHu1
 /XtFrEHAFwr5KObyngIpSU1hvHfvWm7rCsfG1N5UTZJ5W0raVULIhu48GRdwfeVFdVUT5pi63Z5
 ybj5ncRBbtQeXnW3kiFplUbri4/MRtXpCKUOwjOBkvftJxdGmphXqM6xMgZH0OGVzfSggvIyio6
 TLYzyFmP/iQamfge2IhAWZksqwM7uXRs2mWfB8dy6PLXP6N6Sndv1dOWC8WEctiPyDeykxChzz5
 23O/SvCgorKl5L+dbR98lF3qGl/kR3dzlEPBzRJ5EavKfFv3YkSjHV5Q0DRQYEjTo+Qifie64ua
 dXIPqVBRUGSJyn
X-Google-Smtp-Source: AGHT+IH/fzKW7eF2Afua4pv/8lqMzHjqilOfUmkLawKp1cJrHz5MTNsghAnJ1QN3bQCeG5scPV4WBQ==
X-Received: by 2002:a17:90b:33d1:b0:339:d1f0:c740 with SMTP id
 98e67ed59e1d1-33b51149673mr14839792a91.1.1760089087303; 
 Fri, 10 Oct 2025 02:38:07 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61a392cdsm2668196a91.7.2025.10.10.02.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 02:38:06 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00
 panel
Date: Fri, 10 Oct 2025 17:37:50 +0800
Message-Id: <20251010093751.2793492-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com>
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

Add device tree bindings for the Tianma TL121BVMS07-00 12.1-inch
MIPI-DSI TFT LCD panel. The panel is based on the Ilitek IL79900A
controller.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../display/panel/ilitek,il79900a.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
new file mode 100644
index 000000000000..a723f179efdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,il79900a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek IL79900a based MIPI-DSI panels
+
+maintainers:
+  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tianma,il79900a
+      - const: ilitek,il79900a
+
+  reg: true
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the enable pin
+
+  avdd-supply:
+    description: Positive analog voltage supply (AVDD)
+
+  avee-supply:
+    description: Negative analog voltage supply (AVEE)
+
+  pp1800-supply:
+    description: 1.8V logic voltage supply
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - avdd-supply
+  - avee-supply
+  - pp1800-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "tianma,il79900a", "ilitek,il79900a";
+            reg = <0>;
+            enable-gpios = <&pio 25 0>;
+            avdd-supply = <&reg_avdd>;
+            avee-supply = <&reg_avee>;
+            pp1800-supply = <&reg_pp1800>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.34.1

