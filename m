Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFFXLL5kfGkKMQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:58:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD0B814D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555E10E910;
	Fri, 30 Jan 2026 07:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="AWxgqqTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jan 2026 07:58:46 UTC
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AD410E910
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JpYDUJToWDqrzA1FWOgU0z00m/lR3GxAeDGpy+BFzrs=;
 b=AWxgqqTVnZfaJZIBw/2Qu/wuHqZddmRDR/lcqTaGqQoca224Rt6WGrV/
 ALHCpAoayuNEahOva7jMM0z7ID+kTfsZ3CsLqt70Azzu+3308mJv/aKpe
 aihMk4spNYatqGa/VQ/56bBKZ5661/M089gvogXs7FNAT8ty7DI2WTcdY
 hcQIQfkwxFTUoD71MtKi4jbcxkZ+QtwBVhvzBSfvK1NBlxo76Urb7Q/Re
 yqkaNUE5m47oUeOfrpOsDAGOWe5BLYHdVTf7Y8yHP4JdMVxDq+YhJijXG
 B5j89SdCav7psDmuJocH+WpPSUMZLIYgof8h5osqMnXJG4UoLTNfY6q4X Q==;
X-CSE-ConnectionGUID: Jg3F77LSQ2unJ5NOaIm3lg==
X-CSE-MsgGUID: Ru6eruDyQF+SBgv8I40eVQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 30 Jan 2026 15:48:56 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL2.internal.ite.com.tw
 [192.168.65.41]) by mse.ite.com.tw with ESMTP id 60U7pR39005428;
 Fri, 30 Jan 2026 15:51:27 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL2.internal.ite.com.tw
 (192.168.65.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Fri, 30 Jan
 2026 15:51:26 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Fri, 30 Jan 2026 15:51:34 +0800
Subject: [PATCH v6 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260130-it61620-0714-v6-1-70afa65923b5@ite.com.tw>
References: <20260130-it61620-0714-v6-0-70afa65923b5@ite.com.tw>
In-Reply-To: <20260130-it61620-0714-v6-0-70afa65923b5@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Jau-chih
 Tseng <jau-chih.tseng@ite.com.tw>, Pin-yen Lin <treapking@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769759532; l=4445;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=XElwW9hs8LNozFkSAZVv6bHsQXqI1zrLpwvbMZHygv4=;
 b=Kv4LLRUV0e3mdSAazM+s/GlU1hbfh3W+miHEFeeysmDBRfzh/CB7S4XwdIkkCiHhH7De1U52a
 CR8rtG9cjVcCLZWyQPsfzdWmzE9PdAxnOiCGPAlAblZTxDwKQpFn8UK
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.40]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL2.internal.ite.com.tw (192.168.65.41)
X-TM-SNTS-SMTP: 8ADC2B3504CA9716FF7EC48017926DD3CB61EC7A40FD4F426EFD05E16CD72BEC2002:8
X-MAIL: mse.ite.com.tw 60U7pR39005428
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ite.com.tw,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ite.com.tw:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hermes.Wu@ite.com.tw,m:kenneth.Hung@ite.com.tw,m:pet.weng@ite.com.tw,m:jau-chih.tseng@ite.com.tw,m:treapking@google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pet.weng@ite.com.tw,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ite.com.tw:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pet.weng@ite.com.tw,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_PROHIBIT(0.00)[0.0.0.58:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,devicetree.org:url,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 17CD0B814D
X-Rspamd-Action: no action

This chip receives MIPI DSI input and outputs HDMI, and is commonly
connected to SoCs via I2C and DSI.

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
---
 .../bindings/display/bridge/ite,it61620.yaml       | 142 +++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e195d192f6b1a2d092b3745e3e7f62b8b1d2d8ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it61620.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT61620 MIPI DSI to HDMI Bridge
+
+maintainers:
+  - Pet Weng <pet.weng@ite.com.tw>
+
+description: |
+  The ITE IT61620 is a high-performance, low-power HDMI bridge that converts
+  MIPI DSI input to HDMI 1.4b TMDS output. It supports up to 4 lanes of MIPI
+  D-PHY 2.0 input at 2.5Gbps per lane (10Gbps total), compatible with DSI-2
+  v2.0.
+
+  The HDMI transmitter side supports up to 4Kx2K@30Hz resolutions, and is
+  compliant with HDMI 1.4b and HDCP 1.4.
+
+  For audio, the IT61620 supports up to 8-channel LPCM via I2S (multi-line or
+  TDM mode), with optional S/PDIF or DSD (for SACD). It supports audio
+  sampling rates up to 192kHz.
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    const: ite,it61620
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  ivdd-supply:
+    description: core voltage
+
+  ovdd-supply:
+    description: I/O voltage
+
+  ovdd1833-supply:
+    description: flexible I/O voltage
+
+  "#sound-dai-cells":
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port for MIPI DSI
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port for HDMI output
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Audio input port (I2S)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - ivdd-supply
+  - ovdd-supply
+  - ovdd1833-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@58 {
+            compatible = "ite,it61620";
+            reg = <0x58>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&pio>;
+            interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it61620_pins>;
+            reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&pp1000_hdmi_x>;
+            ovdd-supply = <&pp3300_vio28_x>;
+            ovdd1833-supply = <&pp1800_vcamio_x>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    it61620_dsi_in: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&dsi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    it61620_hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    it61620_audio_in: endpoint {
+                        remote-endpoint = <&i2s0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

