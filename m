Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52E36B696
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DA86E851;
	Mon, 26 Apr 2021 16:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44B6E851
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:16:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l2so4156905wrm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6YeXSR08Kz6QNybZkKw6GZ+ruRsXau9J7ptkqp4Tb+w=;
 b=fNJYzcQkbTIjt2Q74OnHXm9C06S68bkF/fjApyVfL2GFH3nygGxiTxnYLK7kX9sZ9k
 aSNWD/CUUVGB08ZV4PpFJPnATQAzOal/leF4x1hYtBiJ1Y2my+ln+LaH7co6IFHEe7IZ
 J8SMKyUPsbQqgTibM8kd6mYrj9jr1ca+zNkkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6YeXSR08Kz6QNybZkKw6GZ+ruRsXau9J7ptkqp4Tb+w=;
 b=O4dTY6g+hrPP+fzhk5LzBvu3DrA/XO43M/r/NdbgmYNfSU+tGnIHPJKV38AVuDrt7p
 6tAKOSU4JgBd3wyxCVBHHA7OZCWgUphjN/A6pr1Lp2iEpL3h9GZNPV5KMHL1A6KCuXIq
 SWK0DqRIkmAtabO/HboowllP11nPqQniAe1WrEhCXf9LEahpNC94vPSABk5Ha71x1lwa
 7+kbqE8OA5VIkxTmCKvrR1UNBBm0+XwvKwbGOxw94pe1kACnnBW24bjXg3SYgIt4xTKK
 e9IgK6Nnwx57dZGpLvnfMpz8RJGgm2DGmUsE+semlCdF8IBgUQ1jRO2x0KoxvJxY5BUF
 uHWw==
X-Gm-Message-State: AOAM532VOgi70Fx9jB6aIHYQGh+jMURthpOosOg6l7b9lt029SgKOrvN
 ignelOceYuX70329d7ZmHSNsSp2CRvctRg==
X-Google-Smtp-Source: ABdhPJyuWR5JP8X+3so8FKIJgSTHr/26YfNI9vicRr2nnc5KX7bR63Aes3g8cvyEaDPKSy/dW0C/Tg==
X-Received: by 2002:a5d:4584:: with SMTP id p4mr23631772wrq.383.1619453784818; 
 Mon, 26 Apr 2021 09:16:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r19sm19178286wmq.33.2021.04.26.09.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:16:24 -0700 (PDT)
Date: Mon, 26 Apr 2021 18:16:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] drm/drm_file.c: Define drm_send_event_helper() as 'static'
Message-ID: <YIbnVgM8Cb2AA+kh@phenom.ffwll.local>
References: <20210422175146.29840-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422175146.29840-1-fmdefrancesco@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 outreachy-kernel@googlegroups.com, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 07:51:46PM +0200, Fabio M. De Francesco wrote:
> drm_send_event_helper() has not prototype, it has internal linkage and
> therefore it should be defined with storage class 'static'.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 7efbccffc2ea..17f38d873972 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -786,7 +786,7 @@ EXPORT_SYMBOL(drm_event_cancel_free);
>   * The timestamp variant of dma_fence_signal is used when the caller
>   * sends a valid timestamp.
>   */

Right above is the kerneldoc comment for documented the driver api that
teh subsystem exposes. Generally we remove those when there's nothing
interesting in there when making a function static, which is the case
here. Can you pls do that too in v2?

Thanks, Daniel

> -void drm_send_event_helper(struct drm_device *dev,
> +static void drm_send_event_helper(struct drm_device *dev,
>  			   struct drm_pending_event *e, ktime_t timestamp)
>  {
>  	assert_spin_locked(&dev->event_lock);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
