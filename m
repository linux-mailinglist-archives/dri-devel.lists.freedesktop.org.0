Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE113496B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 18:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A986E12B;
	Wed,  8 Jan 2020 17:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551D6E106
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 17:35:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 20so3397304wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qwg5hibFRVywSqJ0shEP5dA8R4/hDi63ijsidIVUsnI=;
 b=QUoqhl67fBgCPzU+SawnnCIxZ4VeUk3dj6RARmd4tvkb3zuVnoidILFVGwXsN5UE2I
 /F5RA4m/Ts5DWqtPY4fbEwVrFuGLvTj3ZvxdZY/KfsHA/92XiLTWNxlRvAT/l38OSrBg
 2KSwA4YLo8d/FXx89+AyH9Iiffz0+7TqE5dms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qwg5hibFRVywSqJ0shEP5dA8R4/hDi63ijsidIVUsnI=;
 b=Fwj/a2zKuqXmhr1h5xZis6FDVQ3VhdT9muiwmIV2Hg7k7Y89h+QzgUGg1cgdEiOrBF
 xDDDYqzSPw5ZHsKrjWsPNBuJpXhnIFb/GcU82Pp+lfc5kuSBro4frXEkXWqvvjiqpbec
 AfY9uzu1UqGeIcXO1+/1M6ozI2jYwaertYD4i5k4zmhjcgEylv/Wh/7FFVydx9RqM6Tg
 HSWpXldT4wIUvphezVntW+Uq2Zz+K+fiClTQFXp9ZCP/z7dqJszqEQaBglQ64rZM7Lr0
 AA5J5uxOXFHbw9zPxPsP9GHCV8DLjzKF5HtJ9haIgAHEq7JmebhroHQJQ7ehIG+kpY2p
 qXyQ==
X-Gm-Message-State: APjAAAUBd7h6NH/I9+uIv5LRkm6P8JClQEg+gum3BkDDO2slDI6A6B5r
 MlcaJ3euoRyYroC2ns0jEbkMRg==
X-Google-Smtp-Source: APXvYqzL8iJjlAP6Ht35NUvrFJlYJCBylU7frfkVj8GVw/wQ1xkS3qZdMpeM79IbBg2pFJtR30DPRQ==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr5324133wme.90.1578504932671; 
 Wed, 08 Jan 2020 09:35:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id h17sm5044566wrs.18.2020.01.08.09.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 09:35:31 -0800 (PST)
Date: Wed, 8 Jan 2020 18:35:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/omapdrm: use BUG_ON macro for error debugging.
Message-ID: <20200108173529.GG43062@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 tomi.valkeinen@ti.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200102095515.7106-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102095515.7106-1-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2020 at 12:55:15PM +0300, Wambui Karuga wrote:
> Since the if statement only checks for the value of the `id` variable,
> it can be replaced by the more concise BUG_ON() macro for error
> reporting.
> Issue found using coccinelle.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Tomi said he's ok with this landing in drm-misc-next on irc, so merged.
Thanks for your patch!
-Daniel

> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 413dbdd1771e..dbb90f2d2ccd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -393,8 +393,7 @@ static void dispc_get_reg_field(struct dispc_device *dispc,
>  				enum dispc_feat_reg_field id,
>  				u8 *start, u8 *end)
>  {
> -	if (id >= dispc->feat->num_reg_fields)
> -		BUG();
> +	BUG_ON(id >= dispc->feat->num_reg_fields);
>  
>  	*start = dispc->feat->reg_fields[id].start;
>  	*end = dispc->feat->reg_fields[id].end;
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
