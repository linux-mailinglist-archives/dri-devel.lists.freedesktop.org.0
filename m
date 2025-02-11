Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A8A31169
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B144710E711;
	Tue, 11 Feb 2025 16:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VinNETBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4510E703
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:31:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5de5a853090so7394864a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739291475; x=1739896275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6SZKMir/CCVtFZIbZW4Fj8Q80/bYL9FqnHdhMsDaITQ=;
 b=VinNETBT1efHWjK7Ej9OtYSD4IFe4JXxW/nkTdnCk0JxzSUsWaoV7L0lHqJItv3oq8
 vNr6S7oWzZwn7vp1wZx779ip3U2PaYsweDqY1GKjhwaoGQYez1ugo9BT8i5Sh4/D3TTA
 4eQ67p+P9garjFC0oFejIMsy/7sYsobLY1UBuZSaDwffNixoCPs09kSbcQ7cjgQKhnxa
 p1Y5r88ig09f3VT58EXDbjoh6kSOhb1hkykoDlDejVcvkAjnCdHBbiZLIlo5OKq/w722
 Ny+Zc62gXYX09qPG99EbS+oRAlY6FdevUa1rphQQnyrht826OypaNmQQFrJ01JG3ygpV
 SK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291475; x=1739896275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SZKMir/CCVtFZIbZW4Fj8Q80/bYL9FqnHdhMsDaITQ=;
 b=xDOZUra5NOx/qwwkB0skkNHAXlxKf2rF5hUC3+ESh3mSdMGaje07c86oP0elr8sYTi
 XIle8goH1UapD2IKwnuc9xJoDcElxhAOF4aOce9NP6EQ6PBgeXTgr+OJhHxULfqGbFX6
 olRMBQbfQZf7bHSY9OMVbmfo72W8G2bt6WFaQtwWThXQ75hZy55X74rUsgB90dTsSpYw
 yTxCzp9I7hFwNi61RKrvZa4LQBXv/Z+klJ3qSLd/ORYGZndQz4jOVuXb+NXbYFU1/m5m
 eAB1g+lieJi1wdPpkNJ7M6ND3aPLHXHaSU5ggAX33k3FdVUGhszQes4C8OtAePTQAgVM
 HGdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7uU9dA0c32uTkJGiLFGGcItVVKmGu/7Kx3JQhPTdbOXC0p2UVq+e/MhAYsEOrqYe/OsTZk669cwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwmTeZiKUYugnr3SsF+m9aiMP48A5EQjHr7m3VGuMLhlHDp+yX
 NMVzTSh41x6f+J7cw/nubvDdnQMf1GxhnNYDZEQAkyJsw7PZE9oA
X-Gm-Gg: ASbGncuHkkLhClMrlDq7stHo4KBUe7srcIvrnCccu5QwflurqVFuluErQgb6fOHgAny
 ggN4qMy35GkMm5n5/jd9ww+ltle3cmru1ofje2gcQxAFf0DtNc1sXE5jsX48mg5BhPDdZLzSsJJ
 On4qzfdssWAmDAJ2KNTJzZwclbDC12AmFd2NfEOp8C0kU0G4T3G3rUeJOUTxLI1vIk+MADvcH3P
 F9EKGwGP0YOVrjy8UyLI6fmJogk2z272nvCUTawxYXaDvUi7GNhyBDSFiUjeg2R/ye1rYgoDne4
 paXicVh0l9xv+RQYXTrZTW+Xmeh0
X-Google-Smtp-Source: AGHT+IEpS2WYCCXVKPTuo/qumvE+XCs2EJBxozM2SlFTakSrMGFjjYts4TVIa5Yz3Yb26t4kH7nU+A==
X-Received: by 2002:a05:6402:42c8:b0:5dc:1289:7f1c with SMTP id
 4fb4d7f45d1cf-5de450d6951mr20692891a12.29.1739291474370; 
 Tue, 11 Feb 2025 08:31:14 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:31:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
Date: Tue, 11 Feb 2025 17:31:07 +0100
Message-Id: <20250211163109.12200-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
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

The fence_value_str and timeline_value_str callbacks were just an
unnecessary abstraction in the SW sync implementation.

The only caller of those callbacks already knew that the fence in
questions is a timeline_fence. So print the values directly instead
of using a redirection.

