Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3011827E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BDC6E834;
	Tue, 10 Dec 2019 08:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74486E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:51:46 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g6so5902707plp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
 b=XogCXVx2RXzDAutpzGtBCHE+T8kLmeCQvQsMdlbs1tDq7y1UrkAwc/k+g7CufIO+PA
 dpQKZ4iazoJSwFFuHkVnZErr6o6mC7eXyQQPeDi2oYU+ZfEdPXZgi7FkAEORJ/7BN9k1
 evO2wVdIGUA1AbJjhA2vmOqgRcmVLhvVO95t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
 b=UeN4a6A832F7ZE31c5QMKsCzxXTIIw9UHn0d0ct0Su6mfgcDl1mF5XnK2u74Nmrbx5
 pIhN6fBK8uQU8k+xARMEpJN3GGX+AVRMlyU+af6EGQ/fcxYB1Dm+NbLeQFjE0W6tPvRg
 IbmCAU5LKw4xhfc1Mvto4cGU5ZJJ/ycJgjJJlv1nK/9v/zXCq3/Q7SM4+VcywwWYpzpx
 jU3NROY9Y7v3pWWK5rD21+kUoprogxguIPl/W4m9JZBAGJwe7yZIpQZlfggNHlGtHL2e
 fyF72wd/2CLKQIAH6m6zkHRB6Ur8x4bd8Tzu6jSkndIsqf2rx+oQowQYyKeUfPVhIcFk
 lPCA==
X-Gm-Message-State: APjAAAWYrFbI4TXVIKMbMWG35MHSZf1rj8A+IjnyvWcdbrqqk+5USku4
 T4Nbec4INct5S/7IFPqKgaksC5+l6TClFQ==
X-Google-Smtp-Source: APXvYqxU02o6BtUzY2uYrPaZe5xjkP17fMbo/9XayXiUcb1MB3mIfbRhi9fLq+g8w3r6KCxzsaaOJw==
X-Received: by 2002:a17:902:a503:: with SMTP id
 s3mr5631915plq.38.1575903106015; 
 Mon, 09 Dec 2019 06:51:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:51:45 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx: support
 bypass GPIO
Date: Mon,  9 Dec 2019 22:50:15 +0800
Message-Id: <20191209145016.227784-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209145016.227784-1-hsinyi@chromium.org>
References: <20191209145016.227784-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support optional feature: bypass GPIO.

Some SoC (eg. mt8173) have a hardware mux that connects to 2 ports:
anx7688 and hdmi. When the GPIO is active, the bridge is bypassed.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/display/bridge/anx7688.txt       | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.txt b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
index 78b55bdb18f7..44185dcac839 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx7688.txt
+++ b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
@@ -15,10 +15,13 @@ Required properties:
 Optional properties:
 
  - Video port for HDMI input, using the DT bindings defined in [1].
+ - bypass-gpios        : External GPIO. If this GPIO is active, we assume
+ the bridge is bypassed (e.g. by a mux).
+ - pinctrl-0, pinctrl-names: the pincontrol settings to configure bypass GPIO.
 
 [1]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
-Example:
+Example 1:
 
 	anx7688: anx7688@2c {
 		compatible = "analogix,anx7688";
@@ -30,3 +33,38 @@ Example:
 			};
 		};
 	};
+
+Example 2:
+
+       anx7688: anx7688@2c {
+               compatible = "analogix,anx7688";
+               status = "okay";
+               reg = <0x2c>;
+               ddc-i2c-bus = <&hdmiddc0>;
+
+               bypass-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+               pinctrl-names = "default";
+               pinctrl-0 = <&hdmi_mux_pins>;
+
+               ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 { /* input */
+                               reg = <0>;
+
+                               anx7688_in: endpoint {
+                                       remote-endpoint = <&hdmi_out_anx>;
+                               };
+                       };
+
+                       port@1 { /* output */
+                               reg = <1>;
+
+                               anx7688_out: endpoint {
+                                       remote-endpoint = <&hdmi_connector_in>;
+                               };
+                       };
+               };
+       };
+
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
