Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FD462F32
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296316ED10;
	Tue, 30 Nov 2021 09:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4E26ED10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:03:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso18938022wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=muzD7wBGzdqNzoTkinsMAk1ZnhCVTb2hy14oh4sGZXs=;
 b=KsOZO+2oOR1bZyCfTbjNitszllo/P6mAAuU1fyIFGEN2IQIt6gBYkeLkFMToefKSSd
 KXAK47tNWFmKXqIr2zqnN4TzMXjb0hu0Z/C/9+rsuKL5EFdbgQ8N2Ulaei987P0d1zk6
 3YeAo3mF6uzga03vx3r+yO0+W175UzZ54INx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=muzD7wBGzdqNzoTkinsMAk1ZnhCVTb2hy14oh4sGZXs=;
 b=KX19U79RVj0ncrfv2uV4tE03OcCFgaAyBCQOjD/Q4Evy7x5/hPj6v04XviM7V7fu/R
 +Uo4lWH1CY4muuLXOWVHhxaOTav4LtNF+/WBJtIb30exy0L303CK12tM7ePe/+37eiiN
 BbZhRJHYH6yuiiKlWMlFyQW0s7H3Yjq3ivxihXD3MRWfkbyr8iArNPYrwitbIzEyCRhs
 YRiJmeSm35xjUhb3IGVjmeLNp8lBDxBK5ktPN9DS8z7WUKM9SzXH2o0ZAYxh5XXcHEmJ
 kyhGnDAyK/p1GLmNkTZyJ81qlU45C1GJgmfs/UCC0e1dVmOJER6ERg/o+xNm5CAF3g8w
 rDhw==
X-Gm-Message-State: AOAM531h2rgP/j/3ifQcEtI49drpJhmUpQ9fUvsX2jl/fkn+ejqk43l5
 OLz5801mSSlHnKB4hJHOsEJmQUaMqKIqPg==
X-Google-Smtp-Source: ABdhPJylCtn/FlaJSqiqPVHrC1ZZ68HhySRCjXJmhWHPzzI6fuCM07R78HjQ+BCid992BuANhdaSWg==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr3442077wme.23.1638263021169;
 Tue, 30 Nov 2021 01:03:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p13sm1802064wmi.0.2021.11.30.01.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:03:40 -0800 (PST)
Date: Tue, 30 Nov 2021 10:03:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/28] dma-buf: make fence mandatory for
 dma_resv_add_excl_fence v2
Message-ID: <YaXo6uvtJJPIU6YP@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-4-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 01:06:34PM +0100, Christian König wrote:
> Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
> that that this frees up the fences is simply abuse of the internals of
> the dma_resv object.
> 
> v2: drop the fence pruning completely.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Cursory look says you got them all, and it's definitely the right thing to
do.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-resv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index ff3c0558b3b8..4deea75c0b9c 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -305,8 +305,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  	if (old)
>  		i = old->shared_count;
>  
> -	if (fence)
> -		dma_fence_get(fence);
> +	dma_fence_get(fence);
>  
>  	write_seqcount_begin(&obj->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
