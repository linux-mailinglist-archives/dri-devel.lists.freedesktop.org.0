Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F82AAE0E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F596897D0;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF22189624
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 15:14:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 35E5A580702;
 Fri,  6 Nov 2020 10:14:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=25s9dtBpvKUMB
 jSzbPopd7XcV2NhfxX6EjAEK2lOZXs=; b=urZszon+irSi9Ll/cqP81RPwSn3/G
 nXlAbb2INZXEB77Fnu8gBn6H+h9N3E93bXS3inzybL3oOERkTnxuypx02RthWZ9+
 KBFCmkjvSNMfhMePVtkyLfZV30Am/1Epvl1ZV/SM7xQESXsZFOWUHYNPLAVE8cl1
 rt6UO6OE23iP2ZQKQ4lA4TSysOMuWwtMp7zIs5kDrMYV4Ymb0XHgH6VdAak2CFGQ
 5uGBtGkcIqOuI9Ga8YdqfpQ60F6h1qKrz4wKOyNa7dkW1WxDo8MufHB1EqJhiDZk
 pY81EOHSNfDa6l5D4x6rmBnG5HzAn7piFXcqEeEhzapUFFfT2GiFDQH9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=25s9dtBpvKUMBjSzbPopd7XcV2NhfxX6EjAEK2lOZXs=; b=emfgznoK
 8pmHYWJ7+ieIugu+xTzTPl8GVqofzW8eHPCC3sWEl3ablBEVRqGvHJsjWeaHhZUN
 HFpdx8cd4XRV/OggDJ9iXTXOpTgj17zYsNfLoQCOLny7ZW90i41TkN7QpWRV/9dm
 XoS0heREVWvKvGpWUQ+fgONgW/wahRAgYyvo7odnDzw7RIIzymHHBNaHb0to59o+
 9Bi4HcNtQX3q1oxjc3VoDpw+MaYYp1F3jr4YfS/yP3fBY/v1oujn3eqLIP9AOvLS
 bvzCmgpvCU8Mk3DjnXJ20Vl6HmhbPmNyksExOM2KcnJOnggADHA9Tnrh9vCDXSu+
 9Basi7/MHuR5Ew==
X-ME-Sender: <xms:TmilXy-QaE2p7SDhuFk1KmHwI0hzf9tPFKwDBQGCmkDZmMp2IZxtUw>
 <xme:TmilXyu6WdxxzZpg81qLDz3HH4aQFu2_CGRZ1H8_6-ba8OwqFjIEeFWhiaZdSlrwK
 V72l7mTTMv1HKqQcio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TmilX4A-e1BQAcyxcAGzi3x8BudQhUZEctRRp6qPm4VQfuH0hw2rmA>
 <xmx:TmilX6cIhOG-mgeFDf2Dc-XPtCO0JsBmuSjzkdwsIhyBY52eKhpHyQ>
 <xmx:TmilX3N9Na3Epz2RN0UPuFfyRMpmnH9UKNGVqtSRYVQ4_c_eNFu5Bg>
 <xmx:TmilX-n8M5tjv2OWvccIuhCsIyNGKETx3sgQV-3eVrMGt9IVoTG5zg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B87143060057;
 Fri,  6 Nov 2020 10:14:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH 6/7] media: cedrus: Remove the MBUS quirks
Date: Fri,  6 Nov 2020 16:14:10 +0100
Message-Id: <20201106151411.321743-7-maxime@cerno.tech>
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
remove them from Cedrus. Since the only quirk was whether or not we had
to apply that DMA quirk, we can also remove the quirks infrastructure.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    |  1 -
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  3 ---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 ------------------
 3 files changed, 22 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index e0e35502e34a..d5fca10ea5b4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -523,7 +523,6 @@ static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_H265_DEC,
-	.quirks		= CEDRUS_QUIRK_NO_DMA_OFFSET,
 	.mod_rate	= 600000000,
 };
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 93c843ae14bb..626090a5811c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -29,8 +29,6 @@
 #define CEDRUS_CAPABILITY_UNTILED	BIT(0)
 #define CEDRUS_CAPABILITY_H265_DEC	BIT(1)
 
-#define CEDRUS_QUIRK_NO_DMA_OFFSET	BIT(0)
-
 enum cedrus_codec {
 	CEDRUS_CODEC_MPEG2,
 	CEDRUS_CODEC_H264,
@@ -150,7 +148,6 @@ struct cedrus_dec_ops {
 
 struct cedrus_variant {
 	unsigned int	capabilities;
-	unsigned int	quirks;
 	unsigned int	mod_rate;
 };
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index bcf050a04ffc..286c7fe844c3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -222,24 +222,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	/*
-	 * The VPU is only able to handle bus addresses so we have to subtract
-	 * the RAM offset to the physcal addresses.
-	 *
-	 * This information will eventually be obtained from device-tree.
-	 *
-	 * XXX(hch): this has no business in a driver and needs to move
-	 * to the device tree.
-	 */
-
-#ifdef PHYS_PFN_OFFSET
-	if (!(variant->quirks & CEDRUS_QUIRK_NO_DMA_OFFSET)) {
-		ret = dma_direct_set_offset(dev->dev, PHYS_OFFSET, 0, SZ_4G);
-		if (ret)
-			return ret;
-	}
-#endif
-
 	ret = of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
