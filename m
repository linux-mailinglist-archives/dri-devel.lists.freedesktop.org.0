Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BA4ADA4E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A610E45E;
	Tue,  8 Feb 2022 13:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6810E4C6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 13:44:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a8so52381301ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=51cyXGs5PH+g5ThyWMgVbLD2cGGTIvqxnKH25hFuBb8=;
 b=dnKA4ttigybSoGmFE5QTpV/NodfdbUjvio9yre6Q7/jRscPVTDhw+VyhcV43LT0LJk
 m7Ur8ot/9c6SGUpF8jEFoOrhkNgC542ieS9RQraOZaedlYtylnA/AoRv8juxOICPEePM
 OuSHrm33PXwYI4lQFZNAbDp7cqoiuXnUH+Zpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=51cyXGs5PH+g5ThyWMgVbLD2cGGTIvqxnKH25hFuBb8=;
 b=MA61QowYxrGfLONeAUS7bXtS43PyuL8Tbwjr+s6WukbcVCvqVTyCgckxFqkFMewh3r
 OUEdRqbsXbJY5MuuXA3L50RVabKVkK3ZINXg9c3OlXSUYEYLXhcON2D1+PfDnzMNgWC7
 Fwdje8Z+JM2GXkwbISwWACZkbs3qdBzgaq/s9yj2d+NOjhxkSe3cKbtfcEOtpSnfWx9r
 yf3sGaYg6H/W6W1PHoLznrcO+oAC4tsOYxviMQss7wSDtrdGcXcGFb7fB3bLiSwlXHAW
 uBEvTbj8q2vvwPS2E1dRm4wcUn13A4jQZrvGPahqEjnTj0o52TBjyjBvgPik1MOKQZJy
 DzKg==
X-Gm-Message-State: AOAM5317sPl3oEYpkWKjDLmA95Mv3nJ5bjxa+VZC9BlNXw1V6k3pXBoT
 i1+N4NWF7bYJ8/mW8MSudjNa5E4nkY875Q==
X-Google-Smtp-Source: ABdhPJxTQwtA5OAxy4GhkNWeqT5PXXuFesodGdl/FW7m9+zEt3PNiJe70Xg3mcWPGa2NuZyu11gHMQ==
X-Received: by 2002:a17:907:7388:: with SMTP id
 er8mr3693063ejc.269.1644327844707; 
 Tue, 08 Feb 2022 05:44:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hh13sm4828699ejb.89.2022.02.08.05.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:44:04 -0800 (PST)
Date: Tue, 8 Feb 2022 14:44:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbcon: Avoid 'cap' set but not used warning
Message-ID: <YgJzohA7S7itGVe+@phenom.ffwll.local>
References: <YgFB4xqI+As196FR@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgFB4xqI+As196FR@p100>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 04:59:31PM +0100, Helge Deller wrote:
> Fix this kernel test robot warning:
> 
>   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
>   drivers/video/fbdev/core/fbcon.c:1028:6: warning: variable 'cap' set but not used [-Wunused-but-set-variable]
> 
> The cap variable is only used when CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> is enabled. Drop the temporary variable and use info->flags instead.
> 
> Fixes: 87ab9f6b7417 ("Revert "fbcon: Disable accelerated scrolling")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Helge Deller <deller@gmx.de>

Applied to drm-misc-fixes.

btw I think would still make sense to grab drm-misc commit rights for you,
so you can push stuff like this directly.

Thanks, Daniel

> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index f36829eeb5a9..2fc1b80a26ad 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int init)
>  	struct vc_data *svc = *default_mode;
>  	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
>  	int logo = 1, new_rows, new_cols, rows, cols;
> -	int cap, ret;
> +	int ret;
> 
>  	if (WARN_ON(info_idx == -1))
>  	    return;
> @@ -1034,7 +1034,6 @@ static void fbcon_init(struct vc_data *vc, int init)
>  		con2fb_map[vc->vc_num] = info_idx;
> 
>  	info = registered_fb[con2fb_map[vc->vc_num]];
> -	cap = info->flags;
> 
>  	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
>  		logo_shown = FBCON_LOGO_DONTSHOW;
> @@ -1137,8 +1136,8 @@ static void fbcon_init(struct vc_data *vc, int init)
>  	ops->graphics = 0;
> 
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> -	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
> -	    !(cap & FBINFO_HWACCEL_DISABLED))
> +	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
> +	    !(info->flags & FBINFO_HWACCEL_DISABLED))
>  		p->scrollmode = SCROLL_MOVE;
>  	else /* default to something safe */
>  		p->scrollmode = SCROLL_REDRAW;

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
