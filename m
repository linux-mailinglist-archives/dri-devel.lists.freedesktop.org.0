Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397BD590CB0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A78018AFBB;
	Fri, 12 Aug 2022 07:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42793113FF8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:43:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A09425C016D;
 Fri, 12 Aug 2022 03:42:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 03:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1660290179; x=1660376579; bh=Wf
 Jpahh3aSFrGN16htkTw4dfeA0tePGew2nMqyXnTQQ=; b=Zu0EBJ4b+rn/CU/MPN
 fTt8teFR9LeeHCna7nl7C0nu+ejS+IysUA7bih08SLbdwc1BUc8AFprWFDS7Nv6c
 asTpZJxEuImeNiALWV4PwCuTffg+JjkP7/jnR+FrorSei3p/x93LQvqOPRYAOilb
 lQ8sZvpoAWUZjw5OBj0XCUaek4zc8wCBXIYbrZxOWbv4wtxvbhD/v/RiMb4k3fIV
 G1Dd2pMqmrav4X39V7IRC4Bq97XH4FOsxpeli9iDrjS797y3hcvcYqKPtRMXDVH3
 XnFmseI/gA5TaFZWiHM2OyYSucqsy/LWIQEE7fBcQZ29bFSNcjtalMEwzlkUmvHd
 YPYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1660290179; x=1660376579; bh=WfJpahh3aSFrG
 N16htkTw4dfeA0tePGew2nMqyXnTQQ=; b=26jbJgd/CSn+PETj88pnb9hF0mMmp
 FeujPRTq9sGd1tSaKGy4Tkk5+H+Dt1N36FQg/KUfph6NeYuw5chddF1XYpFJxCzC
 k4x5xtzR5Iyb9wTOfuIq+uYSGDyR2yFkHr5zJEEDWbv0csGmhrgfPzbZuvgxbSmL
 hnBcP38q/CFy4PNGClu0Bi7dtNusA3ZBI6v8yVV2yV0p5oOxEDWzhBQvc/9cZPH5
 dFE7IXfuQaf4Ez+w1mIW0qn2nM+0qSJ+ExT03bUJsXWD60jzaTlZg9TDsyOWDsZB
 sBMDbtpZBZjeuogc3tPpLQsntWbyOpZNqyBVb5vk1zwlk5pczRLbhbcIQ==
X-ME-Sender: <xms:gwT2YrTqUMh3ip_25XFWmnuXeae8Zu5KtLMUpoaVlS8U8BTNTQymaA>
 <xme:gwT2YszCN7u-27GuMu5mKIvxCgLVvwipLMxylCP_DsWBdBlKyRMLQCR9Pio-u1Hks
 ryMLLE6vrk_xE_1zA>
X-ME-Received: <xmr:gwT2Yg2RMUOv0ia9J5wImwaqq0jGGgmqtfoX2MHkFe9G3L5KxIRBXsoZP_AlKzAgoOGZU3KbguG1odvmF9a01Iqg_pjE-Xo2-m1AZeTwrL43NDZb1ReQKKtnftyNt_FVtvDmgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:gwT2YrDcS2dGikRzeZyB4Zkpxa4AiM9yjuhhPy_4PQUN2t6ivJktIw>
 <xmx:gwT2YkjbFnKHEeIrMfw3eY363kkExSoS-hYrMXbSXdvPMwKGxbQewQ>
 <xmx:gwT2YvqpBDROyxwKfXFg8TrxwRz9zW1rQtDGEmnMmtC_HgJxWPCmQA>
 <xmx:gwT2Yla7EVLt4l2Zg0oFPWEWiRNV4aHOi336NxVcnAL_psWhiN2dYA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:42:58 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: sun6i-dsi: Fix clock conditional
Date: Fri, 12 Aug 2022 02:42:53 -0500
Message-Id: <20220812074257.58254-2-samuel@sholland.org>
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

The A64 case should have limited maxItems, instead of duplicating the
minItems value from the main binding. While here, simplify the binding
by making this an "else" case of the two-clock conditional block.

Fixes: fe5040f2843a ("dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index bf0bdf54e5f9..ae55ef3fb1fe 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -78,16 +78,10 @@ allOf:
       required:
         - clock-names
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: allwinner,sun50i-a64-mipi-dsi
-
-    then:
+    else:
       properties:
         clocks:
-          minItems: 1
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.35.1