Additional to that remove the implementations from virtgpu and vgem.
As far as I can see those were never used in the first place.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c              | 16 ----------------
 drivers/dma-buf/sync_debug.c           | 21 ++-------------------
 drivers/gpu/drm/vgem/vgem_fence.c      | 15 ---------------
 drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ----------------
 include/linux/dma-fence.h              | 21 ---------------------
 5 files changed, 2 insertions(+), 87 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..849280ae79a9 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -173,20 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
 	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
 }
 
-static void timeline_fence_value_str(struct dma_fence *fence,
-				    char *str, int size)
-{
-	snprintf(str, size, "%lld", fence->seqno);
-}
-
-static void timeline_fence_timeline_value_str(struct dma_fence *fence,
-					     char *str, int size)
-{
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	snprintf(str, size, "%d", parent->value);
-}
-
 static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
@@ -208,8 +194,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.get_timeline_name = timeline_fence_get_timeline_name,
 	.signaled = timeline_fence_signaled,
 	.release = timeline_fence_release,
-	.fence_value_str = timeline_fence_value_str,
-	.timeline_value_str = timeline_fence_timeline_value_str,
 	.set_deadline = timeline_fence_set_deadline,
 };
 
diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 237bce21d1e7..270daae7d89a 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -82,25 +82,8 @@ static void sync_print_fence(struct seq_file *s,
 		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
 	}
 
-	if (fence->ops->timeline_value_str &&
-		fence->ops->fence_value_str) {
-		char value[64];
-		bool success;
-
-		fence->ops->fence_value_str(fence, value, sizeof(value));
-		success = strlen(value);
-
-		if (success) {
-			seq_printf(s, ": %s", value);
-
-			fence->ops->timeline_value_str(fence, value,
-						       sizeof(value));
-
-			if (strlen(value))
-				seq_printf(s, " / %s", value);
-		}
-	}
-
+	seq_printf(s, ": %lld", fence->seqno);
+	seq_printf(s, " / %d", parent->value);
 	seq_putc(s, '\n');
 }
 
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index e15754178395..5298d995faa7 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -53,25 +53,10 @@ static void vgem_fence_release(struct dma_fence *base)
 	dma_fence_free(&fence->base);
 }
 
-static void vgem_fence_value_str(struct dma_fence *fence, char *str, int size)
-{
-	snprintf(str, size, "%llu", fence->seqno);
-}
-
-static void vgem_fence_timeline_value_str(struct dma_fence *fence, char *str,
-					  int size)
-{
-	snprintf(str, size, "%llu",
-		 dma_fence_is_signaled(fence) ? fence->seqno : 0);
-}
-
 static const struct dma_fence_ops vgem_fence_ops = {
 	.get_driver_name = vgem_fence_get_driver_name,
 	.get_timeline_name = vgem_fence_get_timeline_name,
 	.release = vgem_fence_release,
-
-	.fence_value_str = vgem_fence_value_str,
-	.timeline_value_str = vgem_fence_timeline_value_str,
 };
 
 static void vgem_fence_timeout(struct timer_list *t)
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index f28357dbde35..44c1d8ef3c4d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -49,26 +49,10 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 	return false;
 }
 
-static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
-{
-	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
-}
-
-static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
-					  int size)
-{
-	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
-
-	snprintf(str, size, "%llu",
-		 (u64)atomic64_read(&fence->drv->last_fence_id));
-}
-
 static const struct dma_fence_ops virtio_gpu_fence_ops = {
 	.get_driver_name     = virtio_gpu_get_driver_name,
 	.get_timeline_name   = virtio_gpu_get_timeline_name,
 	.signaled            = virtio_gpu_fence_signaled,
-	.fence_value_str     = virtio_gpu_fence_value_str,
-	.timeline_value_str  = virtio_gpu_timeline_value_str,
 };
 
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e230af0d123f..8778e2d758da 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -238,27 +238,6 @@ struct dma_fence_ops {
 	 */
 	void (*release)(struct dma_fence *fence);
 
-	/**
-	 * @fence_value_str:
-	 *
-	 * Callback to fill in free-form debug info specific to this fence, like
-	 * the sequence number.
-	 *
-	 * This callback is optional.
-	 */
-	void (*fence_value_str)(struct dma_fence *fence, char *str, int size);
-
-	/**
-	 * @timeline_value_str:
-	 *
-	 * Fills in the current value of the timeline as a string, like the
-	 * sequence number. Note that the specific fence passed to this function
-	 * should not matter, drivers should only use it to look up the
-	 * corresponding timeline structures.
-	 */
-	void (*timeline_value_str)(struct dma_fence *fence,
-				   char *str, int size);
-
 	/**
 	 * @set_deadline:
 	 *
-- 
2.34.1

