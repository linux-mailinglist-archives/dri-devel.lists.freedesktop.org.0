Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A916A2B0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D1A6E32B;
	Mon, 24 Feb 2020 09:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5E56E220
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 42B9162B;
 Mon, 24 Feb 2020 04:09:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=CbU6f6ZrrpRWQ
 5qiZhenLgFrNL32RR24Q5O8MBsSZvU=; b=W76T6gjD+sG5x7IbekSRVdLvYieY4
 0tMN/Qq1LQA8/98MKWgeqgmo+9AIL7z8LUwDt5cQBrzcA6KymtAMYeuV2Ufk3+jV
 OO455hMj7nz1fbRpTPUDRlAm0IuWuKAQ0Wi8TqcSk4FtXqjehlrt/3/uOWDh1c0z
 Y0O+m8ULJaojxWUiNRK4gdMRLh7m9G/iP2fOg+DAaZ1Pofy9gYqPHMmY3ZzftXuu
 eXiXqnWmH3oOU27yO7tBpd3O2szkIh3301nwnZ5AbzUQDZ1HtZZwxFzT173WjjY3
 yv4t99V8s0Rp2YgaDoE7JUzUQBbNCf6KlhlSQiK88iugXBLd44MPsY3Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=CbU6f6ZrrpRWQ5qiZhenLgFrNL32RR24Q5O8MBsSZvU=; b=RKzivMKy
 IQkX23piS/y2KwMA99ZW0TY+5SRbg4EinBkDfV+PiQXYEr0h9+zds8OQeHCmAIxP
 wQczdVgEGfBQ6Bqnts4qCLlJLYHmut8X80HdctAI6JskCQwXKvytevID6tzbNHbx
 cGxHJlcpQkZBGfH2UZXyw2CpbVCDDUmFNI9ydIYZguV5h6S/2BWeAYYpNvM4SRdL
 pOvR8W0hitW1A4DVREBSpD11cBwHuEGz64fBEcYh+C2hFXctcGerL7MhIhfOqIId
 hKH3IHeh+dr9mzyB01qS/e3dP6hxbdLuqz+2N9AxeUjsEeRwlYIOpeORcweakXCo
 WbnMb8CGWJEmOA==
X-ME-Sender: <xms:zJJTXgYA3KOAgVDKHdets8P1tOwZ0fTR-xPvmXsWcszeDVUNcjiO1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zJJTXiXEHLsjUhY8NMC6KWUNJq2o0A3JEeyhIxxbIRKE4pBJxlDAmw>
 <xmx:zJJTXgAUhB0WVorQIzALKP5zIVVyIZZeDWaIHpTMfoMnseuXUxS1Jg>
 <xmx:zJJTXhy86s8Ketq3N1zcox58fE7uiG28WP2OeyE5KR5NzpMbyyc8FQ>
 <xmx:zJJTXntbuq4xgKgCV9oiEPx5LN3QcXLPEsVThr0AZdszfRIuGq6HD5giWH8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8691B3280066;
 Mon, 24 Feb 2020 04:09:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 30/89] dt-bindings: display: vc4: dpi: Add missing clock-names
 property
Date: Mon, 24 Feb 2020 10:06:32 +0100
Message-Id: <042c8f676d3d863b55092bb58c1f15db95370782.1582533919.git-series.maxime@cerno.tech>
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
wasn't explicitly documented in the previous binding. Make sure it is now.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 288494b70e82..58213c564e03 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -21,6 +21,11 @@ properties:
       - description: The core clock the unit runs on
       - description: The pixel clock that feeds the pixelvalve
 
+  clock-names:
+    items:
+      - const: core
+      - const: pixel
+
   port:
     type: object
     description: >
@@ -31,6 +36,7 @@ required:
   - compatible
   - reg
   - clocks
+  - clock-names
   - port
 
 additionalProperties: false
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
