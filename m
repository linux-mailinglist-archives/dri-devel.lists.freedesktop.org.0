Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9B8CE980
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 20:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2630D10EF34;
	Fri, 24 May 2024 18:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aTtg9meC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52C10EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 18:27:56 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-4200ee47de7so68153855e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1716575274; x=1717180074;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dAf5h5XwHiWp+dmoS6JsUC+O9MVsTne143uCle/zUc=;
 b=aTtg9meCIpZ7Lv8mCqHdkhki6eBcxGMHvbxV2QEEktetK9ZEFEmKaQqr6OzPY6D3va
 rnHxi5vPQUOvX9lt9ysqo75lqCSTAE4pzy6BBi2fedbodAmcXLIVdKUGaCVTgDbd2+nh
 aXi7JqHf3lPQLHbW3owfI5n8+OdDTBqCGmozgWurAUlVAD8SbB8So5Wy9BMLtQMTNGH4
 CHf7gzrMH//WI9Wzs/pwCksJuU03n/MtTWr4pMSO5Uwp9vHKIbWOStODIfLqE5JPpiLw
 kt5wzI3eP4uDddlKSvgBiV/fu6P3x+mDBM4hQIBLoiR3k7fPAtimek/d/cNNCqd3VVXM
 IPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716575274; x=1717180074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dAf5h5XwHiWp+dmoS6JsUC+O9MVsTne143uCle/zUc=;
 b=Q3yF1uRhG08ILCBJzLP5mfRL9RsEjk5wwwcbd663JQ5RYxJ+KHjDl/wn4ifYyClt9r
 jbRS14USocfbqOntmwKm+kXRrEYGUPxBjKIpqJvR0i4a7Gjh6DNS6fX72a3H/X7pSqis
 hSA/xpk+GCtkWJktDwfETaZJrvieZBW1TNvKivmIBDYJX59I4yn1J+w2WiGNoV/AV/aX
 5DgUmlNkFYOSmU+dl1FaLfNQpHf0BAG9naUbdAVpwFh5E9Ej1JeNFnMGWncprPTyp7LF
 b3a5NrXIvUG01Ci/U0y4Yf/ltjKcekIlvRlV6H59N94U9fPKccnILOfT5tOHFWpVJq7k
 ep5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXDPy+s68yz3dRbUksymBcwkfShRL92Aq6MKzr9XexnVPs39nWXP9WJYzvzQUJJFAafJtTwly9hXRvEo+Ku5F+sBGbD3xsAvHMO8NDk1GD
X-Gm-Message-State: AOJu0Yy6nH3HTmNEKGqxGRTD5xhaEo6HUyHTFQD4eY9wSeVB6r61mIX7
 Bpk0GzKZhbF/vd+BhYuM3HpMS9ID9j+uqBIzexmrvbdAldAON4Y9UP3ZyEGIv3eV2d12IM+TUi5
 TUiCyhCwHC/xvyIX0EQpxV6d1WPD/k/zt
X-Google-Smtp-Source: AGHT+IG7AwSKXGWwm3Jk0PS/jS/c6HEpbiqG3nmvQrlTW240Q10yveOxPP4at4VICqmuogqReFECxtmY3Gqc
X-Received: by 2002:adf:f746:0:b0:34d:bab1:26eb with SMTP id
 ffacd0b85a97d-3552fe17476mr2052052f8f.68.1716575274538; 
 Fri, 24 May 2024 11:27:54 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-35579d7c6bfsm65665f8f.22.2024.05.24.11.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 11:27:54 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux.dev, linux-sound@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 06/18] dmaengine: bcm2835: make address increment platform
 independent
Date: Fri, 24 May 2024 19:26:50 +0100
Message-Id: <20240524182702.1317935-7-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Stefan Wahren <stefan.wahren@i2se.com>

Actually the criteria to increment source & destination address doesn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index ef452ebb3c15..d6c5a2762a46 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -252,6 +252,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction != DMA_DEV_TO_MEM;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -336,10 +354,8 @@ static inline size_t bcm2835_dma_count_frames_for_sg(
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -408,9 +424,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.34.1

