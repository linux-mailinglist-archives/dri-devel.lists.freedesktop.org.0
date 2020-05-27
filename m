Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AEC1E5935
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1166E3F5;
	Thu, 28 May 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6B6E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 519AE582003;
 Wed, 27 May 2020 11:49:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=l41voml82pNgG
 OR2Kp29KgbgqjpRY+t3Z1kDCxuBln8=; b=LwyVj0+V+DEaHSykM/vtJwaul2K23
 QDNU8Ty1iOhjlOwxdohJuJbJpJiRiRal4JDGuOHCy+pFzgx77yLj2ixp21ufLsGP
 B3uOtt2puIEP0u8NYd5DAdV8yrcUCiNysE7pkbftLgi5jSSgvA2LYztDgMaDPGPD
 x4jkhmPbV97DYnvZypq8cSAMYzsHsm0uyA+l7Y+nXuO7fzsyTccxPr+CIxugluzf
 Y7jaRyvLS7blQGyRqAZgju97h2dEn4BGLnZB1ncCUi4ad1wziJIRsBpPQFRKjaGU
 Y5zWHNiLV9HlcUVDwfNvWtNTjMdFLS6yA9u1pLWa91qXv9uCdRB2u/PvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=l41voml82pNgGOR2Kp29KgbgqjpRY+t3Z1kDCxuBln8=; b=l+sQWYkP
 QN/PjzUHwCSyMNiqasejVTcljvtl09YxV+msYyoEc72qm/JuTSj71dtQTs5TE/h0
 o+VFasE0INxrM39eUGxcELp3BWrC+0UJi8z7yXa0zxjXZEK4e2zCbQGdcdcUmHWe
 DOtT4wQGCG5FzWELp+It3z2iTsLbfQAtkCfGCDOVStSFKtobvmL8z2M9FRT21jYc
 l8DEYeOXbkCU2fsZ5fP5/57GLESKufFEU+ussoqrBZ3v/SsxKVfJ+ziAcXWZQlru
 gDPUNWZwr81f7d/i0ddHpb3PuPU/LG3XeqTdyeBqaJhsOEWlS6GqkHEqiubXDKLM
 MkaMi5/UT4Oa2A==
X-ME-Sender: <xms:C4zOXmVdW4IhUCfS7EfZ1WYyfxrl-Z8g26TGHVebdW-FJZdP7d75uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C4zOXime4Y2KPW2Ahpz-wCnnlt7HKomlUMiw517uPXZvmlIXpw6UWg>
 <xmx:C4zOXqaFVXAc_3WD1Q4_Gi5kHA-D_MgokN-UnSin9yiGttzD1w40Ew>
 <xmx:C4zOXtV3aBhJjmFHhdaApBUCn_DZ22u8GbT2mDOpJo2D-8kgUoFH0g>
 <xmx:C4zOXtg3D02naQZX4ovv9wDz5f-W1nLksx6jk9Dktak5kYpjcHTHng>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E87AD30618B7;
 Wed, 27 May 2020 11:49:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 009/105] dt-bindings: display: vc4: hdmi: Add missing
 clock-names property
Date: Wed, 27 May 2020 17:47:39 +0200
Message-Id: <10ef2821e10886b66af5f8ba3e212aa87e9fd360.1590594512.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the device tree and the driver expected a clock-names property, it
wasn't explicitly documented in the previous binding. The documented order
was wrong too, so make sure clock-names is there and in the proper order.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
index 834cc5f1c254..52b3cdac0bdf 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
@@ -23,8 +23,13 @@ properties:
 
   clocks:
     items:
-      - description: The HDMI state machine clock
       - description: The pixel clock
+      - description: The HDMI state machine clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: hdmi
 
   ddc:
     allOf:
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
