Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA18625661
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA58A10E7C5;
	Fri, 11 Nov 2022 09:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411DC10E7C5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:15:23 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y14so11205859ejd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xtSvYYn7sZgfQOD/LS+WUVcCFaMk/fKnGeBQ6IL0GRQ=;
 b=YyoTcmPDtOsf/E0K5Y2/VVSAJ9yIvKvsPrNg3CrlRW9o0aSG5efP9NxSR3I79UczVQ
 9tRR0ck1L+hbKFg6qWblY63KSmSYex2W36hUvOcpFLi0JL+cqwd2sbr9tp2HnSsCkbsS
 ETPyZD4PG42ysgMwd9vi2WprqDmQA2xVJ2ZRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtSvYYn7sZgfQOD/LS+WUVcCFaMk/fKnGeBQ6IL0GRQ=;
 b=GhLeLbhrOwmfxH9xUMSrCMBs/9jjPXnAxyTGmIy68XyyVN+aIQCXNwdCKN4ybyqF8m
 4lDefPKoxzjHrUSTa4NLofsFcVQQkfC5zqeizgh7avknrkVfgLSbjUV7xDyHAWeMSCUd
 3tjdYojsQbIg+xRVID4RgV34clGmNy/nsRc+w3SdVEMkNQvXf8xdO28TFO3/AO/mzL3z
 v7aM3ZEyLdi/FIMj9K5rGlNIYTuwdH6ImJAf8YswJLMvmgZfQTt5Q/mmICMPLfxznvga
 hJx3yLQQGW85ArM35X1XSSiy3awhSsQNCyX3lTYVn43Vip2hlhfZadpLpLGjSDQpJBsy
 DTIw==
X-Gm-Message-State: ANoB5plWMtVabzfVk4SVIZcEPmBrktf7BJldBqgMFW1HaIdMLvbbnRlf
 8169AVbsEhvWwL5hg8/cybOXwQ==
X-Google-Smtp-Source: AA0mqf4TGEfL66bEjKQr84Z85zSPxSgAtD4vB7hFe2WP/GrFk3k5yWoePitdit+Uo7962YsKWANdtg==
X-Received: by 2002:a17:907:9618:b0:78e:17ad:ba62 with SMTP id
 gb24-20020a170907961800b0078e17adba62mr1087711ejc.719.1668158121770; 
 Fri, 11 Nov 2022 01:15:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b007ae0fde7a9asm631184eja.201.2022.11.11.01.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:15:21 -0800 (PST)
Date: Fri, 11 Nov 2022 10:15:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm/fb-helper: Set damage-clip area in helper
Message-ID: <Y24Sp4cf9CnoWMRi@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110135519.30029-2-tzimmermann@suse.de>
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

On Thu, Nov 10, 2022 at 02:55:15PM +0100, Thomas Zimmermann wrote:
> Set the damage area in the new helper drm_fb_helper_add_damage_clip().
> It can now be updated without scheduling the damage worker. This change
> will help to remove the damage worker entirely. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e0384f967c0b3..178615565760e 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -576,8 +576,8 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>  }
>  EXPORT_SYMBOL(drm_fb_helper_fini);
>  
> -static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> -				 u32 width, u32 height)
> +static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u32 y,
> +					  u32 width, u32 height)
>  {
>  	struct drm_clip_rect *clip = &helper->damage_clip;
>  	unsigned long flags;
> @@ -588,6 +588,12 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
>  	clip->x2 = max_t(u32, clip->x2, x + width);
>  	clip->y2 = max_t(u32, clip->y2, y + height);
>  	spin_unlock_irqrestore(&helper->damage_lock, flags);
> +}
> +
> +static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> +				 u32 width, u32 height)
> +{
> +	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
>  
>  	schedule_work(&helper->damage_work);
>  }
> -- 
> 2.38.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
