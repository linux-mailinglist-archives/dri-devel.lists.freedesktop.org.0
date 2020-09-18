Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE026FCCA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235F6EC68;
	Fri, 18 Sep 2020 12:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46466EC68
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:45:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c18so5482508wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rq67HAUwjHPZKs/urtQHIUecwbG25ockaZcppSzjcdk=;
 b=TpojCR/NJV7QnBXzE5bQHyYCP1Is7E/ntFLj7ssPKhkvpykRxjDKSKIg3UvaymzoJT
 7mNJ9YKZoAXnxw8/hIFwsiEWd49dgbOQIf91Ro/qCFYkZaPax87arhp+HM7SwlYhsYC8
 yLxbSU0XJbbkCoGD38hgCmp/eLHqlVvdSuYXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rq67HAUwjHPZKs/urtQHIUecwbG25ockaZcppSzjcdk=;
 b=rxwA7W9bwuRen2gv8ZHTPNA9MPm4ioqAaknJIYEQzLeRAxMIt4NaHkURQDFsctdCzC
 bKmciFoTf/jWV/KLc3vUdz2bZncef6UjqMGGd/XtJhTeYJrkP2juPEZno3B2m7q5+5aS
 bWAi0oZgw3Knei4Povall27b1+SKz09gIqHhGL9aXlAUGt9F8eT6vLypOD/TLGcpv0Yp
 ++eVmkeoAzz5/YzYYztzUUQTMe0QS5NmBh1ipAFxNR9H1w4ltgP7YBKIsnz/n2H7OsjU
 oaEVyPmoxQj9mQndZzPmMX4DVD1lU7YSXhL89AiDXkAnP+ENbdmjoMj8t1Y6RitJRRKV
 z0BQ==
X-Gm-Message-State: AOAM531A5UOAZagWN64NBdVn0ayl9elOSVx4nKTdLGRSafrY1p/II54t
 tZ4BPMOpl8B7iBfUtVGy+8fY/Q==
X-Google-Smtp-Source: ABdhPJzKYZzudbcvRodjUlgUsP0VJIGUK9kF4w4HoQsJh5XPt6v+xzUfwtWTxa5cLbJwbgXqoGkK2A==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr36968595wrr.414.1600433103332; 
 Fri, 18 Sep 2020 05:45:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 185sm5639101wma.18.2020.09.18.05.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:45:02 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:45:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
Subject: Re: [PATCH] dma-fence: add get_signaled_timestamp to fence ops
Message-ID: <20200918124500.GA438822@phenom.ffwll.local>
References: <1600379138-12774-1-git-send-email-veeras@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600379138-12774-1-git-send-email-veeras@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: pdhaval@codeaurora.org, abhinavk@codeaurora.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 02:45:38PM -0700, Veera Sundaram Sankaran wrote:
> Add an optional fence ops to allow drivers to be able to set the
> timestamp for a fence. Some drivers have hardware capability to get
> the precise timestamp of certain events based on which the fences
> are triggered. This allows it to set accurate timestamp factoring
> out any software and IRQ latencies. The get_signaled_timestamp ops,
> if defined by the driver would be used during fence signaling to set
> the timestamp, before setting the flag DMA_FENCE_FLAG_TIMESTAMP_BIT.
> If the callback is not defined, ktime_get is used to set the fence
> timestamp.
> 
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

We don't add hooks without implementations, please submit a complete patch
series (and yes that would need to be with upstream drm/msm drivers if
this is for qcom platforms).

Thanks, Daniel

> ---
>  drivers/dma-buf/dma-fence.c |  6 +++++-
>  include/linux/dma-fence.h   | 13 +++++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 43624b4..95c6ab0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -340,7 +341,10 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>  	/* Stash the cb_list before replacing it with the timestamp */
>  	list_replace(&fence->cb_list, &cb_list);
>  
> -	fence->timestamp = ktime_get();
> +	if (fence->ops->get_signaled_timestamp)
> +		fence->timestamp = fence->ops->get_signaled_timestamp(fence);
> +	else
> +		fence->timestamp = ktime_get();
>  	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>  	trace_dma_fence_signaled(fence);
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 09e23ad..ce73aba 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -261,6 +262,18 @@ struct dma_fence_ops {
>  	 */
>  	void (*timeline_value_str)(struct dma_fence *fence,
>  				   char *str, int size);
> +
> +	/**
> +	 * @get_signaled_timestamp:
> +	 *
> +	 * Allows the driver to fill in precise timestamp for a fence.
> +	 * This ops would be used during fence signalling to set the timestamp,
> +	 * before setting the flag DMA_FENCE_FLAG_TIMESTAMP_BIT.
> +	 *
> +	 * This callback is optional. If this callback is not present,
> +	 * ktime_get is used to fill in the timestamp.
> +	 */
> +	ktime_t (*get_signaled_timestamp)(struct dma_fence *fence);
>  };
>  
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
