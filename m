Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872479D6D04
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1510E16D;
	Sun, 24 Nov 2024 08:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBksETh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFAC10E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:05 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7f71f2b136eso2805529a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435385; x=1733040185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwiSSoyq95aS10ZR5ywHjvkOgOJUU0juZpwe2Ul98ro=;
 b=YBksETh8xzoSLk4Jdd5k/bkErjj0MtiUaryJ9mo3J5UvMCQY3Nyn90Nm2pDGAmR3nV
 uj9nXd37w186aBnIsu9RQMqihJzQ9hXwduoYEdEz/Q4/Ylqi1P/QzVVPZSgsRMeckkNM
 mPKTLs6d7dJZBog6jqvPEj0EQnpDHKIEaw1+eosSMUsM3oB3yE5BkHXxqIsg9kHV/2uX
 ejgy17llFegbDVUouYAlpIZp2qqxIXRjcGyXJ7y6sm+1rIdMPoIN7MvaqfqrVEjxUFg8
 Ik6K/dB7VxXouuVBhYe4s4PR63q++vChTv5j8+A1abJll3f0+g4O58dUz7Wzn6prdUgy
 rhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435385; x=1733040185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwiSSoyq95aS10ZR5ywHjvkOgOJUU0juZpwe2Ul98ro=;
 b=nm1g+U4TGXne5LNVK9cHaZ+Rb3PnzTAJ5m5w7mgc+dH6Lg0Qc3ir+DG/ig24AIMEGG
 KnXe0TnOAuErhACtsDOjS8+dM9VaoUYYpLGO0FQIFPBovfV7xIJo/gbYixfidwhYv9wI
 NT1sh5IlTRsVQtSoZs+qiPDME8mZbZhG0Z2n5YdF4EgAJVCSGWeyDY5ZgIQeqeIt54Ki
 iAYGTCxcTQBwnolH5/GOXQXAWw8rjBNs7tYeeXsAMSoMgzgvf5WamZzo8YPBs3tlAOZp
 i949q2/OeHAB1jSvvT8BNJMB8AzRtJN6FsfTDayOwJldsYmhPGZ+p572J4yRa9JRQn1u
 Kk+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmNvv++qyvq4obOpL2ZcsIISOIxcyBTnhMrg4elJ4hv4lkgBcyOp4UIAqgqGN+Ja18EF+Msc+0x+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQfsqcvvjeMYB4wXFktemx3deS6K2eMJ1u7oJKbVoU8JulTKzk
 g+bJmiKF+mp0LIndQC2xn/NjNIpPqy+AJPMCRIXF+9J11DHdyYfX
X-Gm-Gg: ASbGncu1Fwn/pq15Qj449rrNMxhPngU0hjQhPh2n0dLxEhdAI/TDvUhTER1iDB9PqXJ
 09+P2yYpyOJWqd9HSGByYt5kHeBeONus9EVpyHQnFTkbyI08D61jDKWOWgPPE/Yq0x1w9dz/UqO
 8ZqQi9GDtQaeC+uykPwSj17+2iK8f9vLcas5b2Y34KdEAGZYp/TVHBOLdM2e0gMhN3olNllvyAm
 gXTgdf70PqOMpbCECRv0AAEUotzuOC+dD7s/Lx/1FmupRIdqpOZiRBRJk3Bj6g=
X-Google-Smtp-Source: AGHT+IHQm9ld2SgBp8RRxM0b4eURI6wePuJGMyF2B2CBhq2jEuS7t2RPu+JeZ89dNwX+SP0klI0u9w==
X-Received: by 2002:a17:90b:350e:b0:2ea:3d61:1849 with SMTP id
 98e67ed59e1d1-2eb0e88201fmr11289217a91.35.1732435385109; 
 Sun, 24 Nov 2024 00:03:05 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:04 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: display: panel: Add another panel for RG35XX
 Plus (Rev6)
Date: Sun, 24 Nov 2024 17:02:12 +0900
Message-ID: <20241124080220.1657238-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124080220.1657238-1-kikuchan98@gmail.com>
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
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

This is a display panel used in the recent revision of the Anbernic
RG35XX Plus, a handheld gaming device from Anbernic.
It is 3.45 inches in size (diagonally) with a resolution of 640x480.

It has the same interface (pins and connector) as the panel of the former
revision of RG35XX Plus, but they differ in their init-sequence. So add
it as a new panel.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../anbernic,rg35xx-plus-rev6-panel.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
new file mode 100644
index 00000000000..b60a4cf00f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic RG35XX series (YLM-LBV0345001H-V2) 3.45" 640x480 24-bit IPS LCD panel
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: anbernic,rg35xx-plus-rev6-panel
+
+  reg:
+    maxItems: 1
+
+  spi-3wire: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,rg35xx-plus-rev6-panel";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+            backlight = <&backlight>;
+            power-supply = <&reg_lcd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&tcon_lcd0_out_lcd>;
+                };
+            };
+        };
+    };
-- 
2.47.0

