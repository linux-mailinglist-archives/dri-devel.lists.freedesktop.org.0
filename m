Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0212150397
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 10:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70F6EB8A;
	Mon,  3 Feb 2020 09:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493C6EB8A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 09:50:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so15009866wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 01:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UaA6NH38cP/TzwXvn/HREZJ8o2d7AFwTkCT76pqp1jE=;
 b=HpPgJNUuvc0m2FQJ1JoqIdtXw5FJ9en4hE0RVkYFHSnbjJCos8F4yd1y8CZkap1tRa
 ZvelrlMjYYlrEa/NHZfSmZJjAT2cBHFns00/T/JCAG12OaxanDoeQJBxtP0dDtVeLEiE
 6H7yy5zofefQwXhvBJzIgC7Gl3B4GF/1wj3Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UaA6NH38cP/TzwXvn/HREZJ8o2d7AFwTkCT76pqp1jE=;
 b=ZvG2oARDQOwBLhzIodpxyDyUYiKP4E8tjtcXJjDk3Pi9tBaVYvo24bmgIKVLZ/tnW+
 x95uRhWhnx1thqBAe9460KMkVDlTvCSY2eJ0H+fvvhXvb/hNHuI0O9uSxzfXa+Ki2702
 PyXkpJ+BivqE/WEPBs2QMeRATmm1+Xd5kLizPHcOx2/gA7jBP0D/dn3/wQ/lfFRcLlWr
 OlltLlc9dduyygG6VexeFQBsX9HOLvzv98hYXHt0xn4mzQLidM8niMb3FkrJYArddz4k
 sPledeglukEzFToAmkh5mMnmE2TyRfH3daZnMYwaoGFwn5TJGWHghQqOQC97akHcEsVz
 /t9Q==
X-Gm-Message-State: APjAAAXXQB/Zz/hivJvX/WLCqkXLFbB+QdKuXNrv13aJNCuAUFOrVkKT
 m4t2kbp2zwz0eFewoEvQBoaOZg==
X-Google-Smtp-Source: APXvYqzmuhTadSYa9EPBYlqsjAozQwVX9H5togfsQni6PrYmjvv+V3hhKlN35nnZilwtAyCODNWCPw==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr27762457wml.88.1580723450918; 
 Mon, 03 Feb 2020 01:50:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a6sm25175815wrm.69.2020.02.03.01.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 01:50:50 -0800 (PST)
Date: Mon, 3 Feb 2020 10:50:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/hibmc: Implement struct
 drm_mode_config_funcs.mode_valid
Message-ID: <20200203095048.GT43062@phenom.ffwll.local>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201122744.27165-4-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 01, 2020 at 01:27:43PM +0100, Thomas Zimmermann wrote:
> The implementation of struct drm_mode_config_funcs.mode_valid verifies
> that enough video memory is available for a given display mode.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

lgtm, Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

While browsing I realized that hibmc has a bunch of dummy mode_valid
functions that we could garbage collect. And the kirin driver has a
hand-rolled version of "must call crtc validation funcs for
connector->mode_valid" (because that driver predates the addition of that
support in the probe helpers). In case you're bored :-)

Cheers, Daniel

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> index 50b988fdd5cc..99397ac3b363 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -54,6 +54,7 @@ int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  
>  const struct drm_mode_config_funcs hibmc_mode_funcs = {
> +	.mode_valid = drm_vram_helper_mode_valid,
>  	.atomic_check = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  	.fb_create = drm_gem_fb_create,
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
