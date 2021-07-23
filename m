Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B743D30C3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7C06F87D;
	Fri, 23 Jul 2021 00:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182586F87E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:10 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so6646300pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1aa3UfCPl5r3Gx3LGknAmWVjZTbPoixp2ch6auAMok=;
 b=d+N8GzRpeSTGp/OruZTGObd2DIyMgwYxWfWF99BelE0Jvb+eDQzfSCx7dXLXd9hgkW
 04WAss68WTaAM9UlSPq1oNXzNrCBMa2mnFwjF2x2PTIcThBwitj4P/WiEHeGbNjkJ1gR
 FCCTY673ZFcmAzVV2t4aiNb4P+8ZFpO6QcydM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1aa3UfCPl5r3Gx3LGknAmWVjZTbPoixp2ch6auAMok=;
 b=sDQ1SgMSB1sWXQ2wXHvjQbsCWPAr6ZLjuTTBgfXsWm4Rr2mJfG6/dpkvePllMGLax5
 h67aX43IU77wAXzZRYHQJ/RMquE/PSonf4grBLn2bt/ItwGUsgvGVgAFevgC+lBvAIJu
 pVZYeut8j6U72rcws5rqDv1Oqi77JIgs9749yGI3E1WPoZ/iew5ybBCt3uj1cWiWMRBL
 G1OfNnX6WBXTrLFtzYcZoF0wSlWN5QbLsn/+r7p00y+aQR3h7gyf9f+DDffGol3uZunN
 7gtqEXHOlXli78G2TH7+VIIRXyYiI06g9e8kQBRY8FnOsFl1sfyAJVpK4ZHRoiVsBvS0
 z+Qg==
X-Gm-Message-State: AOAM533JQCgnz1KIhT9cy4sRA9Sx0Ajya0DBY8nNo2keKMQefzBE3BZ8
 q13Rg+RNPAPh9tKFMuuPUkoAMQ==
X-Google-Smtp-Source: ABdhPJwXkB+/Q0ipK7gZlDgVmpnlbd2yTuIMyf7sLPTbGVb3lXaOPCPFxflhuADAkax5ltoO0R5KSw==
X-Received: by 2002:a17:90b:2245:: with SMTP id
 hk5mr2097234pjb.60.1626999729331; 
 Thu, 22 Jul 2021 17:22:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 1/8] dt-bindings: drm/panel-simple: Introduce generic eDP
 panels
Date: Thu, 22 Jul 2021 17:21:39 -0700
Message-Id: <20210722172104.RFC.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
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

In order to help ease the transition, we'll support old "panel-simple"
panels as "fallback" panels. In this case "edp-panel" should be
specified first but if there are problems or a panel is unknown we can
fallback to controlling panels like we used to.

