Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF522C3CD2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A51C6E8BC;
	Wed, 25 Nov 2020 09:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193BC6E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:50:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w24so1539327wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4UEVjN2k2/BKl91Hbol55WThwdT9QOSQsbVh861UOog=;
 b=sNroeqOjO4OD4UDLAueXMufSgsd5EC84KQYo9r/5e3gv5LeeZSre7nWqfdaAra7/iG
 S16gHcURIe34teYR+SzzwO40ymgU/zPipBEoI01XDYvVi8P18L8JA9GGuRVi836IswDI
 Q+B+ja7XHhQ48ie1hkWcsR/csGYl2tzzL72KtATW7vrvZ7cJlN/7jf0G44tVXURUvLok
 eZ6HJXKFDRMMRWx7mi1n5ACVEA9657ER2wNfUa37j+08P6q2r1PbplQPZgWnXrmD7mBx
 z1idVH+poxtEANmfoZOpkX/5LyesvHzQYpRJXu9icm90FDt8vXdAWdbZ0iM8fcDpr6hO
 xEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4UEVjN2k2/BKl91Hbol55WThwdT9QOSQsbVh861UOog=;
 b=rfl18Z0DZ5XDG5JunVhciw75HxMPYAZEhA9J89FLuyNOa6KOFVbxxL95fuy38LIAes
 QGsvpcT8IHpExTO+l6exvtwdbcvwLKlfI2Jr42PDTDqJy8tsXnixWqGkrMeDpLtFDOMU
 e64l1JmWIYY5ZWoQaGpmTT30Hz6OqOpo90zwHi83An8hRqxHDx2a+KZ48mMsiHBwpHkx
 azblYXbW0Y5fWIjDsSIW9Teo0UVt1xcGDFNFPFg5raR+cAwPPjodsTLQyNdL7ayjjjH+
 dowrtdwzF/jVTr+c134vhqUJlnTbddJynyi5283Y5XvqAP08eXV7nC8aPTxoXsGbbbQw
 S6tA==
X-Gm-Message-State: AOAM533eg+fj5LRwIJZISYzRExatLi6i3AZ2It2QQtwun3Jv+RifAtCE
 WepbLZt/kWJxM3/rrTGfVq0=
X-Google-Smtp-Source: ABdhPJzyXoumVST409fA5dbJC0KRExrWhkmT13kUTS2zqEzHHpUaOUWZPXIHYWEeGzkMWamCNW61hw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr2717335wmc.72.1606297803696;
 Wed, 25 Nov 2020 01:50:03 -0800 (PST)
Received: from gmail.com (lns-bzn-36-82-251-42-13.adsl.proxad.net.
 [82.251.42.13])
 by smtp.gmail.com with ESMTPSA id k84sm3832399wmf.42.2020.11.25.01.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 01:50:03 -0800 (PST)
Date: Wed, 25 Nov 2020 10:50:01 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 3/3] drm/virtio: consider dma-fence context when signaling
Message-ID: <20201125095001.GE12906@gmail.com>
References: <20201124021902.407-3-gurchetansingh@chromium.org>
 <20201124022817.404-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124022817.404-1-gurchetansingh@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 06:28:17PM -0800, Gurchetan Singh wrote:
