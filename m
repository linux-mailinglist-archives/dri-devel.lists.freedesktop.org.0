Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D42AAE07
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243C897DC;
	Sun,  8 Nov 2020 22:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9896EA8F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 15:14:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 779F45806FE;
 Fri,  6 Nov 2020 10:14:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=kt1qOxi6S/GR7
 EnnkRTvKLS2suVMvFKnRKAgJVBIXG4=; b=Ad6e3Wbv6LcOPgen3WgWRD4leWKsG
 YbmCJe6Vp03HU/cN/KZqNfTdbHM52YIsnA0jthGccXSFCmXL9RcinYX5F7KCNwXo
 YqhoPhdwWD9tt9EFsmUz6H1PeFWqMUPEU/hkA+mcb+LtcgtBk/2JPR2VE52VWcBP
 LDDGVjuURRnSHPe5OngQ0jWDnCwIkq2oE2OjOD/zdr8wEckand7KMKzvoHMlDc/e
 iHgQKIS4Yi7Lthe5pzytaFglfBH1JgIj9+iuuXNu/3rvW8Tk86/fSfCLe4QRUP5a
 ndJx6yC3PbODQEB96FQB+nV+Llv3SJnnvQr/fjeuAX2n8XAU5mgtBANHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kt1qOxi6S/GR7EnnkRTvKLS2suVMvFKnRKAgJVBIXG4=; b=qpU62Cd3
 hJhrNkk3Kif7WcbWUKyY6zvr3G1h8p5cUmF/603zfzFqve9cWZQgTcjKw9yJfhs7
 hkPqZFaCNIAAYW4x7vHnO1zpKvmor6CMMGFfhLk323PA0hek66cKHZagIGjhaOWm
 2B/pVs+I52vCARBWOmUtuvxyBg+iEzDi7nFvy4FQUU3BtQ6BFg77kvrYOaBRU02w
 4aDr1wadvURMbvlHhGG24P1z2B/2YyNSLdz9IhtuDvvSk0VyDbBWMhlZ1elvZnNr
 jkpDH9UCMWjsKbWwzPmrRXhotF4Bd0LWQZWbRlu4L1C0dIhrDJHXkKoo6fw113I0
 Nq7GmdAoIR536w==
X-ME-Sender: <xms:S2ilXwLE4Tdi69dmOGB-0z6nlV2Dk0vr3ycnnXrhD_z0DeM1G6z14g>
 <xme:S2ilXwJdCFegKFRbPefQomXu0hnlmkwlYIwUUmLoq6DZD_6oUEGAy16HO-bjclkll
 HHyu4Qxg9do__lIZsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S2ilXwu-VwPhTbJ_v2KD8WKoJx94I1ooKCucx65POyDZ1HWZuuvPGA>
 <xmx:S2ilX9Y4IUKmPzSJdRrOK3as34mne7nBdgk6rWgC-nUWfBzrz_9pNg>
 <xmx:S2ilX3Y7wTYJ3ABre0Nxl0nJE8jLb2zfb5sqpfwQmPedTHE5Fks0-Q>
 <xmx:S2ilX9zqwwra4H5fGhEmxzZ2Xhg2mt4DMhyeWrXTQv5M86gA0lldww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECF573060057;
 Fri,  6 Nov 2020 10:14:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH 4/7] media: sun4i: Remove the MBUS quirks
Date: Fri,  6 Nov 2020 16:14:08 +0100
Message-Id: <20201106151411.321743-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106151411.321743-1-maxime@cerno.tech>
References: <20201106151411.321743-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: devel@driverdev.osuosl.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime@cerno.tech>, Yong Deng <yong.deng@magewell.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the MBUS quirks are applied by our global notifier, we can
remove them from our CSI driver for the A10.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 27 -------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index eb15c8c725ca..ec46cff80fdb 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -167,33 +167,6 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	if (!csi->traits)
 		return -EINVAL;
 
-	/*
-	 * On Allwinner SoCs, some high memory bandwidth devices do DMA
-	 * directly over the memory bus (called MBUS), instead of the
-	 * system bus. The memory bus has a different addressing scheme
-	 * without the DRAM starting offset.
-	 *
-	 * In some cases this can be described by an interconnect in
-	 * the device tree. In other cases where the hardware is not
-	 * fully understood and the interconnect is left out of the
-	 * device tree, fall back to a default offset.
-	 */
-	if (of_find_property(csi->dev->of_node, "interconnects", NULL)) {
-		ret = of_dma_configure(csi->dev, csi->dev->of_node, true);
-		if (ret)
-			return ret;
-	} else {
-		/*
-		 * XXX(hch): this has no business in a driver and needs to move
-		 * to the device tree.
-		 */
-#ifdef PHYS_PFN_OFFSET
-		ret = dma_direct_set_offset(csi->dev, PHYS_OFFSET, 0, SZ_4G);
-		if (ret)
-			return ret;
-#endif
-	}
-
 	csi->mdev.dev = csi->dev;
 	strscpy(csi->mdev.model, "Allwinner Video Capture Device",
 		sizeof(csi->mdev.model));
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
