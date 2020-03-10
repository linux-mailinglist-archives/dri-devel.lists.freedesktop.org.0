Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9117EDB0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B406E7D2;
	Tue, 10 Mar 2020 01:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646DA6E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:31 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id u68so4942310pfb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1gir7XHID34j/xNq8rv+e7yfugiCYxyP4ul0n3cDDo=;
 b=UoFrvzBKYbJDhuC85UgYW7DXhN2Lrd122AVz3NTBGZj3Mj2UkkmAmGjmwelzPc8XVB
 FvhguscX5HLXubUQIDzSXjPzQIxXLTrk/IxZKGZDkPcmeRSETfcsDrRVzpNSh6TPpXH4
 ebxI0z6UuJohi3T3S3v9PVOIdkN/o+kOp0UzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1gir7XHID34j/xNq8rv+e7yfugiCYxyP4ul0n3cDDo=;
 b=gBDa2SXWmu5YHgmclJhaM+Euce7HQuJoXDaRZ8+cx1kvnnLCCF26K9UB+UWkMARAiW
 hyXadrSwQWlZQkuA+TfmXAiMhnOO0rgBmxNWXvXtBu+P6OAB3WIA93O5WBIXDPdNoKA9
 fkFB0o5tcfB9O9ZByupOq3WCgztAaqXQlgIgfp8ff0o+qa5l/MerKNcQzVl/VV895LbR
 tj37cVQwHv8Hal6lb1GQilYMlTwiCYulGpdDXUoqr04JqfdqjWVSI4n/QkbiQ4GzBPrg
 5+M046vYAoSq4Q6FKC2wHc+edeXiaHihe4/Cz3oVY+oUEglDANZzY8BTbrOz87AhcjP3
 In3g==
X-Gm-Message-State: ANhLgQ3A3S7TRn5Ra1bGapApxWiuSsVaSOQQI5lmkXbTzyQTjrSG0L76
 w5Pn/bOPcBrz3ZSVpDgQHg7TeIuv7e8=
X-Google-Smtp-Source: ADFU+vuPIsPQmz5pKGctu79kSP6hj4AW6VpOIcHMYkXjW1nFSMbFhPSMFCjd1oA+zwh7HexVTKUG9g==
X-Received: by 2002:a63:fb0c:: with SMTP id o12mr7367077pgh.204.1583802510563; 
 Mon, 09 Mar 2020 18:08:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/8] drm/virtio: rename sync_seq and last_seq
Date: Mon,  9 Mar 2020 18:08:14 -0700
Message-Id: <20200310010818.569-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310010818.569-1-gurchetansingh@chromium.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
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
Cc: chadversary@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be clearer about our intentions to differentiate per-context
sequence numbers and fence IDs, let's rename these variables.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_fence.c   | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index e27120d512b0..807fe7e9e4d9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -60,8 +60,8 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
 	seq_printf(m, "fence %llu %lld\n",
-		   (u64)atomic64_read(&vgdev->fence_drv.last_seq),
-		   vgdev->fence_drv.sync_seq);
+		   (u64)atomic64_read(&vgdev->fence_drv.last_fence_id),
+		   vgdev->fence_drv.current_fence_id);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 76223e2aa68d..7d96d0fdcbac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -98,8 +98,8 @@ typedef void (*virtio_gpu_resp_cb)(struct virtio_gpu_device *vgdev,
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
index f0a7ef80e484..0c32f3f72737 100644
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
+		(u64)atomic64_read(&fence->drv->last_fence_id));
 }
 
 static const struct dma_fence_ops virtio_fence_ops = {
@@ -101,7 +102,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	fence->f.seqno = ++drv->sync_seq;
+	fence->f.seqno = ++drv->current_fence_id;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
@@ -120,7 +121,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
+	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
 		if (fence_id < fence->f.seqno)
 			continue;
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
