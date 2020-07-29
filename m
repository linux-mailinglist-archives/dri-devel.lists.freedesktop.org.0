Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70192231FA3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7276E523;
	Wed, 29 Jul 2020 13:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382206E523
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:53:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g8so2805305wmk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5pg9/2Qnn5bk9hVwg9f7s8Wg+/2B1XGWjybyTFVX54o=;
 b=lRqVEqkgsc5rjQOHCvGuZAklnLTy/8hLvb0zf84Rd+2DV3hN+Qy4cse+tDp5EV/7+2
 5HDD0yqm/k3XFjEZJmarPeUz15ZneckEcfkJvSTfDQ0gYoiC7DznE8AlNvbcc7y+chCs
 n6Z0F6R4kpNsrj8FogrwSnhO5Rrjct/ee3WD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5pg9/2Qnn5bk9hVwg9f7s8Wg+/2B1XGWjybyTFVX54o=;
 b=arytfUa039UvPx+/4duNnwkOjWOKdQvACtwL38+TSqxyFNbsTpfDw0er+kljuWF4uz
 rxz1xToUQFGLnDeSaTMRbdAHZozJgJWrKmWsHqTSzCk7paUS2Ol4gFwvkthGNX5GmThO
 2Ua7XMGDvWf6w2mHVmM8lFrQElIdW7J8YAoLMXu9CD8cY/Ioz8dCbzIpEIwuoIU/nxC5
 XXYBVJ48MGhW0lOpwEiFQ39ksgz44EItmrXjz70FKsfKOYHBH8C9s8z7tYfLBIFv4ogM
 ilIO2MTJW0BynRCyWkd2yWLIeBAdZHu38TUxppeVdkTMgYr8+uM6QicYSyKoD5ff/DW1
 gkUA==
X-Gm-Message-State: AOAM533dk90fyObCHWg9LOepYgPK6SAAlSA265X0zEl3nzUJcmMr3sp4
 lLkQQRB65xHyUHMCsDu9tgoEBg==
X-Google-Smtp-Source: ABdhPJxQRB652XqKb+9GvJsRPDdBUrH927WkHXDJNE14SSv3fl9kkOVrqQhpjx0J7aVO3ZShrYln2w==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr1377477wma.167.1596030810827; 
 Wed, 29 Jul 2020 06:53:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v5sm4809239wmh.12.2020.07.29.06.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 06:53:30 -0700 (PDT)
Date: Wed, 29 Jul 2020 15:53:28 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 2/5] fbdev/core: Export framebuffer read and write code
 as cfb_ function
Message-ID: <20200729135328.GP6419@phenom.ffwll.local>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729134148.6855-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, natechancellor@gmail.com, sam@ravnborg.org,
 peda@axentia.se, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 03:41:45PM +0200, Thomas Zimmermann wrote:
> DRM fb helpers require read and write functions for framebuffer
> memory. Export the existing code from fbdev.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm I'm not super sure whether we want to actually reuse this stuff ... We
kinda don't care about the sparc special case, and just having an fbdev
implementation witch has the switch between memcpy and memcpy_to/from_io
in one single place sounds a lot simpler ...

This way we can have a clean split between the old horrors of real fbdev
drivers, and a much cleaner world in drm. It would mean a bit of
copypasting, but I think that's actually a good thing.

In general my idea for drm fbdev emulation is that for any area we have a
problem we just ignore the entire fbmem.c code and write our own: mmap,
backlight handling (still unsolved, and horrible), cfb vs sys here. This
entire fbmem.c stuff is pretty bad midlayer, trying to avoid code
duplication here doesn't seem worth it imo.

Thoughts?
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 53 ++++++++++++++++++++++----------
>  include/linux/fb.h               |  5 +++
>  2 files changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index dd0ccf35f7b7..b496ff90db3e 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -759,25 +759,18 @@ static struct fb_info *file_fb_info(struct file *file)
>  	return info;
>  }
>  
> -static ssize_t
> -fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count,
> +		    loff_t *ppos)
>  {
>  	unsigned long p = *ppos;
> -	struct fb_info *info = file_fb_info(file);
>  	u8 *buffer, *dst;
>  	u8 __iomem *src;
>  	int c, cnt = 0, err = 0;
>  	unsigned long total_size;
>  
> -	if (!info || ! info->screen_base)
> -		return -ENODEV;
> -
>  	if (info->state != FBINFO_STATE_RUNNING)
>  		return -EPERM;
>  
> -	if (info->fbops->fb_read)
> -		return info->fbops->fb_read(info, buf, count, ppos);
> -
>  	total_size = info->screen_size;
>  
>  	if (total_size == 0)
> @@ -823,16 +816,12 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  
>  	return (err) ? err : cnt;
>  }
> +EXPORT_SYMBOL(fb_cfb_read);
>  
>  static ssize_t
> -fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> +fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  {
> -	unsigned long p = *ppos;
>  	struct fb_info *info = file_fb_info(file);
> -	u8 *buffer, *src;
> -	u8 __iomem *dst;
> -	int c, cnt = 0, err = 0;
> -	unsigned long total_size;
>  
>  	if (!info || !info->screen_base)
>  		return -ENODEV;
> @@ -840,8 +829,20 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  	if (info->state != FBINFO_STATE_RUNNING)
>  		return -EPERM;
>  
> -	if (info->fbops->fb_write)
> -		return info->fbops->fb_write(info, buf, count, ppos);
> +	if (info->fbops->fb_read)
> +		return info->fbops->fb_read(info, buf, count, ppos);
> +	else
> +		return fb_cfb_read(info, buf, count, ppos);
> +}
> +
> +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> +		     size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *buffer, *src;
> +	u8 __iomem *dst;
> +	int c, cnt = 0, err = 0;
> +	unsigned long total_size;
>  
>  	total_size = info->screen_size;
>  
> @@ -895,6 +896,24 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  
>  	return (cnt) ? cnt : err;
>  }
> +EXPORT_SYMBOL(fb_cfb_write);
> +
> +static ssize_t
> +fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct fb_info *info = file_fb_info(file);
> +
> +	if (!info || !info->screen_base)
> +		return -ENODEV;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	if (info->fbops->fb_write)
> +		return info->fbops->fb_write(info, buf, count, ppos);
> +	else
> +		return fb_cfb_write(info, buf, count, ppos);
> +}
>  
>  int
>  fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 714187bc13ac..12ad83963db5 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -593,6 +593,11 @@ extern int fb_blank(struct fb_info *info, int blank);
>  extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>  extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>  extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
> +extern ssize_t fb_cfb_read(struct fb_info *info, char __user *buf,
> +			   size_t count, loff_t *ppos);
> +extern ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf,
> +			    size_t count, loff_t *ppos);
> +
>  /*
>   * Drawing operations where framebuffer is in system RAM
>   */
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