[1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As usual with anything remotely complicated with yaml bindings, I
mostly messed around with these until it seemed to validate
correctly. Hopefully this is somewhat the way to do things. If folks
would prefer something different (maybe just having one bindings file
for edp-panel and simple-panel) I can change it up.

 .../bindings/display/panel/panel-edp.yaml     | 196 ++++++
 .../bindings/display/panel/panel-simple.yaml  | 559 +++++++++---------
 2 files changed, 479 insertions(+), 276 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
new file mode 100644
index 000000000000..7a9dcf270646
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
@@ -0,0 +1,196 @@
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
+  eDP panels in general can have fairly arbitrary power sequencing
+  requirements. However, even though it's arbitrary in general, the
+  vast majority of panel datasheets have a power sequence diagram that
+  looks the exactly the same as every other panel. Each panel datasheet
+  cares about different timings in this diagram but the fact that the
+  diagram is so similar means we can come up with a single driver to
+  handle it.
+
+  These diagrams all look roughly like this, sometimes labeled with
+  slightly different numbers / lines but all pretty much the same sequence:
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
+    items:
+      - const: edp-panel
+
+    # You can list a panel from panel-simple.yaml as a fallback which will
+    # be used for power sequence timings in case the operating system can't
+    # auto-detect using the AUX bus.
+    additionalItems: true
+    minItems: 1
+    maxItems: 2
+
+  hpd-reliable-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      A fixed amount of time (in milliseconds) that must be waited after
+      powering on the panel's power-supply before the HPD signal is a reliable
+      way to know when the AUX channel is ready. This is useful for panels
+      that glitch the HPD at the start of power-on. This value is not needed
+      if HPD is always reliable for all panels that might be connected.
+
+  hpd-absent-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+            compatible = "edp-panel", "boe,nv133fhm-n62";
+            power-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+            hpd-reliable-delay = <15>;
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
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..a3ebd2bdbe1e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -23,284 +23,287 @@ allOf:
   - $ref: panel-common.yaml#
 
 properties:
-
   compatible:
-    enum:
-    # compatible must be listed in alphabetical order, ordered by compatible.
-    # The description in the comment is mandatory for each compatible.
+    anyOf:
+      - minItems: 1
+      - items:
+          - const: edp-panel
+          - enum:
+            # compatible must be listed in alphabetical order, ordered by compatible.
+            # The description in the comment is mandatory for each compatible.
 
-        # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
-      - ampire,am-1280800n3tzqw-t00h
-        # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
-      - ampire,am-480272h3tmqw-t01h
-        # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-      - ampire,am800480r3tmqwa1h
-        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-      - auo,b101aw03
-        # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
-      - auo,b101ean01
-        # AU Optronics Corporation 10.1" WXGA TFT LCD panel
-      - auo,b101xtn01
-        # AUO B116XAK01 eDP TFT LCD panel
-      - auo,b116xa01
-        # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
-      - auo,b116xw03
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133htn01
-        # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
-      - auo,b133xtn01
-        # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
-      - auo,g070vvn01
-        # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
-      - auo,g101evn010
-        # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
-      - auo,g104sn02
-        # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
-      - auo,g121ean01
-        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
-      - auo,g133han01
-        # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
-      - auo,g156xtn01
-        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
-      - auo,g185han01
-        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
-      - auo,g190ean01
-        # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
-      - auo,p320hvn03
-        # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
-      - auo,t215hvn01
-        # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
-      - avic,tm070ddh03
-        # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
-      - boe,hv070wsa-100
-        # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
-      - boe,nv101wxmn51
-        # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
-      - boe,nv110wtm-n61
-        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
-      - boe,nv133fhm-n61
-        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
-      - boe,nv133fhm-n62
-        # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
-      - boe,nv140fhmn49
-        # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
-      - cdtech,s043wq26h-ct7
-        # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD Panel
-      - cdtech,s070pws19hp-fc21
-        # CDTech(H.K.) Electronics Limited 7" WVGA (800x480) TFT LCD Panel
-      - cdtech,s070swv29hg-dc44
-        # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
-      - cdtech,s070wv95-ct16
-        # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
-      - chefree,ch101olhlwh-002
-        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
-      - chunghwa,claa070wp03xg
-        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-      - chunghwa,claa101wa01a
-        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-      - chunghwa,claa101wb01
-        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-      - chunghwa,claa101wb03
-        # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
-      - dataimage,scf0700c48ggu18
-        # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
-      - dlc,dlc1010gig
-        # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
-      - edt,et035012dm6
-        # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
-      - edt,et057090dhu
-      - edt,et070080dh6
-        # Emerging Display Technology Corp. 3.5" WVGA TFT LCD panel with
-        # capacitive multitouch
-      - edt,etm0350g0dh6
-        # Emerging Display Technology Corp. 480x272 TFT Display with capacitive touch
-      - edt,etm043080dh6gp
-        # Emerging Display Technology Corp. 480x272 TFT Display
-      - edt,etm0430g0dh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-        # Same as ETM0700G0DH6 but with inverted pixel clock.
-      - edt,etm070080bdh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-        # Same timings as the ETM0700G0DH6, but with resistive touch.
-      - edt,etm070080dh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-        # Same display as the ETM0700G0BDH6, but with changed hardware for the
-        # backlight and the touch interface.
-      - edt,etm070080edh6
-      - edt,etm0700g0bdh6
-        # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
-      - edt,etm0700g0dh6
-      - edt,etm0700g0edh6
-        # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
-        # capacitive touch
-      - edt,etmv570g2dhu
-        # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
-      - evervision,vgg804821
-        # Foxlink Group 5" WVGA TFT LCD panel
-      - foxlink,fl500wvr00-a0t
-        # Frida FRD350H54004 3.5" QVGA TFT LCD panel
-      - frida,frd350h54004
-        # FriendlyELEC HD702E 800x1280 LCD panel
-      - friendlyarm,hd702e
-        # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
-      - giantplus,gpg48273qs5
-        # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
-      - giantplus,gpm940b0
-        # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
-      - hannstar,hsd070pww1
-        # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
-      - hannstar,hsd100pxn1
-        # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
-      - hit,tx23d38vm0caa
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
-        # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
-      - innolux,at043tn24
-        # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
-      - innolux,at070tn92
-        # Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
-      - innolux,g070y2-l01
-        # Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
-      - innolux,g101ice-l01
-        # Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
-      - innolux,g121i1-l01
-        # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
-      - innolux,g121x1-l03
-        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-      - innolux,n116bca-ea1
-        # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-      - innolux,n116bge
-        # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
-      - innolux,n125hce-gn1
-        # InnoLux 15.6" WXGA TFT LCD panel
-      - innolux,n156bge-l21
-        # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-      - innolux,zj070na-01p
-        # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
-      - kingdisplay,kd116n21-30nv-a010
-        # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-      - koe,tx14d24vm1bpa
-        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
-      - koe,tx26d202vm0bwa
-        # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
-      - koe,tx31d200vm0baa
-        # Kyocera Corporation 7" WVGA (800x480) transmissive color TFT
-      - kyo,tcg070wvlq
-        # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
-      - kyo,tcg121xglp
-        # LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
-      - lemaker,bl035-rgb-002
-        # LG 7" (800x480 pixels) TFT LCD panel
-      - lg,lb070wv8
-        # LG Corporation 5" HD TFT LCD panel
-      - lg,lh500wx1-sd03
-        # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
-      - lg,lp079qx1-sp0v
-        # LG 9.7" (2048x1536 pixels) TFT LCD panel
-      - lg,lp097qx1-spa1
-        # LG 12.0" (1920x1280 pixels) TFT LCD panel
-      - lg,lp120up1
-        # LG 12.9" (2560x1700 pixels) TFT LCD panel
-      - lg,lp129qe
-        # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
-      - logictechno,lt161010-2nhc
-        # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
-      - logictechno,lt161010-2nhr
-        # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
-      - logictechno,lt170410-2whc
-        # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
-      - mitsubishi,aa070mc01-ca1
-        # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
-      - nec,nl12880bc20-05
-        # NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
-      - nec,nl4827hc19-05b
-        # Netron-DY E231732 7.0" WSVGA TFT LCD panel
-      - netron-dy,e231732
-        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
-      - neweast,wjfh116008a
-        # Newhaven Display International 480 x 272 TFT LCD panel
-      - newhaven,nhd-4.3-480272ef-atxl
-        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
-      - nlt,nl192108ac18-02d
-        # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
-      - nvd,9128
-        # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
-      - okaya,rs800480t-7x0gp
-        # Olimex 4.3" TFT LCD panel
-      - olimex,lcd-olinuxino-43-ts
-        # On Tat Industrial Company 7" DPI TFT panel.
-      - ontat,yx700wv03
-        # OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
-      - ortustech,com37h3m05dtc
-        # OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
-      - ortustech,com37h3m99dtc
-        # OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
-      - ortustech,com43h4m85ulc
-        # OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
-      - osddisplays,osd070t1718-19ts
-        # One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
-      - osddisplays,osd101t2045-53ts
-        # POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
-      - powertip,ph800480t013-idf02
-        # QiaoDian XianShi Corporation 4"3 TFT LCD panel
-      - qiaodian,qd43003c0-40
-        # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
-      - rocktech,rk101ii01d-ct
-        # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-      - rocktech,rk070er9427
-        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
-      - samsung,atna33xc20
-        # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
-      - samsung,lsn122dl01-c01
-        # Samsung Electronics 10.1" WSVGA TFT LCD panel
-      - samsung,ltn101nt05
-        # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
-      - samsung,ltn140at29-301
-        # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-      - satoz,sat050at40h12r2
-        # Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
-      - sharp,lq035q7db03
-        # Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
-      - sharp,lq070y3dg3b
-        # Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
-      - sharp,lq101k1ly04
-        # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
-      - sharp,lq123p1jx31
-        # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
-      - sharp,ls020b1dd01d
-        # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
-      - shelly,sca07010-bfn-lnn
-        # Starry KR070PE2T 7" WVGA TFT LCD panel
-      - starry,kr070pe2t
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
-        # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
-      - tianma,tm070jdhg30
-        # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
-      - tianma,tm070jvhg33
-        # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
-      - tianma,tm070rvhg71
-        # Toshiba 8.9" WXGA (1280x768) TFT LCD panel
-      - toshiba,lt089ac29000
-        # TPK U.S.A. LLC Fusion 7" 800 x 480 (WVGA) LCD panel with capacitive touch
-      - tpk,f07a-0102
-        # TPK U.S.A. LLC Fusion 10.1" 1024 x 600 (WSVGA) LCD panel with capacitive touch
-      - tpk,f10a-0102
-        # United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
-        # Supported are LVDS versions (-11T, -19T) and parallel ones
-        # (-T, -1T, -7T, -20T).
-      - urt,umsh-8596md-t
-      - urt,umsh-8596md-1t
-      - urt,umsh-8596md-7t
-      - urt,umsh-8596md-11t
-      - urt,umsh-8596md-19t
-      - urt,umsh-8596md-20t
-        # VXT 800x480 color TFT LCD panel
-      - vxt,vl050-8048nt-c01
-        # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
-      - winstar,wf35ltiacd
-        # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
-      - yes-optoelectronics,ytc700tlag-05-201c
+                # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
+              - ampire,am-1280800n3tzqw-t00h
+                # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
+              - ampire,am-480272h3tmqw-t01h
+                # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+              - ampire,am800480r3tmqwa1h
+                # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
+              - auo,b101aw03
+                # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
+              - auo,b101ean01
+                # AU Optronics Corporation 10.1" WXGA TFT LCD panel
+              - auo,b101xtn01
+                # AUO B116XAK01 eDP TFT LCD panel
+              - auo,b116xa01
+                # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
+              - auo,b116xw03
+                # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+              - auo,b133htn01
+                # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
+              - auo,b133xtn01
+                # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
+              - auo,g070vvn01
+                # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
+              - auo,g101evn010
+                # AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
+              - auo,g104sn02
+                # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
+              - auo,g121ean01
+                # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
+              - auo,g133han01
+                # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
+              - auo,g156xtn01
+                # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
+              - auo,g185han01
+                # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
+              - auo,g190ean01
+                # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
+              - auo,p320hvn03
+                # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
+              - auo,t215hvn01
+                # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
+              - avic,tm070ddh03
+                # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
+              - boe,hv070wsa-100
+                # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
+              - boe,nv101wxmn51
+                # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+              - boe,nv110wtm-n61
+                # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
+              - boe,nv133fhm-n61
+                # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
+              - boe,nv133fhm-n62
+                # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
+              - boe,nv140fhmn49
+                # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
+              - cdtech,s043wq26h-ct7
+                # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD Panel
+              - cdtech,s070pws19hp-fc21
+                # CDTech(H.K.) Electronics Limited 7" WVGA (800x480) TFT LCD Panel
+              - cdtech,s070swv29hg-dc44
+                # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
+              - cdtech,s070wv95-ct16
+                # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
+              - chefree,ch101olhlwh-002
+                # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
+              - chunghwa,claa070wp03xg
+                # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+              - chunghwa,claa101wa01a
+                # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+              - chunghwa,claa101wb01
+                # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
+              - chunghwa,claa101wb03
+                # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
+              - dataimage,scf0700c48ggu18
+                # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
+              - dlc,dlc1010gig
+                # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
+              - edt,et035012dm6
+                # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
+              - edt,et057090dhu
+              - edt,et070080dh6
+                # Emerging Display Technology Corp. 3.5" WVGA TFT LCD panel with
+                # capacitive multitouch
+              - edt,etm0350g0dh6
+                # Emerging Display Technology Corp. 480x272 TFT Display with capacitive touch
+              - edt,etm043080dh6gp
+                # Emerging Display Technology Corp. 480x272 TFT Display
+              - edt,etm0430g0dh6
+                # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
+                # Same as ETM0700G0DH6 but with inverted pixel clock.
+              - edt,etm070080bdh6
+                # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
+                # Same timings as the ETM0700G0DH6, but with resistive touch.
+              - edt,etm070080dh6
+                # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
+                # Same display as the ETM0700G0BDH6, but with changed hardware for the
+                # backlight and the touch interface.
+              - edt,etm070080edh6
+              - edt,etm0700g0bdh6
+                # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
+              - edt,etm0700g0dh6
+              - edt,etm0700g0edh6
+                # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
+                # capacitive touch
+              - edt,etmv570g2dhu
+                # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
+              - evervision,vgg804821
+                # Foxlink Group 5" WVGA TFT LCD panel
+              - foxlink,fl500wvr00-a0t
+                # Frida FRD350H54004 3.5" QVGA TFT LCD panel
+              - frida,frd350h54004
+                # FriendlyELEC HD702E 800x1280 LCD panel
+              - friendlyarm,hd702e
+                # GiantPlus GPG48273QS5 4.3" (480x272) WQVGA TFT LCD panel
+              - giantplus,gpg48273qs5
+                # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
+              - giantplus,gpm940b0
+                # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
+              - hannstar,hsd070pww1
+                # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
+              - hannstar,hsd100pxn1
+                # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
+              - hit,tx23d38vm0caa
+                # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
+              - ivo,m133nwf4-r0
+                # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
+              - innolux,at043tn24
+                # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
+              - innolux,at070tn92
+                # Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
+              - innolux,g070y2-l01
+                # Innolux Corporation 10.1" G101ICE-L01 WXGA (1280x800) LVDS panel
+              - innolux,g101ice-l01
+                # Innolux Corporation 12.1" WXGA (1280x800) TFT LCD panel
+              - innolux,g121i1-l01
+                # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
+              - innolux,g121x1-l03
+                # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+              - innolux,n116bca-ea1
+                # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
+              - innolux,n116bge
+                # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
+              - innolux,n125hce-gn1
+                # InnoLux 15.6" WXGA TFT LCD panel
+              - innolux,n156bge-l21
+                # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
+              - innolux,zj070na-01p
+                # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
+              - kingdisplay,kd116n21-30nv-a010
+                # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
+              - koe,tx14d24vm1bpa
+                # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
+              - koe,tx26d202vm0bwa
+                # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
+              - koe,tx31d200vm0baa
+                # Kyocera Corporation 7" WVGA (800x480) transmissive color TFT
+              - kyo,tcg070wvlq
+                # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
+              - kyo,tcg121xglp
+                # LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
+              - lemaker,bl035-rgb-002
+                # LG 7" (800x480 pixels) TFT LCD panel
+              - lg,lb070wv8
+                # LG Corporation 5" HD TFT LCD panel
+              - lg,lh500wx1-sd03
+                # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
+              - lg,lp079qx1-sp0v
+                # LG 9.7" (2048x1536 pixels) TFT LCD panel
+              - lg,lp097qx1-spa1
+                # LG 12.0" (1920x1280 pixels) TFT LCD panel
+              - lg,lp120up1
+                # LG 12.9" (2560x1700 pixels) TFT LCD panel
+              - lg,lp129qe
+                # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
+              - logictechno,lt161010-2nhc
+                # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
+              - logictechno,lt161010-2nhr
+                # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
+              - logictechno,lt170410-2whc
+                # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
+              - mitsubishi,aa070mc01-ca1
+                # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
+              - nec,nl12880bc20-05
+                # NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
+              - nec,nl4827hc19-05b
+                # Netron-DY E231732 7.0" WSVGA TFT LCD panel
+              - netron-dy,e231732
+                # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
+              - neweast,wjfh116008a
+                # Newhaven Display International 480 x 272 TFT LCD panel
+              - newhaven,nhd-4.3-480272ef-atxl
+                # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
+              - nlt,nl192108ac18-02d
+                # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
+              - nvd,9128
+                # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
+              - okaya,rs800480t-7x0gp
+                # Olimex 4.3" TFT LCD panel
+              - olimex,lcd-olinuxino-43-ts
+                # On Tat Industrial Company 7" DPI TFT panel.
+              - ontat,yx700wv03
+                # OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
+              - ortustech,com37h3m05dtc
+                # OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
+              - ortustech,com37h3m99dtc
+                # OrtusTech COM43H4M85ULC Blanview 3.7" TFT-LCD panel
+              - ortustech,com43h4m85ulc
+                # OSD Displays OSD070T1718-19TS 7" WVGA TFT LCD panel
+              - osddisplays,osd070t1718-19ts
+                # One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
+              - osddisplays,osd101t2045-53ts
+                # POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
+              - powertip,ph800480t013-idf02
+                # QiaoDian XianShi Corporation 4"3 TFT LCD panel
+              - qiaodian,qd43003c0-40
+                # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
+              - rocktech,rk101ii01d-ct
+                # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
+              - rocktech,rk070er9427
+                # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
+              - samsung,atna33xc20
+                # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
+              - samsung,lsn122dl01-c01
+                # Samsung Electronics 10.1" WSVGA TFT LCD panel
+              - samsung,ltn101nt05
+                # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
+              - samsung,ltn140at29-301
+                # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
+              - satoz,sat050at40h12r2
+                # Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel
+              - sharp,lq035q7db03
+                # Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
+              - sharp,lq070y3dg3b
+                # Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
+              - sharp,lq101k1ly04
+                # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
+              - sharp,lq123p1jx31
+                # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
+              - sharp,ls020b1dd01d
+                # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
+              - shelly,sca07010-bfn-lnn
+                # Starry KR070PE2T 7" WVGA TFT LCD panel
+              - starry,kr070pe2t
+                # Starry 12.2" (1920x1200 pixels) TFT LCD panel
+              - starry,kr122ea0sra
+                # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
+              - tianma,tm070jdhg30
+                # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
+              - tianma,tm070jvhg33
+                # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
+              - tianma,tm070rvhg71
+                # Toshiba 8.9" WXGA (1280x768) TFT LCD panel
+              - toshiba,lt089ac29000
+                # TPK U.S.A. LLC Fusion 7" 800 x 480 (WVGA) LCD panel with capacitive touch
+              - tpk,f07a-0102
+                # TPK U.S.A. LLC Fusion 10.1" 1024 x 600 (WSVGA) LCD panel with capacitive touch
+              - tpk,f10a-0102
+                # United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
+                # Supported are LVDS versions (-11T, -19T) and parallel ones
+                # (-T, -1T, -7T, -20T).
+              - urt,umsh-8596md-t
+              - urt,umsh-8596md-1t
+              - urt,umsh-8596md-7t
+              - urt,umsh-8596md-11t
+              - urt,umsh-8596md-19t
+              - urt,umsh-8596md-20t
+                # VXT 800x480 color TFT LCD panel
+              - vxt,vl050-8048nt-c01
+                # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
+              - winstar,wf35ltiacd
+                # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
+              - yes-optoelectronics,ytc700tlag-05-201c
 
   backlight: true
   enable-gpios: true
@@ -309,6 +312,10 @@ properties:
   no-hpd: true
   hpd-gpios: true
 
+  # These are OK if we're a fallback for edp-panel
+  hpd-reliable-delay: true
+  hpd-absent-delay: true
+
 additionalProperties: false
 
 required:
-- 
2.32.0.432.gabb21c7263-goog

