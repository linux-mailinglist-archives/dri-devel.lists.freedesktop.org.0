Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDDuM5SGrWnZ3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54264230A1A
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179FA10E43B;
	Sun,  8 Mar 2026 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="QTorFkrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD4B10E062
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1772949812; x=1773209012;
 bh=RCwVWD51K3Bng0aSbuQAQ7SiRFAZ93WauinTBb32Sfo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QTorFkrSk2+m6f8MQpjKLTpqVhb0DgzUUkUV1WEEPPXUENdD3mh8xtSLtSMAXx/O8
 h9Vm4fXtxUQpas1vixGekf/p8zgx0D6zKDTFpXZqFA7SX18mbtZaYA4ZF2MTVT1z+d
 9oGiJ5JXCQb8hcV4PtuJGqy2LpxjDEZsgoTjLvgSZTUqmxXoVbfmAdf1X36gv+eH3V
 0HWAnRv75fdMqgQQMjTDOJF8ZiczPrGiQwK+c1jYwyRuz+L7VLaiVv0OGB+rWGCBWc
 dX/+xDr9DINQkORPbJH5mDUz9sefNIZR+ujWoE02HoI9lRE+8dlsKQvWVASR4jVy32
 ihvBJazgdl9sw==
Date: Sun, 08 Mar 2026 06:03:29 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: display: panel: Document Tianma TA066VVHM03
Message-ID: <20260308-tianma-ta066vvhm03-v1-1-869fac443b20@pm.me>
In-Reply-To: <20260308-tianma-ta066vvhm03-v1-0-869fac443b20@pm.me>
References: <20260308-tianma-ta066vvhm03-v1-0-869fac443b20@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1114fd13308e962e3c38e2973bfd995b85b98090
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 54264230A1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.0:email,devicetree.org:url]
X-Rspamd-Action: no action

Add bindings for the Tianma TA066VVHM03 6.59" 1080x2340 AMOLED DSI
panel with DSC compression, found in the ASUS ROG Phone 3.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../bindings/display/panel/tianma,ta066vvhm03.yaml | 67 ++++++++++++++++++=
++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/tianma,ta066vv=
hm03.yaml b/Documentation/devicetree/bindings/display/panel/tianma,ta066vvh=
m03.yaml
new file mode 100644
index 000000000000..afcdd203e1b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tianma,ta066vvhm03.ya=
ml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tianma,ta066vvhm03.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tianma TA066VVHM03 AMOLED DSI Panel
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tianma,ta066vvhm03
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddio-supply: true
+  vci-supply: true
+  vdd-supply: true
+  port: true
+  enable-gpios: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vci-supply
+  - vdd-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "tianma,ta066vvhm03";
+            reg =3D <0>;
+
+            enable-gpios =3D <&tlmm 12 GPIO_ACTIVE_HIGH>;
+            reset-gpios =3D <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+            vci-supply =3D <&vreg_l10a>;
+            vdd-supply =3D <&vreg_l3c>;
+            vddio-supply =3D <&vreg_l14a>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint =3D <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

--=20
2.53.0


