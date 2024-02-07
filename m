Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208384D076
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45710E7A6;
	Wed,  7 Feb 2024 18:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="e4FSmuv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047D010E7A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:02:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33b30fc475eso21845f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 10:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707328930; x=1707933730; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTie9X02LUZlS6EEEi4aYupSAjOSD5icxvNUzEugVLM=;
 b=e4FSmuv9vn/OLMfuMgLVTNSrRHw4Zpt8e4yWdRkEGojKb8o5Ht5HzSrkgpH6kVoTPE
 Mc1cGnFsa+KkAU2wbmISYBHzBx8q8+KgTn67O/q1qAW2ApKzC/Ndkwl6/WeaFWDeD0E5
 1hY3T/YDzIFYjLwclsiF7XHBvLmO9T012+yck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707328930; x=1707933730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTie9X02LUZlS6EEEi4aYupSAjOSD5icxvNUzEugVLM=;
 b=Ac5okuWLHLp0NuO2L9RtopnPBo2zduwN5kkX7cH/8PVDpL4nBxrhI8KsQH3aO98871
 +EbKYC1mx7BVuxG/rLtQcNc84c/H3w5gapWf/8V6Xf2imaj7XjXox76rvm6sEIkVjrDt
 Yf1EHLiK+3ErA0nqMfG/abGbxxAmj2ukNOJJXf04cuEVbTqB04X/o7yQK4XX6UYvfhSE
 yonozywnkcvuL8XERc4Jz9+fKeSBhoBwYhA3Hq+HTBcT6/blOb5BeowNFvibo17JuMzu
 9ljV8d9osgjYzHmiS87wSQwJ5ewY+bsoL0hgOqxnYIoGKosq6bitBQAQoGOIivY0Jj56
 TuJQ==
X-Gm-Message-State: AOJu0YwmP4wrSZrCbSun5tiseQX1LzDcozio1l5zjonVvgbNtgCy97VB
 JAvxROCTsqJv1cEt/EgrOBUfK5VXBKnWBLskrPfSKbTBayyePmhg/5+t5Hu1tmTTSQoryyoDCdn
 e
X-Google-Smtp-Source: AGHT+IHqn7asFg55QdASw1RfE27vqthPRSMN0lHrVQGCD6NNTmq34xx1xMEfh/0PEB0EeQNTj5iWsw==
X-Received: by 2002:a5d:6dab:0:b0:33b:4a2b:1b1 with SMTP id
 u11-20020a5d6dab000000b0033b4a2b01b1mr4139253wrs.4.1707328929685; 
 Wed, 07 Feb 2024 10:02:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXppY6D1aoyIYs6e0KXhXxPo1TXWnoCjo4RlxQwApSrZx2LvU5KzTbT6CM67f6UX2fw9wYhxSBIm/Ud4WsASGcKjNgzyrdR8nTeTw0Gcy9rsRw6z9J7Po5+2VDvqswkGypOJqCgnQ8IFUHSwqGxBmWCR/jePAExj6wckyoTh4c2QxAer4WONp1ID69/XUisILMrsgO8L63JQ5oZXAT07Xhg7VGrmifmlAloh8IPP5lLnXfad+4HBW2Q4hCzN1xADgCb+I7FFOz9XCFij7zgUFiDOvzmiC1atUu0qHEFbzVU9o5f2eVR
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b0033b44355a08sm2005948wrx.5.2024.02.07.10.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 10:02:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] dma-buf: try to catch swiotlb bounce buffers
Date: Wed,  7 Feb 2024 19:02:01 +0100
Message-ID: <20240207180201.118681-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

They rather fundamentally break the entire concept of zero copy, so if
an exporter manages to hand these out things will break all over.

Luckily there's not too many case that use
swiotlb_sync_single_for_device/cpu():

- The generic iommu dma-api code in drivers/iommu/dma-iommu.c. We can
  catch that with sg_dma_is_swiotlb() reliably.

- The generic direct dma code in kernel/dma/direct.c. We can mostly
  catch that with looking for a NULL dma_ops, except for some powerpc
  special cases.

- Xen, which I don't bother to catch here.

Implement these checks in dma_buf_map_attachment when
CONFIG_DMA_API_DEBUG is enabled.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Paul Cercueil <paul@crapouillou.net>
---
Entirely untested, but since I sent the mail with the idea I figured I
might as well type it up after I realized there's a lot fewer cases to
check. That is, if I haven't completely misread the dma-api and swiotlb
code.
-Sima
---
 drivers/dma-buf/dma-buf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d1e7f823fbdb..d6f95523f995 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -28,6 +28,12 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
+#ifdef CONFIG_DMA_API_DEBUG
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/swiotlb.h>
+#endif
+
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
 
@@ -1149,10 +1155,13 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 #ifdef CONFIG_DMA_API_DEBUG
 	if (!IS_ERR(sg_table)) {
 		struct scatterlist *sg;
+		struct device *dev = attach->dev;
 		u64 addr;
 		int len;
 		int i;
 
+		bool is_direct_dma = !get_dma_ops(dev);
+
 		for_each_sgtable_dma_sg(sg_table, sg, i) {
 			addr = sg_dma_address(sg);
 			len = sg_dma_len(sg);
@@ -1160,7 +1169,15 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
 					 __func__, addr, len);
 			}
+
+			if (is_direct_dma) {
+				phys_addr_t paddr = dma_to_phys(dev, addr);
+
+				WARN_ON_ONCE(is_swiotlb_buffer(dev, paddr));
+			}
 		}
+
+		WARN_ON_ONCE(sg_dma_is_swiotlb(sg));
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
-- 
2.43.0

