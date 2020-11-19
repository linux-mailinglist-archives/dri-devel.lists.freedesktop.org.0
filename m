Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396C2B8949
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6346E4EC;
	Thu, 19 Nov 2020 01:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D089FD1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:08:17 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bj5so1201004plb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHx4ytUijlNq7bxaYPhHyX5eNG3Jmb5vUd+7wKMszi8=;
 b=UnrCsOjXt91X3uDxE2bRnn51Qylw5aPu+fChwRoCk1rpN842aYn6klPrDJBgABMitU
 H/T04lcgGwxLqWWo2ef72rgGDnZtYF7+qcE1NveTW1NmbsBwPrLwsx6Gx0v94NvVxXde
 Ov1WISNyhdPWD6KelyH4YahXrFqXUhIxmsGtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHx4ytUijlNq7bxaYPhHyX5eNG3Jmb5vUd+7wKMszi8=;
 b=a8TN0f9kyA1I6ljENOyHwdVzMdM2LCVIBwy1GdhebEvR77xKOERBIZdUqgWpv+IF1k
 YIR24LZWQ2b6UeE9Zg9r+3EFcNIoWn1QYh2+ZT4kBmZJGIEmTt1w4dLNLR+z27OmhqbW
 COhcuDihx1Q2xGh6sI7UNSkBqNpxzl0tGFQScj/+rSKbJ3mbjdfAtTsbct05wgZJMvl8
 KgQVpX3OHOzZUTGTjx4MuNqdwXLivq+dHvatZvmjPblTc/68kL8qAooas5BpMV9Gn1xt
 OI8cEHFdLEkv25BFMCFzum81sJ5lwJt096SX7Q6DDkDebY+wbqz2LIAJ6GBKW5Qmg1Y1
 Ystw==
X-Gm-Message-State: AOAM533BhX/M9ja+C/zaoFSmhbT1PPZAWUD0pylQaNp4Jv2ku9GdwfSl
 kQg0pdXPyKyMAcShtmviqTMVWNEyUokuEA==
X-Google-Smtp-Source: ABdhPJxeUOSTbMSMeNsGHJbmrgvEND8QM/55Cluu52fZKa312LE/iwk222afJ6TLweY+sKYELFljUA==
X-Received: by 2002:a17:902:a702:b029:d8:c562:14dc with SMTP id
 w2-20020a170902a702b02900d8c56214dcmr6838091plq.40.1605748097308; 
 Wed, 18 Nov 2020 17:08:17 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m8sm24188574pgg.1.2020.11.18.17.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 17:08:16 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/virtio: rename sync_seq and last_seq
Date: Wed, 18 Nov 2020 17:08:09 -0800
Message-Id: <20201119010809.528-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119010809.528-1-gurchetansingh@chromium.org>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be clearer about our intentions to associate sequence numbers
and fence IDs, let's rename these variables.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_fence.c   | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index f336a8fa6666..5fefc88d47e4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -67,8 +67,8 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
 	seq_printf(m, "fence %llu %lld\n",
-		   (u64)atomic64_read(&vgdev->fence_drv.last_seq),
-		   vgdev->fence_drv.sync_seq);
+		   (u64)atomic64_read(&vgdev->fence_drv.last_fence_id),
+		   vgdev->fence_drv.current_fence_id);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7c7967a2eb84..6a232553c99b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -127,8 +127,8 @@ typedef void (*virtio_gpu_resp_cb)(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_vbuffer *vbuf);
 
 struct virtio_gpu_fence_driver {
-	atomic64_t       last_seq;
-	uint64_t         sync_seq;
+	atomic64_t       last_fence_id;
+	uint64_t         current_fence_id;
 	uint64_t         context;
 	struct list_head fences;
 	spinlock_t       lock;
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 2fe9c7ebcbd4..728ca36f6327 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -48,7 +48,7 @@ static bool virtio_fence_signaled(struct dma_fence *f)
 		/* leaked fence outside driver before completing
 		 * initialization with virtio_gpu_fence_emit */
 		return false;
-	if (atomic64_read(&fence->drv->last_seq) >= fence->f.seqno)
+	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
 		return true;
 	return false;
 }
@@ -62,7 +62,8 @@ static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
 {
 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
 
-	snprintf(str, size, "%llu", (u64)atomic64_read(&fence->drv->last_seq));
+	snprintf(str, size, "%llu",
+		 (u64)atomic64_read(&fence->drv->last_fence_id));
 }
 
 static const struct dma_fence_ops virtio_fence_ops = {
@@ -100,7 +101,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	fence->f.seqno = ++drv->sync_seq;
+	fence->f.seqno = ++drv->current_fence_id;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
@@ -119,7 +120,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
+	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
 		if (fence_id < fence->f.seqno)
 			continue;
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
