Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258122AAE0A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCBA897FF;
	Sun,  8 Nov 2020 22:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237B897C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 15:14:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AC98F580701;
 Fri,  6 Nov 2020 10:14:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SzmJUpEELVvdR
 xE50uIjwGm8zMB0GdoR18I3irVVZQI=; b=RCCAOLFsgkOyCNGZmUO2sVk9uv06J
 qAMp84Mbv5OmnpO/oVhohP81FilXzdgbNTPY5Vey/aaI6uwCVYhNdMj8RAy7WfLF
 cewW8iwlEUaJ/Ht0CTeKievU0XRMTCbvSgErdO/Bc4Crolk3qtQBaPmkMdI+nUpz
 LEoytHBqeIRu4RpQyyeoeJqwSJoBOdClaFeJ2o647tNTEKWZSk48PHbLV4OGLi3T
 5Cvavapc44/EaKa8zp3ePHMUCMpXpHFK7LJal33umIuxukpjS92KSLd60cHRyAm0
 T1aZUyLVd3XIF2Tug8RfKzswxFEKadKJbC7BG+Uw2p5AKil+Yawb+BV7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SzmJUpEELVvdRxE50uIjwGm8zMB0GdoR18I3irVVZQI=; b=BytyAt+R
 sMjY8gQbI5HJ5sGPo6QMPPFmnCK6+KDsy1wvSPU0nUAMhn22BnTQ4UsS8vgfAMEZ
 XUSiSKZvoutzCYgQDjaG0E/TgT6iobizThUVMxKZDUkhS8Ewm8RVjboX1gLeecuP
 m6coczlSLFXfEp01WZoxwipYBERIhmEfE6vLVNW0UIAQuNwTNUJKDyyHyVDnFEoX
 m5QFhDNhHb+Cu9rFJzxqKkz3xHMqWs25OxxNccD5E9J1zS9cJZSHI6Jp6c98lYEH
 r2ZnXRfQ4BpNdukZtCgaBD8TtUqv6bycm6ePNgApkjMltKFmyPF4hUMACdxHlSBP
 a2vSkZnYalBYvA==
X-ME-Sender: <xms:T2ilX3wyiOdT9FK4ymEi7mv0oneD9pLoakL_Gd5lN1vmObQvLdgtNQ>
 <xme:T2ilX_QCn0yjaf2aRsn4v-tTfUDa1K5rZW1Rwf8uBi0VqtZIePj81TwvMY94B-y8a
 Io1KDl1fdtptIFVLzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T2ilXxXSq8RdxYQlQcj5jRxU4aDsgUE7HxME6IVD9t7B3HAwRSUE6A>
 <xmx:T2ilXxi9JkK6tkWO8M4i4vcxe-MJPWxkRqh2e1-AILWKMg9qMyoCNA>
 <xmx:T2ilX5DXxVbPlhA9QFSjBI-d6KI2kuMH83T7uZcFHCXY1EX4eoE6Nw>
 <xmx:T2ilXxZRyNBPR3tXZYSnu_anBhpuggG2k4xdndsixbBfBz07at6CLA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24297306005B;
 Fri,  6 Nov 2020 10:14:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH 7/7] media: sun8i-di: Remove the call to of_dma_configure
Date: Fri,  6 Nov 2020 16:14:11 +0100
Message-Id: <20201106151411.321743-8-maxime@cerno.tech>
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

of_dma_configure is called by the core before probe gets called so this
is redundant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index ba5d07886607..ed863bf5ea80 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -825,10 +825,6 @@ static int deinterlace_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_dma_configure(dev->dev, dev->dev->of_node, true);
-	if (ret)
-		return ret;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(dev->base))
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
