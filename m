Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA6949211
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6813A10E36E;
	Tue,  6 Aug 2024 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U4oD78TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FD110E36D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:51:03 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D65A7B2A;
 Tue,  6 Aug 2024 15:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722952210;
 bh=IF8k3H0gE8YhPnz0T6m/pZtJeWAe9wrl+n28Q6+Xvxk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U4oD78TWkhNztE4ZarFd/OImT3rpDxwE+fGGKn07kaa/9l67rxuuj32rc+w8jQA1p
 1GWABhWnfGLlp08hOH93P15TXM/gwNJ3DWl3NeXDQhl8YI/KYVPAR6rx4Or8mX1MOv
 eQX9Pu4+2OcK5uE8vWJKw3lff2GvCL0xbFCETgHY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 06 Aug 2024 16:50:28 +0300
Subject: [PATCH 2/3] drm/omap: Hide sparse warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240806-omapdrm-misc-fixes-v1-2-15d31aea0831@ideasonboard.com>
References: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
In-Reply-To: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=IF8k3H0gE8YhPnz0T6m/pZtJeWAe9wrl+n28Q6+Xvxk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmsipDdr+f3F4HkkT2DmWhyzkwlmOdF+EVZhZmY
 yJvac+1PuqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZrIqQwAKCRD6PaqMvJYe
 9c1lD/9/lvA0ovq/S7ijSiuWHRwX7jFf+QHum9j/N8Uu4fbONj2p+pkf5W6aMiovnNlx66kKJLs
 tusPccExK5dolb4giIzH8WBQVbOGU1TdCRhISBKvCEV+IkZFr4xJq4oeGHqAp5qHExsRXMsEwde
 jiDVIVnM9mbS5VubWf7Z2Y7AMyXyEE1gGP8yERiVl8OJFpBFd3WGR1pInys+6xZPa38uZ7dIK6P
 Yw6h0VAtdT3VoY/zavl4dejnmrWK6rhuux4CAdbflwRPZG+uIIMBAhVTAhRrxQPAsEjFBsG5Ml9
 PgZv1QR3Fd34u3ggp4h3Y+agQ2bYB7xGcJhiSS9oVvn7mpw1zIsA7tVngfO5wGbRP/vkau4sZCT
 B9s/AMk+Rzpblqo7s+QpOpYPMf0LeMo/jkvPv6MJjkN9Fonm1C8K7KvKWwFtq2iFu1EYr989Wbv
 mzD4id9jDK7SwQe69iTlhgqqsf6eoatQLyFa/fWVzTwwTLJP17Qapq2k5+iTZmvDNqI3YuONO8l
 sC2oXXbOsKTpCoScPFqZSf3aKQczkgOuumeHISvx8D7RyTqyLX05W2ButyJK8Pu897ElTvE3DPW
 exQ0ZnSfrKBBWqI+wqjd/SgytdHsyeJtmFwrSMNBS4b8YHX5IsyjmHO7k5L9ss6q2hSkGP5u42/
 /2RHNT+HvY0+0+Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse reports:

drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:16: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:16:    expected void const volatile [noderef] __iomem *addr
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:122:16:    got unsigned int [usertype] *wa_dma_data
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:9: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:9:    expected void volatile [noderef] __iomem *addr
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:130:9:    got unsigned int [usertype] *wa_dma_data
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:9: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:9:    expected void const volatile [noderef] __iomem *addr
drivers/gpu/drm/omapdrm/omap_dmm_tiler.c:414:9:    got unsigned int *

These come from pieces of code which do essentially:

p = dma_alloc_coherent()

dma_transfer_to_p()
readl(p)

writel(x, p)
dma_transfer_from_p()

I think we would do just fine without readl() and writel(), accessing
the memory without any extras, but ensuring that the necessary barriers
are in place. But this code is for a legacy platform, has been working
for ages, and it's doing work-arounds for hardware issues, and those
hardware issues are very difficult to trigger... So I would just rather
leave the code be as it is now.

However, the warnings are not nice. Hide the warnings by a (__iomem void
*) typecast.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407311737.VsJ0Sr1w-lkp@intel.com/
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 1aca3060333e..fcd600024136 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -119,7 +119,7 @@ static u32 dmm_read_wa(struct dmm *dmm, u32 reg)
 	 * earlier than the DMA finished writing the value to memory.
 	 */
 	rmb();
-	return readl(dmm->wa_dma_data);
+	return readl((__iomem void *)dmm->wa_dma_data);
 }
 
 static void dmm_write_wa(struct dmm *dmm, u32 val, u32 reg)
@@ -127,7 +127,7 @@ static void dmm_write_wa(struct dmm *dmm, u32 val, u32 reg)
 	dma_addr_t src, dst;
 	int r;
 
-	writel(val, dmm->wa_dma_data);
+	writel(val, (__iomem void *)dmm->wa_dma_data);
 	/*
 	 * As per i878 workaround, the DMA is used to access the DMM registers.
 	 * Make sure that the writel is not moved by the compiler or the CPU, so
@@ -411,7 +411,7 @@ static int dmm_txn_commit(struct dmm_txn *txn, bool wait)
 	 */
 
 	/* read back to ensure the data is in RAM */
-	readl(&txn->last_pat->next_pa);
+	readl((__iomem void *)&txn->last_pat->next_pa);
 
 	/* write to PAT_DESCR to clear out any pending transaction */
 	dmm_write(dmm, 0x0, reg[PAT_DESCR][engine->id]);

-- 
2.43.0

