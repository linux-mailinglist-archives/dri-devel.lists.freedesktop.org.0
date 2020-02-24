Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189416A2BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51D06E378;
	Mon, 24 Feb 2020 09:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8BE6E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B5261605;
 Mon, 24 Feb 2020 04:09:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=uLtns6AGYyhR2
 mHtFQT06p/ZWFfTJ2DIAXurRHKaoRw=; b=DhKd0P5GJvdLtV2/9K7KSzrx0m8W7
 khCKpVHiuVVcOUu6TxIZn8muLo/DnMOZDHAeTI0Zqody+6sf5+dHsohu0/fgVC5R
 783wB/saX4Vrt1nGOtNgtfA9pMimCekab3vf3Ek0s2uIGoL+UtRP6jhZLQMkv2pB
 Prat/Ca2Tu0hc4lqpUpTeuNvM8dD8WW4a3P9ScWCtfUim5aaPUbY4sjNq/flfkrl
 OHaqSOWww28PO5NmqLAeKrinLosgQgQajrDo4tfrfX3o8Udz8rwxJffDZ0A2JLkh
 BiX8xtzJ9l2cEmyP4bCcPX86ECNCzAYow+vxcmwrDnNLw6bWEMBVuxTbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uLtns6AGYyhR2mHtFQT06p/ZWFfTJ2DIAXurRHKaoRw=; b=sTNAt1mj
 oMS8EmjluG8H+wHX81rBGtVdfN49EiVSNigLtzI4gni1D4xmsWwptBGTVTM69QRZ
 eID30SGQtL0hPo8iH90qglpxzEvHQloAloeKuyzw13+0QyYiF9ouXH95F51ixjEw
 fZAsHPc+snBDobirtrJIDS1NtQ4Yyt0D4bqI1kPC+uWxctaqq9gftMuW+rN/r1WM
 B0ARXRERe0y6/zgPvwpgmnFRYrp5sOqC5p/52RZYaRd9C52W9QFvXF06ToxrLCRM
 sgpey00cPkOIwA/qihATQSp4O+B4YEF3BaD2czMeORtaG3sf5h233vxs67EeS7Sb
 NgzzA78oPsy7mw==
X-ME-Sender: <xms:zpJTXkpLdbDEsQVcFoMwwWuA0HcTVgpPiqlK6VA1eovXohcUr_supw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zpJTXkuVt7CQ83hN3gZ7xFqSMRLxlX1TcDRLwoB6SuidPnKHN43zVQ>
 <xmx:zpJTXuI-GuedMDFNpCDrehD0YfPYmpeNuRcBIDfqAqkrf-CxDqqohg>
 <xmx:zpJTXjq18WjfhbDKNyfHHZNrUsYyG6Io1EJHeXWmQsxJXGPJREnlQw>
 <xmx:zpJTXo9kaMLF9yFsVtMl1SmnKWDzBB1_lcIJbx24eNh9I6TQapW5AMod3Vo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 021313060F9B;
 Mon, 24 Feb 2020 04:09:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 31/89] dt-bindings: display: vc4: dsi: Add missing clock
 properties
Date: Mon, 24 Feb 2020 10:06:33 +0100
Message-Id: <2d7aaa0bdf3f0cb66d14700fb77348453b3cd29a.1582533919.git-series.maxime@cerno.tech>
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

While the device tree and the driver expected a clock-names and a
clock-cells properties, it wasn't explicitly documented in the previous
binding. Make sure it is now.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml | 11 +++++++-
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
index 3887675f844e..3c643b227a70 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Eric Anholt <eric@anholt.net>
 
 properties:
+  "#clock-cells":
+    const: 1
+
   compatible:
     enum:
       - brcm,bcm2835-dsi0
@@ -24,6 +27,12 @@ properties:
       - description: The DSI ESC clock
       - description: The DSI pixel clock
 
+  clock-names:
+    items:
+      - const: phy
+      - const: escape
+      - const: pixel
+
   clock-output-names: true
     # FIXME: The meta-schemas don't seem to allow it for now
     # items:
@@ -35,9 +44,11 @@ properties:
     maxItems: 1
 
 required:
+  - "#clock-cells"
   - compatible
   - reg
   - clocks
+  - clock-names
   - clock-output-names
   - interrupts
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
