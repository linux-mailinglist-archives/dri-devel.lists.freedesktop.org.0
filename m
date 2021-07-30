Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE63DC033
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 23:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A416E4AF;
	Fri, 30 Jul 2021 21:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905986E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 21:26:46 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u16so4082422ple.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 14:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDbg21Rf2V3jdZDSKF8dbOSamKttBFrGYQS/hOkLKIM=;
 b=Dt3QaGEKJYQZpLNZ++o1Zh7kagDav2QSU5ZW7Z46Hb/uObkC78VphH8EgnIIj97Rdm
 1EO47fO8lBpdVGkPx0g2fBeXbz25u3zHUp/jrnZB3stIlEmHpihzNztapECzMg7HLXKw
 AmWLluiT4t/pxEPrj5pbfoOpqwWsk1W+n4O/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDbg21Rf2V3jdZDSKF8dbOSamKttBFrGYQS/hOkLKIM=;
 b=CNcBoR14xneuB9vJVW7av6YqoEnk2wMW5Q4dhlXqD+wK9FEXt7ly10bI+s7OmPwjzp
 gK+y+WxKiFPccqr1oYwbZh2qtB9CU+O4/Qi+oHoAeY4+nyHdio1hgAhpq1H7PBkx5JX1
 /WwUIUnemtjI6pDxDFXouPesKPSlcq9soWqtS7tY8JHq0KdYCBFvLW3yz+aZXERsP71n
 bNkqK4jMugiP/vS17KaNiFz7Oqa3Q+m12d5KbgwKSDm8iBvWu9illJhotMnAMlxW6pnl
 4JRH6lujQsSHtcI57/aJnzJw/bwOcw+RjJqzE6dlA9cpohoJhEz7xo5w3HWrwtGO3G7o
 QNbg==
X-Gm-Message-State: AOAM533tMG/NK/21Y8bbzbMR68hsmDoRr0j6+AgVbXnsX6G+WaXGY8Fy
 sTomYbhdIM4LKDncyuQEIptSdA==
X-Google-Smtp-Source: ABdhPJy29foJ9bcVWNWDDSnMOmun1T+EKhKagCWWHZ2uc3dmqwxtcbjTqo+KDuWUfDXITLP/4vQgoQ==
X-Received: by 2002:a17:90a:a511:: with SMTP id
 a17mr5267369pjq.69.1627680406216; 
 Fri, 30 Jul 2021 14:26:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3424:e0ac:5a92:d061])
 by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 14:26:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: drm/panel-simple: Introduce generic eDP
 panels
Date: Fri, 30 Jul 2021 14:26:20 -0700
Message-Id: <20210730142537.v2.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
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

eDP panels generally contain almost everything needed to control them
in their EDID. This comes from their DP heritage were a computer needs
to be able to properly control pretty much any DP display that's
plugged into it.

The one big issue with eDP panels and the reason that we need a panel
driver for them is that the power sequencing can be different per
panel.

While it is true that eDP panel sequencing can be arbitrarily complex,
in practice it turns out that many eDP panels are compatible with just
some slightly different delays. See the contents of the bindings file
introduced in this patch for some details.

The fact that eDP panels are 99% probable and that the power
sequencing (especially power up) can be compatible between many panels
means that there's a constant desire to plug multiple different panels
into the same board. This could be for second sourcing purposes or to
support multiple SKUs (maybe a 11" and a 13", for instance).

