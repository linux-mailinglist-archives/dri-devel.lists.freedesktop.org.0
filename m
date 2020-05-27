Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDDE1E596E
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA87F6E429;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC96E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40720581FFB;
 Wed, 27 May 2020 11:49:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5EfepUmgVDPUO
 z3GVL3TqSbU3jIl6CJ4wxOzynhsQS0=; b=wGdtcsoPQSEMk57Pp2QJJwhiH3JXO
 ZgB0OTpO841RseW2zC8TuxTPXz6YYA2Fo7aPBgu2Ja/jYBMb+0IRLGkx1Cpt9Bin
 rR1CCvBP9zOld/O0tpiOtdJOXyi+JZpazGIMO1YEHdtrrSM9ltU/wQjn3y3lHXS9
 5TKFLA4mGSYYRFEfAhz6qI3wSGY4yWoR1cBrVSeMlTarf5r1G20F72QTBX03Epmo
 oZWzmrCrLfGMxtNWaw5OBLtDuNTUpK/Wm4lSDZy7fT8Hienz8s0Kl9urspGXC/z8
 fv7Xh4oP6aQ62hDEJH888eEkVfGn0N/TFaBQxXFApBLQTn38CIvRNImqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5EfepUmgVDPUOz3GVL3TqSbU3jIl6CJ4wxOzynhsQS0=; b=P/yJoS4r
 wZPI1T9jo+AULljM4ICpiwFadvxLo0HFPahyrtmqjj8YcqPWmTyzy4ysNIKhIFbI
 YMNpb69xzt4BYvW/UxwhCgJLpepf2WDqNsxUOGdtHyyV/e55CL5JRMQSKq+58Mip
 0R09Hl7DgFTV4B7VL0JcCkKPWDTAWL9NSRzW/m1kp3lMQq/f+jhTnZjlxsKnYlft
 gnY+DoXHj7XBu6JXX73S9yF0EDmayRBx+erqFA29HC4xeoUlYwR/IxffWpFBNVGC
 YDIbpby/u8LV/evsQChQPOsa/q3GPCGyLMXRyHN9xNdyJALzPf7M8g/xFJCZSA6c
 mX0Q13+eeiLjgQ==
X-ME-Sender: <xms:CIzOXin-Rec4SJPItuM6TITo1R5r0uQoGhJkg-Ca31OSnU-RLsHTeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CIzOXp0p6H6uuw2gatHvPkQAt3tIxXViKfHgz3TK884fSn5pxeIfsQ>
 <xmx:CIzOXgoeWRj97NThbIzJFm-pAmwTW9DGvOEg7J3aW2CI7Kg4unVPxA>
 <xmx:CIzOXmkyChH3bDKlcDjSeRR2Ju0kCPETdokBB0jN0UaBSPdk6-pHIA>
 <xmx:CIzOXmy_pLwVXdPD6CYWKaS96Ok6eANExebgMILMWquhzvRPH4Z3Ig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D478430614FA;
 Wed, 27 May 2020 11:49:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 007/105] dt-bindings: display: vc4: dpi: Add missing
 clock-names property
Date: Wed, 27 May 2020 17:47:37 +0200
Message-Id: <8c7a4a9d85f7d1b23346367acf8d321ddad7cffe.1590594512.git-series.maxime@cerno.tech>
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
wasn't explicitly documented in the previous binding. Make sure it is now.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
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
