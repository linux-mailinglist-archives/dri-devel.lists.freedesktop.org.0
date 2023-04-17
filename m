Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422876E3FDE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640C10E325;
	Mon, 17 Apr 2023 06:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E72E10E325
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:37:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso850539f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 23:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681713458; x=1684305458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7IXIP7q/s1xix6CTRGLAY4yDYB3r1AK2dwz7D/b9OT0=;
 b=dU1FwO7dhUaHNXn6RGmIbU/rngaNzlYPu7YNHW0tTruXITT07QwXjMwPLBNoMoBPTa
 RvsuAHrjxupSsytA/xqHSP4Dkyq4K4YrR8E7aZZH1nEm11lj1wIxIHiY1cw3vOC51yJs
 bXa3kTfwsNkzYptmjqR122WE4nLMnIm+MRw7uBt7Uu6F8VWPvv/551ZtFGbb9LLcVjdt
 80wkACwwMu6h99Li/A2BcG0IL8IMaFaYqWer8wSj139lZl8lMdyHua6ZTvRHGcc7Yu1Z
 FmXCGp0aRgo0Er2EC8n4AxpgcX6xYKvIvY8NR6gXVufDVJDdFnbHn6dc11Xs40tCtVpF
 6Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681713458; x=1684305458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IXIP7q/s1xix6CTRGLAY4yDYB3r1AK2dwz7D/b9OT0=;
 b=DqWvNbm7LIk3qZ8zrtNb3lNpzQ3qnOk8N+8ZNlIMcZTXNtDqkOWpNPkP3fJ9hprfOi
 txjvbCT1AzOBu6oD7yCf0iMXro7n+d+SatQNkHW8ZdQGKwxoHrhk8GSuAsEzY8SlTLyz
 Z7ogdLzTLOYetpwIywGl5ajPT1ixFW2hiLsuIryvfocULj03erM/rSKMTUa3Gd8cBEQZ
 gQf6nmrVC32xKjEhh47Z2l2wp3y4Xq7BrejKb2oWmvv9yRnRz1/Fbsr1KHgJ9+SylLBs
 NMMJ7CHzrAGzDvCjjNuRTL2Fh/34yTzcdAruJaD9SbnUGFiwii42d+VPeG7olsOnDq52
 LruQ==
X-Gm-Message-State: AAQBX9dX9ybBMR9bFPYAcKpYrGh75d60onq0p90fuR+nU9/ncA549zra
 RRuAmPL9eF+8jpW/nUPrUOo=
X-Google-Smtp-Source: AKy350buWo2VHVVEq6fdepidS1aRuqjnGpTyGaTCE7dHduAojZjroCT/mevfzJK86i3SFDde2xa5mQ==
X-Received: by 2002:a5d:6ac7:0:b0:2f0:2cfb:e90e with SMTP id
 u7-20020a5d6ac7000000b002f02cfbe90emr5218591wrw.17.1681713458143; 
 Sun, 16 Apr 2023 23:37:38 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d54c4000000b002c3f81c51b6sm9595428wrv.90.2023.04.16.23.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 23:37:37 -0700 (PDT)
Date: Mon, 17 Apr 2023 09:37:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hongqi Chen <U202112190@hust.edu.cn>
Subject: Re: [PATCH] gpu: gma500: psb_drv: add missing unwind goto
Message-ID: <be7cfdac-29bf-47ee-8efa-4a5d06faf165@kili.mountain>
References: <20230417060105.16411-1-U202112190@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417060105.16411-1-U202112190@hust.edu.cn>
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
Cc: hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org,
 Dongliang Mu <dzm91@hust.edu.cn>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 02:01:05PM +0800, Hongqi Chen wrote:
> Smatch reports that missing unwind goto in psb_driver_load().
> drivers/gpu/drm/gma500/psb_drv.c:350 psb_driver_load() warn: missing
> unwind goto?
> 
> psb_driver_unload() and psb_driver_load() exist in correspondence, 
> and psb_driver_unload() should be executed when the psb_do_init() 
> fails to initialize.
> 
> Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
> Signed-off-by: Hongqi Chen <U202112190@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index cd9c73f5a64a..b5a276342129 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -347,7 +347,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>  
>  	ret = psb_do_init(dev);
>  	if (ret)
> -		return ret;
> +		goto out_err;

This kind of error handling is called One Magical Cleanup Function.
These functions are always buggy.  My instinct is that it's better to
just return directly and leak resources instead of doing whatever
horrible thing psb_driver_unload() does.

Update:  I started to look at the psb_driver_unload() and the first line
is gma_backlight_exit() which will lead to a crash if
backlight_device_register() fails.

Reviewing One Magical Cleanup Function is a waste of time, easier to
just re-write it.

The problem as well is that in olden days if the probe() function failed
you were screwed and so no one cared about error handling and cleanup.
Who cares about the details when the result is the same (dead system).
But these days we return -EPROBE_DEFER which is not a fatal error and
we're supposed to recover from that without crashing.  So on modern
drivers changing the error path from a leak to a crash has a huge
negative impact.

regards,
dan carpenter