As discussed [1], it should be OK to support this by adding two
properties to the device tree to specify the delays needed for
powering up the panel the first time. We'll create a new "edp-panel"
bindings file and define the two delays that might need to be
specified. NOTE: in the vast majority of the cases (HPD is hooked up
and isn't glitchy or is debounced) even these delays aren't needed.

[1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- No longer allow fallback to panel-simple.
- Add "-ms" suffix to delays.

 .../bindings/display/panel/panel-edp.yaml     | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
new file mode 100644
index 000000000000..6a621376ff86
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Probable (via DP AUX / EDID) eDP Panels with simple poweron sequences
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description: |
+  This binding file can be used to indicate that an eDP panel is connected
+  to a Embedded DisplayPort AUX bus (see display/dp-aux-bus.yaml) without
+  actually specifying exactly what panel is connected. This is useful for
+  the case that more than one different panel could be connected to the
+  board, either for second-sourcing purposes or to support multiple SKUs
+  with different LCDs that hook up to a common board.
+
+  As per above, a requirement for using this binding is that the panel is
+  represented under the DP AUX bus. This means that we can use any
+  information provided by the DP AUX bus (including the EDID) to identify
+  the panel. We can use this to identify display size, resolution, and
+  timings among other things.
+
+  One piece of information about eDP panels that is typically _not_
+  provided anywhere on the DP AUX bus is the power sequencing timings.
+  This is the reason why, historically, we've always had to explicitly
+  list eDP panels. We solve that here with two tricks. The "worst case"
+  power on timings for any panels expected to be connected to a board are
+  specified in these bindings. Once we've powered on, it's expected that
+  the operating system will lookup the panel in a table (based on EDID
+  information) to figure out other power sequencing timings.
+
+  eDP panels in general can have somewhat arbitrary power sequencing
+  requirements. However, even though it's arbitrary in general, the
+  vast majority of panel datasheets have a power sequence diagram that
+  looks the exactly the same as every other panel. Each panel datasheet
+  cares about different timings in this diagram but the fact that the
+  diagram is so similar means we can come up with a single driver to
+  handle it.
+
+  These diagrams all look roughly like this, sometimes labeled with
+  slightly different numbers / lines but all pretty much the same
+  sequence. This is because much of this diagram comes straight from
+  the eDP Standard.
+
+                __________________________________________________
+  Vdd       ___/:                                                :\____       /
+          _/    :                                                :     \_____/
+           :<T1>:<T2>:                                 :<--T10-->:<T11>:<T12>:
+                :    +-----------------------+---------+---------+
+  eDP     -----------+ Black video           | Src vid | Blk vid +
+  Display       :    +-----------------------+---------+---------+
+                :     _______________________:_________:_________:
+  HPD           :<T3>|                       :         :         |
+          ___________|                       :         :         |_____________
+                     :                       :         :         :
+  Sink               +-----------------------:---------:---------+
+  AUX CH  -----------+ AUX Ch operational    :         :         +-------------
+                     +-----------------------:---------:---------+
+                     :                       :         :         :
+                     :<T4>:             :<T7>:         :         :
+  Src main                +------+------+--------------+---------+
+  lnk data----------------+LnkTrn| Idle |Valid vid data| Idle/off+-------------
+                          +------+------+--------------+---------+
+                          : <T5> :<-T6->:<-T8->:       :
+                                               :__:<T9>:
+  LED_EN                                       |  |
+          _____________________________________|  |____________________________
+                                               :  :
+                                     __________:__:_
+  PWM                               |          :  : |
+          __________________________|          :  : |__________________________
+                                    :          :  : :
+                       _____________:__________:__:_:______
+  Bklight         ____/:            :          :  : :     :\____
+  power   _______/     :<---T13---->:          :  : :<T16>:     \______________
+  (Vbl)          :<T17>:<---------T14--------->:  :<-T15->:<T18>:
+
+  The above looks fairly complex but, as per above, each panel only cares
+  about a subset of those timings.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: edp-panel
+
+  hpd-reliable-delay-ms:
+    description:
+      A fixed amount of time that must be waited after powering on the
+      panel's power-supply before the HPD signal is a reliable way to know
+      when the AUX channel is ready. This is useful for panels that glitch
+      the HPD at the start of power-on. This value is not needed if HPD is
+      always reliable for all panels that might be connected.
+
+  hpd-absent-delay-ms:
+    description:
+      The panel specifies that HPD will be asserted this many milliseconds
+      from power on (timing T3 in the diagram above). If we have no way to
+      measure HPD then a fixed delay of this many milliseconds can be used.
+      This can also be used as a timeout when waiting for HPD. Does not
+      include the hpd-reliable-delay, so if hpd-reliable-delay was 80 ms
+      and hpd-absent-delay was 200 ms then we'd do a fixed 80 ms delay and
+      then we know HPD would assert in the next 120 ms. This value is not
+      needed if HPD hooked up, either through a GPIO in the panel node or
+      hooked up directly to the eDP controller.
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+  no-hpd: true
+  hpd-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
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
+            compatible = "edp-panel";
+            power-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+            hpd-reliable-delay-ms = <15>;
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
2.32.0.554.ge1b32706d8-goog

