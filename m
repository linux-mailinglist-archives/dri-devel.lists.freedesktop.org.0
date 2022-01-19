Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8C493EED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 18:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9D010E172;
	Wed, 19 Jan 2022 17:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1D10E172
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 17:20:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so7037133wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=x1K+9XuZnU2QXSiIOenVV/0BbioWKHd2vi7gWIUztz4=;
 b=ZjDcbktQX1wrIfebPiKigKTZKneWJd4ErYnf1dt5pNy9Jtv+LToiiIVncgX0W4YBXJ
 WHNrl6WoAOT5RHKyYTIRNkCY95mR+MSqAkbhxhgNxsoQ64IkTvrE4NpPR9/UJm4T40QM
 Ib41oXpbBcJ34yd7Fu2m115MV2byinCv02T54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x1K+9XuZnU2QXSiIOenVV/0BbioWKHd2vi7gWIUztz4=;
 b=SSPwFH5odLRG6lbF4ephjNxIdqosu/VrlpO8orr0pjGJNC1o1T2x3htqFrPxVD/oTA
 GOnjknjJLNWYo/fJ3h9AJ1PRgeacWJkW9VkmJDO9uB5mavAK5F+5Lyw+dYHOUU1oeD1B
 b4vS52TbyQwJsXNRq/CyT4fuiFRWlrvpWMs+xnrYaVK+yFg6MHLCy2Z8fn27zseSUbfB
 BuvY6H2IB8eLw8Xh9Rxx0wFGm7FD/R84nWb4aQFYmTe6cbCepCURxJfaAJjNqC2pzdSp
 lqWUBaR+V4UNqTG22DiH5WDDGCneKwBO0nneZk8QDe1k4Fz5PVsEbEoxN/qRog18iVeI
 d8ag==
X-Gm-Message-State: AOAM531TOfDzsQGa7/1rBRyzrnHpGxf1D6iXFXofBH7hGiHnOIncXTJH
 6ryEDWA+pbb4HEwk+kRUa5Y6KA==
X-Google-Smtp-Source: ABdhPJwpJ/+gWlQUuTp3j3mXrLlbARjuqjVzw39wNQS0Ltl/R0eyrvLAkK+eazHap9QqPxuGOwVN3Q==
X-Received: by 2002:a05:600c:2216:: with SMTP id
 z22mr4628205wml.119.1642612801812; 
 Wed, 19 Jan 2022 09:20:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x13sm427589wru.28.2022.01.19.09.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:20:01 -0800 (PST)
Date: Wed, 19 Jan 2022 18:19:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] dma-buf: warn about containers in dma_resv object
Message-ID: <YehIP4zMfcO79Zrl@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-4-christian.koenig@amd.com>
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

On Wed, Jan 19, 2022 at 02:43:39PM +0100, Christian König wrote:
> Drivers should not add containers as shared fences to the dma_resv
> object, instead each fence should be added individually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 6dd9a40b55d4..e8a0c1d51da2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  
>  	dma_resv_assert_held(obj);
>  
> +	/* Drivers should not add containers here, instead add each fence
> +	 * individually.
> +	 */
> +	WARN_ON(dma_fence_is_container(fence));

I'm honestly not sure whether this could go boom, so good if we push this
asap and let it soak in linux-next for the entire release cycle.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On the change itself, we'll see what it brings.
-Daniel

> +
>  	fobj = dma_resv_shared_list(obj);
>  	count = fobj->shared_count;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
