Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45D9590CB8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A618B34D;
	Fri, 12 Aug 2022 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044111BADF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:43:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 983835C019F;
 Fri, 12 Aug 2022 03:43:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 03:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1660290180; x=1660376580; bh=G3
 HetWTYQKtK8QqCgUM2kvq7Vfig4bZOw18uodekdq0=; b=T9ZP3+OmCNOlHMH3Ja
 M9aTNeExWZEBghnxCOB83oU6LN97pUTbE4ANlqDqH6pCinCgeM6P/R4Iv9SFqTfs
 +0vsDVCKwMD1WbxUJKL2Xbyj9FZ5oK2cqMKnxkGlO825r8y283VVa9NfLMPEWIhA
 +GhsaZbWEdjziJbn7ljdd5j81cBx3ihDVOd96SdFRCG9ocfo6GjZk76uVvYCHIfY
 VFgXL70xgaUdJWOmRK+VXneI/oegUyohz6C269Ab3ADr31VdnXG17a4eCQqukBJb
 i/MyIpmiJvf9JC7rgLp27FTf3Mqfb7g40sYrqMoXscEKAALtiU997pylGYbwofZK
 +/Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1660290180; x=1660376580; bh=G3HetWTYQKtK8
 QqCgUM2kvq7Vfig4bZOw18uodekdq0=; b=4d6jOEwij7287N+2LpgNABsI8x3vi
 Iw15bgocjZ+PtK0CsnDn0XTGmpY9tz6KsOz+ckkgmC8UT9yZ6bCTOTUOingBAzZl
 CliIIHnCyPCJF09QZCb5y9BShhZ0Q36GRSKllk9NU1LzgW4QIEge8rb0GRtAJx4v
 MfsCXw7QQguWRFr5gS93OS5HmR2ZBxdmZWYahX62iKZJg0xomx4q7s9CjSPgQzdj
 jSQq3Kw76lKPEqzRE5tYENwy6fx23gDAdoFD7zSSmqtpmNdJ9yoAQk5mNOcr9Dwo
 oCtFXBZOenOFkgIWOgzNiE6DRG5sntdqt3lqyI6QivLNqoa7aypFChEEg==
X-ME-Sender: <xms:hAT2Yu7A1_RfpyAjMbfFTXTkR25_msqfh1FfeRHBMY0m08aPD4C1CA>
 <xme:hAT2Yn4VkZ6E-JYsAzbZBuAHEUo6A1oYZu4Re3ZJKeL9t3wCi_pYUI1YRx1eiS_Lo
 zrplBjm1uPqM5nBdQ>
X-ME-Received: <xmr:hAT2Yteynei1uacOcT1matKwWT1UlYRS63qrCr1ExZXkBone0DneyWjbrCSoltGxheToi_2e0hiBhMKrZBloVCQRmFKPjMBo0V3yi8mp-t2zn8-LSGD4DlnSiFXvhl_wlpvp2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:hAT2YrK76U4CmQDqTCxWH51ktgutirQipdI1se9B3y5OSsTQX656mg>
 <xmx:hAT2YiKbgjhVRp5MVrUyAIPLSEPJ3HpJtAKzR5Pp_yAKe-IutdyOpQ>
 <xmx:hAT2Ysw1O2eJCYgaWtNVq0CvLIqqJgm9IIdXumZAkFFeG53FV-9U_Q>
 <xmx:hAT2YkDe_9_cuzhA1ghSkqzJUfKtRhsiwdzwXJCFxUjh2hB1EH-Clw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:42:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/4] dt-bindings: display: sun6i-dsi: Add the A100 variant
Date: Fri, 12 Aug 2022 02:42:54 -0500
Message-Id: <20220812074257.58254-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220812074257.58254-1-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "40nm" MIPI DSI controller found in the A100 and D1 SoCs has the
same register layout as previous SoC integrations. However, its module
clock now comes from the TCON, which means it no longer runs at a fixed
rate, so this needs to be distinguished in the driver.

The controller also now uses pins on Port D instead of dedicated pins,
so it drops the separate power domain.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Removal of the vcc-dsi-supply is maybe a bit questionable. Since there
is no "VCC-DSI" pin anymore, it's not obvious which pin actually does
power the DSI controller/PHY. Possibly power comes from VCC-PD or VCC-IO
or VCC-LVDS. So far, all boards have all of these as always-on supplies,
so it is hard to test.

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index ae55ef3fb1fe..c53c25b87bd4 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -12,9 +12,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun6i-a31-mipi-dsi
-      - allwinner,sun50i-a64-mipi-dsi
+    oneOf:
+      - enum:
+          - allwinner,sun6i-a31-mipi-dsi
+          - allwinner,sun50i-a64-mipi-dsi
+          - allwinner,sun50i-a100-mipi-dsi
+      - items:
+          - const: allwinner,sun20i-d1-mipi-dsi
+          - const: allwinner,sun50i-a100-mipi-dsi
 
   reg:
     maxItems: 1
@@ -59,7 +64,6 @@ required:
   - phys
   - phy-names
   - resets
-  - vcc-dsi-supply
   - port
 
 allOf:
@@ -68,7 +72,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun6i-a31-mipi-dsi
+            enum:
+              - allwinner,sun6i-a31-mipi-dsi
+              - allwinner,sun50i-a100-mipi-dsi
 
     then:
       properties:
@@ -83,6 +89,18 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun6i-a31-mipi-dsi
+              - allwinner,sun50i-a64-mipi-dsi
+
+    then:
+      required:
+        - vcc-dsi-supply
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

