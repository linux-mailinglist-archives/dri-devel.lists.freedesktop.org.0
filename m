Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E3538F6A1
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276476E997;
	Tue, 25 May 2021 00:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BC66E996
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so821914pjr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9Fdpfj9PL4rvEigmb2QGhmwBANHPAlZSGnNvCdFiZM=;
 b=ZPl93bbbxQFUkDwjKcmU98GmeBrylXCNPRli/XHIx3pbVK62kq/iQdMuWLu6LZFEnf
 zRqfB+dYNMxsnhABbMeRlPT4j9wT29e5h54MD2dwAa9cZptK1E98OWj9Td7NExrV0yJM
 IktKCVr6X1wGQXA9YvDNTr6sDvOI8BYtm1Jlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9Fdpfj9PL4rvEigmb2QGhmwBANHPAlZSGnNvCdFiZM=;
 b=Y9Ssv8Gry8n32SDoRcQgiX1j6HXo3bFQ9e+Q3NGVNRWIP0Eoqc9EBqcrHjMus9GJtK
 NL7UsrYa+2BZ687fd+B8SWaTUlYbQ0U+JeiomDxsiKFojD0Bx/zF3bOVPr86W5zj62TT
 zcN3aiBP7XQGZx+333mGphvcbl0sEsLvWMF0hWcOYqtCOfnDXnXaTAPB+CAW9r2N9vnS
 wVWkmX1cWDzZUmG5Bh7CWKOZnYH60sn3Ymv6jDdl5Viv6QAVFIDYpshE8M5qt0jE0K1p
 DNICUHzuB5hRZlgiglzT27YHjS4SN9JxXz9JRGBEfoTUi7aYsLgEbSP9KkdbM90tJWMq
 S7vg==
X-Gm-Message-State: AOAM530o2NR2aCcJDyl68bPRvbyMDDUGsnasJNFBXc6YqvO1ApVqXvaI
 NJlPxjr5O7b2TMz0opSCCvQTfw==
X-Google-Smtp-Source: ABdhPJzEA6lrzK1TzhErfu2B21yXgIxTQg8HxrClwB7kEktuahte8BwRcwy/TibwPGUVkNDM7PvZAw==
X-Received: by 2002:a17:902:d643:b029:ef:62cd:eeed with SMTP id
 y3-20020a170902d643b02900ef62cdeeedmr28061200plh.42.1621900963170; 
 Mon, 24 May 2021 17:02:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
Date: Mon, 24 May 2021 17:01:52 -0700
Message-Id: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have an eDP controller that lists aux-bus, we can safely
add an example to the aux-bus bindings.

NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
one. It feels useful to have the example in both places simply because
it's important to document the interaction between the two bindings in
both places.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Separate DP AUX bus binding is new for v8.

 .../bindings/display/dp-aux-bus.yaml          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
index 5e4afe9f98fb..43494d2a32a1 100644
--- a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
+++ b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
@@ -35,3 +35,68 @@ additionalProperties: false
 
 required:
   - panel
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        no-hpd;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            sn65dsi86_out: endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+
+        aux-bus {
+          panel {
+            compatible = "boe,nv133fhm-n62";
+            power-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+              panel_in_edp: endpoint {
+                remote-endpoint = <&sn65dsi86_out>;
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.31.1.818.g46aad6cb9e-goog

