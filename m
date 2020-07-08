Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93C219938
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A2E6E9E1;
	Thu,  9 Jul 2020 07:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5238F6E591
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4B5DB102D;
 Wed,  8 Jul 2020 13:44:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=22DgldfA68AXn
 ru45DDdHPoK4TUJKVOnMWCmmvRPZfc=; b=SkoUuzjKtGgrp4QhMqSkPA5ySM0KM
 MG6dj5uoifOezXGuEEUUuF5+oX3pakbKdJIzYitMZ9xT5GW52cwoZRG9yMmfVwJO
 7VYk76stb/tIrjJR07WFaAF25e10SygkSN5PA43vBOoO9LtdvExpKBhMDe1V1QbN
 3js7sSjziRK755fjyUPJyOIgpKKErL7OuIPVQfl7wq0Sop3UGb0STIg5TIPUa3Ra
 N/gsIZS/fiJlHTA60+E1EypdnitetYceuMUHSlHwvgGuoOA/5GQJZ9U5B4bPZ3cP
 yG7LYGlhIfeosG/vZ9H6L1QqVAIDMet58jSt533a4J5ollwDPAHnIhXdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=22DgldfA68AXnru45DDdHPoK4TUJKVOnMWCmmvRPZfc=; b=uoYj57XU
 iTS8nLdQTylj/OjSzWS7isg/wF9wqWexENLMBtHWrPS2EautN1w23x55+QDLd6VP
 O5WBs3L3GmPugRlfu43HuwZwVYVqn4V/kFvnX4eHUp6l4WXL8cOzw7cUIGjliSiO
 Zu184flyxHRWjnTmGV/o2SLRQN71m08w+9H/cnH5owj7jO7tbALs5TNcSglHufER
 QRkbC2VunbgaMzX0gvBOSzIwP1MRFS5IgVJVqWuHK2zbyoUddcBaaKr4YRRAhoNU
 nYkxc5iIjHpgBr/UO5dTpTqf9Srlell1cwf1XSmZcW76iMR9ZXXopz9I/lP4MHIB
 N5KCOPAtdzGCLQ==
X-ME-Sender: <xms:9AUGXxWpksRgftCg_XGNNDHcGkEWNQvQuMHAt2TajEZmCn6buKZzRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9AUGXxn4rNOLXZFrd2Gz8uhFWNq009JxD27r2xApXY3UTEIPC96jtw>
 <xmx:9AUGX9Zw-ON5OWp3o7wtwDAd4RSs6q8SliawcU3uI-4P-lY-NipG9w>
 <xmx:9AUGX0W7UySDKp1Yx5JD8eLrfaEiw_ZOlWrlcZ94AVlkF543y50p3A>
 <xmx:9AUGX946nWvvMGiriMOeFy8TUv7KPl6Lh0ylpzj5AV5ZkzCpQcqt4lSsfBM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8168B3280064;
 Wed,  8 Jul 2020 13:44:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 76/78] dt-bindings: display: vc4: Document BCM2711 VC5
Date: Wed,  8 Jul 2020 19:42:24 +0200
Message-Id: <da9668f3676427a63323f33ad8b0d68e733a5fb6.1594230107.git-series.maxime@cerno.tech>
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

The BCM2711 comes with a new VideoCore. Add a compatible for it.

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 0dcf0c397375..49a5e041aa49 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -17,6 +17,7 @@ description: >
 properties:
   compatible:
     enum:
+      - brcm,bcm2711-vc5
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
