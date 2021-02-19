Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CC31FA31
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 15:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FF66EB35;
	Fri, 19 Feb 2021 13:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A386EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7627E90D;
 Fri, 19 Feb 2021 08:59:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 19 Feb 2021 08:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dxeh+Z0SI83yj
 /PolwzvHg+WOriDZFlwtgZT5HFDJVU=; b=Z/olhDQP3pbJWbgTrbb9C8szVyY69
 ydZQY6/k3Nh/G2kmeU8I3wDeLT/fZ7h6o1+WyR3YUBDF591Xf0+WKpASHa4XeDo1
 B1K9l2bUBtuk29B0NgEjpeJf6sCbAc9FEIcO+9f+bx0Tdt0L15jz4xyZJrp4m5Xm
 lzR67hpnU12djAG6coDSuOq539PU+uq29dZBdCQRCmq8+03WwBQya+ilUpjvkBKG
 0oEys3jKAfdq95B0gx+IHytq8YUG6tY+l76zAR5gsWUlnGAGG8rP+aXbYelTlDGm
 pxQSP7Ntjp1NMf+wQIplEWu3Nan94M6TxXx4GWmPV3f5QGB+n1FSaJK7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dxeh+Z0SI83yj/PolwzvHg+WOriDZFlwtgZT5HFDJVU=; b=defokmpj
 H8ZFgWNWhvAJmJ3/P0P/7acw5RIZ52KQ0Jn4wV3hzBoF1K1ySJ5hk5mfM2e6RtTV
 V3DuAvQHbCifG/g+6gWcIxfPzc6HnQbZXic2UKFXD46mX0wUYl4vj3bcHzVLiMEj
 ALgH0FLcc6hgq1jqsAw5Ye7lZOHsSnSQTGjgESJSld0z7WY+vbYhqqmfNlxw/n+M
 FIIMjHMnARZ0NdJtRfMg2Wy20TJMpeGjfT+JSvUpDhrNpEC13DpMDQmNIrxXs6p2
 MUshwLTZqp0hf+CwbSzp2MnPnxrEgc5j1TLGe0lnvpIveKYU3d9gtMdk/rFPlZqB
 5apqDQpT66hAXQ==
X-ME-Sender: <xms:VMQvYJ40aNhV6fYoQrQUsbg-WUTg7TKnPMKyeL4LM0q0dtCS3Z7NeQ>
 <xme:VMQvYLNG5Ob5TOP4Or5KHOS7RDsnMCt5D-PE5VkRwhBah-o0e4zDu9A7bo8QNjdmC
 6Ts2OpikB7yCqXOQCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VMQvYPmeT6lexcKhZoIcv-NivseYjsolGNBd6u753m2C0I4Rgcm0Nw>
 <xmx:VMQvYKRdGM3TYUx93OfOLU7SXihba97V9CsZ5GUg3ZIJBSHFqQay7g>
 <xmx:VMQvYDA_L_cFVvj1AlRWtgSREaPJ2bngPlT5_vbD32EoNxA4D2SkRw>
 <xmx:VMQvYBIhrPpBNGGZjBVYIIsIJT-A5ZeS1AkudtFrgD8FHIF80zYgBw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8D26240064;
 Fri, 19 Feb 2021 08:59:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 6/7] drm/sun4i: tcon: Enable the A20 dual-link output
Date: Fri, 19 Feb 2021 14:59:33 +0100
Message-Id: <20210219135934.618684-7-maxime@cerno.tech>
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

The A20 second TCON (TCON1) can be used as a secondary output to drive a
dual-link LVDS output. Let's add it to our capabilities.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 005c37831eb6..86717235b4ea 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1538,6 +1538,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
 };
 
 static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
+	.supports_lvds		= true,
 	.has_channel_0		= true,
 	.has_channel_1		= true,
 	.dclk_min_div		= 4,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
