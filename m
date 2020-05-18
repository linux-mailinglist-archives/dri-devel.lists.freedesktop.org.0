Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5CC1D7C4D
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 17:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C686E422;
	Mon, 18 May 2020 15:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECDA6E422
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:04:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 50so12226323wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RrvhDV8DVFWyMRsIvrRH0Y2arRzFeduKZV40v9drE1w=;
 b=dTa/6PWhawR8o4+9HxstIBY5GCN5ePD+G8tj5KXJQU1rRIx8YyeJkAnfn1EZ5uUKI6
 1nmwChNM8e3AiaiFCeUTTDHUDsSlU84SAajf+Jz2WlvZMG2/NVadeVpOAP0Yl1UcD5cT
 ikAkgZTH5fHpEY7zGdtncBp4hQr40dcFwM0+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RrvhDV8DVFWyMRsIvrRH0Y2arRzFeduKZV40v9drE1w=;
 b=raugi03rToY28SDYXfEWJGgXzzUhETI1EX9d1dT8p/cxk6VFVYqmyF4DwD6ld7Xr4b
 arYbAiXGu+Pf9PTDi+DIcLkKwT8F4RmRtFlKVhpOViRLOqoeoeVf0Unudef1UIFtlpf9
 CoV7dsC7wVdxRlQGmcFBnh/Uw7G2WmfCufv3Se9MCdspBKORjWXwCJ069JRTrEMPpcbS
 7gJMCj1LmFl6mOG/LlgPfnVJ8POIqzW/7SeaGMUXBc0L0snCGjlxhiiO1Fcf9IdAZnW0
 I16HE5c0nPgLCo5UcefomY+5NunmIgZYIq1MneMPiqMkhryJuoXXYG3BaofcEvsHjIz6
 s0yQ==
X-Gm-Message-State: AOAM530b+Zw62DmdozheLDvx7cTeeqtfBCRFzJJihFwTkdjWhTyiToQS
 ckivownjgPub3p1tfJgonD0aMcOR2j4=
X-Google-Smtp-Source: ABdhPJzkCihsVvPV5T2QMcsGkFDy5Hh6FUe86b/w/ks1ygttG2g9AogdLfuMk7HYmOnsJrxTw8niNQ==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr20630022wrn.96.1589814296854; 
 Mon, 18 May 2020 08:04:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m82sm17776949wmf.3.2020.05.18.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:04:56 -0700 (PDT)
Date: Mon, 18 May 2020 17:04:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: print the current->comm alongside the pid
Message-ID: <20200518150454.GS206103@phenom.ffwll.local>
References: <20200518083315.129948-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518083315.129948-1-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Bob Beckett <bob.beckett@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Mauro Rossi <issor.oruam@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 09:33:15AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The question of "what process is this pid" keeps on popping up, so lets
> print the process name alongside the pid.
> 
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: Bob Beckett <bob.beckett@collabora.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_file.c  |  7 ++++---
>  drivers/gpu/drm/drm_ioc32.c |  4 ++--
>  drivers/gpu/drm/drm_ioctl.c | 11 ++++++-----
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 7194e67e78bd..9b79bfc60ad7 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -253,8 +253,8 @@ void drm_file_free(struct drm_file *file)
>  
>  	dev = file->minor->dev;
>  
> -	DRM_DEBUG("pid = %d, device = 0x%lx, open_count = %d\n",
> -		  task_pid_nr(current),
> +	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
> +		  current->comm, task_pid_nr(current),
>  		  (long)old_encode_dev(file->minor->kdev->devt),
>  		  atomic_read(&dev->open_count));
>  
> @@ -345,7 +345,8 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
>  	if (dev->switch_power_state != DRM_SWITCH_POWER_ON && dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
>  		return -EINVAL;
>  
> -	DRM_DEBUG("pid = %d, minor = %d\n", task_pid_nr(current), minor->index);
> +	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,
> +		  task_pid_nr(current), minor->index);
>  
>  	priv = drm_file_alloc(minor);
>  	if (IS_ERR(priv))
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 22c7fd7196c8..ff5d40036e21 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -985,8 +985,8 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	if (!fn)
>  		return drm_ioctl(filp, cmd, arg);
>  
> -	DRM_DEBUG("pid=%d, dev=0x%lx, auth=%d, %s\n",
> -		  task_pid_nr(current),
> +	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
> +		  current->comm, task_pid_nr(current),
>  		  (long)old_encode_dev(file_priv->minor->kdev->devt),
>  		  file_priv->authenticated,
>  		  drm_compat_ioctls[nr].name);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 73e31dd4e442..b03c34fb4467 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -852,8 +852,8 @@ long drm_ioctl(struct file *filp,
>  		out_size = 0;
>  	ksize = max(max(in_size, out_size), drv_size);
>  
> -	DRM_DEBUG("pid=%d, dev=0x%lx, auth=%d, %s\n",
> -		  task_pid_nr(current),
> +	DRM_DEBUG("comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
> +		  current->comm, task_pid_nr(current),
>  		  (long)old_encode_dev(file_priv->minor->kdev->devt),
>  		  file_priv->authenticated, ioctl->name);
>  
> @@ -890,15 +890,16 @@ long drm_ioctl(struct file *filp,
>  
>        err_i1:
>  	if (!ioctl)
> -		DRM_DEBUG("invalid ioctl: pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
> -			  task_pid_nr(current),
> +		DRM_DEBUG("invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
> +			  current->comm, task_pid_nr(current),
>  			  (long)old_encode_dev(file_priv->minor->kdev->devt),
>  			  file_priv->authenticated, cmd, nr);
>  
>  	if (kdata != stack_kdata)
>  		kfree(kdata);
>  	if (retcode)
> -		DRM_DEBUG("pid=%d, ret = %d\n", task_pid_nr(current), retcode);
> +		DRM_DEBUG("comm=\"%s\", pid=%d, ret = %d\n", current->comm,

Nit: Since you adjust them all, also delete the spaces around the = here
in ret = %d. With that

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +			  task_pid_nr(current), retcode);
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
