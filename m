Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B9493EE7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 18:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469B10E748;
	Wed, 19 Jan 2022 17:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D834010E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 17:18:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso15738596wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rQ+yyRcLTMO72ZwgIvbqK79p/62FdZWlD9ln/D9mqrQ=;
 b=O8gRtMbL0cQw6BEysGCr14KMg9Fo4AlYnDea8ecj2bJB8uhHsX56dubo/71ZtMcKZm
 uykyzjo6ZkvjCXHzkb78rjXN40K8GhnxI4mD+/Yimu5LOLJWWValLuVsqFPpAgmxSNJd
 lQOdJFcRYHIPHS3zTAjTUHvT9Oxh4hpgQ7Hn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rQ+yyRcLTMO72ZwgIvbqK79p/62FdZWlD9ln/D9mqrQ=;
 b=NrUqTZXS/5Knl85tc39mgbst4P7dNSnXWxdpUkRXs46WrKxdWZ9EcCOQiOoLpoa7+6
 KzMCCG9UfX1PmP8jSunU7jV1y5UBx0biDpg+TPUEPM9gVM8uYLyCGMCGw4NY3BiDnWGt
 5zXCTh6f5b+xXQxxCMWy1WRPOiczsjTo/T2Ec83a3P9IFnMg2a2cKucghc2hOi983kBM
 bj5bIlQLA1AvPl6/kxI+qX8otuLp/bzyzai1TT7ooxyA8xrGE9bc/rEWxCO/vexqYAD2
 UBfrYMblcXv4zfVWP8qPw6U1Wr3ycjfm7jrqS+5Ze6Z+W2rSZ1ILgQ5Drrqq/LA3ZL4M
 PiUA==
X-Gm-Message-State: AOAM530aYBEBu/asnpx/4qI8x45PnXrOi7Y8ZdDXaYqFOkePunzGoKF+
 WWteIjFJ2+dMXwa6l66BpsUbrA==
X-Google-Smtp-Source: ABdhPJx4k/wum3uSEYpvkt7c9tWl67rTeqCQ4BapICaxaEK2FFu+ShCicViWb6AetcJAyz/n/0CZDQ==
X-Received: by 2002:a05:600c:3c9c:: with SMTP id
 bg28mr4470721wmb.190.1642612688352; 
 Wed, 19 Jan 2022 09:18:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n15sm570212wrf.79.2022.01.19.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:18:07 -0800 (PST)
Date: Wed, 19 Jan 2022 18:18:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] dma-buf: warn about dma_fence_array container rules
Message-ID: <YehHzs8FDn4PfD+l@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-2-christian.koenig@amd.com>
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 02:43:37PM +0100, Christian König wrote:
> It's not allowed to nest another dma_fence container into a dma_fence_array
> or otherwise we can run into recursion.
> 
> Warn about that when we create a dma_fence_array.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 3e07f961e2f3..4bfbcb885bbc 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>  
>  	array->base.error = PENDING_ERROR;
>  
> +	/* dma_fence_array objects should never contain any other fence
> +	 * containers or otherwise we run into recursion and potential kernel
> +	 * stack overflow on operations on the dma_fence_array.
> +	 *
> +	 * The correct way of handling this is to flatten out the array by the
> +	 * caller instead.
> +	 *
> +	 * Enforce this here by checking that we don't create a dma_fence_array
> +	 * with any container inside.
> +	 */
> +	while (seqno--)
> +		WARN_ON(dma_fence_is_container(fences[seqno]));

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	return array;
>  }
>  EXPORT_SYMBOL(dma_fence_array_create);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
