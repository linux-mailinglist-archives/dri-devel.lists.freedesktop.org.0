Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06D1AAC3C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95BF6EA1C;
	Wed, 15 Apr 2020 15:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098CE6EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:49:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w65so126895pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xv5Jh31H5+w8jdcU3qZ2inNmrbUd8kK+/sKgr7aMmBA=;
 b=ocsih6TZchbbdMilfJ2eaHo8YrE4iyg4spUMxkGBGstj8CDKhojbdYG+R6JnRMOHpi
 cibm2DqYQindZF69po+bUjLtkYkIIFvjCe50kEUJUbPMiABottJBLLZhsFmJEMAKF8bX
 iYWvV+b13tAnkuxypq1P36v0kRWJuAPIlucVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xv5Jh31H5+w8jdcU3qZ2inNmrbUd8kK+/sKgr7aMmBA=;
 b=RA7bLH6jfp5JeUXJKIZXImDgTQTl5EP8Mh4taqDMla4ui306ws5xX3CgXnbA8NBxo/
 ruVG7M5BOkgZypu316zdZkgGzRAj5JxYje/KuDBJZadlt1jVbP8BkiXWI76ijsyeJOZd
 9xwa3jhEcD1sozVn72dFVL9V28CVwIyzNRyHP4Dn4CoXlMv7mxC9DfZwAp3Uzp/KdyAk
 n1Nc/lW6NWwp6pTPSAMPfCcqengr+3xUTYS08UgHHXVRK9jxiNLTEsYs2EZRj11IHYUT
 Y32dGMOJ6XfvZnI3pa0agXa/X7Q4mvfQYZY9WP41cvCFb6m9RnkLfHbxRF6v14bhiw6s
 RJCg==
X-Gm-Message-State: AGi0PuYXBfykDN6lucDh9dbJyUbg+3x+6atiNqbSm4mZSDOVAFgqERs+
 bepuWZ6ItRy9rbRoPEk6jVyl1g==
X-Google-Smtp-Source: APiQypJ7H4gzqxg/2G4EhbDrGrS2BP4/dIipLbFjqpBVazKk05eyediy+KegDkVKm7ncrS7AMSqZ6Q==
X-Received: by 2002:a62:e50f:: with SMTP id n15mr5859148pff.22.1586965789612; 
 Wed, 15 Apr 2020 08:49:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x27sm14382473pfj.74.2020.04.15.08.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:49:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Subject: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios to
 the bindings
Date: Wed, 15 Apr 2020 08:48:40 -0700
Message-Id: <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
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
 swboyd@chromium.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow people to specify to use a GPIO for hot-plug-detect.  Add an
example.

NOTE: The current patch adding support for hpd-gpios to the Linux
driver for hpd-gpios only adds enough support to the driver so that
the bridge can use one of its own GPIOs.  The bindings, however, are
written generically.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 8cacc6db33a9..554bfd003000 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -60,6 +60,10 @@ properties:
     const: 1
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  hpd-gpios:
+    maxItems: 1
+    description: If present use the given GPIO for hot-plug-detect.
+
   data-lanes:
     description: See ../../media/video-interface.txt
 
@@ -148,7 +152,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      bridge@2d {
+      sn65dsi86_bridge: bridge@2d {
         compatible = "ti,sn65dsi86";
         reg = <0x2d>;
 
@@ -165,6 +169,10 @@ examples:
         clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
         clock-names = "refclk";
 
+        gpio-controller;
+        #gpio-cells = <2>;
+        hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.26.0.110.g2183baf09c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
