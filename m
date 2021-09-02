Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B13FEF8A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DA46E578;
	Thu,  2 Sep 2021 14:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A0B6E578
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:37:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b6so3306527wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CT4LAspdSBwDkfapAAwxnh3D14vFcnZ3QM8rnn3hC1E=;
 b=hccyw/Ba5hg0YsYFQ1hC6F4QOU6QYLFs/YLEPT/bx5DPd9gLmKg7nBFjrR74RwDtdb
 xCoyWUJGIRQ5y5KsnR6a19WJV6B1JqA3VXG55x3t1SiI6rqGUB1DZOgJy9XCYj9E4vx3
 htOiY2t7CjVWRQ2JzzOz2Y8bSfc8qkd5XU2SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CT4LAspdSBwDkfapAAwxnh3D14vFcnZ3QM8rnn3hC1E=;
 b=Ap0TIf4VAeQdaP8mwr1i5Bqo+3RD9ctThYBqYkMcE6Rx5n+5GzOQXSpVHtha3Iz1ET
 a110dp2vNlfS1kiA+723Vo4PiDBX9ngWrXsVF/bnuHvHZrko86i0+yTAn3ZNJv7kVqzT
 c7Hqq4X9G85CLr3SDkeUUl1niBrW8bXs5YvrtpkbzV1So2vUdSQ7hA+qyaoV9dLwVVBc
 mko9qLLWFoZN0xrhIn32Gyuv1bzgO1kZmDFVvALkqZCUjbbHZOWlBAjCCgX34y3BbE4P
 JzESNWlq1EnUmfkQDlKj99Gdk54DQdzWIC57+Gs/cPcGjXQ1C9HPuJZdnL+hau3Y6qch
 NDtg==
X-Gm-Message-State: AOAM530A169i1J6lFJ3YWdOYMRQ5Vp6ePHwuc/hSRny+4c5x8rG4JGeK
 ADc/t22zAmYsyHs42ALpoJ5mwQ==
X-Google-Smtp-Source: ABdhPJw3CeDkQUgOa1ZqnOlCigj/LcT6+bjut2s4XIt/vXZTFskefL6mrH1JT9ZeSEabF6naeFODww==
X-Received: by 2002:adf:c508:: with SMTP id q8mr4287862wrf.260.1630593434296; 
 Thu, 02 Sep 2021 07:37:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm2035337wrw.59.2021.09.02.07.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:37:13 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:37:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] dma-buf: clarify dma_fence_ops->wait documentation
Message-ID: <YTDhmM6jWp/k8UEa@phenom.ffwll.local>
References: <20210901120240.7339-1-christian.koenig@amd.com>
 <20210901120240.7339-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210901120240.7339-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Wed, Sep 01, 2021 at 02:02:39PM +0200, Christian König wrote:
> This callback is pretty much deprecated and should not be used by new implementations.
> 
> Clarify that in the documentation as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  include/linux/dma-fence.h | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..a44e42b86c2a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -214,19 +214,15 @@ struct dma_fence_ops {
>  	 * Custom wait implementation, defaults to dma_fence_default_wait() if
>  	 * not set.
>  	 *
> -	 * The dma_fence_default_wait implementation should work for any fence, as long
> -	 * as @enable_signaling works correctly. This hook allows drivers to
> -	 * have an optimized version for the case where a process context is
> -	 * already available, e.g. if @enable_signaling for the general case
> -	 * needs to set up a worker thread.
> +	 * Deprecated and should not be used by new implementations. Only used
> +	 * by existing implementations which need special handling for their
> +	 * hardware reset procedure.
>  	 *
>  	 * Must return -ERESTARTSYS if the wait is intr = true and the wait was
>  	 * interrupted, and remaining jiffies if fence has signaled, or 0 if wait
>  	 * timed out. Can also return other error values on custom implementations,
>  	 * which should be treated as if the fence is signaled. For example a hardware
>  	 * lockup could be reported like that.
> -	 *
> -	 * This callback is optional.
>  	 */
>  	signed long (*wait)(struct dma_fence *fence,
>  			    bool intr, signed long timeout);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
