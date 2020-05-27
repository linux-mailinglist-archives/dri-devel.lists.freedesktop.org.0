Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D41E598A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807D56E435;
	Thu, 28 May 2020 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E12A6E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7626758200F;
 Wed, 27 May 2020 11:49:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=m33/GpK4Sa24j
 4S+fnmVvjFqz0KFoPPGqLfZr0rxfJ8=; b=tqdXa1ylBE/UVJtc3ANF+oflooYd+
 WPobjk+0RvLKxTRQiXTnydTARlNhVdMTdGGGLuPSyKjuQG7ZcSsWAA18NtV2BEoi
 6Qdsvm3JfFnrDms1YB+h6Q4I45KiES1ihQRNn8GZ27gSNFuZ52f7hWsHiE3rLCOb
 rSDPZ9t9M8qAv6It+lS6vMFIMxvC6lFr8jj/Y0uTpxh5waB1NL8csQmg1UX8Et6U
 oCnsUGfFd/wYyZlsik2XtAd2z1obUL95wAniUdqSrKCI9blue/SZaQ6CI2TaJT9q
 zb2SVpwYo/FkNfCqj8Kb8aOt3AGl9CyTq63hQb4083YXsOME2U+6f6RKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=m33/GpK4Sa24j4S+fnmVvjFqz0KFoPPGqLfZr0rxfJ8=; b=yHaLYnwB
 6oTEn7UTcrBMFS06+gc8YQWwsA4NyN0XTHqIUy8pD7u9/y1u/jpsodNzRsqMaFAe
 UvT+ubemRcNMJ7xv7a9YeN/LaKRb1H4yXWG2+mN8KNKabtOZPEZ/WQtz9eCf0oz+
 iffPFC8w59ZRid0CWS9QnY/nW9fDz3ybVYuuMWiYEmQzMZU59TXruF70oKAzb6Jt
 rz/en952aQQqe1opIA+HgASAW3cyI0BerKnybP2yZTS614wIRHt5vPb3FYj7enNx
 vgrf4Z3fSKwsHtBllXBNUAkRZ6PC8PMCzVvD8oUGatmiVFqQ1HH/m8vx0dB6QscI
 J0SCeBDSk787GQ==
X-ME-Sender: <xms:EYzOXhyVUDBRq8q47qeTsTA2hIvsBGF1SY8KHADHd29Xtx7VVodwUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EYzOXhTBDP6r4e7x6hMJhPgFcHpfiHPeZn1h-aN8CutDvOffEY4eGg>
 <xmx:EYzOXrWFtu5cQ3eymv7uJKseFN4rt0R0PwoEMb_Rls77PbCcndfYsQ>
 <xmx:EYzOXjj4lh1x0JG6UirMcDIgT1ALIZLbtp2Sy8hb9NrWp18s5eFphA>
 <xmx:EYzOXlC4OIoxHqh8fqcqQsGo_5VIJ477IleCj0O6k3_kemjgtFGuiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 131B5306215A;
 Wed, 27 May 2020 11:49:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 013/105] dt-bindings: display: Add support for the BCM2711
 HVS
Date: Wed, 27 May 2020 17:47:43 +0200
Message-Id: <9d1718b1d3b73da4522861bf16730cc47157bef7.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 18 ++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 02410f8d6d49..bb1fa805b14e 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-hvs
+    enum:
+      - const: brcm,bcm2711-hvs
+      - const: brcm,bcm2835-hvs
 
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
