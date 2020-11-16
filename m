Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6E2B5335
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC706EA8F;
	Mon, 16 Nov 2020 20:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F646EA8F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:52:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so598993wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4O8Aa4G0FXUnNNpF5DyBTeqvgUbqkgjA7XITfr5GBH8=;
 b=QCO9NhKMIslBXbus4i0zahEaoDlUhzUhI2DejP3nRzxKx74ju6xwZVJYzz+Ty0CHsG
 zDG35Q1NVfl9mOZwWI87xxWiWgf/NX0Far8SPzTRVRfY+bmJZykYpdb7paMl47nVXmuc
 m9r1Rl8nmp1XwypTjuhgUZ5kpD44OF33SpNS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4O8Aa4G0FXUnNNpF5DyBTeqvgUbqkgjA7XITfr5GBH8=;
 b=m8T+lVv3mteCZzWayKqHD+PVc1A9Yd2S9WktQCQDD6zHsxjs46FTJyp4oG0c5/jCuz
 zWMpKSmS2LHefWnPZhndl1cCrZDJgk0sJ476xk3+WeTgN0sWPdhH3erk/8bY4VCwE4Ys
 0T1Z75VE3JU8OcJVF90SLHuQa4K0BKD6ZgQroWA4e1F7Qh8jwZo0qk+rpkQEen3T9Dot
 E8wwQz0kk7Q6pCzQu02ZOl08oKq2YkoDLZVVMkTpn6IFGCrUTOx97/ZD62l2vNmNfohZ
 AUOSp3J9irUq7KTqklykxJ279g5TiSTyOAFsOjpwVLaKFvt2xcC7zMmzE7+/Jw0yagfq
 +qPw==
X-Gm-Message-State: AOAM530Tx/SUhWa6nam3aKZj3Xz7x8/KYCJcctmoZN9l/l5R/0c9pe2x
 QE+4fLnhLcJ79/ajExmjWWPR4A==
X-Google-Smtp-Source: ABdhPJwktVA7oStqBmWxeDu1GDE8vE0+jJoQLulK/2axkkuPMczPwIqFd+Wae0ZddsbYXrk9yLvScA==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr765636wma.74.1605559938570; 
 Mon, 16 Nov 2020 12:52:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u8sm614470wmg.6.2020.11.16.12.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:52:17 -0800 (PST)
Date: Mon, 16 Nov 2020 21:52:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 08/10] drm/fb-helper: Restore damage area upon errors
Message-ID: <20201116205216.GH401619@phenom.ffwll.local>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116200437.17977-9-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 09:04:35PM +0100, Thomas Zimmermann wrote:
> If the damage handling fails, restore the damage area. The next invocation
> of the damage worker will then perform the update.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 2e1a335bafd2..13b65dad2ca8 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -431,11 +431,28 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
>  	if (helper->buffer) {
>  		ret = drm_fb_helper_damage_blit(helper, &clip_copy);
>  		if (ret)
> -			return;
> +			goto err;
>  	}
>  
> -	if (helper->fb->funcs->dirty)
> -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> +	if (helper->fb->funcs->dirty) {
> +		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> +		if (ret)
> +			goto err;

I think this is unexpected enough that we should put some drm error
printing here I think.
-Daniel

> +	}
> +
> +	return;
> +
> +err:
> +	/*
> +	 * Restore damage clip rectangle on errors. Next instance of damage
> +	 * worker will perform the update.
> +	 */
> +	spin_lock_irqsave(&helper->damage_lock, flags);
> +	clip->x1 = min_t(u32, clip->x1, clip_copy.x1);
> +	clip->y1 = min_t(u32, clip->y1, clip_copy.y1);
> +	clip->x2 = max_t(u32, clip->x2, clip_copy.x2);
> +	clip->y2 = max_t(u32, clip->y2, clip_copy.y2);
> +	spin_unlock_irqrestore(&helper->damage_lock, flags);
>  }
>  
>  /**
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
