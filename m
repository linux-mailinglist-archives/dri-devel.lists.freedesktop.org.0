Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760225D1E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C580E6EAA5;
	Fri,  4 Sep 2020 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853316E57E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4DCA2B19;
 Thu,  3 Sep 2020 04:03:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6txcLK9XS/umD
 ai20rz0YaH0SugcRvZLRpEWcEN1jU0=; b=asoKpVlKc+1v01Yu3/H77bGv3Arpw
 sF/yNn7NpY3xp1tR7xx9EuKR8TbhHO28ELFI7bvz/SfxJFbEfC7jI6C5WpEv/4YY
 KCVA68GX7VXLQzID0z6n1snoHjr+OrB2hKch9S5yPBDf4iHW74sKVzLTwzG7B5H2
 NE2FqPJUAv8iZHrLq5iam7o11z6EraaaTstPUxvpeMgk3EezG0+gjBoxvNrjTtGp
 vzLost8f9NIE3JjD7HACcT0cz7toN1CjfrV7EBSr15T58p5qP4B6bILec27YGHzE
 2aYTakIVzDIZnbBKRNbjZxAsodIT3NlKTSci0Xna8Imo0cF9hbHsiGYOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6txcLK9XS/umDai20rz0YaH0SugcRvZLRpEWcEN1jU0=; b=gdndLaGV
 9bjkoBpSQeY81lcl0AP/KyYs9Lkb15GPMb9yiMyN/v4F9oa7jk8JCTrP3UQtNk2N
 DSSRYgGNdCbSS2OZwaWC5VAardemN99OzVHzv+ukwUkyzWZUsns0Z5rn8BOT6crB
 MF3puEI69ZNADoDXq2wVy9oy25st49lV/upv5S6SF7o6J0mB9oam+6Zh29TNFgU5
 2v2NzLs64xXxz0lW6Fir7zQ+mW2RDl5FZoyPdM2MwXYSBrBaeptF/U/GxCzVMxcf
 LZCPEq9/AWN4JLhyn1nI06KN1sHcdJLq3JbwyLawVWGR+DYSKcvujnX9Sw0hKYAh
 su7EGLbEujo0qg==
X-ME-Sender: <xms:XqNQX645TScxcMwY5xPO_q0lXiSQnBN4UmJvJPx9_yIv13VaJBpN_g>
 <xme:XqNQXz7_EXZR10-heYEQfXoXt0PF65izT-l8d9luThieRQISFI5geYd-hP4AXT56l
 p46wXJIOw4He-o9DR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
 jghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomh
 grgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdev
 gfffgfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpe
 guvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XqNQX5e5g3lAglKBbbjJkl27rRRhv0Fs4asVXSKHAu32QSqHQppdOw>
 <xmx:XqNQX3Ib62OV-K-MDBT8fl7WGJJl8j0LQaSt3oWBRKRJR1H7LIE0-g>
 <xmx:XqNQX-LfHituxjPI8To9ohes_ILdcd-hjFRpST5u3JFnIGFl_8BzWQ>
 <xmx:XqNQXwDBGQWAzGdRp8EZ5npNoeVUwf0EUcq1PoSMtrX0JfAmQeVm48-PTB4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B555306005E;
 Thu,  3 Sep 2020 04:03:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 77/80] dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI
 controllers bindings
Date: Thu,  3 Sep 2020 10:01:49 +0200
Message-Id: <ecd686e9b2335275bfb1ccfe1878305367b34bf3.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controllers found in the BCM2711 SoC need some adjustments to the
bindings, especially since the registers have been shuffled around in more
register ranges.

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
new file mode 100644
index 000000000000..03a76729d26c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2711 HDMI Controller Device Tree Bindings
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-hdmi0
+      - brcm,bcm2711-hdmi1
+
+  reg:
+    items:
+      - description: HDMI controller register range
+      - description: DVP register range
+      - description: HDMI PHY register range
+      - description: Rate Manager register range
+      - description: Packet RAM register range
+      - description: Metadata RAM register range
+      - description: CSC register range
+      - description: CEC register range
+      - description: HD register range
+
+  reg-names:
+    items:
+      - const: hdmi
+      - const: dvp
+      - const: phy
+      - const: rm
+      - const: packet
+      - const: metadata
+      - const: csc
+      - const: cec
+      - const: hd
+
+  clocks:
+    items:
+      - description: The HDMI state machine clock
+      - description: The Pixel BVB clock
+      - description: The HDMI Audio parent clock
+      - description: The HDMI CEC parent clock
+
+  clock-names:
+    items:
+      - const: hdmi
+      - const: bvb
+      - const: audio
+      - const: cec
+
+  ddc:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle of the I2C controller used for DDC EDID probing
+
+  hpd-gpios:
+    description: >
+      The GPIO pin for the HDMI hotplug detect (if it doesn't appear
+      as an interrupt/status bit in the HDMI controller itself)
+
+  dmas:
+    maxItems: 1
+    description: >
+      Should contain one entry pointing to the DMA channel used to
+      transfer audio data.
+
+  dma-names:
+    const: audio-rx
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - ddc
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi0: hdmi@7ef00700 {
+        compatible = "brcm,bcm2711-hdmi0";
+        reg = <0x7ef00700 0x300>,
+              <0x7ef00300 0x200>,
+              <0x7ef00f00 0x80>,
+              <0x7ef00f80 0x80>,
+              <0x7ef01b00 0x200>,
+              <0x7ef01f00 0x400>,
+              <0x7ef00200 0x80>,
+              <0x7ef04300 0x100>,
+              <0x7ef20000 0x100>;
+        reg-names = "hdmi",
+                    "dvp",
+                    "phy",
+                    "rm",
+                    "packet",
+                    "metadata",
+                    "csc",
+                    "cec",
+                    "hd";
+        clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+        clock-names = "hdmi", "bvb", "audio", "cec";
+        resets = <&dvp 0>;
+        ddc = <&ddc0>;
+    };
+
+...
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
