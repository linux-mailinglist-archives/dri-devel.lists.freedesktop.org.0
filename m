Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9029605FD8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94F10ED7E;
	Thu, 20 Oct 2022 12:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C345410E445
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:13:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m15so29551623edb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KzSxYsG4b4l+I9q2QIs0U4YnHUtpdMnLVfBoeSrQrAc=;
 b=jIYrU7+t6O0+MOllWK+5mFCQMiOi/kRWuMhz3cY4alWWXmJLWcFMrHIqgYpApPm7rV
 w5gnQSyraFv6vlSxkrFxE/z6BH2AriwBL0nqbkLvB92duSwkVfBWFH6JxUAu1g5ugSV4
 SEkz6WhzGTTTKG82PHYo5d64WY6PyQU9xaUdmVqi45fnr5pqXYxvQN/m5uzUoTh8gQHB
 4e16i8/MIxm5Mcq/qeSjTxc2dXHtuDaB/PNaL7GYEQOBJp0E9Vb2xrpra+tWs5fqWogd
 yWC+B8e+1kIQYwycccp+zWvZRXO14+Gjwej51Ggu5qqmALXlRZZuU5D2zETpzsOR1R5S
 IS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KzSxYsG4b4l+I9q2QIs0U4YnHUtpdMnLVfBoeSrQrAc=;
 b=oNw8GLGHnQzJmOzjlNGIOE4n52ptSsveTHyCUE+SMI7KW42Qp8rHtzUeCYZB66lWeJ
 LxBXnu2RDEASVfuFXUBDDu1omP6YL4ixPUQH7EF4eHW76lcoOHVyGOf5AUOtiEvmB8tc
 Y17gU5lWSEHgm8p2VV8pph3q3oG98+lMYFiGRI2Gv9ru2wXWyg2+P0nZMH9sSaISyyxg
 AFJsU2pt/HMUZwU3qhyhMEaTLuC1cRil3uHAqcjwwgCKRYmrZhkntuTeOkE+XCWUoWkg
 09qss2HB9PZOTsMSbZHiqIsNL9P/0Bby3sjg1eaE4QUm8hVD9skqp8FXOJXs900zK+CS
 0n2A==
X-Gm-Message-State: ACrzQf0AxYfBxJQBZc8fJ0t0KWGkY0ZfMlGAXhzcehia4RP2SqsvDrI/
 OUOLYsR8MJUebM9HP/C4UJk=
X-Google-Smtp-Source: AMsMyM7Tr0exJWZIHe2hajABmGUD0VYCZ5U27TZBF0a1r7poeOtlWKVajuBZT4re8KtHczrCmIgQ8Q==
X-Received: by 2002:aa7:de9a:0:b0:44d:8191:44c5 with SMTP id
 j26-20020aa7de9a000000b0044d819144c5mr11711686edv.232.1666268007265; 
 Thu, 20 Oct 2022 05:13:27 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:13:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: videobuf2: set dma_coherent flag for DMA-buf
Date: Thu, 20 Oct 2022 14:13:16 +0200
Message-Id: <20221020121316.3946-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a device is snooping the CPU cache we assume that all importers
must snoop the CPU cache as well.

Execpt for vmalloc allocations since those implement mmap() imports must
always snoop the cache or we will run into coherency problems.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 2 ++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 2 ++
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 555bd40fa472..57433310c55c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
 #include <linux/module.h>
 #include <linux/refcount.h>
 #include <linux/scatterlist.h>
@@ -507,6 +508,7 @@ static struct dma_buf *vb2_dc_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
 
 	if (!buf->sgt_base)
 		buf->sgt_base = vb2_dc_get_base_sgt(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 36981a5b5c53..dbdd753e4a39 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -10,6 +10,7 @@
  * the Free Software Foundation.
  */
 
+#include <linux/dma-map-ops.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/refcount.h>
@@ -522,6 +523,7 @@ static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
 
 	if (WARN_ON(!buf->dma_sgt))
 		return NULL;
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 41db707e43a4..0b6874733e86 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -341,6 +341,7 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = true;
 
 	if (WARN_ON(!buf->vaddr))
 		return NULL;
-- 
2.25.1

