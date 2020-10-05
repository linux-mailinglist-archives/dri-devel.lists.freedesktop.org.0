Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3E284738
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391346E3FC;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490E89D4A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:15:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9D630580167;
 Mon,  5 Oct 2020 11:15:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YUl8YEHShXmJC
 0LRyXCCThIZxlDv2ekCGyxR4T4zF5U=; b=fS7fXeksMZUSYGUc+DLqYK2ewyZMG
 OD1EtuIqTVN59+QNFgdUs5wUaTxlt71vylTsdIOsYsPRHakNy+ckxyltQhDw7qNi
 gkhWbctFDr7WlkFhysW5KOlmQffQ4EllVPn+32vBOTAjtO4gTjD4VZs500kKUzBr
 Xt5akSK70RQJ8DpaXPmrba4A+i9jE3PCgjbgGTDWDdL7GQyYciiEAs5+0IXJUIp4
 rwzUPsBNW7gOY2cwXAmRLUdW0A13dvQPm1SXA3bGKMjv1HQyacm97P19UpnH5e02
 TwUyrfqL+UQ5QFM5CXWPnzMPRkOucD8MD72qn/OnMb17qGFDRNRkjitpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YUl8YEHShXmJC0LRyXCCThIZxlDv2ekCGyxR4T4zF5U=; b=EjzRAUkT
 62BzMXpQbU+LmKoqd0cC8pxrpwFZxVQm7MmGzmZ/TKsS6oxQfe2JiR2QihxreuDg
 QcrnT+rs1NV7+1V/LmEg3mDPu0DkPY9wpLyhXuV9PlZlJx2/ceNg8B82y6RCXNk+
 eDU/62tkJEiTtMO8KTPYq3pk1tJJlvV4CPsU6+NEs1wUYVT+ylt+A+YC4C/pY+Dd
 /R6TJw+IIOSsa6QpvhdQYs4p4cjPrE6C7DIG1sabJ8r6bZOHn/YUyG70RECfnR5N
 Rv5EKPxjW8Z2oYeLA0II6wD7R6KXHZJJc4C9C2uN2G4SHQ0McyZNQYESAhXPEUMR
 fK3Bu9ywPW7Yiw==
X-ME-Sender: <xms:pTh7X24BSNYaaD421xtWgVcmIbiAKhOh7Zo-iBaSWP79w8cXNVuNoA>
 <xme:pTh7X_6LT-vuejWsuiI0TuAmsIIS52uDk1DLy6Ys66UgiQ3-pjNEMfTTKOi0mgl4D
 nGnJyuFV9VLKgROaV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pTh7X1cnLfLrJVrTR5myM_r-1q--3X0VERiRUkkjXkIyZNkLqT5ymw>
 <xmx:pTh7XzJWqalr3Y0fwhf8Xum0p5ECwUdNcjvia7NKOQH-Itx-UnKMNw>
 <xmx:pTh7X6Jj5m5yAOnCCnt0S0g6ZAS7YbOhMhQwU6SWF6UeaBEKhi0GQQ>
 <xmx:pjh7X3AiFWsBgEHX5L9KiByCUILRDb6FMwqC0fiFHqY-1O7EfWX4Sw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 756BC328005D;
 Mon,  5 Oct 2020 11:15:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 2/6] dt-bindings: display: sun4i: Add LVDS Dual-Link
 property
Date: Mon,  5 Oct 2020 17:15:40 +0200
Message-Id: <2bc93c7c1d3121730239a01dda9c30dcf4e353b0.1601910923.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
LVDS dual-link. Add a new property to express that link between these two
TCONs.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index e5344c4ae226..ce407f5466a5 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,6 +115,12 @@ properties:
         - const: edp
         - const: lvds
 
+  allwinner,lvds-companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle to the other TCON in the system used to drive a dual-link LVDS
+      output.
+
   ports:
     type: object
     description: |
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
