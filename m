Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F52C3CCC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8B46E83D;
	Wed, 25 Nov 2020 09:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1926E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:47:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so1225102wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6f3aS5IKixHnsPr8wHeIikAVgrJwL6vY1X8kfx9oNhg=;
 b=My1K3T9UcTdQIa2ClpzsN4d/3rSBaTExPd7RjI1dlYFlDoJjSbCItMsKqHBY9RXFMD
 9Ek9t1vqAC2ZeR4Xf0wMyO9nAC3XrC+dKxbAOaGMgnkHPHMZyvEEBfRzNd9qoCUNF7xW
 M8qIWaYg6MS26Lt+TxwTijcT7/UTsl3Titkmyna82gxeZQJXNT4umKg5iQOZheAfvSq5
 l0qsXcZra8bwrVayYMJE3yp1ng2FXMCX4G/6hH2rXbYFi07eeHZtxIs4POfOrcEYnWox
 rWgZkpiaicOoICIuX/whsk2rCJztYJyAvcrdpMNybj6eWUgkKaIEZMuJAwfeKIGoCn8l
 jjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6f3aS5IKixHnsPr8wHeIikAVgrJwL6vY1X8kfx9oNhg=;
 b=bnOyUbs16jcwwwy9DkScF03QZt0WK5JbPRDI0amPgyVXm2GBtRMdWwjhhntQPi+pKp
 bcGku+aWSq0RcMfcNXfcrxmp04Ok0GZxhd9v69tE65qQgaHQMC2ovSBntBMsFsxaA8Ih
 Ip/L1LJsQ1nqbaZd0EW4sCMFV8des4myh2+m2zQYfeGmu6DT+9TWlxQousSr7GYlfEqq
 7/GBQz80AgpgmdaloZaRHyN6gwgm0A5/WMkjP2dtRjdWXCiolmlB8lhKm3kY2S/R8HIl
 LkH8yhiu7qsL5WyUoPMEIAiw6+KpRNHn4RWT47csYOp4Y7xd9mNA3qKD8nhbpL2il4lj
 w0AA==
X-Gm-Message-State: AOAM533FwZ/aw4CNcMEjBqrmk6ouO3uTWbDlqhZO4Slz1NIFiB9B+vB8
 ne5oCUttIzExa9Kqc5q18ps=
X-Google-Smtp-Source: ABdhPJxuqEKGx/BsRQ4KlAoGIQpzdlr4TLEllr0iPXXPaqv9MWu0g02VQH3Ty29EUdgNYjfd3MEg8Q==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr3096135wro.363.1606297635165; 
 Wed, 25 Nov 2020 01:47:15 -0800 (PST)
Received: from gmail.com (lns-bzn-36-82-251-42-13.adsl.proxad.net.
 [82.251.42.13])
 by smtp.gmail.com with ESMTPSA id f19sm3505851wml.21.2020.11.25.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 01:47:14 -0800 (PST)
Date: Wed, 25 Nov 2020 10:47:12 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 1/3] drm/virtio: virtio_{blah} --> virtio_gpu_{blah}
Message-ID: <20201125094712.GC12906@gmail.com>
References: <20201124021902.407-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124021902.407-1-gurchetansingh@chromium.org>
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

