Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF54265BFE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5056E38A;
	Fri, 11 Sep 2020 08:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102B66E38A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:54:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s12so10642833wrw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=l74wd6NMB+UUQWVCt5aPCq/IVe0WNLlAuB214FZvfPA=;
 b=djiuqUUHblnIjuVEPh1h1h+trIWDBS9HBnr4ZJaFNmHq+G1S6nAY47wGtWEHwHA6w/
 741TeKcHqv+TY0/qITjAROtrPQgps9vL1t5QbVClQfvHR7ubiziA2BvzpRQaTLMAFNwz
 TtLnF52tSljeTVYASrgsOoZ+bRSLFfTv03WKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=l74wd6NMB+UUQWVCt5aPCq/IVe0WNLlAuB214FZvfPA=;
 b=PlzoVMOudnAoTCj5vGlbIfmkrI2ugZJBVSR5NzHMBflxCZPbNa1atFrplv6zuzl8y4
 CejWSha9Y22BYLPcsip0LYoZnpTDa61mmRcEeHv7OsCbJgpX8VQBLMCNCPmO9KvR39yX
 7JjfQjJdszxyUuzVAUGCTwqJkDIbFA0kLTLnlxfMmT7B29qTLrAOsK3GP0AbgRfVjpiY
 CQH6JJL4Tr0qKouzO6koj5Ocy7psv2sQBh4T9YgHPJV8fGeZBgBIWJd7D3EMN/LeqTcJ
 TGtYnI8xxrWTVLt7XRhlbWTBl9R8Ckh2LhaA6Lsjzl3cMFjchVOMRvW4YhXz6rL0aN1h
 424g==
X-Gm-Message-State: AOAM531GVWqx3recu7MBWdTwLvdloEh/Ng2+ul/wA4AHDCpkn0DVTIKk
 J2XZ5cmq2vcWr/VbKmydbwUBsw==
X-Google-Smtp-Source: ABdhPJwCo+rJODET6mRLi+uobSSYyKWOVpB0S1spxGhqb3+t6ZBlutn7gP1xklANUJCZ+GSc6GfVCw==
X-Received: by 2002:a5d:40c7:: with SMTP id b7mr992023wrq.300.1599814474727;
 Fri, 11 Sep 2020 01:54:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 2sm3178204wrs.64.2020.09.11.01.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:54:34 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:54:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/i810: make i810_flush_queue() return void
Message-ID: <20200911085432.GQ438822@phenom.ffwll.local>
Mail-Followup-To: Jason Yan <yanaijie@huawei.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
References: <20200910140610.1191578-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910140610.1191578-1-yanaijie@huawei.com>
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
Cc: airlied@linux.ie, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 10:06:10PM +0800, Jason Yan wrote:
> This function always return '0' and no callers use the return value. So
> make it a void function.
> 
> This eliminates the following coccicheck warning:
> 
> drivers/gpu/drm/i810/i810_dma.c:860:8-11: Unneeded variable: "ret".
> Return "0" on line 885
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Queued up for 5.10 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/i810/i810_dma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
> index 303c2d483c6e..88250860f8e4 100644
> --- a/drivers/gpu/drm/i810/i810_dma.c
> +++ b/drivers/gpu/drm/i810/i810_dma.c
> @@ -853,11 +853,11 @@ static void i810_dma_quiescent(struct drm_device *dev)
>  	i810_wait_ring(dev, dev_priv->ring.Size - 8);
>  }
>  
> -static int i810_flush_queue(struct drm_device *dev)
> +static void i810_flush_queue(struct drm_device *dev)
>  {
>  	drm_i810_private_t *dev_priv = dev->dev_private;
>  	struct drm_device_dma *dma = dev->dma;
> -	int i, ret = 0;
> +	int i;
>  	RING_LOCALS;
>  
>  	i810_kernel_lost_context(dev);
> @@ -882,7 +882,7 @@ static int i810_flush_queue(struct drm_device *dev)
>  			DRM_DEBUG("still on client\n");
>  	}
>  
> -	return ret;
> +	return;
>  }
>  
>  /* Must be called with the lock held */
> -- 
> 2.25.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
