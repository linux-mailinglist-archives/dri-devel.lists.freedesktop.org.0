Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC141F8FAC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114AE6E270;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B6F6E427
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 14:07:09 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b201so5699420pfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sINdMhFbZdpubyb64Rbv6xvZZ8jKZulgvmVTTGZUUz0=;
 b=SOtQ6p4sRhtg8JfNrmFIiArKm9kS2Voa7R+LcgGAoLPlXv1mim8jjYbAdhsP/US4iy
 CZkhC//ER9jywCGZWUCkxOe8ad4FPO8efFjEURBIX+87aiWUV3ZU7kHrY+JaY4qdUYLT
 +Zb5MftWmrYalJ8IuJv2Pl8IwV8dArcDytD+GECy0Vs0MMFfXZIApas1tj2tSq7kz+5Q
 /sMFMLVTtqaT5L+oGX0Ye1shF87qjQjdA/S8xvmnAmvqa7MKkSesmnAM1bEaNpO1NoNU
 +0pUroaN0NObpyqBmCPqCt56K8DPVMMXtr3QxlM5NDl0J4ewpwFlJ7ROPY0apRhKdTpu
 E0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sINdMhFbZdpubyb64Rbv6xvZZ8jKZulgvmVTTGZUUz0=;
 b=dzqrFKTk0YeWVjGzLh6os5xMfnz8eVPsukXMaMsr2dSAyHKcq3nVJRmH7LLTsnxWXi
 EWDfdAIT3j1k5pnsQRCduaWV8KgxsvqYvZv5l2qOXzRx4hCZcXy2dGkjjnBGj3LQwbWS
 qqyI5rq0L2r380eblhEWLM3kVEx+Tsh0T++mZFhLxph9++fhibfTKZlB38d+hY+CIwv3
 +/HBR4r4vqPjh+7cx28Z2fCPK9ShJH/o3Dy80bJKOXolgSRXx1VfA7L+Z0EJJ/POi85k
 Qml5aH7ftTbQc25ZL7YWWGTWQsj+DaiNVIx+FgM15rcN2iijMNOd9RnIIVrxFeoVIQa+
 hF/Q==
X-Gm-Message-State: AOAM530vtqhzZVvksaL6+rAhHk7lTcT4i3tel1ycyJ18WaHdqklcGGaB
 cVPJLWcowYm+vSk+v1cjHjE=
X-Google-Smtp-Source: ABdhPJzWRzBsKF5jXuCP6Vo0CT+Kzi9M0c71c4GoGH0lck2uJS/Iq9Idpmd9I51GdBt1cDCCx7POoQ==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr16218148pfb.58.1592057229307; 
 Sat, 13 Jun 2020 07:07:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
 by smtp.gmail.com with ESMTPSA id w6sm7825022pjy.15.2020.06.13.07.07.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 07:07:08 -0700 (PDT)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] dt-bindings: add binding for Ilitek ili9488 based display
 panels
Date: Sat, 13 Jun 2020 19:37:03 +0530
Message-Id: <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds binding for ilitek,ili9488 based display panels

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 .../bindings/display/ilitek,ili9488.yaml           | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
new file mode 100644
index 0000000..61e7a63
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 display panels device tree bindings
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9488 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Eastrising 3.5" 320x480 Color TFT LCD
+        - eastrising,er-tft035-6
+      - const: ilitek,ili9488
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+
+            display@0{
+                    compatible = "eastrising,er-tft035-6", "ilitek,ili9488";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    rotation = <90>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
