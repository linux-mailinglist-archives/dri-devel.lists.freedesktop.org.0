Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0642C1B8027
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510696EB8C;
	Fri, 24 Apr 2020 20:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68766EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A2D791431;
 Fri, 24 Apr 2020 11:36:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FMKLC09xuIf9F
 IYI+xqoFdFwX3vaShvGRIMTND5Z/+g=; b=vFfuVaTBl9lBx6ZA41ONXjYnFmlbp
 1NRewMuL2HFtVGQVR1sFE2ehBKg5TWy0c8owqnD7Idt8Ip1OgmS/ZD7vujJIdGH1
 oXAQD0IfScXmKwzLlgz4qIavwX0xa7wtiGa52zAR80dWpo3O2kmGTY192DkCYXMX
 PrRj6B2g2G6WX+Ks7Jp+2pF9NHx8grY79nQp2CvUv+H7700vprZ5AbYBs6oVG6ZZ
 k2m00lawZe8wnZmTNQsb9bR2TUKkGNHEIAR4FjWRaMjcn3acL+9CUoyDfSRm0Pga
 nD+08qqizhA3tfQQBur0wRPpWhpDpzCKzqf94esKXax6wNLbR36v+zZug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FMKLC09xuIf9FIYI+xqoFdFwX3vaShvGRIMTND5Z/+g=; b=l5Tkrgwu
 r558IB52HFews4Qvk9hqnM1tMnPOGyRIUlKRZ8znuQCAiUbghI6qNYMKB+fCiW0N
 mdD+Yw70W593GTMPQP7Iqsu7nfIEOWV4TgeKhXEVamQeK1+6LLMFptRmtGgEYUjh
 Is0fpwhpA2XsO3/SjT/XHFr3CAzSPl4QjbmAwTneKAwDFIoNA/junuobImWbwZAm
 gYO0eSR8p9jGTFfMFtR3oXHb6xB66S9Vewy2uCFuPB+Dh8dgRZvNcVl7wuS8jqIx
 IkuTWW5mdd4jZpe0xbf/RFCc8+jdnqXYh2rdPx5kzBbtyFpkUaBWq4sy7dctyzK9
 XodGkIk8JEEhSA==
X-ME-Sender: <xms:YwejXtMEaz-78CfRt8VHDSDF-2Mfan41F-7443840BSgzgItSSVDiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YwejXmtvckOH_v0Zc3S75RQgkV81DoBmBappqeO5EGPqSwhC9zf7CA>
 <xmx:YwejXjzsSNu7ZSKymFDA8TDT7qmoQU8XzG_MHcd1FsmeycsRcYw9yg>
 <xmx:YwejXn4hfRyhLITSm-CjTvvgqLlrPhTMlo-aTkneWhxHuptTNfSQLw>
 <xmx:YwejXoZY41Z9pG-PSPtCJqihIIMb2yFbOef9FmSsb7I4vUGbNltVkEPHsM0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DEF6F3065CDA;
 Fri, 24 Apr 2020 11:36:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 29/91] dt-bindings: display: vc4: dsi: Add missing clock
 properties
Date: Fri, 24 Apr 2020 17:34:10 +0200
Message-Id: <250df886c0909445783deaf05dac777a362cd156.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
