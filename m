Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16271E5988
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12166E489;
	Thu, 28 May 2020 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876CB6E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E600B5820B3;
 Wed, 27 May 2020 11:50:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mIo2yTnIciTwR
 AfqGqPRdeUMoEIyJ/WFBxN68ut8oG8=; b=WIujI7WharlAGicvX2WyOiv3jX+w/
 sT18coLSjEtk5L6aOGZY5lEKGgnwldzH3cLD8lbkMcVhqvgRz3ICcqIxnBGeRMrw
 sCG3316RnFnMeU3i7e5daLdaLKRYg7+FjeHtF0AEpaV0IQ7C+1MFLC+CbSpOWUq8
 Vn3+NbxUHP5RNbgafLj5MOlPPLpXGsan+WRemQ9AKtNZ2fkjRbsrk4Q9CHqW1crt
 s6Fmu23OKv0wtN4mphn96mVswCajMnF677jS+WpYpaTucREJhPkTggCh8/UYY8FJ
 1UyDuHxaMWLdKntiSlyOJfz2o7MBprRWdDO6lqtxZMkVGXND67UCYIgTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mIo2yTnIciTwRAfqGqPRdeUMoEIyJ/WFBxN68ut8oG8=; b=Wn93fV+R
 q1M2XVFtqYnkqegBnI2+hcYd65lr3f+m4BIGlxHmdf6Hgre9IShj5JSu7XGCoXz8
 yE1eZdm5wV5arOOa4w2NiU3YeUN8gw1fXX0yU9Xr9IsJBNuQpRC7Lu/HNUDfddqG
 0USSPnOFBnuYyRh5hEXkMrmMlWQUGDXpxlYp5yza7lRjsl25J+ZZ5Rqqqyiczz5A
 6Y+vrG7MRNzE+ptXg9W/IzFwduiWxOZeFqevg0I2owrehgdm2zYHq5DfTMITEczi
 4H8DDAVfixWaqZKs/4sqtQ3QLwSfPAA3lKzrTRRx7b0vRpBPbHEebDd9YmMP+y7/
 KAovOHXo2fb26w==
X-ME-Sender: <xms:WYzOXuaXTafeeH1qBIUAYGWr3X21ebDrB9dOHZ8wFMBc7C6HItNLbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WYzOXhZtgLYNhhexBOTBA6ekPuv5j5tLZn190Cf_lBBfLsUgv6Q65A>
 <xmx:WYzOXo-OWLJuw1Pf0HRrPKQfBDUL3huWfJqU7z1Qe1pA2PzsrA7jDw>
 <xmx:WYzOXgqZgDKyETahtm56zYeJtFcIIQQ75t6Ma4356fq1LYgp97pVng>
 <xmx:WYzOXk0QdgkupH8rqEGRjj03brjLl77Z9AxUQD2EfQ-GxsT29GxhBA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8671B3280069;
 Wed, 27 May 2020 11:50:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 058/105] dt-bindings: display: vc4: pv: Add BCM2711 pixel
 valves
Date: Wed, 27 May 2020 17:48:28 +0200
Message-Id: <38e915fcfcbc6896344423eb651f60cc04273caa.1590594512.git-series.maxime@cerno.tech>
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

The BCM2711 comes with other pixelvalves that have different requirements
and capabilities. Let's document their compatible.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
index e60791db1fa1..4e1ba03f6477 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
@@ -15,6 +15,11 @@ properties:
       - brcm,bcm2835-pixelvalve0
       - brcm,bcm2835-pixelvalve1
       - brcm,bcm2835-pixelvalve2
+      - brcm,bcm2711-pixelvalve0
+      - brcm,bcm2711-pixelvalve1
+      - brcm,bcm2711-pixelvalve2
+      - brcm,bcm2711-pixelvalve3
+      - brcm,bcm2711-pixelvalve4
 
   reg:
     maxItems: 1
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
