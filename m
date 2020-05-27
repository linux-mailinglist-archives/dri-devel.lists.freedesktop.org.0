Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA31E595D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AF36E457;
	Thu, 28 May 2020 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7AB6E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C6153581FE2;
 Wed, 27 May 2020 11:49:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FMKLC09xuIf9F
 IYI+xqoFdFwX3vaShvGRIMTND5Z/+g=; b=k8lQDKuvjJyZSQm0zYsOKK/831vfI
 dwF1eR+LmaE1HsHlUvJQCpTYqRs5bv4zuqQF+QqsikMNrK44lkJeU5tAK2EuZ1iV
 ZJ2C/KC3olPmDpmkVU/4fL+8NhNjwbVHXEvo13urDJby5JD7+wQTg2t0rN4cXJuU
 UjIkOGnLMfWlsxEtrcvm65gbIKG642h1prlAs6MJwlNJlxFI0dsz6Lv2IkE5O7Kd
 k0UDuXS/GLC2sWdgvxfM9LZ3+uWq+7HXS//U3VIDRAosErI8uRAxG6i2Huat4O16
 XeS5x0emvICPiGZhnBitoksaGQi0y1nyZWubzPqMRW6Qe3RoIS3drhTeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FMKLC09xuIf9FIYI+xqoFdFwX3vaShvGRIMTND5Z/+g=; b=YOSOEb9R
 WsTOlJuCWYivbI7VpnVMB2Se0EQjIOllck6yN9f0J3mGCR9AAVuJLTyWBTZllI5I
 L4yWYz9nCaXFcd2Sv0k1i3eU4y03j5lSiEvdQBTX2q61SUqihhPNUev11mdmsDpp
 jZtFfkSkCcz8cyVIV4om9dQLZuOyDNyQ8aQ8z7ROYMFdoAT6WjWLyptBXx0i380u
 cpo6JT3FCj/iuoho4aMPPlRR2KcGgZMh194VEQLhhbpd2jUxCFSW+Z2povLbeLhg
 NpnikkBbsW1ZvInF6S/yPdCGWqMc+mY2uF7QwcYXfP79let6sEezM557vxWdDdk/
 C6gt9ar6YTZ4Mg==
X-ME-Sender: <xms:CYzOXo3k5ggk4CMwUXr4-QjPEHgDZ5wxvRkmItNAHgZM4Ddb2W7JHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CYzOXjEamHtenIDCn-_P7UuJat8hSAjGK8tXSvIIdLW87gJ844uE_g>
 <xmx:CYzOXg6F1-Elxg63MvQ6RAhOYNMMMAkV8NMV37ryabHpJ6Xiw4zosQ>
 <xmx:CYzOXh2nGdwYQm7Bqs5tVe3YdnhlwB01W2KDu6mcTCggWRHBFLv4ug>
 <xmx:CYzOXiDJCszV65p7WjgGUYa6NwaOP-FbahYUafV-Ig9MORX3d-JMww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 648093280060;
 Wed, 27 May 2020 11:49:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 008/105] dt-bindings: display: vc4: dsi: Add missing clock
 properties
Date: Wed, 27 May 2020 17:47:38 +0200
Message-Id: <867813ae6b3e9cff0e9627e6ed09569dee5573bc.1590594512.git-series.maxime@cerno.tech>
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

While the device tree and the driver expected a clock-names and a
clock-cells properties, it wasn't explicitly documented in the previous
binding. Make sure it is now.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
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
