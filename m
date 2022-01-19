Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB3493EEB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 18:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC710E754;
	Wed, 19 Jan 2022 17:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6914110E758
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 17:19:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so7029760wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=weDoiXWIlqsW0bwSabnqiWkOc5jo1BbeEdm7AfzIltI=;
 b=ZwijlQyT9ACfMKxTUvh3s7J6qo0qJbtEnyFJc45VVsm9b1nveMbpVe5TTxIPfYgZPr
 uf/XXWvVtIq6o5V/0mTPAvs45HG6iGmeSsfDJYAv5FQv5a+Idjeyuw44wSq0V1q5i9iG
 +fWqi9Uym2lrOa5qsnATZ2eZab7Q0m9P0KYMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=weDoiXWIlqsW0bwSabnqiWkOc5jo1BbeEdm7AfzIltI=;
 b=tQkMdQeo/k24N9elrIMG2+a3m7kbf1FujUAwIGC/OwV52ZCdT67CL40Iavy2qA7SQd
 BttyL8jQ4i5xYU9wls8MxXWPDf5aXPZzupUEVH21BvOwxsGc0TxVpfouGoTTdLYwM0om
 xhm8dqkDXjflqVEGRfcTsob20sy0OffFP8Dw43egMDIr0qzNBruKWDKapkBzGRF8GsZs
 DqAEN+6b+TLD1VNJ8YqBYepm1cKtmOBEaliiTw85wgCk1oO5kksauR9IqjbKt3eVktga
 I3Dl55L8kKe46x1+/LxeJ/PKGeqKz2l6omMIcatBR2Lc1dCBbs7t9FDNYN7ws2MUI2Kz
 J0OA==
X-Gm-Message-State: AOAM531PLuS2wcirsU4K8+3g08s0UnZYcZ11Wj9JKYT1lh1qjPQs7SZm
 4lkW+1no9TA+4v4iJTZFJq1a9w==
X-Google-Smtp-Source: ABdhPJyAGgep8QOseVVDvL9cILUQyoL5tC8CLK3q904SVKTC2KYBUvucJ90kjGYENpFq5sfzsLyebA==
X-Received: by 2002:a05:600c:2994:: with SMTP id
 r20mr1407383wmd.158.1642612739974; 
 Wed, 19 Jan 2022 09:18:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c13sm410043wrv.24.2022.01.19.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:18:59 -0800 (PST)
Date: Wed, 19 Jan 2022 18:18:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/4] dma-buf: Warn about dma_fence_chain container rules
Message-ID: <YehIAaPI53wNes+1@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-3-christian.koenig@amd.com>
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

On Wed, Jan 19, 2022 at 02:43:38PM +0100, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
> 
> Warn about that when we create a dma_fence_chain.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..fa33f6b7f77b 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  
>  	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>  		       &chain->lock, context, seqno);
> +
> +	/* Chaining dma_fence_chain container together is only allowed through
> +	 * the prev fence and not through the contained fence.
> +	 *
> +	 * The correct way of handling this is to flatten out the fence
> +	 * structure into a dma_fence_array by the caller instead.
> +	 */
> +	WARN_ON(dma_fence_is_chain(fence));

At first I was worried that you'd leave a chain fence in the array fence
as an option, but we exclude that with the previous patch.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  EXPORT_SYMBOL(dma_fence_chain_init);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
