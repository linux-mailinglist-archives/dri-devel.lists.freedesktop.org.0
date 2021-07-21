Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D13D0E11
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7096EBFD;
	Wed, 21 Jul 2021 11:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214C36EBFD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 11:47:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n1so1840360wri.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2DhNzX8SHDQYkdoHCXzFmXHJ0VGGgo8O+g7jT63btcI=;
 b=CMU97kNDTLD1n7EjFse7TTD/xCp+yw1yzqStCL1b2pIQKPqbyNoAomQ4Fb/Z1HHcxg
 3fN47Uq0e8d0huflxNZsRfdxLPW2lOxy7QEgoyjVm+DRZ0uOJrZrzWuZP1LNxsqxfANf
 UyUQHxdlxoMZRoJEym4r5skvpnYy/N2IaaDFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2DhNzX8SHDQYkdoHCXzFmXHJ0VGGgo8O+g7jT63btcI=;
 b=n1yK9ft6ut1G6I1omqW91KSxBfYu9elp4cgzsTAwAzog2yhO0+HERfCa7pnDIHmycr
 vc5h48fdeMChWac1vmm6LCnlwFLX/GQzKRKCgXw18os+Q/ZyCzD+pfeym5E02aq0C9WO
 6/JyU3DTohO6IALN4diyOKup7z5iV8aLuZzgm+seeCkGEVGDMvambIgPp2ZHwvqB0Kir
 rfxut5YZ8sbR6/DkYQ9OmU870b8zqE1t+Dwm42+ZAZ7BwmQQTwlyQXp4Tp957f56yba2
 sTbVVgqvcqh9aFAWKa0mdeIP1BoP/gd8JIxTEbHMay4Xjuuib77cJhalmvVwmI1krZc8
 3u4A==
X-Gm-Message-State: AOAM530lZeXMda9SqYpPFLdKZ4s4WWIt0vHx7qq/mf6WiKZhhIZBxTKy
 l1/h0n5sCED2xlZ7Sog2ZDDU2A==
X-Google-Smtp-Source: ABdhPJwaTaBSsgi4GgmNHg48EINvFVy1+zfMC3VRCRsSulWOUgpm3eNi2JgIEY4VCXEzJ6aCii/HCg==
X-Received: by 2002:adf:e409:: with SMTP id g9mr44045639wrm.66.1626868038997; 
 Wed, 21 Jul 2021 04:47:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o7sm19267295wrs.52.2021.07.21.04.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:47:18 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:47:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: clarify dma_fence_ops->wait documentation
Message-ID: <YPgJRAEeRKsD4NHw@phenom.ffwll.local>
References: <20210721092133.2817-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721092133.2817-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 11:21:32AM +0200, Christian König wrote:
> This callback is pretty much deprecated and should not be used by new implementations.
> 
> Clarify that in the documentation as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
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

I thought the other reason was unreliable interrupts, so waiters had to
wake up once per jiffy? So maybe: "... for their hw reset procedure or for
handling missed interrupts".

Maybe also add here:

New implementations must have an @enable_signalling and dma_fence_signal()
implementation which does not require special handling to make
dma_fence_wait() work.

With these:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
