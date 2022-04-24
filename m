Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD550D34B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15F10FC0B;
	Sun, 24 Apr 2022 16:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47F10FB80
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:26:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 49F305C0112;
 Sun, 24 Apr 2022 12:26:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 24 Apr 2022 12:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817597; x=1650903997; bh=iZ
 8UlWzjvuD9578rf5+qyEth9oXMoy4abZ8+2x1E9TI=; b=LU+CgGYWItGih3EZoW
 2BA2xbYs6LRQaS2/4drtlMuO47F0oSD1SMjch+h/dsJM+48sV5MdVCE5oRwkq5Ei
 +3Nm8889pnsNNNEDSkaNIKum7de+aogyuFHzhHCeZTGj+8pcxhfBA5APggj5UNhL
 aXjcbCnHe18RKvlyn7kAoRAZghl1dmp0tQ6OFT++tbk9ykOFo/RoGj+Ub3RDs6Qf
 ka10ttlIm3K3UNqG7kekdnsS3Pl/YdcpKKgWOjBUQ2BGvEeaRamFOAAUE3V43tPj
 K2vJ6ONJCtEp1/Ox7s12yy0oSs9WpF+axg7vJpyjgFJP9z1E05BS129pxDb/bj4M
 qoGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817597; x=1650903997; bh=iZ8UlWzjvuD9578rf5+qyEth9oXMoy4abZ8
 +2x1E9TI=; b=dKvZ9lq93DVs9J+rT5WMTSvg0j9W1BVyo3dNGkMlLF4uREL2eHO
 sI1VaTnyT8vXrZEwPpCw+SrezHcptZ4cfGLZ5L7514SxNhZIZG1/LsnhK+aP7Adc
 AsM000xnf14LgErHp1N3oTKm+3e/Q7YfcAOZSf1kWQSGyNI7RPC6duK7i9WS4XZg
 F2JR11/DNjY1p+u43ie8RGoF8YeKGFByjtr/XnyN9vaqM3fpW+HzG9OafF7juLVI
 84zYgMNkzpa2PUaoWLqqOEXHymO/XTUMg4kJyJyPOY3JsVnzZVkWNG1Gjm0SNj3K
 PSOmdSF0ggtWRWCocmjSzBcwbDHfUgrm2tg==
X-ME-Sender: <xms:PXplYsWZhgAKqMyHOR_DnqgPVUWZe3tuDEC0Uxs_-jES4NzPCO4ucg>
 <xme:PXplYgmTCAdCbUXC5SDiGu85KSsNBefECxI9UH7ue_aysW9tEwRybQO6d1EtvrQHm
 SXUjOzP9SPQjuzq7Q>
X-ME-Received: <xmr:PXplYgYJbQSrKrTmjnVXUC7UgNyQv9b8Z84-Zk07mbOHXg3u1fyUWWNWHXc3VSTVNOeJvdkEXW_qqv80bu6A3jWCDe7DokID4-sRiLExCPKITfeZ-pCJIoLA5YK48SQRPWBEVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:PXplYrWn86KOgknX24vf--Zuh13nlC_aVwUeZHu6tdFYe2VhOamEyQ>
 <xmx:PXplYmnKihdq0rWh5O46RgZ9SwDePWooMQwMgOO8eT3h-Wo6ZBY2_A>
 <xmx:PXplYgchpd_f6w9s_Tqhwh54oAdEq6k0CJ1EUYaw7a7r6KWi7zDXIA>
 <xmx:PXplYh_OPmYS69UDq-tyMKVbnN55bEXBaMIQGK7betR7PenICTVg5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:36 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 01/14] dt-bindings: display: Separate clock item lists by
 compatible
Date: Sun, 24 Apr 2022 11:26:19 -0500
Message-Id: <20220424162633.12369-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far, the binding and driver have relied on the fact that the H6
clocks are both a prefix and a subset of the R40 clocks. This allows
them to share the clocks/clock-names items and the clock-output-names
order between the hardware variants.

However, the D1 hardware has TCON TV0 and DSI, but no TCON TV1. This
cannot be supported by the existing scheme because it puts a gap in the
middle of the item lists. To prepare for adding D1 support, use separate
lists for variants with different combinations of clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Drop redundant minItems and maxItems

 .../display/allwinner,sun8i-r40-tcon-top.yaml | 105 ++++++++++--------
 1 file changed, 61 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 61ef7b337218..449fa99aa51b 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -48,31 +48,15 @@ properties:
 
   clocks:
     minItems: 2
-    items:
-      - description: The TCON TOP interface clock
-      - description: The TCON TOP TV0 clock
-      - description: The TCON TOP TVE0 clock
-      - description: The TCON TOP TV1 clock
-      - description: The TCON TOP TVE1 clock
-      - description: The TCON TOP MIPI DSI clock
+    maxItems: 6
 
   clock-names:
     minItems: 2
-    items:
-      - const: bus
-      - const: tcon-tv0
-      - const: tve0
-      - const: tcon-tv1
-      - const: tve1
-      - const: dsi
+    maxItems: 6
 
   clock-output-names:
     minItems: 1
     maxItems: 3
-    description: >
-      The first item is the name of the clock created for the TV0
-      channel, the second item is the name of the TCON TV1 channel
-      clock and the third one is the name of the DSI channel clock.
 
   resets:
     maxItems: 1
@@ -129,32 +113,65 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-tcon-top
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-output-names:
-      maxItems: 1
-
-else:
-  properties:
-    clocks:
-      minItems: 6
-
-    clock-output-names:
-      minItems: 3
-
-    ports:
-      required:
-        - port@2
-        - port@3
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-r40-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+            - description: The TCON TOP TVE1 clock
+            - description: The TCON TOP MIPI DSI clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+            - const: tve1
+            - const: dsi
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
+            - description: TCON TV1 output clock name
+            - description: DSI output clock name
+
+        ports:
+          required:
+            - port@2
+            - port@3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
 
 examples:
   - |
-- 
2.35.1

