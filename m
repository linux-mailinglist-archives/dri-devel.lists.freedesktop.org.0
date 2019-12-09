Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9C11827D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0163A6E831;
	Tue, 10 Dec 2019 08:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458AE6E439
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:20:37 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id s35so5825211pjb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJLNZ5TvbBRTBk5/byYcKg9wRzpXt/4CUjn6xa6Yk2k=;
 b=RafgoOWy81f3KsyNV6b4nwN0KnXLBvQ2HkyA6S5LLq6ZloyClLVD6VZ3NTwKfu8iS7
 xNS4VsiadFrWaWJdsza8CA0c0+9EnC6YoLu6W1EmnaO/6Kt9HzfGkS/2AP0xcnHE9Eyb
 r3H8KhlDnRb7GWWP63ARzFFZfUL6r8ziuokYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJLNZ5TvbBRTBk5/byYcKg9wRzpXt/4CUjn6xa6Yk2k=;
 b=WVckIRCSXfv6hrjENfEeb0y7QjyeefxoWFhs4TryPkFcHqb32Byxib99O685W/4Pjc
 +er0bmB69hiybOYPw96pO25VyiHCtbNXqzQN2oC3dhKgfe7L8LKH80TtWngEYTHndrbh
 xf2dJjtlETDvh3gAtGgyNY8zzROMkGluMkR+jsWcdU0irrO8EjMF6UUQUB7RvoQpF1o3
 vTldReVLXwmvdymmIEA2qT5ORegpwQvny3ed3fH+l9Fo6V3ojoi+A/sZECweVmyrpQ1V
 yOItbJpGEyA3MM77+6n+QetOV2hwMtCnoa6Pcf6/yC6ODgdI8h7M0FDUy/lp5GhYJQ7Y
 SlXw==
X-Gm-Message-State: APjAAAXT+su6/TltA/4OwUwgW2awuBCEaUbHhlOXGIRHah9uAFsiILGh
 P4LRz+EATAuCZKOUeVpRgyyIiJcm4K2vkA==
X-Google-Smtp-Source: APXvYqxoMr3FbIpijNOEPSqLNXh6fn576z9LQ1rBetbAQMOnnockF3VNaxXXJ4ojvMAG7toh5y6XzQ==
X-Received: by 2002:a17:902:760e:: with SMTP id
 k14mr5360485pll.198.1575894036563; 
 Mon, 09 Dec 2019 04:20:36 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p21sm26733813pfn.103.2019.12.09.04.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:20:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add ANX7688
 transmitter binding
Date: Mon,  9 Dec 2019 20:20:10 +0800
Message-Id: <20191209122013.178564-2-hsinyi@chromium.org>
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

From: Nicolas Boichat <drinkcat@chromium.org>

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
