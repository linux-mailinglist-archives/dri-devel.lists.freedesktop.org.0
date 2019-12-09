Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95263118288
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFDC6E841;
	Tue, 10 Dec 2019 08:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6BD6E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:51:38 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l24so7245028pgk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGLkt56MhFh8o5EiPOGN5Gs/bQLSYtcgRKiESMUAAEg=;
 b=FoiOPgQcYmkXm/tZqxmuOTlheNX0AgdOI/2MZIVoyVaDZ2omAlNpvjC5J7UkXZjHkN
 w/FEIk9KLjFC9aKhMHaRz6mznpSflD0o8I0Gq9L9AKEzN5+Ft6j7taGzy5nEO8JDQzdE
 SXjPxv1lzNd1yp0r/THRyWzyCzs5KLo3RQEv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGLkt56MhFh8o5EiPOGN5Gs/bQLSYtcgRKiESMUAAEg=;
 b=ZCDG7WCZbL5EVJn/xad2lEgdZ6L1mwjmAfU4MK9pFHZHFufa41eM3B/mto9Xxjm7pg
 au3ZsxbDKub5dLyslYKz1F/L1C8JziQjtmrwRIcJVlQcChgjJheW7A3G7UkxbU0QUtXn
 fqk7SWvhagNMHte4uUJcntRNVQA+ryFVzjoFFWLaIO7Sdotpawz1xaVjB7HGtYPaxKOZ
 FFxy9OCCAU1RwGAY2o8PLpSBWrVCJcmSn05Qk33uA4ZHQs6MzUIQ65EuNnNvFh3xMmcl
 Cb8a65zzPpkvezpAZIoinJTCic8/Nq3Q/gqqRNE4SYNjI3ljnp69aJ9rjk1MrzuQpcQn
 j6wQ==
X-Gm-Message-State: APjAAAXwABcrOXgrYQADt+IxdSeduhws8MTJ+HfzlPXT5pD1zthN/bhB
 j/LDNl2WsRkk29tnCOAnGptDtA/kVkZCiQ==
X-Google-Smtp-Source: APXvYqwdFN4BDi6/3J9nybGN70nDZ2haqNMPr+4STLfU6yafWcXmeyYw7k9dIphwuYdoFrfoWNCktQ==
X-Received: by 2002:a63:93:: with SMTP id 141mr18975594pga.411.1575903097523; 
 Mon, 09 Dec 2019 06:51:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:51:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
Date: Mon,  9 Dec 2019 22:50:13 +0800
Message-Id: <20191209145016.227784-2-hsinyi@chromium.org>
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

From: Nicolas Boichat <drinkcat@chromium.org>

Add support for analogix,anx7688

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/display/bridge/anx7688.txt       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.txt b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
new file mode 100644
index 000000000000..78b55bdb18f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
@@ -0,0 +1,32 @@
+Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
+---------------------------------------------------------------------
+
+The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
+second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
+resolution from a smartphone or tablet with full function USB-C.
+
+This binding only describes the HDMI to DP display bridge.
+
+Required properties:
+
+ - compatible          : "analogix,anx7688"
+ - reg                 : I2C address of the device (fixed at 0x2c)
+
+Optional properties:
+
+ - Video port for HDMI input, using the DT bindings defined in [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	anx7688: anx7688@2c {
+		compatible = "analogix,anx7688";
+		reg = <0x2c>;
+
+		port {
+			anx7688_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
