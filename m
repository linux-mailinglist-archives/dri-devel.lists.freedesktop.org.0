Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B240FAE3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79D96ED8F;
	Fri, 17 Sep 2021 14:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A276ED8F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:56:14 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g21so31141262edw.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X29mbY4XMQeoCuwbVUTtCWIrpaTXec+xmjDFVMtuCBM=;
 b=A1mcavcYt2QQTNBkoc/FLtlWT1v9wbPlqaIljyDs2v8H+aMqb3YWAo/dBjkr7bnB9Q
 fdKFk/C3fl1c+dc4jgBuYmy83h8ZIAXghsGelEppBnIbXsB+MPbQHYy2wL6veYXqLwB0
 IXY7RuywYKGiRoaVNoO2pnLtiRV+KPnamRdbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X29mbY4XMQeoCuwbVUTtCWIrpaTXec+xmjDFVMtuCBM=;
 b=LA6n9uhIKXQNVAv58zvLhPNE98aty4/oDferESfcpNZ4WJGx/aq9gIQhDAlmIm6wo8
 NTIcFmS0O4M7SGMnMzRlgc6pjgaX14PVhWCKd+Q35NiyPOrxJlsNqeN5lKcPEYxz9jiB
 Mqg6xoAnZ3iJ4WGWbAP4N5aOHHWhnEIsQHaNJBgGJVr3iXzlooPDqhjGVMMnl9JUbJB/
 Y+u6ZHOP1qW+4fF9kzG95O6EhAZ/3ZnEQPhkR6VQnT4+gZNdR0Oc6hcSJQ29I07eYNCs
 /jjRExfKdUyoD+/2qgG3HU05DibR53Ft1yc8wd7wNeLVdjn1JXTHOmf5ZGINW4WeRF8G
 Suzw==
X-Gm-Message-State: AOAM532aL8TvMuxcI8btK99MyKhfmFFHhRVX37AMF5ffuIYHykLOl6bp
 KXd88PWsrcKAJCgNYZryeq/d4A==
X-Google-Smtp-Source: ABdhPJzipdEA6H6mMcSGep1fE9poMh/Q4IA14eEu/6Rd+xLXMksMP/16auhU0CWMS0H+xVD6zggZfg==
X-Received: by 2002:a17:906:fb13:: with SMTP id
 lz19mr12364559ejb.516.1631890573401; 
 Fri, 17 Sep 2021 07:56:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o23sm2752212eds.75.2021.09.17.07.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:56:12 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:56:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Message-ID: <YUSsixkj+ivSug/5@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-27-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-27-christian.koenig@amd.com>
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

On Fri, Sep 17, 2021 at 02:35:13PM +0200, Christian König wrote:
> Heureka, that's finally not used any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/linux/dma-resv.h | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8c968f8c9d33..f42ca254acb5 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -423,32 +423,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
>  	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
>  }
>  
> -/**
> - * dma_resv_get_excl_unlocked - get the reservation object's
> - * exclusive fence, without lock held.
> - * @obj: the reservation object
> - *
> - * If there is an exclusive fence, this atomically increments it's
> - * reference count and returns it.
> - *
> - * RETURNS
> - * The exclusive fence or NULL if none
> - */
> -static inline struct dma_fence *
> -dma_resv_get_excl_unlocked(struct dma_resv *obj)
> -{
> -	struct dma_fence *fence;
> -
> -	if (!rcu_access_pointer(obj->fence_excl))
> -		return NULL;
> -
> -	rcu_read_lock();
> -	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
> -	rcu_read_unlock();
> -
> -	return fence;
> -}
> -
>  /**
>   * dma_resv_shared_list - get the reservation object's shared fence list
>   * @obj: the reservation object
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