>This an incremental refactor towards multiple dma-fence contexts
>in virtio-gpu.  Since all fences are still allocated using
>&virtio_gpu_fence_driver.context, nothing should break and every
>processed fence will be signaled.
>
>The overall idea is every 3D context can allocate a number of
>dma-fence contexts.  Each dma-fence context refers to it's own
>timeline.
>
>For example, consider the following case where virgl submits
>commands to the GPU (fence ids 1, 3) and does a metadata query with
>the CPU (fence id 5).  In a different process, gfxstream submits
>commands to the GPU (fence ids 2, 4).
>
>fence_id (&dma_fence.seqno)       | 1 2 3 4 5
>----------------------------------|-----------
>fence_ctx 0 (virgl gpu)           | 1   3
>fence_ctx 1 (virgl metadata query)|         5
>fence_ctx 2 (gfxstream gpu)       |   2   4
>
>With multiple fence contexts, we can wait for the metadata query
>to finish without waiting for the virgl gpu to finish.  virgl gpu
>does not have to wait for gfxstream gpu.  The fence id still is the
>monotonically increasing sequence number, but it's only revelant to
>the specific dma-fence context.
>
>To fully enable this feature, we'll need to:
>  - have each 3d context allocate a number of fence contexts. Not
>    too hard with explicit context initialization on the horizon.
>  - have guest userspace specify fence context when performing
>    ioctls.
>  - tag each fence emitted to the host with the fence context
>    information.  virtio_gpu_ctrl_hdr has padding + flags available,
>    so that should be easy.
>
>This change goes in the direction specified above, by:
>  - looking up the virtgpu_fence given a fence_id
>  - signalling all prior fences in a given context
>  - signalling current fence
>
>v2: fix grammar in comment
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
>---
> drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
> drivers/gpu/drm/virtio/virtgpu_fence.c | 39 ++++++++++++++++++++------
> 2 files changed, 31 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index 6a232553c99b..d9dbc4f258f3 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -136,6 +136,7 @@ struct virtio_gpu_fence_driver {
>
> struct virtio_gpu_fence {
> 	struct dma_fence f;
>+	uint64_t fence_id;
> 	struct virtio_gpu_fence_driver *drv;
> 	struct list_head node;
> };
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index b35fcd1d02d7..d28e25e8409b 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -51,7 +51,7 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
>
> static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
> {
>-	snprintf(str, size, "%llu", f->seqno);
>+	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
> }
>
> static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
>@@ -99,7 +99,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 	unsigned long irq_flags;
>
> 	spin_lock_irqsave(&drv->lock, irq_flags);
>-	fence->f.seqno = ++drv->current_fence_id;
>+	fence->fence_id = fence->f.seqno = ++drv->current_fence_id;
> 	dma_fence_get(&fence->f);
> 	list_add_tail(&fence->node, &drv->fences);
> 	spin_unlock_irqrestore(&drv->lock, irq_flags);
>@@ -107,24 +107,45 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 	trace_dma_fence_emit(&fence->f);
>
> 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
>-	cmd_hdr->fence_id = cpu_to_le64(fence->f.seqno);
>+	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
> }
>
> void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
> 				    u64 fence_id)
> {
> 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
>-	struct virtio_gpu_fence *fence, *tmp;
>+	struct virtio_gpu_fence *signaled, *curr, *tmp;
> 	unsigned long irq_flags;
>
> 	spin_lock_irqsave(&drv->lock, irq_flags);
> 	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
>-	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
>-		if (fence_id < fence->f.seqno)
>+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
>+		if (fence_id != curr->fence_id)
> 			continue;
>-		dma_fence_signal_locked(&fence->f);
>-		list_del(&fence->node);
>-		dma_fence_put(&fence->f);
>+
>+		signaled = curr;
>+
>+		/*
>+		 * Signal any fences with a strictly smaller sequence number
>+		 * than the current signaled fence.
>+		 */
>+		list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
>+			/* dma-fence contexts must match */
>+			if (signaled->f.context != curr->f.context)
>+				continue;
>+
>+			if (!dma_fence_is_later(&signaled->f, &curr->f))
>+				continue;
>+
>+			dma_fence_signal_locked(&curr->f);
>+			list_del(&curr->node);
>+			dma_fence_put(&curr->f);
>+		}
>+
>+		dma_fence_signal_locked(&signaled->f);
>+		list_del(&signaled->node);
>+		dma_fence_put(&signaled->f);
>+		break;
> 	}
> 	spin_unlock_irqrestore(&drv->lock, irq_flags);
> }
>-- 
>2.29.2.454.gaff20da3a2-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
