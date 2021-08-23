Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3F3F47CE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A0389CD9;
	Mon, 23 Aug 2021 09:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DE589D60
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 09:41:17 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id h1so5722192pjs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59YVNoAHghXrJOXBJcWLjTuxbid6YF3SI87m42J17Q0=;
 b=gbWMwZ3nq7etjCnuCvxfCnWJXwJ8zAbX4Ms0DCGR5VR1jmwS6MC1ZWySqf0GgiRiqY
 IjmU2xtzkD40NqvNnQ8L9fznZU3rWVMKJd0mZ/nKR5tdWDWB19hNC23V0pSsL7J2H5Tt
 Bq2Dz2I6lSXovfwvmdQFykTUCWvAo1uSUeR9klurDrqR07Y93zhIw7+++DrXjD6xklYt
 RvgkBY2cyncYuixQXYoyU0Z/mKFLarZa6xHzWgv5pc3LqagSxo/T6/p/z9wEoRqd4Ovv
 Q/RE3BMQ+lNTmiP3FyP7ucLJwsYngG9xfch6rZoTHeeUoa6GkLDrR2R3nhcKzuB1HZLt
 bELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59YVNoAHghXrJOXBJcWLjTuxbid6YF3SI87m42J17Q0=;
 b=bapO1KN6ABf20hwGZHZdFbgYWC5+qDY7RlCdybQru5oVZUS9N/4Fjm2YWD2qkEtVB9
 1y1GpsmAcLF++o7FgcRmTm5PcLdwvVcCVl+5pgY8rIjAA5HpW0HOKE0c1odpOkrunwtG
 e1usC8lzrrrn8krHUs++szfLtgjc8Ybn1QoLESeS/cz+Hm0Tl0s2ZR4d3pskWe3ZEDzf
 vQwcKp4wPtQ9aTWi+Z3cXBJgI4Vz/Id5tY77AyEd+cPb+FQDT/SBwGgtFbDJtfxhTvC+
 tlwXVQiXFz3BrdzrJzHFc36SvI4OdEAJoEOGgb53vD4hla134vUFht/k20F5rkyZTcVW
 ULMA==
X-Gm-Message-State: AOAM532N71xXkmDIkKaATCsH/jwr3mZHdCi4SJiODDTdba0yig5uCnxs
 GCSxZ4rMPgL433+vz19IHFPqKA==
X-Google-Smtp-Source: ABdhPJwG3pkvSi2qfi44MfiIuMVRPahIUv461kNadzm506l+fNVr9SQR4jUJk6t49M5U4BzbWftc5Q==
X-Received: by 2002:a17:902:9a02:b029:118:307e:a9dd with SMTP id
 v2-20020a1709029a02b0290118307ea9ddmr27623510plp.47.1629711677137; 
 Mon, 23 Aug 2021 02:41:17 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id p10sm14453192pjv.39.2021.08.23.02.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:41:16 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 2/2] dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel
 bindings
Date: Mon, 23 Aug 2021 17:41:02 +0800
Message-Id: <20210823094102.1064716-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823094102.1064716-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210823094102.1064716-1-yangcong5@huaqin.corp-partner.google.com>
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

Add documentation for boe tv110c9m-ll3 panel.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../display/panel/boe,tv110c9m-ll3.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
new file mode 100644
index 000000000000..3593405241af
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv110c9m-ll3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV110C9M-LL3 DSI Display Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # BOE TV110C9M-LL3 10.95" WUXGA TFT LCD panel
+      - boe,tv110c9m-ll3
+        # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
+      - inx,hj110iz-01a
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  pp3300-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+ - compatible
+ - reg
+ - enable-gpios
+ - pp1800-supply
+ - pp3300-supply
+ - avdd-supply
+ - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,tv110c9m-ll3";
+            reg = <0>;
+            enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&vdd_reset_1800>;
+            avdd-supply = <&avdd_lcd>;
+            avee-supply = <&avee_lcd>;
+            pp1800-supply = <&v1p8_mipi>;
+            pp3300-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            status = "okay";
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

