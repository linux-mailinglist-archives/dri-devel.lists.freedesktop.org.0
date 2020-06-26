Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7F20C097
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 12:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EA06E1B8;
	Sat, 27 Jun 2020 10:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160AA6EC7D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 12:11:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02C7D5C009E;
 Fri, 26 Jun 2020 08:11:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Jun 2020 08:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=00SNO/wD0CWDmhJki0nu6Z9nf1
 ZxH0I2QGAEfWPDokc=; b=gHdSO0x3fpqbUlDf0nm4WaNYPBVThArTFMp3MHKmDl
 SpVVWFtTqdaSDxN7utnS8GKMoJF39WJuAf+g4sCKzRsFI56qG7j54rXbucNs0Kwn
 BvDNj0w6heUMOa9E84zGQuArbgfqoX0lYvfQCToYINersYp0raHsak88yhk4u4wO
 M8s8iWOd8ij6EWvrtwQ1kEwBRn/2qtuZmoYPe7TEixoyPlRxgloKTRMEZolgfH33
 fgDW1mw1kzsDyJcypk2A/yWydWYmX9HMyoLnbuyFWu8pcYgqr5lvEPNdzigdUE/D
 6Z3q3fXG3TWpQ4OoLjCjQ/c8pQNw85T6RKVqTEuUyOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=00SNO/wD0CWDmhJki
 0nu6Z9nf1ZxH0I2QGAEfWPDokc=; b=jMV835Dt/zrJ17lU0kwT6WcDk36tEKNAk
 Iji5ayH3acPz91jjFQwrCXGp86C6i0MWOzHBm0EA5HDXkCUhnjxqmbjsbRktZlHw
 wa2WYXYsha6rlo1iUlvzy4eBYEuBDgQC30rWYhATtWy4yzLriyWY5auq/vdiOq0O
 Z1eTE7oIfzpOkpSIpeG8nzu/o3eJGGeYL4BNCHfAhX1rFdmI6kevctgO66gXFM2G
 DC8k58oOGetx+xgbSxo5GZFL8WXeVR6Ejx4p6Sa9ZyJbVRIlyEhjQRtjsCePq6dX
 SJGxhHIbfTubkoavoFQC8I+B2NoeOktPGnWzV80CdifgC+2xJA1Ug==
X-ME-Sender: <xms:-eX1Xqdn2NL1yBmXoetqw6d84Bwdbk02gLiOI-a3IDtHuICwf098Tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-eX1XkNILtv6qeN463fad4ev5rxCm5whK_3wcCloBa4YsLwmnSB8rA>
 <xmx:-eX1XrhOxZYQqAXPYLUZ7WuONWanqzOYJ7HTeKh4rP-Dg18bWz7Sgw>
 <xmx:-eX1Xn9AP92zHPJASyfT4gwiSMmS99RD2zW3u02DIWCGMSJug5CorQ>
 <xmx:-eX1XqgE23waE9dZmnXJMQ-PyP8bzibI2KBMHhkZLhZNJYWmpWbhFA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09114328005A;
 Fri, 26 Jun 2020 08:11:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH] dt-bindings: display: vc4: dpi: Fix panel warning
Date: Fri, 26 Jun 2020 14:11:31 +0200
Message-Id: <20200626121131.127192-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 27 Jun 2020 10:12:42 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The example used in the DPI binding before the conversion to YAML had a
simple-panel example that got carried over to the YAML binding.

However, that example doesn't match the simple-panel binding and results in
validation errors. Since it's only marginally helpful, let's remove that
part of the example entirely.

Fixes: 094536003e06 ("dt-bindings: display: Convert VC4 bindings to schemas")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/display/brcm,bcm2835-dpi.yaml  | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 58213c564e03..5c1024bbc1b3 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -45,16 +45,6 @@ examples:
   - |
     #include <dt-bindings/clock/bcm2835.h>
 
-    panel: panel {
-        compatible = "ontat,yx700wv03", "simple-panel";
-
-        port {
-            panel_in: endpoint {
-                remote-endpoint = <&dpi_out>;
-            };
-        };
-    };
-
     dpi: dpi@7e208000 {
         compatible = "brcm,bcm2835-dpi";
         reg = <0x7e208000 0x8c>;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
