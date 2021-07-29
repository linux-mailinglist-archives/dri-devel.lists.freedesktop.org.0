Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2A3D9E59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72AA6ECB7;
	Thu, 29 Jul 2021 07:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5366ECB7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:24:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q3so5668120wrx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nzkjBDuSwezQZln5wCPuzWUYp20qbIfqcoBrM55OXuE=;
 b=L6YAtMUB+0JfJp3Oa9or8qJiSOga3hsQsF12Nvvbh7rdTZMaVUps/PLyZtMBRK2RJd
 xFaba20jIp4qFvuvBOeiul4hDdHaC+ced1i3ZM51E8/i6pHHqIhfZlNFPj/3ibQZsu0h
 yan77wLRuimscbEE9gIZWgeN0MVoHp8f6mmf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nzkjBDuSwezQZln5wCPuzWUYp20qbIfqcoBrM55OXuE=;
 b=T7bnzbfPadmxdSU3qd5xCbuK7zY65sVxkno9FiwicopeQCAWvZZ3Xo5Zw20KLkEA4r
 G1NT9fPJ8E921LKLL4AW9SwhihExgMMhLqvh4T34b3CQRuSMVTZFlxvYc6j3ftHtJP7f
 AJF+CV6UpfIf5IpIT1KSa6LG+3ChOKWXGdI/f74WJYos9IyNJDopb59EtXGFOqxIW3eQ
 91g/UXYebN7zv5PwbV6u+3sa5u50QIgLQJMuEfafU/gdyc2TlPvrGH+Du3zMFjnKCL42
 J37A55oluRMQkBRMpnOwsk2YZn1nMijB3onKxVENjJ0mTZa8v/V80tLfsiuHmEviY7LS
 a+Cw==
X-Gm-Message-State: AOAM533a7oG/ys+YNDaDHQbCDGcrOwPM10+LPZAWt+CN3TMxiD8xTLGG
 nrkrCS4+psXm8s8WVel8JX12YA==
X-Google-Smtp-Source: ABdhPJw5q0Ahuh0HYwAZHw8J13cHk9qv9+j1hhMjbhS/5ubGar0uBpOneUg3rUN8W1cvwnlh7M2DfQ==
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr3234283wrn.269.1627543471666; 
 Thu, 29 Jul 2021 00:24:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p22sm7436401wmq.44.2021.07.29.00.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:24:31 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:24:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: nuke seqno-fence
