Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA631FA2D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 14:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E666EB33;
	Fri, 19 Feb 2021 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC686EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3E29F99C;
 Fri, 19 Feb 2021 08:59:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 19 Feb 2021 08:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cSRgvP84DbDQi
 b/BfGkBeb1l5959VTl5Bv/VFdhu7gE=; b=bYp4eaDaPM46A7G941eaZ00q6QNVC
 gFVE+y6V1CP5O2zfkiSC5pjc22y96AgXYusD9kPE/j6b/m2AKaT+Y/QiMJQIUz98
 jP0Dy3/lrfoZrPTKra6axEnI4vA9GzUekWktxRpKXvPxZG/MjmIwLTk2KayVM8la
 +nC6+T8BQuiZ+j0l7/J9rrBac37jLLH0xLfCF20KXkCqCZPWsOi9jFspLAE4ncd7
 g/cJK7vmR61S9024J48034B9suEvRTrwZjTK4DD4ZesEg6YNHaZ/766rxZ3wumTb
 PIO1npXN2Hi5d6jAlQqviz0zi5WVKMKGMMORjzpmOirqtCxUMFFD38iWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cSRgvP84DbDQib/BfGkBeb1l5959VTl5Bv/VFdhu7gE=; b=ZWdNnR+F
 eaFF0FUSlriw6ZM2KNJ4ikJyjh3Bf5sNTDXQuaeYhqc4k2fzG3f3fyuChx9+NayW
 pCprjsNvhBYFjrChzON4uLsMNhZgxMX6EOXISz/5Cgw1bfAYJd38usrfV8xrYD+e
 tzHTWitwHYK14T3PT+BTWpzrrlrhuqnLC9v5eywPQcWV6QwiWycNlnaLgY+5tMLn
 bXbzs73/MJQIOqFqRUGyAQJtmh/9uXUPmbbuwsUD97b3ADS3IcHpgG1bBDlFs7z3
 girbUVp7dGc/V2Xfg9l4cJnXFSsukF65rBwcSexfLf/6I5mKAN7As6bycWYDfnAO
 rfRMPpNqtbtVTA==
X-ME-Sender: <xms:T8QvYJTl05UciLss7RLgUzBeYfdSoI9A4Bno8ijyXWJxl0EB2ESYTQ>
 <xme:T8QvYLsR6CvfjN-BAR5MwlfG6L-GipKkUDZQNhzSk7H2YD-1fD6o_PTOawgVilNsk
 bdCLxq4Ij4Ldr5eCX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T8QvYKbWWgptsB3qhA_cO2-8UclwyBCgRzlhyEXn_B-dKuKkMuBhwg>
 <xmx:T8QvYBHK_9G30sVcoW-gp6IPqgPon6025sj9XpeJ43ovJtLZW5yfKg>
 <xmx:T8QvYOyp44fEODmVYBtzHqa_1zIE51MZpzw0N0fJZQz73vUZKV0oyw>
 <xmx:T8QvYNZ6R65wyHnZ4EYqWf-1hlML4jDpI_1J4toT7Vgz0PPuBn-lvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DF50240064;
 Fri, 19 Feb 2021 08:59:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 3/7] dt-bindings: display: sun4i: Add LVDS Dual-Link
 property
Date: Fri, 19 Feb 2021 14:59:30 +0100
Message-Id: <20210219135934.618684-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219135934.618684-1-maxime@cerno.tech>
References: <20210219135934.618684-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
LVDS dual-link. Add a new property to express that link between these two
TCONs.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 4c15a2644a7c..a1237391118f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -114,6 +114,12 @@ properties:
           - const: edp
           - const: lvds
 
+  link-companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle to the other TCON in the system used to drive a dual-link LVDS
+      output.
+
   ports:
     type: object
     description: |
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
