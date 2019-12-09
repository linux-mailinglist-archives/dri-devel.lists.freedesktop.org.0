Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023311826A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2C889CB9;
	Tue, 10 Dec 2019 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAA56E43F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:20:43 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w7so5733763plz.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
 b=ToMamDlBdtGc6HWR4u6Df1/w+9GuqbMO5QPDj43TnsU66oqMIBvyqqQBbh2UErjkdE
 ndZN3Ao+3mrQd04Uw0c37+CG4AYIybK1OXP/qN4f+nd1adxV0qshJiFycPK4QMsgGIR/
 ZB/6i1hJ7AkrmqZoFw3fAHK+2qNzCedXkJjDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
 b=M1vgoDBjWKVl9u8NE7H+A8DqLc66AkfffZRBVWyU92uyjYBTTJicks3ujS23cVk1Tv
 d4Xf4f2/uG/8qxCCH7MEC1aIYmzldBnXkt9R7zSwUmlx4Nnexv2UBkgViCVsBAcNjrI3
 YcSU5RUrMTAdSrrGM4Sl6MhoYlRfEqrt5hzH1VfB08C+qUDLhGhNVgMK8S93T4HUCx8c
 /70YG2gHln3KxhU5xmR+4HDFGN7PA4dROo2ux6s9iqhZgvlMu3Bt1b072kLzVnBliKYK
 M1A7/nU6WgOba6V8mWrdFuUOGlUukRXqYtqk8sOYjcV4WxCksCCdEqW4XrmG5CUTxYhV
 ctpg==
X-Gm-Message-State: APjAAAWwbbEBtliDcBQp+fPPXGPmfsxgW0Vuf+TuCtJML/qv8fZxgQo1
 HRC0E7D8LMn5RGLgTOadw4c0VDa4IoQG2w==
X-Google-Smtp-Source: APXvYqysHMmAFrD3m3tlj9ZX9fug8HAdxXWYvC6SD36Gi+NKgGLW+KDuHH9YvK1YhwCqLO5lC23yhQ==
X-Received: by 2002:a17:902:ac88:: with SMTP id
 h8mr28987310plr.131.1575894042818; 
 Mon, 09 Dec 2019 04:20:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p21sm26733813pfn.103.2019.12.09.04.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:20:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] dt-bindings: drm/bridge: analogix-anx78xx: support bypass
 GPIO
Date: Mon,  9 Dec 2019 20:20:12 +0800
Message-Id: <20191209122013.178564-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209122013.178564-1-hsinyi@chromium.org>
References: <20191209122013.178564-1-hsinyi@chromium.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>
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
