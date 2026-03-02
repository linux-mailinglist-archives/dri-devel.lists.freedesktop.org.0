Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DI+LZO2pWkiFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:10:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E641D1DC6E6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41E110E54A;
	Mon,  2 Mar 2026 16:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50A10E53E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 16:10:56 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1vx5rC-0002vi-Fe; Mon, 02 Mar 2026 17:10:54 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 02 Mar 2026 17:10:40 +0100
Subject: [PATCH v10 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-v6-18-topic-imx93-parallel-display-v10-1-634fe2778c7a@pengutronix.de>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
In-Reply-To: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: E641D1DC6E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:m.felsch@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.794];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,pengutronix.de:mid,pengutronix.de:email,0.0.0.1:email,nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Liu Ying <victor.liu@nxp.com>

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
[m.felsch@pengutronix.de: port to v7.0-rc1]
[m.felsch@pengutronix.de: add bus-width]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -40,6 +40,58 @@ properties:
     minItems: 8
     maxItems: 10
 
+  dpi-bridge:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - nxp,imx91-pdfc
+          - nxp,imx93-pdfc
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/$defs/port-base
+            unevaluatedProperties: false
+            description: Output port node to downstream pixel data receivers.
+
+            properties:
+              endpoint:
+                $ref: /schemas/media/video-interfaces.yaml#
+                unevaluatedProperties: false
+
+                properties:
+                  bus-width:
+                    enum: [ 16, 18, 24 ]
+                    description:
+                      Specify the physical parallel bus width.
+
+                      This property is optional if the display bus-width
+                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
+                      is connected and all 18-bit data lines are muxed to the
+                      parallel-output pads.
+
+                      This property must be set to 18 to cut only the LSBs
+                      instead of the MSBs in case a 24-bit RGB888 display is
+                      connected and only the lower 18-bit data lanes are muxed
+                      to the parallel-output pads.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - ports
+
 allOf:
   - if:
       properties:
@@ -112,4 +164,30 @@ examples:
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
       #power-domain-cells = <1>;
+
+      dpi-bridge {
+        compatible = "nxp,imx93-pdfc";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+              bus-width = <18>;
+            };
+          };
+        };
+      };
     };

-- 
2.47.3

