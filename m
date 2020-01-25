Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58A149FA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4026EA31;
	Mon, 27 Jan 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15A26E87B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 15:46:21 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id s18so3706776iln.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nEE9k9xP7NhBgYIn56k3vKJI+rhRW1t8ddUHC5QJ7gQ=;
 b=rykCTY+jFnfAlMLr1uGeiajs7BGMwsbKkGhQ7xO+QruzmaAKtIvXHCOGgurWEwW9I3
 ZUZxMlA7UCUW3xPnnYisDRaKjuKRIcuCANDPyOeEX/8Ki7RaQDPR6RODu9CFu5dcLUcX
 T3phvaRuuVNDbu9boXnuX/9l6YGPudsZMdAqvCuUaMzR2Qllvw88RQWm95kvbV++7yaY
 VaTtZNxjyam2wlFpDes1WkO1ufm7pET5N+ZRJBrK+eyqBI5o5034H9C92mNx36u26Ahr
 FoY5bNn1ZUN5CpQhZclEmH23Gc1oFCJlrAQbrPi1T6EiZY4BANrPYrUp1r3mL0WSTuSR
 b0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nEE9k9xP7NhBgYIn56k3vKJI+rhRW1t8ddUHC5QJ7gQ=;
 b=LlH43VeVK46+3H36rzF6MvKlvKijg4AouI0QuQCL2E0C1ABgwStlPnlOqhFWViC1iW
 1v4QWG+Tb1qQMwcPs9Cw+DJG5MyBCwo/W/cPrbHJq4nKVdAfvAf2/UkP5Cd5aldl++Ca
 2NKQPnPnfnU6YPxSocnMsv6i3FGzkFZ9fimQctmujhkmPYhdJm6iClfZZoRc48bgUXYm
 4D1rLBqGDUflPl77IYtfoOaZvo8L7KnbDEeoIE+53jbTLqFmYqV34mYBNUzqg8WESmQy
 ExDPeUySJpeHANtzH+cHeIkgw9AKCcgnbsouQ3zFZwT+guBkboFfz8X1+bgnycET6sND
 cMjQ==
X-Gm-Message-State: APjAAAUBaKoVkdwNfJ9RkoBm+C/fJaRBIuj7DmFvdrjqQObAmlqvQkkX
 I6uzrPnzxFc1pJT2FQGwIuw/oaxnO+pp7A==
X-Google-Smtp-Source: APXvYqyuLCh9kCnSqEeYfMiPjgG3+kpQlAZKjcBc2KYHJ5rE+F1touilplj4R0obGS40Gzmu9tqb0w==
X-Received: by 2002:a63:215f:: with SMTP id s31mr9755838pgm.27.1579966716119; 
 Sat, 25 Jan 2020 07:38:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:717b:4cd5:6ebd:92d1])
 by smtp.gmail.com with ESMTPSA id c17sm9998480pfi.104.2020.01.25.07.38.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 25 Jan 2020 07:38:35 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org
Subject: [PATCH 1/2] dt-bindings: add binding for Ilitek ili9486 based display
 panels
Date: Sat, 25 Jan 2020 21:08:30 +0530
Message-Id: <ab0780c182b6921a6ca7ebf88f0bcd36ceed6450.1579963130.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
References: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 .../devicetree/bindings/display/ilitek,ili9486.txt | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.txt

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.txt b/Documentation/devicetree/bindings/display/ilitek,ili9486.txt
new file mode 100644
index 0000000..51c8196
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.txt
@@ -0,0 +1,27 @@
+Ilitek ILI9486 display panels
+
+This binding is for display panels using an Ilitek ILI9486 controller in SPI
+mode.
+
+Required properties:
+- compatible:   "ozzmaker,piscreen", "waveshare,rpi-lcd-35", "ilitek,ili9486"
+- dc-gpios:     D/C pin
+- reset-gpios:  Reset pin
+
+The node for this driver must be a child node of a SPI controller, hence
+all mandatory properties described in ../spi/spi-bus.txt must be specified.
+
+Optional properties:
+- rotation:     panel rotation in degrees counter clockwise (0,90,180,270)
+- backlight:    phandle of the backlight device attached to the panel
+
+Example:
+        display@0{
+                compatible = "ozzmaker,piscreen", "waveshare,rpi-lcd-35", "ilitek,ili9486";
+                reg = <0>;
+                spi-max-frequency = <32000000>;
+                dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+                reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+                rotation = <180>;
+                backlight = <&backlight>;
+        };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
