Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D85955B0F7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 11:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F8911BCC3;
	Sun, 26 Jun 2022 09:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112A014A66F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 09:58:44 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e2so9229555edv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eOQ2h2PN7Q8f3N8xyxH26Dzet5W+a2jwnNsGimzLoCU=;
 b=RmJNAF1Yw2GFQyCzjCnRFWOHoojqGwzUpkK8yByvWr6JXHlTclntETHfsQ8C7E5/DO
 OMphFuqYeCKCXSqcZf2jOJOqwUcGvcmbltLEhz0FfB8WT6lpGhjQeumfjfYqItYSirIg
 n+enPNZzcSiANeKP4Fh94jRkSwsr5mSHWUIR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eOQ2h2PN7Q8f3N8xyxH26Dzet5W+a2jwnNsGimzLoCU=;
 b=Jy8jXIs1FUz/lQR20Th8l+ZWdRNNUQE8sUcLpgmazytF2rT+Chkp61XrERNkPzdbPY
 75LMuSyhdpwJfTdrjqK0KIII8m15oD6sBC+wKTXq1fZ66PJ2u/ZZV8w7zP39/KssBLHN
 mef/rgSEugZdXOC42Bfc8lKCZFRGTq6EwpVd1s+5E2pD7lD0BGRmUX6vH1wiak7F9p5t
 el3YWP0HgqQx+eSsAdiVJOFdBWDT3Ftfatyk/M0bav8c8MQfSxtlAit0JowUbB/qNwX3
 Y+hBYYpEKWFqX/Mad5eQjcJWrXTYJGtuZ46Iy76TDcnZYWmXNMY50cGjjvODguFmCRFJ
 u1fw==
X-Gm-Message-State: AJIora8asoaT7tzGQj14WhuMh7+xT6r074NkPVxlnLZJU6ixswXlLJhP
 LlWzWAclSMfzRfjrNvzj05bakWlbSXpfFQ==
X-Google-Smtp-Source: AGRyM1u36LB6OvWR+ikyDWR7knlr+ZogwD+FcpqHAEFTglVMQ46HwwMAgm2vFGOBMK8jLKTVtwM54w==
X-Received: by 2002:a05:6402:2804:b0:431:7dde:6fb5 with SMTP id
 h4-20020a056402280400b004317dde6fb5mr10024324ede.379.1656237523374; 
 Sun, 26 Jun 2022 02:58:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7cd05000000b0042bc5a536edsm5571111edw.28.2022.06.26.02.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:58:42 -0700 (PDT)
Date: Sun, 26 Jun 2022 11:58:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 3/4] fbcon: Prevent that screen size is smaller than
 font size
Message-ID: <Yrgt0dUnZjAm3eZT@phenom.ffwll.local>
References: <20220626085615.53728-1-deller@gmx.de>
 <20220626085615.53728-4-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626085615.53728-4-deller@gmx.de>
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 10:56:14AM +0200, Helge Deller wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
> 
> This patch adds a new function fbcon_modechange_possible() which
> implements this check and which later may be extended with other checks
> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> for a too small screen size.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c |  4 +++-
>  include/linux/fbcon.h            |  4 ++++
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index e162d5e753e5..69c7261ac334 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2736,6 +2736,33 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
>  }
>  EXPORT_SYMBOL(fbcon_update_vcs);
> 
> +/* let fbcon check if it supports a new screen resolution */
> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> +{
> +	struct fbcon_ops *ops = info->fbcon_par;
> +	struct vc_data *vc;
> +	int i;
> +
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	if (!ops || ops->currcon < 0)
> +		return -EINVAL;
> +
> +	/* prevent setting a screen size which is smaller than font size */
> +	for (i = first_fb_vc; i <= last_fb_vc; i++) {
> +		vc = vc_cons[i].d;
> +		if (!vc || registered_fb[con2fb_map[i]] != info)
> +			continue;
> +
> +		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||
> +		    vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xres))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(fbcon_modechange_possible);
> +
>  int fbcon_mode_deleted(struct fb_info *info,
>  		       struct fb_videomode *mode)
>  {
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 5dfa4bbee642..b6e1d0f2b974 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			return -EFAULT;
>  		console_lock();
>  		lock_fb_info(info);
> -		ret = fb_set_var(info, &var);
> +		ret = fbcon_modechange_possible(info, &var);
> +		if (!ret)
> +			ret = fb_set_var(info, &var);
>  		if (!ret)
>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  		unlock_fb_info(info);
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index ff5596dd30f8..2382dec6d6ab 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
>  void fbcon_get_requirement(struct fb_info *info,
>  			   struct fb_blit_caps *caps);
>  void fbcon_fb_blanked(struct fb_info *info, int blank);
> +int  fbcon_modechange_possible(struct fb_info *info,
> +			       struct fb_var_screeninfo *var);
>  void fbcon_update_vcs(struct fb_info *info, bool all);
>  void fbcon_remap_all(struct fb_info *info);
>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info *info) {}
>  static inline void fbcon_get_requirement(struct fb_info *info,
>  					 struct fb_blit_caps *caps) {}
>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
> +static inline int  fbcon_modechange_possible(struct fb_info *info,
> +				struct fb_var_screeninfo *var) { return 0; }
>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
>  static inline void fbcon_remap_all(struct fb_info *info) {}
>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { return 0; }
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
