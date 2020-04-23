Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74C1B60CC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16AF6E953;
	Thu, 23 Apr 2020 16:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086D6E953
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:26:18 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c21so1726938plz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pFOeS/sccEGP8eQs3DCcfXA0C9Qzm+B0/uziitxo7M=;
 b=PZJbeComGG7JDFOB1vq0Jdn+qnhdYrSl+H4jkTL11L9tYn72mUi7nGkoVSNEeSsD0g
 027EsBScgUtwPBDQUwrSSERa/J98e9K2LZccHBgJsVTEnustjW2Ah+SmFQ0DuvzLwCdO
 f4jxVcisWbddJDGpXHycgtzYGooB/8jVRMDj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0pFOeS/sccEGP8eQs3DCcfXA0C9Qzm+B0/uziitxo7M=;
 b=a6DdTUK9Xu35ny3u446eLZB7rjrecqyBgucbX20yDH/OMF3Xcc2FX4ifpgkZj/REfG
 Ob2a9xpio06ju1pDEZhTe+a2fDHB2Vw2knSco4L0GjRHIFKADAFxoF2k0S2x3t/D1M4r
 QiD8N7MXeSwomRh6CCtgXNjp+72cALz6GzY2opIDBlhtnNfANiHd+GhrNXCKtiuEzOQ1
 3ytwIl8OXGnwma4PixobwrQB4Q9MWLSvxaMUxKxPUA68pnKHPzu8UL+8NrtAwCKnaA4+
 jGGQDFGTP3XAB9nYkLkcgGa1K+rDHPu7olHQIFoDZcj/VfyTJYqkWAFLakPr8k3eeTUu
 GzHw==
X-Gm-Message-State: AGi0Pua8bDXbcLzUMb4rmkQlWDphk0GiI1iAJDM+0a//UE2gSHEgop98
 f5aEgF02m5d2mGfcvWmPBUu2OA==
X-Google-Smtp-Source: APiQypKCbPFY+Q4sglYBstzKdPED0nN/sooISbAltNPO+XiIHqjiLYy5Y1KMaCJ8PsAcOItdpeGcfg==
X-Received: by 2002:a17:902:8eca:: with SMTP id
 x10mr4668468plo.60.1587659178165; 
 Thu, 23 Apr 2020 09:26:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:26:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, narmstrong@baylibre.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 spanda@codeaurora.org
Subject: [PATCH v3 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
Date: Thu, 23 Apr 2020 09:25:47 -0700
Message-Id: <20200423092431.v3.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
because of excessive debouncing in hardware.  Specifically there is no
way to disable the debouncing and for eDP debouncing hurts you because
HPD is just used for knowing when the panel is ready, not for
detecting physical plug events.

Currently the driver in Linux just assumes that nobody has HPD hooked
up.  It relies on folks setting the "no-hpd" property in the panel
node to specify that HPD isn't hooked up and then the panel driver
using this to add some worst case delays when turning on the panel.

Apparently it's also useful to specify "no-hpd" in the bridge node so
that the bridge driver can make sure it's doing the right thing
without peeking into the panel [1].  This would be used if anyone ever
found it useful to implement support for the HW HPD pin on the bridge.
Let's add this property to the bindings.

NOTES:
- This is somewhat of a backward-incompatible change.  All current
  known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
  bridge node yet none of them had HPD hooked up.  This worked because
  the current Linux driver just assumed that HPD was never hooked up.
  We could make it less incompatible by saying that for this bridge
  it's assumed HPD isn't hooked up _unless_ a property is defined, but
  "no-hpd" is much more standard and it's unlikely to matter unless
  someone quickly goes and implements HPD in the driver.
- It is sensible to specify "no-hpd" at the bridge chip level and
  specify "hpd-gpios" at the panel level.  That would mean HPD is
  hooked up to some other GPIO in the system, just not the hardware
  HPD pin on the bridge chip.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3:
- useful implement => useful to implement

Changes in v2:
- ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.

 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 6d7d40ad45ac..5746416b0f73 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -28,6 +28,10 @@ properties:
     maxItems: 1
     description: GPIO specifier for GPIO1 pin on bridge (active low).
 
+  no-hpd:
+    type: boolean
+    description: Set if the HPD line on the bridge isn't hooked up to anything.
+
   vccio-supply:
     description: A 1.8V supply that powers the digital IOs.
 
@@ -207,6 +211,8 @@ examples:
         clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
         clock-names = "refclk";
 
+        no-hpd;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
