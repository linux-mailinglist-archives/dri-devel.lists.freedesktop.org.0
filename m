Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C44FCDD8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871C10FE6D;
	Tue, 12 Apr 2022 04:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486CB10FE6A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C0E42320207B;
 Tue, 12 Apr 2022 00:28:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Apr 2022 00:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737692; x=1649824092; bh=rv
 XBx6Speir9A+Mv16v/VwsiIYejgVfw+Q/AAYmk+hU=; b=nCqCxwuOyoqCh81j/K
 F2e6AtXRWQ/n2xefvng39OVWyZn5xw2tKAlzSrA0syPqcAXewYrx1loBFAIGi5lA
 TA4yP3bbRt3FKDXC9pHzaVY+KHYW6obQ+Z3dtC8CrDYJ9qLq/hdl9+/rL9afV/jt
 V99c9Mg5EnBxXKSIvsZt8RBzxNJ5topKBkLA8R1rEaNg1XbWom9Yom+d0IPXjNrp
 I8Fb1vAvX2cnGESXGK+u0MWZwZc+tsz1fX5WZaEcy6+ywc2zCj5+ZBi/flpzOfh/
 eVOHldwV+Z1KRqiiyelVxRf9NnUCZBEWSXdRVqRjuDFQm0Whcc1kH/cyAucUzbEP
 rkdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737692; x=1649824092; bh=rvXBx6Speir9A+Mv16v/VwsiIYejgVfw+Q/
 AAYmk+hU=; b=bt5f1dTkKFOYNpWvBj0G1DWhdT+5K39GIejpUntlOcspQUlQIDr
 JricfHLsIyNtBimpO1OftBu6fQtxo+KPlDANWskwP5gHuuKFKQzhRKkiqJcx3agb
 3ocl5elJGNRb3cVxFrWrHqW3bmKZ73MWaAmHtWanp+ZarpmS6YSLPTK6lHLF/JHu
 unMBwISbKhEMc5WaQ4Wx1lvMjuGHp35Fr4+E+L99zn39CXu8AFml+iqARMOILm2N
 9TbEf53ocC9XvOrRE+7LskMCHwMqRdOPfdD10q+8amXjzTEIfPpfqyDbUFq2OICv
 xu8yICFVnNXHasO7rwv1ZTrPJPUF9PqmdGw==
X-ME-Sender: <xms:3P9UYle33Q7rPy7VUZARj9mcVcxXHMoiCzHSg9yDsVdIYR0N7B7spA>
 <xme:3P9UYjNWSUV9K72ekId-VaLbKjljCnQ4W2NoZ0J-DwZUodr9Wyfi9pvM-7txT0crb
 d0CsSxcqaSnxDC95Q>
X-ME-Received: <xmr:3P9UYujdDwwVXlV8DMBaGOfodAa1zb3jB-3fb0OO9k_CkFxO1otUEsF3mQtpusshdhLwUxbY4BQFr6BEBG8A9c3JrrRyra_mlfQVpWPLIGLW0lvU57XumByS6evlBuhEMrFiGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:3P9UYu9X42opmEYuiT8WhxOsbkOu_MNtiJipBDYKUyv-p-CNTlX29Q>
 <xmx:3P9UYhvvZFLuuEYeSbCjMgDBnFQHAmrUJB78mhMT2n1Zt2u9WK52OA>
 <xmx:3P9UYtGslht-lE8kwWmmDOrejDg1aRpUh33pBniABdUw9Q1pKegryQ>
 <xmx:3P9UYqET0WjbCr6oVnfQKFjxipLiB9zMjCw1XTSlKfNRX_trPSeC9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:11 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 01/14] dt-bindings: display: Separate clock item lists by
 compatible
Date: Mon, 11 Apr 2022 23:27:53 -0500
Message-Id: <20220412042807.47519-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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

(no changes since v1)

 .../display/allwinner,sun8i-r40-tcon-top.yaml | 111 +++++++++++-------
 1 file changed, 67 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 61ef7b337218..784b267635fb 100644
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
@@ -129,32 +113,71 @@ required:
 
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
+          minItems: 6
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+            - description: The TCON TOP TVE1 clock
+            - description: The TCON TOP MIPI DSI clock
+
+        clock-names:
+          minItems: 6
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+            - const: tve1
+            - const: dsi
+
+        clock-output-names:
+          minItems: 3
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
+          maxItems: 2
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+
+        clock-names:
+          maxItems: 2
+          items:
+            - const: bus
+            - const: tcon-tv0
+
+        clock-output-names:
+          maxItems: 1
+          items:
+            - description: TCON TV0 output clock name
 
 examples:
   - |
-- 
2.35.1