On Mon, Nov 23, 2020 at 06:19:00PM -0800, Gurchetan Singh wrote:
>virtio_gpu typically uses the prefix virtio_gpu, but there are
>a few places where the virtio prefix is used.  Modify this for
>consistency.
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
>---
> drivers/gpu/drm/virtio/virtgpu_debugfs.c | 24 ++++++++++--------
> drivers/gpu/drm/virtio/virtgpu_fence.c   | 32 +++++++++++++-----------
> 2 files changed, 30 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>index 5fefc88d47e4..c2b20e0ee030 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
>@@ -28,14 +28,13 @@
>
> #include "virtgpu_drv.h"
>
>-static void virtio_add_bool(struct seq_file *m, const char *name,
>-				    bool value)
>+static void virtio_gpu_add_bool(struct seq_file *m, const char *name,
>+				bool value)
> {
> 	seq_printf(m, "%-16s : %s\n", name, value ? "yes" : "no");
> }
>
>-static void virtio_add_int(struct seq_file *m, const char *name,
>-				   int value)
>+static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
> {
> 	seq_printf(m, "%-16s : %d\n", name, value);
> }
>@@ -45,13 +44,16 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
> 	struct drm_info_node *node = (struct drm_info_node *)m->private;
> 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
>
>-	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
>-	virtio_add_bool(m, "edid", vgdev->has_edid);
>-	virtio_add_bool(m, "indirect", vgdev->has_indirect);
>-	virtio_add_bool(m, "resource uuid", vgdev->has_resource_assign_uuid);
>-	virtio_add_bool(m, "blob resources", vgdev->has_resource_blob);
>-	virtio_add_int(m, "cap sets", vgdev->num_capsets);
>-	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
>+	virtio_gpu_add_bool(m, "virgl", vgdev->has_virgl_3d);
>+	virtio_gpu_add_bool(m, "edid", vgdev->has_edid);
>+	virtio_gpu_add_bool(m, "indirect", vgdev->has_indirect);
>+
>+	virtio_gpu_add_bool(m, "resource uuid",
>+			    vgdev->has_resource_assign_uuid);
>+
>+	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
>+	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
>+	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
> 	if (vgdev->host_visible_region.len) {
> 		seq_printf(m, "%-16s : 0x%lx +0x%lx\n", "host visible region",
> 			   (unsigned long)vgdev->host_visible_region.addr,
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 728ca36f6327..586034c90587 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -27,22 +27,22 @@
>
> #include "virtgpu_drv.h"
>
>-#define to_virtio_fence(x) \
>+#define to_virtio_gpu_fence(x) \
> 	container_of(x, struct virtio_gpu_fence, f)
>
>-static const char *virtio_get_driver_name(struct dma_fence *f)
>+static const char *virtio_gpu_get_driver_name(struct dma_fence *f)
> {
> 	return "virtio_gpu";
> }
>
>-static const char *virtio_get_timeline_name(struct dma_fence *f)
>+static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
> {
> 	return "controlq";
> }
>
>-static bool virtio_fence_signaled(struct dma_fence *f)
>+static bool virtio_gpu_fence_signaled(struct dma_fence *f)
> {
>-	struct virtio_gpu_fence *fence = to_virtio_fence(f);
>+	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>
> 	if (WARN_ON_ONCE(fence->f.seqno == 0))
> 		/* leaked fence outside driver before completing
>@@ -53,25 +53,26 @@ static bool virtio_fence_signaled(struct dma_fence *f)
> 	return false;
> }
>
>-static void virtio_fence_value_str(struct dma_fence *f, char *str, int size)
>+static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
> {
> 	snprintf(str, size, "%llu", f->seqno);
> }
>
>-static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
>+static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
>+					  int size)
> {
>-	struct virtio_gpu_fence *fence = to_virtio_fence(f);
>+	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>
> 	snprintf(str, size, "%llu",
> 		 (u64)atomic64_read(&fence->drv->last_fence_id));
> }
>
>-static const struct dma_fence_ops virtio_fence_ops = {
>-	.get_driver_name     = virtio_get_driver_name,
>-	.get_timeline_name   = virtio_get_timeline_name,
>-	.signaled            = virtio_fence_signaled,
>-	.fence_value_str     = virtio_fence_value_str,
>-	.timeline_value_str  = virtio_timeline_value_str,
>+static const struct dma_fence_ops virtio_gpu_fence_ops = {
>+	.get_driver_name     = virtio_gpu_get_driver_name,
>+	.get_timeline_name   = virtio_gpu_get_timeline_name,
>+	.signaled            = virtio_gpu_fence_signaled,
>+	.fence_value_str     = virtio_gpu_fence_value_str,
>+	.timeline_value_str  = virtio_gpu_timeline_value_str,
> };
>
> struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
>@@ -88,7 +89,8 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
> 	 * unknown yet.  The fence must not be used outside of the driver
> 	 * until virtio_gpu_fence_emit is called.
> 	 */
>-	dma_fence_init(&fence->f, &virtio_fence_ops, &drv->lock, drv->context, 0);
>+	dma_fence_init(&fence->f, &virtio_gpu_fence_ops, &drv->lock, drv->context,
>+		       0);
>
> 	return fence;
> }
>-- 
>2.29.2.454.gaff20da3a2-goog
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
