Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EEE3D0E21
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B667F6E90D;
	Wed, 21 Jul 2021 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1415F6E90D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 11:52:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t5so1856733wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jeAQ1G++rPnF+hp7ksDH4lyQwwycI5U2loZxtSOENKc=;
 b=gweIyTUDDIJQ+eRdC9susBC5MgKBStq8p32/FzZkbHGflYbAN7fN94wua6i+nboMYT
 odAlqkyO9C6k3ev5FgHAVE8OsDEb6TjJws3OC4QJU5SsSmcx3tWeD6D79tWA+NXxwkRO
 6zfI4gCK7IUJ6puv8GSrjQDBmJMVrPzUM3pSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jeAQ1G++rPnF+hp7ksDH4lyQwwycI5U2loZxtSOENKc=;
 b=ai5q5gMKo0Mxk2chmbl4BwgG249Hjqykm20RJIpdKxtc2MPFnMOKNALv+r/s6O8SHb
 rGEwm4QyIaNerknh5uK8xZaTYBK3IKjb0fnyGhRk7O2aibFkclXaIDxYJcSVF6dREEAo
 S9dqtD28+w8Lat9BwyNet2FtggKSoMkukpd+qjUMRmOjYMqCJbs6A29d5M7rTE0tkqVY
 yTE3BGjAUYNIzdix9hsCcqVWOs8LBOUnGCr8OCervD3STpgRjjon1Ct7ztoVefiWRp7e
 I8r7b/iO3CFMIRfydE17tm3EpGWgeO2pEBcnHXqbgRoSU7f+A8NIpXPLDyK6tI/zcGI5
 D29w==
X-Gm-Message-State: AOAM530/KlPVGrBl10o7r/dTwMQfC64134g1/owSHvEdiwjyu3ukasow
 ZSaz5xw6LY5Qh/1XvcE+CMheAA==
X-Google-Smtp-Source: ABdhPJydbPVmzq7HOjw4k/D7MP0M5CNmweFiGy4v8cEPRYYaP5jWPqiPOLh/cext6sTPcgMJLdM8Fw==
X-Received: by 2002:a5d:5550:: with SMTP id g16mr10055411wrw.342.1626868334820; 
 Wed, 21 Jul 2021 04:52:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm4920177wmj.34.2021.07.21.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:52:14 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:52:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
Message-ID: <YPgKbBXpoEZFHcHE@phenom.ffwll.local>
References: <20210721092133.2817-1-christian.koenig@amd.com>
 <20210721092133.2817-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721092133.2817-2-christian.koenig@amd.com>
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

On Wed, Jul 21, 2021 at 11:21:33AM +0200, Christian König wrote:
> That the caller doesn't need to keep a reference is rather
> risky and not defensive at all.
> 
> Especially dma_buf_poll got that horrible wrong, so better
> remove that sentence and also clarify that the callback
> might be called in atomic or interrupt context.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I'm very vary of aspirational interface docs for cross-anything, it just
means everyone does whatever they feel like. I think I get what you aim
for here, but this needs more careful wording.


> ---
>  drivers/dma-buf/dma-fence.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..1e82ecd443fa 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>   * @cb: the callback to register
>   * @func: the function to call
>   *
> + * Add a software callback to the fence. The caller should keep a reference to
> + * the fence.

Instead of your "The caller should" what about:

It is not required to hold rerence to @fence. But since the fence can
disappear as soon as @cb has returned callers generally must hold their
own reference to prevent issues.


With that or something similar that explains when we must do what and not
vague "should" wording.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + *
>   * @cb will be initialized by dma_fence_add_callback(), no initialization
>   * by the caller is required. Any number of callbacks can be registered
>   * to a fence, but a callback can only be registered to one fence at a time.
>   *
> - * Note that the callback can be called from an atomic context.  If
> - * fence is already signaled, this function will return -ENOENT (and
> + * If fence is already signaled, this function will return -ENOENT (and
>   * *not* call the callback).
>   *
> - * Add a software callback to the fence. Same restrictions apply to
> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
> - * when software access is enabled, the creator of the fence is required to keep
> - * the fence alive until after it signals with dma_fence_signal(). The callback
> - * itself can be called from irq context.
> + * Note that the callback can be called from an atomic context or irq context.
>   *
>   * Returns 0 in case of success, -ENOENT if the fence is already signaled
>   * and -EINVAL in case of error.
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
