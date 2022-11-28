Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D863AC38
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 16:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCA897D4;
	Mon, 28 Nov 2022 15:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6C889664
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 15:23:57 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3E8A7100002;
 Mon, 28 Nov 2022 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669649036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKHAg1cVHEhagz6zCtsb8zjr1ngIs6Y68PTvy+DOXVk=;
 b=BeUo6hYVFhdXTHv65hQpc0YqNxqpX68WHeUq/wdKu3YJ/al/Nv9Y9OFhG8e8ro21iGjJyp
 UvgU29eXk4d0z5JOT+dWT36nwdSEVLhd5OdIwba+FnWRmsuDdSTrrNcrf5m0IAEWJItPOV
 65LtlT72/Hm7oaYq5mClLm5Zq7GPdFyy9ad5LWL1CSQNhG3rqI2jk2RVVrCXQydELdmYui
 LTRcotkGB2a4bN3WWgw7tF77GA4yMB3Fh5gXqh8HiMrV7bUV26+thagCmk3S30/CWyKQRm
 0qySvMNWAVodKy8LwQ7r1ZuFk1qPncpqPrFHCMPJY5Xp72oB47+1fQFif6m6iw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Date: Mon, 28 Nov 2022 16:23:16 +0100
Message-Id: <20221128152336.133953-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VIP is the parallel video capture component within the video input
subsystem of Tegra20 (and other Tegra chips, apparently).

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2 (suggested by Krzysztof Kozlowski):
- remove redundant "bindings" from subject line
- remove $nodename
- add channel@0 description
- add reg: const: 0
---
 .../display/tegra/nvidia,tegra20-vip.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
new file mode 100644
index 000000000000..44be2e16c9b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra VIP (parallel video capture) controller
+
+maintainers:
+  - Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-vip
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  channel@0:
+    description: parallel video capture interface for the VI
+    type: object
+
+    properties:
+      reg:
+        const: 0
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              Port receiving the video stream from the sensor
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              Port sending the video stream to the VI
+
+        required:
+          - port@0
+          - port@1
+
+    additionalProperties: false
+
+    required:
+      - reg
+      - ports
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - channel@0
+
+# see nvidia,tegra20-vi.yaml for an example
diff --git a/MAINTAINERS b/MAINTAINERS
index 69565ac0c224..92c762f85f17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20315,6 +20315,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	drivers/staging/media/tegra-video/
 
+TEGRA VIDEO DRIVER FOR TEGRA20 VIP (PARALLEL VIDEO CAPTURE)
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+L:	linux-media@vger.kernel.org
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
 S:	Supported
-- 
2.34.1

