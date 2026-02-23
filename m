Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEPpG9IbnGlF/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBA173C6E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45710E2B9;
	Mon, 23 Feb 2026 09:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d45tR7l0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160110E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24D6C4444F;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01F9CC2BC87;
 Mon, 23 Feb 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771838414;
 bh=ogo7dePnMxqWdg0+TyjVYamVaRxYyAeax6iknxPvnV0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=d45tR7l0fVm5z61h5HRPwyCXEzqaZHVtjhRXBARPcTzMTQL0mLpMH6RAYASyXmLP3
 BtDYGqsdM4901+MT9fVSmmjgA2mFai6F9oI4Ya5/XSThV6vAhYsdydhjy95nKJh0iA
 NRvkaXITVfSqkTnB/NNd6d0RNNp4ps08IkENrivS0YDrzRxY9tyXhauW1gd9ffwZkt
 axTz0Osm1PetCzb+LRAkmDwmRe/R2A+D9pPtnk8H9E26tVSNBG8d0vbAQRWgKu+KdX
 FpCjmmW5k6+gXnPMp+kGSoSF0w3b8RZVj5m5thXiJyCypnDN2UC3ZOh8SAJmHn/+Oz
 OEFVO1+QanFWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id ED77AE98DFF;
 Mon, 23 Feb 2026 09:20:13 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 23 Feb 2026 17:20:46 +0800
Subject: [PATCH 2/3] dt-bindings: display: bridge: Add ITE IT6162 MIPI DSI
 to HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-upstream-6162-v1-2-ebcc66ccb1fe@ite.com.tw>
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
In-Reply-To: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.Wu@ite.com.tw>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771838463; l=5183;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=RPki/TN57hKw8ecs2LV5OUWeAKQeKfXxTdHdAtzApJ4=;
 b=7IXPvkB5T7jqQQCrgwtKpK+vykkelp8Dik/v6Kk+cxfaParm2cgHbaReanvEYtvvuMEfYD+Rt
 UShJGWvi02wB40A0pSuhBjP25c/t/SA7gIel9WXrR33PMBlkI8BixcS
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[Hermes.wu.ite.com.tw];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:Hermes.Wu@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Hermes.wu@ite.com.tw,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Hermes.wu@ite.com.tw];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.58:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.2:email,0.0.0.3:email,ite.com.tw:mid,ite.com.tw:email,ite.com.tw:replyto,0.0.0.1:email]
X-Rspamd-Queue-Id: CBCBA173C6E
X-Rspamd-Action: no action

From: Hermes Wu <Hermes.wu@ite.com.tw>

Add device tree binding documentation for the ITE IT6162 MIPI DSI to
HDMI 2.0 bridge chip. The IT6162 is an I2C-controlled bridge that
supports the following configurations:

  - Single MIPI DSI input: up to 4K @ 30Hz
  - Dual MIPI DSI input (combined): up to 4K @ 60Hz

The chip also supports up to 8-channel audio output via 4 I2S data
channels.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 .../bindings/display/bridge/ite,it6162.yaml        | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..31f809a83c305447a152e14b20cb39ef1f816911
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6162.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6162.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6162 MIPI DSI to HDMI2.0 Bridge
+
+maintainers:
+  - Hermes Wu <Hermes.Wu@ite.com.tw>
+
+description: |
+  The ITE IT6162 is a high-performance, low-power HDMI bridge that converts
+  2 MIPI DSI signal to 1 HDMI2.0. It supports 2 MIPI D-PHY 2.0 up to 10Gbps
+  each DSI port (20Gbps total), compatible with DSI-2 v2.0.
+
+  The HDMI transmitter side supports up to 4Kx2K@60Hz resolutions, and is
+  compliant with HDMI2.0.
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
+    const: ite,it6162
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
+        description: Input port for MIPI DSI-0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port for MIPI DSI-1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            required:
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Audio input port (I2S)
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port for HDMI output
+
+    required:
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+            compatible = "ite,it6162";
+            reg = <0x58>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&pio>;
+            interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6162_pins>;
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
+                    it6162_dsi0: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&dsi_0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    it6162_dsi1: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&dsi_1_out>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    it6162_audio_in: endpoint {
+                        remote-endpoint = <&i2s0_out>;
+                    };
+                };
+
+                port@3 {
+                    reg = <3>;
+                    it6162_hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


