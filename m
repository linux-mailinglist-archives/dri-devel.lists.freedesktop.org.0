Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F11405E42
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E52A6E913;
	Thu,  9 Sep 2021 21:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A76E914
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:21 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id v123so2845617pfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bT3m1N0T6YGe6P7z6BBYi6xksvzyeQjttgnlA44cESo=;
 b=UFD27uuifC5YG76KqJ2scE2s+j8nclIkoiUI7k5wZfUIGsyeLvMhFdvMly8jacRkZH
 TpRIHKNWwg2gJhuRRUqTT01lms03EyWI4y4CoGXz9kc7dIYj36IuxZrzOKYXShXuDCrX
 xZOpHdEbbFXsxLtdZVQXyholwjegG7niZlSSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bT3m1N0T6YGe6P7z6BBYi6xksvzyeQjttgnlA44cESo=;
 b=3DK0wYZSMA3sq8y03OZ1Or0q4KG/bdb126F++smKwKgcg4NnpFvbOtr6mSujnEmQNH
 WdeutT7ouU6gpdk/JHUNE5bcifCA8kod9s1WuEnLBBGKgdKN1CFXPmINeTg9v5gSRxcQ
 G6D+/n6U9O1eRU+2MjlU67FGdHT67NT7oXZUNfAB/LEe8zS+9YLTiiwIRVWULvt9BoXO
 TwHg+6qhbHI5fO5Vimnt0a8qJZz5ynf/6FAkE98QSzoof+yTPs8dJo/oFpMFXtly+12T
 sAxjo7xiHwfdgF8cwf9w4jsJh20F59EA82rTwHPP/87uLmBTA9hs6DeEjpd0ioGLusQv
 mwDQ==
X-Gm-Message-State: AOAM531S2MaRvZeWwlDeXlp3YvWC6O4KtpknIXUFTT0ooKCSAAs0nHtt
 c4O7VRr8zyJ1LfvooC1F5+dF3A==
X-Google-Smtp-Source: ABdhPJxP8gY+fRBxA6UOgHitCFUBQ23QRiX0Y/4vOR1bGgDMWDtvdAVTkO+g7/GFMWr0qp6T1xrQ3A==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr4356999pgj.47.1631221280610; 
 Thu, 09 Sep 2021 14:01:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/15] dt-bindings: drm/panel-simple-edp: Introduce generic
 eDP panels
Date: Thu,  9 Sep 2021 14:00:17 -0700
Message-Id: <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v2)

Changes in v2:
- Add "-ms" suffix to delays.
- No longer allow fallback to panel-simple.

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
2.33.0.309.g3052b89438-goog

