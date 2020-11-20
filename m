Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B72BA5FC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3066E896;
	Fri, 20 Nov 2020 09:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B016E894
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:24:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so9266963wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+VMjOflOUPo+DdaHM2rS4NYdppCRx52PeUW6Odoxj10=;
 b=Coh9Q6MhUMpkYswerY6OZV+e3BLZ7yW8d58XpzRJ8FDAmxaLj9+oARkechzN3ILQIs
 C5tSK5DapCLvUC/e5lMrbYmQ6jj3MtTCKuQhnKTJ6pEKTEEMP8rN2gNNbZLYAEDiqQGV
 tkGw5OkC23HTVc19Zig46589GugNRk/iDJzXqIgUCnAamtt+tyshR+894c9j629ubFWu
 Y94fnDjvvQz3YQUBTjxshAOi02zwMjuqt5fJONk8Fey4N4OASWwNo70txU+DW7pZw2j4
 l6YS7MT8eZJr1StdQH6MOGx6DMTKID9Vp/+MqJK6xAV89XebppSafL80qSNgpMkp9Huo
 +OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+VMjOflOUPo+DdaHM2rS4NYdppCRx52PeUW6Odoxj10=;
 b=VoUEOkmbYf9/kBgg75l2P3RhwIaIlaXK1wIGk1JQeIUlSt185XbgQIfxDSE9hVAsnJ
 YQT36Y0ShIOn0AOPUu53WDYN9DwL5nXx3X+2h2ks3bx02ORalRp72uKodu2XsWp4e/oW
 QRimLX+AvM3f3nVHNnsOm1ejilJXedfQ+NRAkgaAqgQNHoVb4vvPjsoN7c1IyBf1GBBM
 VfAJMKbgWKYNgZ6B9TAZMxEHDuQ80H3lrIAxu8eweDqrWI5kAWtxRRApy6QRDI7hWUqC
 ZCxBUBcDIoK2k+3kG6LhUxckdRZVjQ0EO5aPGlLB48QRTmkA7nnu+wOMVzzmS0xkIB/H
 nkcw==
X-Gm-Message-State: AOAM533TOT29dnjK16rh2HCLPD4fxkBXCnTH9fhLDkfefaRcnrZRZ50M
 nE07wb62gt5cnnb2W1FI0hE=
X-Google-Smtp-Source: ABdhPJxpuwBmU5K6BVLhwhS0eh83QzTklC3zb92ccB+PT1ZVM91/FrlBBpn865pA+F0sObz8DqY0ew==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr14672332wru.397.1605864254957; 
 Fri, 20 Nov 2020 01:24:14 -0800 (PST)
Received: from gmail.com (lns-bzn-36-82-251-42-13.adsl.proxad.net.
 [82.251.42.13])
 by smtp.gmail.com with ESMTPSA id b124sm3665875wmh.13.2020.11.20.01.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 01:24:14 -0800 (PST)
Date: Fri, 20 Nov 2020 10:24:12 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 5/5] drm/virtio: rename sync_seq and last_seq
Message-ID: <20201120092412.GB12906@gmail.com>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
 <20201119010809.528-5-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119010809.528-5-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 05:08:09PM -0800, Gurchetan Singh wrote:
>To be clearer about our intentions to associate sequence numbers
>and fence IDs, let's rename these variables.
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

>---
> drivers/gpu/drm/virtio/virtgpu_debugfs.c | 4 ++--
> drivers/gpu/drm/virtio/virtgpu_drv.h     | 4 ++--
> drivers/gpu/drm/virtio/virtgpu_fence.c   | 9 +++++----
> 3 files changed, 9 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>index f336a8fa6666..5fefc88d47e4 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>@@ -67,8 +67,8 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
> 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
>
> 	seq_printf(m, "fence %llu %lld\n",
>-		   (u64)atomic64_read(&vgdev->fence_drv.last_seq),
>-		   vgdev->fence_drv.sync_seq);
>+		   (u64)atomic64_read(&vgdev->fence_drv.last_fence_id),
>+		   vgdev->fence_drv.current_fence_id);
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index 7c7967a2eb84..6a232553c99b 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -127,8 +127,8 @@ typedef void (*virtio_gpu_resp_cb)(struct virtio_gpu_device *vgdev,
> 				   struct virtio_gpu_vbuffer *vbuf);
>
> struct virtio_gpu_fence_driver {
>-	atomic64_t       last_seq;
>-	uint64_t         sync_seq;
>+	atomic64_t       last_fence_id;
>+	uint64_t         current_fence_id;
> 	uint64_t         context;
> 	struct list_head fences;
> 	spinlock_t       lock;
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 2fe9c7ebcbd4..728ca36f6327 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -48,7 +48,7 @@ static bool virtio_fence_signaled(struct dma_fence *f)
> 		/* leaked fence outside driver before completing
> 		 * initialization with virtio_gpu_fence_emit */
> 		return false;
>-	if (atomic64_read(&fence->drv->last_seq) >= fence->f.seqno)
>+	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
> 		return true;
> 	return false;
> }
>@@ -62,7 +62,8 @@ static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
> {
> 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
>
>-	snprintf(str, size, "%llu", (u64)atomic64_read(&fence->drv->last_seq));
>+	snprintf(str, size, "%llu",
>+		 (u64)atomic64_read(&fence->drv->last_fence_id));
> }
>
> static const struct dma_fence_ops virtio_fence_ops = {
>@@ -100,7 +101,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 	unsigned long irq_flags;
>
> 	spin_lock_irqsave(&drv->lock, irq_flags);
>-	fence->f.seqno = ++drv->sync_seq;
>+	fence->f.seqno = ++drv->current_fence_id;
> 	dma_fence_get(&fence->f);
> 	list_add_tail(&fence->node, &drv->fences);
> 	spin_unlock_irqrestore(&drv->lock, irq_flags);
>@@ -119,7 +120,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
> 	unsigned long irq_flags;
>
> 	spin_lock_irqsave(&drv->lock, irq_flags);
>-	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
>+	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
> 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
> 		if (fence_id < fence->f.seqno)
> 			continue;
>-- 
>2.29.2.299.gdc1121823c-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
