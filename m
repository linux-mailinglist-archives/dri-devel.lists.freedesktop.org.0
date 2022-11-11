Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E668562570C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CF910E05A;
	Fri, 11 Nov 2022 09:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF110E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:42:04 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i10so2700302ejg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wCDP5OFRlghyUHd9s7ywxMsDsb+pewrFvRrJs8YJSjA=;
 b=KwJETxyLNrqAq/C7IChgYLdPg4Q3VKbKcJhrxwDX150hLnUiO5yFpR7RJVGVbQ4KOy
 NbgY452LpeFprh3kdmGS6VNCzQELMJOgsLjXPCa1G8tZbcnsN2Os5WQjMs1GJs7QX4c0
 FC7WbPUs2qOMR+2F0EU4r0t7BEbKJGNzqskT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCDP5OFRlghyUHd9s7ywxMsDsb+pewrFvRrJs8YJSjA=;
 b=HtjKRhVyrrSc0VO/fANwSgeSBQW36ZMxndrrTiN6ZMIhAIKt3Cch8XK7vVysr32HNc
 2hHS/P2gQagePT3ZBbSCs2P8AIbs1AMgasgrU5vteRY3IJEpq0q5b20akqKBhfpk3zNQ
 bXTRQIHM3ioB+a/dyzJfIlsZaeqEmRkZ28IFSmYm63wCjZk4nZgd9kWuE+/0tPzO9zxc
 LQBPXGhUR4BOnyB4WnAzQcZ2TxTRSD+/IFZZr+NuKkNenPs1DO4aq2pxOSQHSTJlsbBP
 KQ+RzaQCZeJrb/TIaq9FaiIkRz/7Ik23ND69HlwkueZ+HOH2KdkSn0PVLf2uZdnfcSyP
 mWng==
X-Gm-Message-State: ANoB5pkJBjMBrlRXY6pzyHWpFg2vDpBMTjj0TMc4CLCBtzk25oOSLEpf
 K3jjNt1pigTJh2H3RccmmAANvg==
X-Google-Smtp-Source: AA0mqf5pNdDWYQkAAOXz9Zh3ESIWKLFtAxSI01E9lmjKfvek4EKanam3BqxVt2MONIV4n+o1kPCYNw==
X-Received: by 2002:a17:906:339b:b0:78d:3862:4488 with SMTP id
 v27-20020a170906339b00b0078d38624488mr1113768eja.683.1668159722882; 
 Fri, 11 Nov 2022 01:42:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b007add62dafb7sm719396ejc.5.2022.11.11.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:42:02 -0800 (PST)
Date: Fri, 11 Nov 2022 10:42:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/5] drm/fb-helper: Remove damage worker
Message-ID: <Y24Y6J5pctUt1mFB@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110135519.30029-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 02:55:19PM +0100, Thomas Zimmermann wrote:
> The fbdev damage worker is unused, so remove it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I'd squash this into the previous patch, which gets rid of the
schedule_work(), if you limit the previous patch to really just that
change. But split out is fine too.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 9 ---------
>  include/drm/drm_fb_helper.h     | 2 --
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8cb644e4ecf90..47b8ef03a1f89 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -403,13 +403,6 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
>  	spin_unlock_irqrestore(&helper->damage_lock, flags);
>  }
>  
> -static void drm_fb_helper_damage_work(struct work_struct *work)
> -{
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
> -
> -	drm_fb_helper_fb_dirty(helper);
> -}
> -
>  /**
>   * drm_fb_helper_prepare - setup a drm_fb_helper structure
>   * @dev: DRM device
> @@ -425,7 +418,6 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
>  	INIT_LIST_HEAD(&helper->kernel_fb_list);
>  	spin_lock_init(&helper->damage_lock);
>  	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
> -	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>  	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
>  	mutex_init(&helper->lock);
>  	helper->funcs = funcs;
> @@ -557,7 +549,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>  		return;
>  
>  	cancel_work_sync(&fb_helper->resume_work);
> -	cancel_work_sync(&fb_helper->damage_work);
>  
>  	info = fb_helper->info;
>  	if (info) {
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index ecfcd2c56d95a..f37bb2832ba41 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -116,7 +116,6 @@ struct drm_fb_helper_funcs {
>   * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
>   *                the screen buffer
>   * @damage_lock: spinlock protecting @damage_clip
> - * @damage_work: worker used to flush the framebuffer
>   * @resume_work: worker used during resume if the console lock is already taken
>   *
>   * This is the main structure used by the fbdev helpers. Drivers supporting
> @@ -146,7 +145,6 @@ struct drm_fb_helper {
>  	u32 pseudo_palette[17];
>  	struct drm_clip_rect damage_clip;
>  	spinlock_t damage_lock;
> -	struct work_struct damage_work;
>  	struct work_struct resume_work;
>  
>  	/**
> -- 
> 2.38.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
