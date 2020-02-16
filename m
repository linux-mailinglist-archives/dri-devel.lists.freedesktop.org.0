Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D6160540
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 19:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A96E480;
	Sun, 16 Feb 2020 18:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907EE6E46D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 18:15:40 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 9so10178485lfq.10
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VOa5BvEVC53gAxDGC2Az8GeC+PWsDupUY7BePlsJCzY=;
 b=JE//nzDhbJRZDEWoj65+j0fBdf4afIh+REZdLrUatpuJfHyk5SFggtpQokzTex9HOC
 8N7AxOWr/+9oyWpTqYL5/QleNcV/2C1w5t7Tioj4D+Ntp35Yi9qe586UaPUX5m0ho+s7
 htAGtgZEOOmQ12YhqIkDD/OVQQARgAs/hCYi+z9TNPynfyEyXoAc1Sjaq9z/JWBNuuLc
 X9L7EV3dnTs3+SrWrMLFdas2ZHz0YT34qGktjk5/oBhNB5fk1DMfrgwuDYT7/xnF6KHt
 N8hSLXpcolzW8FVsD+dK2eulCXkpu2NMEoibKnqgOmQQwrIa6dk8hHpMGZx3XAe6hW0D
 4lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VOa5BvEVC53gAxDGC2Az8GeC+PWsDupUY7BePlsJCzY=;
 b=KugMUMGq4huut4oSBgsScXhB/y+kb1rLDmcqaLsHgyJkbjpoqe4fSxdfJ2kUfe2+wZ
 3LFSaLFkfYOM+JRpRcbR8a0pcS4KKhOuURzB/3pYYVPy0/oGtblMDEs5VuSI+dxfSPTV
 +5nuN4Xe2iwcrbvFGm5t/HlYPUhm/sSTKlG65mW9kD1JbuwB9Sg0gpM0d2tmG8NzFtYo
 Ykv6Acys575fSxrzOCPG925k3bVjpr7tkB20GQR99BZ8s7Y2THlA6eD2wYj73G31dsDy
 jCqLFJh87YbpbSqgrXmMdyQi/5/GndTpPe24L9KFPyLxmtNETK/xacna6Oxrym1GgkLR
 ySAg==
X-Gm-Message-State: APjAAAXD6bTbYPtmjJQYklJlDbxXG6Ul0gxly4jU/RRt7Q6qnuWxPpTg
 mT14oYVTr0CiqNPNCvtCIWVgAlfS37A=
X-Google-Smtp-Source: APXvYqxFx+f4n79IKFN5yY6IXfp11xLEIaNyV8NpiBY8wsoxTO2N5b6whFvxeE3ZgsfI+YSfF9wIbA==
X-Received: by 2002:a19:7015:: with SMTP id h21mr6051881lfc.68.1581876938935; 
 Sun, 16 Feb 2020 10:15:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u15sm6157431lfl.87.2020.02.16.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 10:15:38 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
Date: Sun, 16 Feb 2020 19:15:12 +0100
Message-Id: <20200216181513.28109-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add data-mapping property that can be used to specify
the media format used for the connection betwwen the
display controller (connector) and the panel.
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index 40079fc24a63..6a03d2449701 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -21,6 +21,16 @@ properties:
       - {}
       - const: panel-dpi
 
+  data-mapping:
+    enum:
+      - rgb24
+      - rgb565
+      - bgr666
+      - lvds666
+    description: |
+      Describes the media format, how the display panel is connected
+      to the display interface.
+
   backlight: true
   enable-gpios: true
   height-mm: true
@@ -43,7 +53,7 @@ examples:
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
-
+        data-mapping = "lvds666";
         backlight = <&backlight>;
 
         port {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
