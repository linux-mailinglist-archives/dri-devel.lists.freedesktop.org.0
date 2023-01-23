Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBA6788A8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47CA10E582;
	Mon, 23 Jan 2023 20:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585FD10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6xlJitFXBs8UqFqbNXtsqz4Qe4cxHRrL4RHl5+HWVV8=;
 b=BYQB1r9230Rhlr9d4tlQD/BzVdvjxRnPEk9wov3faQk2ckbz06LXW2HPwHA/4TyrQdLvlpnJklOfG
 FXDMxvjuc8dnXEYTUwgcbFiBfstPjMdyyH0YX2LO4+w6qRdSvHnnlJ5VUd/vEv8cp4732SJ1G1Oxwm
 XDILz3LGNXkxa94+o32JYdV1q8wgZyO/UDr6LQHMMor8Nqr6+EYZ/6mqDJwtaHYgIBcPdc0C+PbaVC
 MC2TS3+vJy41LdgNmuafvswsaPs0nSZII8RqLUnszrRYbh16WDrhUaFtP/Itlj58s4XyO5EZ4IDuDF
 jRL7m85J+clhsyWnmXyUsjbJyzwd5aA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6xlJitFXBs8UqFqbNXtsqz4Qe4cxHRrL4RHl5+HWVV8=;
 b=TvwoevhBurigcyIfAcq+VWI6JaPtfF139Yc4vlWQbp6YNbsnZUwUpsVBURsM+ZPfScBMEH9fCMbO3
 jQpf0XYBQ==
X-HalOne-ID: a3c44e78-9b5f-11ed-a91a-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id a3c44e78-9b5f-11ed-a91a-11abd97b9443;
 Mon, 23 Jan 2023 20:51:00 +0000 (UTC)
Date: Mon, 23 Jan 2023 21:50:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to
 'info'
Message-ID: <Y87zMk0sJc6EOG/6@ravnborg.org>
References: <20230123100559.12351-1-tzimmermann@suse.de>
 <20230123100559.12351-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123100559.12351-11-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

a quick drive-by comment.

On Mon, Jan 23, 2023 at 11:05:59AM +0100, Thomas Zimmermann wrote:
> The generic fbdev emulation names variables of type struct fb_info
> both 'fbi' and 'info'. The latter seems to be more common in fbdev
> code, so name fbi accordingly.
> 
> Also replace the duplicate variable in drm_fbdev_fb_destroy().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 49 ++++++++++++++---------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 49a0bba86ce7..7633da5c13c3 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -46,17 +46,16 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>  static void drm_fbdev_fb_destroy(struct fb_info *info)
>  {
>  	struct drm_fb_helper *fb_helper = info->par;
> -	struct fb_info *fbi = fb_helper->info;
>  	void *shadow = NULL;
>  
>  	if (!fb_helper->dev)
>  		return;
>  
> -	if (fbi) {
> -		if (fbi->fbdefio)
> -			fb_deferred_io_cleanup(fbi);
> +	if (info) {
As info is already used above to find fb_helper, this check is
redundant.

	Sam

> +		if (info->fbdefio)
> +			fb_deferred_io_cleanup(info);
>  		if (drm_fbdev_use_shadow_fb(fb_helper))
> -			shadow = fbi->screen_buffer;
> +			shadow = info->screen_buffer;
>  	}
>  
>  	drm_fb_helper_fini(fb_helper);
> @@ -173,7 +172,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>  	struct drm_device *dev = fb_helper->dev;
>  	struct drm_client_buffer *buffer;
>  	struct drm_framebuffer *fb;
> -	struct fb_info *fbi;
> +	struct fb_info *info;
>  	u32 format;
>  	struct iosys_map map;
>  	int ret;
> @@ -192,35 +191,35 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->fb = buffer->fb;
>  	fb = buffer->fb;
>  
> -	fbi = drm_fb_helper_alloc_info(fb_helper);
> -	if (IS_ERR(fbi))
> -		return PTR_ERR(fbi);
> +	info = drm_fb_helper_alloc_info(fb_helper);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
>  
> -	fbi->fbops = &drm_fbdev_fb_ops;
> -	fbi->screen_size = sizes->surface_height * fb->pitches[0];
> -	fbi->fix.smem_len = fbi->screen_size;
> -	fbi->flags = FBINFO_DEFAULT;
> +	info->fbops = &drm_fbdev_fb_ops;
> +	info->screen_size = sizes->surface_height * fb->pitches[0];
> +	info->fix.smem_len = info->screen_size;
> +	info->flags = FBINFO_DEFAULT;
>  
> -	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
> +	drm_fb_helper_fill_info(info, fb_helper, sizes);
>  
>  	if (drm_fbdev_use_shadow_fb(fb_helper)) {
> -		fbi->screen_buffer = vzalloc(fbi->screen_size);
> -		if (!fbi->screen_buffer)
> +		info->screen_buffer = vzalloc(info->screen_size);
> +		if (!info->screen_buffer)
>  			return -ENOMEM;
> -		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
> +		info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>  
> -		fbi->fbdefio = &drm_fbdev_defio;
> -		fb_deferred_io_init(fbi);
> +		info->fbdefio = &drm_fbdev_defio;
> +		fb_deferred_io_init(info);
>  	} else {
>  		/* buffer is mapped for HW framebuffer */
>  		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
>  		if (ret)
>  			return ret;
>  		if (map.is_iomem) {
> -			fbi->screen_base = map.vaddr_iomem;
> +			info->screen_base = map.vaddr_iomem;
>  		} else {
> -			fbi->screen_buffer = map.vaddr;
> -			fbi->flags |= FBINFO_VIRTFB;
> +			info->screen_buffer = map.vaddr;
> +			info->flags |= FBINFO_VIRTFB;
>  		}
>  
>  		/*
> @@ -229,10 +228,10 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>  		 * case.
>  		 */
>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -		if (fb_helper->hint_leak_smem_start && fbi->fix.smem_start == 0 &&
> +		if (fb_helper->hint_leak_smem_start && info->fix.smem_start == 0 &&
>  		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
> -			fbi->fix.smem_start =
> -				page_to_phys(virt_to_page(fbi->screen_buffer));
> +			info->fix.smem_start =
> +				page_to_phys(virt_to_page(info->screen_buffer));
>  #endif
>  	}
>  
> -- 
> 2.39.0
