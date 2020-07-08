Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592821994E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0F96EA09;
	Thu,  9 Jul 2020 07:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822DD89267
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7C4CB2F2;
 Wed,  8 Jul 2020 13:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=IL+LA9pcXUyxj
 UWzIXY3ibODb9Xn3Uwa+7niXIcB3ME=; b=XrAu3vEcCYtBIOxNTnPhnBQUFherK
 sVdVOtD6AMtrIJDXXSVkHN/tP2L9qZKzGu9n6yCuJLtkcLYU2XNfAvZENTDdY6Qw
 eGqKgSyyFCwO3AQudfNRbdnfX1OInznpNEGuzrjdV1Oy49SCQBpGYaBNFzWBSdAO
 qUCYIcxttJhcWQA3EnMwhR9OvZ6tiQ/A6ugh+VBZU+sDRMyOw6Wqn9kA+9gzdjne
 NnPAofX7hGZbk1QKTt2aeLvl4Ly268Alq6KgIG/ko3fte42n4o7HLdG/6gVa15t3
 1/OsvQWjvHahDwiRVRRsQjVHSN6vZqYibLE9z8GJak15RomoHdztnsVPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=IL+LA9pcXUyxjUWzIXY3ibODb9Xn3Uwa+7niXIcB3ME=; b=VN9kDjGh
 2vjQicDSq2PDJ275xRqY7gGdWJ0NyEhC7EyD+FQ2dLldspfmo70zLVPcFR2Nf9Hk
 2uJuATiXQXx0+vyz9kj2D5SzLRVVZ+2KOGgJsXBp24iqK6E+f/3cnEWlEDvGtXLn
 KOGB4xV3E0WwmKx5C2VS0QAvGQwXb2Ke9J38gGcZEBeuIzDBgdpAcDcVYqmox1Hy
 LvWrB1XnqGX0DuuBmidZuC6iDkYG77XyX7DJhXb2P9q8ONHiTFBJHagoT77z5LiF
 uZxeqchaIAkAIS5gecL+Ml9HrB51lyut5OIIw3ORZXiNzCpCXFfHmVOzic8Wvld4
 HTzhZZDaLU+nYQ==
X-ME-Sender: <xms:ugUGXxicgbJWMN30djti37qtVLK8EAdxeC8JZ4_SyXlwkD5hnB5B7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ugUGX2Aig3EUug2rrZjuB7xGj3yMa1J0meFQkTmBiqZb-gXut3NhwA>
 <xmx:ugUGXxE7mA3N2z2QLVTIokewQwJYIEocdgUOYblqNXGCZ1ejyaqXWA>
 <xmx:ugUGX2TYcQVRgSc-CNV25MDDj7SNwxmrCumzmE3LoFVddIXTpoYURA>
 <xmx:uwUGX9kJgP-LeGX2bAw00hQzeMLl0nRb9nD5AJASnpa745VboyGeSvmDOhM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AD19C328005E;
 Wed,  8 Jul 2020 13:43:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 36/78] dt-bindings: display: vc4: pv: Add BCM2711 pixel
 valves
Date: Wed,  8 Jul 2020 19:41:44 +0200
Message-Id: <73fbd3a5bd425af0c91233921bd259520a4d915e.1594230107.git-series.maxime@cerno.tech>
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

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
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
