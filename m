Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFF3BA5EE
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 00:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FF6E209;
	Fri,  2 Jul 2021 22:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859D6E209
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 22:16:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j39-20020a05600c1c27b029020028e48b8fso1625605wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nWA+t/6vsRwy8BncoPKwbgbu4AU5038aIzazbpBSKkA=;
 b=VOsPfgKM+gDfZeGN6XE6Fg8S/miHlH49u35uI8mYZyKNCWXoM7J3OWBTw7gP/yQhej
 4v89GrwiKL8poOOD39TefY6yHK8w526oKXWqZq+r6VrSxob1YJkf8NbvHuHWLLJXBvyz
 pLFX9zfTYUausJfeukBlWF3AG9+8Nyq4WJjgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nWA+t/6vsRwy8BncoPKwbgbu4AU5038aIzazbpBSKkA=;
 b=ILEv+NHdhN5dalBwTXKvtfhA9WCPQXWuGoHQcSQcIjz+Q6NxwN2XDpUZTW9kZkDSQ9
 RFQLGt0QM78N4NRaNMziMGDMQS0VZ0QQC2cHp2yOmbI+Zu6u+ioxeD2wg3ywO22BkNMo
 56O4cjO5jo6P3znjlsz7O51tcMfUHe49enOMFqmLYD0XEJS3IJwZTl5qjc+ae/AY7M5i
 pMZEfnBrJMPJNJyxpElVy8mnyiZBk8xm3FPzL3wNgkCAUodmrpvV56xZzF2aOnGNcslW
 rE6Z1+EQ4xoaDaHGvItwzfgwB6NQWC1GLRoi0FdeZLlUy6FfhIyPnZWZm9mzRKOWLnxk
 yy6w==
X-Gm-Message-State: AOAM532MxNqDAG4JXeyrcz+oOpoXx1nrBOdMR2dHbcbV/GlBPHl/i2C6
 FkwoaeqoBPBabpB2hol4GWNuog==
X-Google-Smtp-Source: ABdhPJyb57pEez8qLJ9SRuCmnAOiwJviFwqRZcGnkHoJ8oUaMi06LFvxNjNwkA7RgkCaqYTMJk4u2g==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr1952681wmb.156.1625264215016; 
 Fri, 02 Jul 2021 15:16:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p187sm4417702wmp.28.2021.07.02.15.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 15:16:54 -0700 (PDT)
Date: Sat, 3 Jul 2021 00:16:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: add some more kerneldoc to
 dma_resv_add_shared_fence
Message-ID: <YN+QVF6E/4OcbltF@phenom.ffwll.local>
References: <20210702111642.17259-1-christian.koenig@amd.com>
 <20210702111642.17259-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702111642.17259-2-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:16:39PM +0200, Christian König wrote:
> Explicitly document that code can't assume that shared fences
> signal after the exclusive fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43..4ab02b6c387a 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
>   * @fence: the shared fence to add
>   *
>   * Add a fence to a shared slot, obj->lock must be held, and
> - * dma_resv_reserve_shared() has been called.
> + * dma_resv_reserve_shared() has been called. The shared fences can signal in
> + * any order and there is especially no guarantee that shared fences signal
> + * after the exclusive one. Code relying on any signaling order is broken and
> + * needs to be fixed.

This feels like the last place I'd go look for how I should handle
dependencies. It's the function for adding shared fences after all, has
absolutely nothing to do with whether we should wait for them.

I'll type up something else.
-Daniel

>   */
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
