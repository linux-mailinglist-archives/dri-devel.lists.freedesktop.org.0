Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57144219904
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9536E9BD;
	Thu,  9 Jul 2020 07:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488A56E906
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7B643FE4;
 Wed,  8 Jul 2020 13:42:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VvkOrdp0/W1H7
 d2xBkajwWCmAwyF4FN0KGbgAuGNezY=; b=SquIMpq9vxvq8BuyxMlKG1BQo7jKN
 o6wc+OthGN8GJ1fMBuMoMHRFGSbN3FnwSiTjFKe1eUTeHsJgWROtx6OJeU0cf7GR
 rYkUuzcenfjpydpBvPBfwK7FQyE+pw5wkdqmny9pZQFw0ymcHnFAMQDfOY4VODvh
 mIG4qRC3VjAmZP+LYNBiV8orHujf0sitKtVl/d8Owr9Lqu/8gnycB91w58aCIlUF
 TkPER58YpB6I2KighEIDu9mZOH5nfP1ECSSrcPzzOQUM4qv73a4leCNKLw3O0JHt
 YtQZjOEnOQPfdsYc35y0oqKpr2+u7PULuaTp2vEosSR0clGWEWokPNWKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VvkOrdp0/W1H7d2xBkajwWCmAwyF4FN0KGbgAuGNezY=; b=oR+mI9ew
 wrI9jHcIrJZ273QLwFe0ETJToJPZb9/tLA+gG2IGXwdMZjycPJA1syYEux+Cd4RZ
 +sJFG4E4TR3nMIUOzuS2hAtoJlU5QcqxRY5Oo7yqvW4FWJY9+BhVzL+z18OssUz3
 gI07YZ6jtT6XIx2ZHHmIxZ2f+hhdIanktlqQZ+Rzm1S1wGakrOvSpv4/Hd73g7Hi
 mm5UT9/6fjAbo7RAQDRhI1t8088PfSbXP8NoGb/q+0oL3CQun6Xd9rt4RBi9Ha2m
 xJXJrqLc4pLrR6Yv8HqRfuP71mGPEQrRitayjftHBsr9a3j5vRtn5K2EnpkRNDn2
 IIZOpn4ImqZaZw==
X-ME-Sender: <xms:iAUGX6NWKBsc_-T-JRmnOnS-15jTckt4kDZlbPxKyUIYRWovyNsqHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iAUGX49xPU4bKR6bUumDizPLJ3J6VWR55y3G1koVdafn9cEFTJYFPQ>
 <xmx:iAUGXxQsZC22oJbsD5atXbxOyD-gN9u1O3PZLQFZRMhHIAXYWMNuMg>
 <xmx:iAUGX6solJI4EjchgVbQ5qG8raqfNDeOjvCxwyhwkwzZbMEbG66DPQ>
 <xmx:iQUGX4t9sl_pZo8fI_RKZ5ZCH2R8gBgvido-3rqLHDU1aaoM-oqCVRZZn0w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7E4B30600B2;
 Wed,  8 Jul 2020 13:42:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 01/78] dt-bindings: display: Add support for the BCM2711 HVS
Date: Wed,  8 Jul 2020 19:41:09 +0200
Message-Id: <2e95580cd3dbd1d9acd6b528c069c82e6ffe5ae7.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS found in the BCM2711 is slightly different from the previous
generations, let's add a compatible for it.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 18 ++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 02410f8d6d49..e826ab0adb75 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-hvs
+    enum:
+      - brcm,bcm2711-hvs
+      - brcm,bcm2835-hvs
 
   reg:
     maxItems: 1
@@ -19,6 +21,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: Core Clock
+
 required:
   - compatible
   - reg
@@ -26,6 +32,16 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: brcm,bcm2711-hvs"
+
+then:
+  required:
+    - clocks
+
 examples:
   - |
     hvs@7e400000 {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