Message-ID: <YQJXrcTv3Cf2cGbF@phenom.ffwll.local>
References: <20210729070330.41443-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210729070330.41443-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 09:03:28AM +0200, Christian König wrote:
> Entirely unused.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/Makefile      |   2 +-
>  drivers/dma-buf/seqno-fence.c |  71 ----------------------
>  include/linux/seqno-fence.h   | 109 ----------------------------------
>  3 files changed, 1 insertion(+), 181 deletions(-)
>  delete mode 100644 drivers/dma-buf/seqno-fence.c
>  delete mode 100644 include/linux/seqno-fence.h
> 
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 40d81f23cacf..1ef021273a06 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-resv.o seqno-fence.o
> +	 dma-resv.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>  obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/seqno-fence.c b/drivers/dma-buf/seqno-fence.c
> deleted file mode 100644
> index bfe14e94c488..000000000000
> --- a/drivers/dma-buf/seqno-fence.c
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * seqno-fence, using a dma-buf to synchronize fencing
> - *
> - * Copyright (C) 2012 Texas Instruments
> - * Copyright (C) 2012-2014 Canonical Ltd
> - * Authors:
> - *   Rob Clark <robdclark@gmail.com>
> - *   Maarten Lankhorst <maarten.lankhorst@canonical.com>
> - */
> -
> -#include <linux/slab.h>
> -#include <linux/export.h>
> -#include <linux/seqno-fence.h>
> -
> -static const char *seqno_fence_get_driver_name(struct dma_fence *fence)
> -{
> -	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
> -
> -	return seqno_fence->ops->get_driver_name(fence);
> -}
> -
> -static const char *seqno_fence_get_timeline_name(struct dma_fence *fence)
> -{
> -	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
> -
> -	return seqno_fence->ops->get_timeline_name(fence);
> -}
> -
> -static bool seqno_enable_signaling(struct dma_fence *fence)
> -{
> -	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
> -
> -	return seqno_fence->ops->enable_signaling(fence);
> -}
> -
> -static bool seqno_signaled(struct dma_fence *fence)
> -{
> -	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
> -
> -	return seqno_fence->ops->signaled && seqno_fence->ops->signaled(fence);
> -}
> -
> -static void seqno_release(struct dma_fence *fence)
> -{
> -	struct seqno_fence *f = to_seqno_fence(fence);
> -
> -	dma_buf_put(f->sync_buf);
> -	if (f->ops->release)
> -		f->ops->release(fence);
> -	else
> -		dma_fence_free(&f->base);
> -}
> -
> -static signed long seqno_wait(struct dma_fence *fence, bool intr,
> -			      signed long timeout)
> -{
> -	struct seqno_fence *f = to_seqno_fence(fence);
> -
> -	return f->ops->wait(fence, intr, timeout);
> -}
> -
> -const struct dma_fence_ops seqno_fence_ops = {
> -	.get_driver_name = seqno_fence_get_driver_name,
> -	.get_timeline_name = seqno_fence_get_timeline_name,
> -	.enable_signaling = seqno_enable_signaling,
> -	.signaled = seqno_signaled,
> -	.wait = seqno_wait,
> -	.release = seqno_release,
> -};
> -EXPORT_SYMBOL(seqno_fence_ops);
> diff --git a/include/linux/seqno-fence.h b/include/linux/seqno-fence.h
> deleted file mode 100644
> index 3cca2b8fac43..000000000000
> --- a/include/linux/seqno-fence.h
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * seqno-fence, using a dma-buf to synchronize fencing
> - *
> - * Copyright (C) 2012 Texas Instruments
> - * Copyright (C) 2012 Canonical Ltd
> - * Authors:
> - *   Rob Clark <robdclark@gmail.com>
> - *   Maarten Lankhorst <maarten.lankhorst@canonical.com>
> - */
> -
> -#ifndef __LINUX_SEQNO_FENCE_H
> -#define __LINUX_SEQNO_FENCE_H
> -
> -#include <linux/dma-fence.h>
> -#include <linux/dma-buf.h>
> -
> -enum seqno_fence_condition {
> -	SEQNO_FENCE_WAIT_GEQUAL,
> -	SEQNO_FENCE_WAIT_NONZERO
> -};
> -
> -struct seqno_fence {
> -	struct dma_fence base;
> -
> -	const struct dma_fence_ops *ops;
> -	struct dma_buf *sync_buf;
> -	uint32_t seqno_ofs;
> -	enum seqno_fence_condition condition;
> -};
> -
> -extern const struct dma_fence_ops seqno_fence_ops;
> -
> -/**
> - * to_seqno_fence - cast a fence to a seqno_fence
> - * @fence: fence to cast to a seqno_fence
> - *
> - * Returns NULL if the fence is not a seqno_fence,
> - * or the seqno_fence otherwise.
> - */
> -static inline struct seqno_fence *
> -to_seqno_fence(struct dma_fence *fence)
> -{
> -	if (fence->ops != &seqno_fence_ops)
> -		return NULL;
> -	return container_of(fence, struct seqno_fence, base);
> -}
> -
> -/**
> - * seqno_fence_init - initialize a seqno fence
> - * @fence: seqno_fence to initialize
> - * @lock: pointer to spinlock to use for fence
> - * @sync_buf: buffer containing the memory location to signal on
> - * @context: the execution context this fence is a part of
> - * @seqno_ofs: the offset within @sync_buf
> - * @seqno: the sequence # to signal on
> - * @cond: fence wait condition
> - * @ops: the fence_ops for operations on this seqno fence
> - *
> - * This function initializes a struct seqno_fence with passed parameters,
> - * and takes a reference on sync_buf which is released on fence destruction.
> - *
> - * A seqno_fence is a dma_fence which can complete in software when
> - * enable_signaling is called, but it also completes when
> - * (s32)((sync_buf)[seqno_ofs] - seqno) >= 0 is true
> - *
> - * The seqno_fence will take a refcount on the sync_buf until it's
> - * destroyed, but actual lifetime of sync_buf may be longer if one of the
> - * callers take a reference to it.
> - *
> - * Certain hardware have instructions to insert this type of wait condition
> - * in the command stream, so no intervention from software would be needed.
> - * This type of fence can be destroyed before completed, however a reference
> - * on the sync_buf dma-buf can be taken. It is encouraged to re-use the same
> - * dma-buf for sync_buf, since mapping or unmapping the sync_buf to the
> - * device's vm can be expensive.
> - *
> - * It is recommended for creators of seqno_fence to call dma_fence_signal()
> - * before destruction. This will prevent possible issues from wraparound at
> - * time of issue vs time of check, since users can check dma_fence_is_signaled()
> - * before submitting instructions for the hardware to wait on the fence.
> - * However, when ops.enable_signaling is not called, it doesn't have to be
> - * done as soon as possible, just before there's any real danger of seqno
> - * wraparound.
> - */
> -static inline void
> -seqno_fence_init(struct seqno_fence *fence, spinlock_t *lock,
> -		 struct dma_buf *sync_buf,  uint32_t context,
> -		 uint32_t seqno_ofs, uint32_t seqno,
> -		 enum seqno_fence_condition cond,
> -		 const struct dma_fence_ops *ops)
> -{
> -	BUG_ON(!fence || !sync_buf || !ops);
> -	BUG_ON(!ops->wait || !ops->enable_signaling ||
> -	       !ops->get_driver_name || !ops->get_timeline_name);
> -
> -	/*
> -	 * ops is used in dma_fence_init for get_driver_name, so needs to be
> -	 * initialized first
> -	 */
> -	fence->ops = ops;
> -	dma_fence_init(&fence->base, &seqno_fence_ops, lock, context, seqno);
> -	get_dma_buf(sync_buf);
> -	fence->sync_buf = sync_buf;
> -	fence->seqno_ofs = seqno_ofs;
> -	fence->condition = cond;
> -}
> -
> -#endif /* __LINUX_SEQNO_FENCE_H */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
