Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F216A2A8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EB56E34D;
	Mon, 24 Feb 2020 09:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A506E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 264EC630;
 Mon, 24 Feb 2020 04:09:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=w4ZWS7I/FMi9e
 iNUeFd2hb4b5Xeqa7Yfx7o20ZPZqYU=; b=JTA8tji+CZZpcxr0dtrdYDB1wPVQQ
 /VOFhn2z+By0P4mIAASVzS79grqcegrA588V9gbnrqwShRQOpgKmIKMSdl4EYXKT
 HYHWzTM4Y7+S+b/mbZeg9hfJVQnlpjmd95Ve9dmn91m/4BLUp/8gxa/AgOZmIT5S
 ojS5vH+X9CKPJyvAZbnf7UE35xDKtKZOK58gjJAFjn9FbpVuv51y4s5z/7B9Fg1/
 Wq1iZvfjteORphTjWKBia39YhJrskji8g6qpOfYAGgbJYpofYesYQ2AMOy8TQjBz
 f1ytfYlJyRrFIaJMlZ1Jm0cEJCFkVh2C3+4hDoSPkNgE1brQV1jBQp6Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=w4ZWS7I/FMi9eiNUeFd2hb4b5Xeqa7Yfx7o20ZPZqYU=; b=amWnolIa
 kFoo2t0Qg154lAVfe5TE2HlEjFaHlVHv77KNMzbQFBFDquXFV5WNfE9kzZVqYPx6
 Zhm3S3ZQiZ26EAmtzdOfy9ji8LG0IJPtsWQSVq+8SZnnF4Y91NudksB7/caxeV+L
 AkJ2ibzCQAFYdT7Na+oYuVjt+pBrF5QZXAEGD7c1s2wpNYJ4LTCAyanLWdfgu3hT
 VXQ7aBn0tXyCldpwY4ch7xfHUYogDJ7nrH3ks7/rCf5es9nKoiM7Zvyx8ooVqsLf
 5Ls5hfYEjQNemQV58LDx+de/64am1DMIIhqV4K9kRJyRfFH7MTEO2aTfv3o3Qdhx
 RAyo9C7LdnxHYA==
X-ME-Sender: <xms:z5JTXomxGRuYd3rcagMms7q31v3p8KKh4RYmxNru9DRuJhAob61huw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:z5JTXo5kbv8w5Cpu0yHCM4ganFoIb3yjw8a58J9un34Xi7JCgSNi-Q>
 <xmx:z5JTXpk5yP1pebAEim-iRflSjY78cC8SvmNTKK93ucYwvNRgEvUDNg>
 <xmx:z5JTXiRC5gusWDkp-vxTHknINGROZzmn34cJ98PbkL9isZzrfzahlA>
 <xmx:z5JTXnVB3Frk6-emshScC9ynE9lw3Vr9uqU9Vn1KdXzIoO7RryOiFQae03Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 66969328005E;
 Mon, 24 Feb 2020 04:09:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 32/89] dt-bindings: display: vc4: hdmi: Add missing
 clock-names property
Date: Mon, 24 Feb 2020 10:06:34 +0100
Message-Id: <d549097789913d64104d6a5924af5b5981beef9b.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
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
