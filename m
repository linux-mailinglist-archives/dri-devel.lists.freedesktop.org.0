Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46855104DC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA0F10E8E0;
	Tue, 26 Apr 2022 17:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3E10E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:05:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id p4so7536620edx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1d6XYPEIOlSgqhPimpriycmvoOlXuKEavH90oQKFT58=;
 b=BW1uW0cKB5fLPLvX4Kdp7TRxewBLJTBqUEO7YRLZ2czLoIbu7HWYs9GwFxNGd5PWog
 l3FeJqKIKEoeGEOmiScWZEayoJ1n6zqFsIU17b4thJP1qaXiLIsSg6PZUO5NqqaYlsVt
 4wp4ARfD5PsWrYHurhMKX04pnn6cWdHrXyr7pS9Y9Y7Lze4kEryph9xIrquynUGk/CUm
 0nORrBtwl6s2hqegqs7SIMwoJzWoh566Tjn2TNbCwiY6dfj8WnskS3rQYkWTxVNrMS0Q
 r322luV/HEd1sf9jEwszc3HkgqHATUFOLa+q2Z6h1KppJP5X/rOIyK0/gy8YUyqTiTbb
 R/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1d6XYPEIOlSgqhPimpriycmvoOlXuKEavH90oQKFT58=;
 b=GyZmiCJmh3P3XPr2UZtft4I/XagT4cV0I/NIgB6v+DidIr5cR5BJ+yVJp6S1BjvoBo
 xYNI4lOYoOuGOg7kqaqncFyzzNP/qGsWpSADbfBJ3nyJZ2qOpOXl4IM2f+kNC9XgAqWA
 2mvE+bhq7+j4MCBRneQ+tzd9MR+O8rgJlaYuBpHtrDq8acv2U8iq+3gwSVsoQzt3BRAo
 +j2xqUMtg6stRybFGdvd3x+s52t/Ug3BQKoUPvSlvWxmEhDJFxYlR7IMgzhEMH0l100f
 uqN8aBO43a1soml6cDMOjBqK5KmYRxV3j724aHB5RJ4xSuBAdxkNqcVmJPYfheh1VP3C
 WQlg==
X-Gm-Message-State: AOAM532BOfK1ZTHkzUofN1PuX+hZ355gbzYu5CCNxHywo1kJhQtmaf0z
 NOfyM1sEVhLOqykuop/xc0c=
X-Google-Smtp-Source: ABdhPJz3N30G7WL5/5A7bIeTHap9cpiax0UhXn4o2lF1gEfPodWNtRBEGhX+CYJ2psY7F8OcxVJ43A==
X-Received: by 2002:aa7:c5c9:0:b0:425:ca31:4e35 with SMTP id
 h9-20020aa7c5c9000000b00425ca314e35mr20395140eds.315.1650992753740; 
 Tue, 26 Apr 2022 10:05:53 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:331b:81d1:1030:30f5?
 ([2a02:908:1252:fb60:331b:81d1:1030:30f5])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a170906234100b006ef83025804sm5318989eja.87.2022.04.26.10.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:05:52 -0700 (PDT)
Message-ID: <cb734eb3-2b65-4384-6d3d-f74b38489681@gmail.com>
Date: Tue, 26 Apr 2022 19:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dma-buf: remove trace_dma_fence_emit
Content-Language: en-US
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20220426170044.29454-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220426170044.29454-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a few more people on CC.

Am 26.04.22 um 19:00 schrieb Christian König:
> There was never any significant difference between trace_dma_fence_emit()
> and trace_dma_fence_init() and the only place where it would made a
> significant difference was never implemented.
>
> So remove trace_dma_fence_emit() since we have an repeating issue that
> people are trying to use it for visualization and are surprised that
> it actually doesn't work for most drivers.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c             | 1 -
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 1 -
>   drivers/gpu/drm/qxl/qxl_release.c       | 1 -
>   drivers/gpu/drm/virtio/virtgpu_fence.c  | 2 --
>   include/trace/events/dma_fence.h        | 7 -------
>   5 files changed, 12 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 066400ed8841..d0d704f3edae 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -20,7 +20,6 @@
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/dma_fence.h>
>   
> -EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7f01dcf81fab..abcac7db4347 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -224,7 +224,6 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
>   			       &fctx->lock, fctx->context, ++fctx->sequence);
>   	kref_get(&fctx->fence_ref);
>   
> -	trace_dma_fence_emit(&fence->base);
>   	ret = fctx->emit(fence);
>   	if (!ret) {
>   		dma_fence_get(&fence->base);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 368d26da0d6a..cb9f27771f32 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -424,7 +424,6 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
>   	 */
>   	dma_fence_init(&release->base, &qxl_fence_ops, &qdev->release_lock,
>   		       release->id | 0xf0000000, release->base.seqno);
> -	trace_dma_fence_emit(&release->base);
>   
>   	list_for_each_entry(entry, &release->bos, head) {
>   		bo = entry->bo;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
> index f28357dbde35..e8b6dec37977 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -111,8 +111,6 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
>   	list_add_tail(&fence->node, &drv->fences);
>   	spin_unlock_irqrestore(&drv->lock, irq_flags);
>   
> -	trace_dma_fence_emit(&fence->f);
> -
>   	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
>   	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
>   
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3963e79ca7b4..eb744a6aca49 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -34,13 +34,6 @@ DECLARE_EVENT_CLASS(dma_fence,
>   		  __entry->seqno)
>   );
>   
> -DEFINE_EVENT(dma_fence, dma_fence_emit,
> -
> -	TP_PROTO(struct dma_fence *fence),
> -
> -	TP_ARGS(fence)
> -);
> -
>   DEFINE_EVENT(dma_fence, dma_fence_init,
>   
>   	TP_PROTO(struct dma_fence *fence),

