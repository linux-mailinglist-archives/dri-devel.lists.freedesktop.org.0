Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169442AAE10
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E54897E9;
	Sun,  8 Nov 2020 22:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9426EAA4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 15:14:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 249085806FD;
 Fri,  6 Nov 2020 10:14:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=a7NVXYPO9y0+R
 hMksqH/QSCzGROhhsGpRj7OUFHPfb0=; b=KIWpSY3GExsLWmzFRhsRr0ovufdrp
 Y7hz7jHgg7T7o+QaYfNhUAbI5/pCHIzFtlxIMuh2oPetGJwc4W2sjvo+kfplxeuf
 0iWgJv7A0PDx2BTZKo+E8L43Utl5bztgbpk1u3hbruKWvtENXzBEynj7jeA/40gq
 +iHbdWUpsfg8znCRjM6zv5kXMqRnzLNsgEpEU6SzGA0jQ0+KgmkeSxGxAPCSZx17
 DrdRm7TN3Stukaxeq1G8pmZsR2aLUaBJK5TGQ4WleeoQE1h8HqfqiPc9nt353VlW
 x603QeoflUYeoH6ZET4Lo8c6vQ0cxrVBJtVDGTvCgw3E76CiLXECt8C6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=a7NVXYPO9y0+RhMksqH/QSCzGROhhsGpRj7OUFHPfb0=; b=bLPmlyBa
 8kMspI5WPXzgzNGzVYPkVAz8qxNgpGwAJ3N51HvBTyqts+aRXeiAeVeL8t0hULto
 euaHK2HgM/FrucVULVU68LIhJ6FFtWqNvUCFFKac/5ADp6upM84OXxTJ2eJvyhOG
 H9skepukiwkj/Yw8eqKCKC8kXzFfJM129yIdgv/kdFz/V7mNeNPxR4nxezseCzOI
 vBOBco+Reid6K/xTLRYr3q/ajCCcIfaEYu/bwI6VgcPQ6AgaJTGRTeoeBQpMmpEj
 CP8z2Ca/xcDYl2dab/is/NzanN8IkFBMd5SzhcQUwnH3/JgjZdEx/e5JVQKcJBcq
 vskIDy3GQq5Z5A==
X-ME-Sender: <xms:SWilX9AmnoBiQOUsbfbHA-VPtz8AXn78jXbt1443JbuO_LLxEE6kqQ>
 <xme:SWilX7iC60lQun_YC9F4KcdBom_a6dQCARHZN-g81dLhV9vmaftD7zvO9lqbcypkO
 dntYQF5tu78-YjZJF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SWilX4lQuBmUhzWp5tABG6ZFW-Mg7irjQE-foBEWgl-_ocRP1fi7Ag>
 <xmx:SWilX3zMBN2gfhCyDGrr42Me_4YRK7TedPqn8af090kMzC1VooeaSQ>
 <xmx:SWilXyQ9VrFJz41NPpHo94vjSIvBB1_htPXzz5fsWqHcCOmE3vefmQ>
 <xmx:SmilX-pYEbP3GLkFMQOgDW_SiYJO3VKqRlKfCg1k6fDHVD6Eb_ITfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C43C3060057;
 Fri,  6 Nov 2020 10:14:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/7] drm/sun4i: backend: Remove the MBUS quirks
Date: Fri,  6 Nov 2020 16:14:07 +0100
Message-Id: <20201106151411.321743-4-maxime@cerno.tech>
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
remove them from our DRM driver.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 55960cbb1019..522e51a404cc 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -805,25 +805,6 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 		ret = of_dma_configure(drm->dev, dev->of_node, true);
 		if (ret)
 			return ret;
-	} else {
-		/*
-		 * If we don't have the interconnect property, most likely
-		 * because of an old DT, we need to set the DMA offset by hand
-		 * on our device since the RAM mapping is at 0 for the DMA bus,
-		 * unlike the CPU.
-		 *
-		 * XXX(hch): this has no business in a driver and needs to move
-		 * to the device tree.
-		 *
-		 * If we have two subsequent calls to dma_direct_set_offset
-		 * returns -EINVAL. Unfortunately, this happens when we have two
-		 * backends in the system, and will result in the driver
-		 * reporting an error while it has been setup properly before.
-		 * Ignore EINVAL, but it should really be removed eventually.
-		 */
-		ret = dma_direct_set_offset(drm->dev, PHYS_OFFSET, 0, SZ_4G);
-		if (ret && ret != -EINVAL)
-			return ret;
 	}
 
 	backend->engine.node = dev->of_node;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
