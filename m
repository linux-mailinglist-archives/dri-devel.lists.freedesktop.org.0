Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BECF1C576F
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 15:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22096E17E;
	Tue,  5 May 2020 13:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB46E17E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:52:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y4so2613503wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=shx41OmUiiDJuv+kI+3aCiWCUAvaFA5BzGibsN1srxA=;
 b=fDfD27Jlod5CZQIH7tM7Sv3GnU++Q0ta9d9Ct6jXH2HZfNe1gYJekeC8DUvK9yJd7q
 7zH/Er0EalY5dCibRMZavHVg+bQ5uW1D341W7lAGrWl6UVSnpj4feQVsFKzBn9slZL/p
 IpPRAalKHKlp/QRYZD0qLshEJi+HsWWdngdL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=shx41OmUiiDJuv+kI+3aCiWCUAvaFA5BzGibsN1srxA=;
 b=ZewdOoESBfY5SfAHutCMghoQkc9tlU2pDzsyHFfR8vz6lqrrT7PcqPYBKCpdr2fhLy
 ajHlFVeaCmusFQjN2JH8jM7kMRGShVw9Upq8ePs3SplrNsGDiuYgZsZjA19Ep6mwjrer
 8/DwHNrr2Zi+c1lrXL9OpWfiUN9HwPyBHpczbWbPnn941HP0xNl1MTG22FDmOaThih97
 ujTKxsKR7CNFTnj/+5oCsIdxI7rkEs8K/5Ig0sEg+20jXwwZq8n1rrT6exWGnpd5vTqb
 g1tSbm1erhV+y+/ertrIeBPEgUJs7kUrIrMaQX/gty9r+/dqqs0ZbwbViPEHfRYVBMw6
 joeg==
X-Gm-Message-State: AGi0PuYHc45Mn1cC+qXI9HN8yN9bfCLRswOfAmS5AvA0+IbKZcV54kpe
 pC6KMVRGqVTwn7gkYULhfwod8Q==
X-Google-Smtp-Source: APiQypJhjOXl2w4WNEOlJ0+qpCr1oZBD7mqGmVeBm8S979knUXaERXeA4aacTo8b6Mlh713zEfrShw==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr3942542wrw.306.1588686719240; 
 Tue, 05 May 2020 06:51:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c17sm2792038wrn.59.2020.05.05.06.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 06:51:58 -0700 (PDT)
Date: Tue, 5 May 2020 15:51:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm/mgag200: Convert struct drm_device to struct
 mga_device with macro
Message-ID: <20200505135156.GQ10381@phenom.ffwll.local>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 11:56:45AM +0200, Thomas Zimmermann wrote:
> Mgag200 used dev_private to look up struct mga_device for instances
> of struct drm_device. Use of dev_private is deprecated, so hide it in
> the macro to_mga_device().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c |  4 ++--
>  drivers/gpu/drm/mgag200/mgag200_drv.c    |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  1 +
>  drivers/gpu/drm/mgag200/mgag200_i2c.c    | 10 +++++-----
>  drivers/gpu/drm/mgag200/mgag200_main.c   |  4 ++--
>  drivers/gpu/drm/mgag200/mgag200_mode.c   | 18 +++++++++---------
>  6 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index d491edd317ff3..aebc9ce43d551 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -260,7 +260,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
>  			    uint32_t handle, uint32_t width, uint32_t height)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	struct drm_gem_object *obj;
>  	struct drm_gem_vram_object *gbo = NULL;
>  	int ret;
> @@ -307,7 +307,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
>  
>  int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
>  {
> -	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
>  
>  	/* Our origin is at (64,64) */
>  	x += 64;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 3298b7ef18b03..c2f0e4b40b052 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -120,7 +120,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
>  			       struct drm_device *dev,
>  			       struct drm_mode_create_dumb *args)
>  {
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	unsigned long pg_align;
>  
>  	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 9691252d6233f..632bbb50465c9 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -96,6 +96,7 @@
>  
>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
> +#define to_mga_device(x) ((struct mga_device *)(x)->dev_private)
>  
>  struct mga_crtc {
>  	struct drm_crtc base;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
> index 9f4635916d322..09731e614e46d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
> @@ -61,34 +61,34 @@ static inline void mga_i2c_set(struct mga_device *mdev, int mask, int state)
>  static void mga_gpio_setsda(void *data, int state)
>  {
>  	struct mga_i2c_chan *i2c = data;
> -	struct mga_device *mdev = i2c->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(i2c->dev);
>  	mga_i2c_set(mdev, i2c->data, state);
>  }
>  
>  static void mga_gpio_setscl(void *data, int state)
>  {
>  	struct mga_i2c_chan *i2c = data;
> -	struct mga_device *mdev = i2c->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(i2c->dev);
>  	mga_i2c_set(mdev, i2c->clock, state);
>  }
>  
>  static int mga_gpio_getsda(void *data)
>  {
>  	struct mga_i2c_chan *i2c = data;
> -	struct mga_device *mdev = i2c->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(i2c->dev);
>  	return (mga_i2c_read_gpio(mdev) & i2c->data) ? 1 : 0;
>  }
>  
>  static int mga_gpio_getscl(void *data)
>  {
>  	struct mga_i2c_chan *i2c = data;
> -	struct mga_device *mdev = i2c->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(i2c->dev);
>  	return (mga_i2c_read_gpio(mdev) & i2c->clock) ? 1 : 0;
>  }
>  
>  struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
>  {
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	struct mga_i2c_chan *i2c;
>  	int ret;
>  	int data, clock;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index b680cf47cbb94..b705b7776d2fc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -92,7 +92,7 @@ static int mga_vram_init(struct mga_device *mdev)
>  static int mgag200_device_init(struct drm_device *dev,
>  			       uint32_t flags)
>  {
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	int ret, option;
>  
>  	mdev->flags = mgag200_flags_from_driver_data(flags);
> @@ -195,7 +195,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  
>  void mgag200_driver_unload(struct drm_device *dev)
>  {
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  
>  	if (mdev == NULL)
>  		return;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index d90e83959fca1..fa91869c0db52 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -28,7 +28,7 @@
>  static void mga_crtc_load_lut(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	struct drm_framebuffer *fb = crtc->primary->fb;
>  	u16 *r_ptr, *g_ptr, *b_ptr;
>  	int i;
> @@ -728,7 +728,7 @@ static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
>  
>  static void mga_g200wb_prepare(struct drm_crtc *crtc)
>  {
> -	struct mga_device *mdev = crtc->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
>  	u8 tmp;
>  	int iter_max;
>  
> @@ -783,7 +783,7 @@ static void mga_g200wb_prepare(struct drm_crtc *crtc)
>  static void mga_g200wb_commit(struct drm_crtc *crtc)
>  {
>  	u8 tmp;
> -	struct mga_device *mdev = crtc->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
>  
>  	/* 1- The first step is to ensure that the vrsten and hrsten are set */
>  	WREG8(MGAREG_CRTCEXT_INDEX, 1);
> @@ -833,7 +833,7 @@ static void mga_g200wb_commit(struct drm_crtc *crtc)
>   */
>  static void mga_set_start_address(struct drm_crtc *crtc, unsigned offset)
>  {
> -	struct mga_device *mdev = crtc->dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
>  	u32 addr;
>  	int count;
>  	u8 crtcext0;
> @@ -902,7 +902,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  				int x, int y, struct drm_framebuffer *old_fb)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	const struct drm_framebuffer *fb = crtc->primary->fb;
>  	int hdisplay, hsyncstart, hsyncend, htotal;
>  	int vdisplay, vsyncstart, vsyncend, vtotal;
> @@ -1263,7 +1263,7 @@ static int mga_resume(struct drm_crtc *crtc)
>  static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	u8 seq1 = 0, crtcext1 = 0;
>  
>  	switch (mode) {
> @@ -1317,7 +1317,7 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
>  static void mga_crtc_prepare(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	u8 tmp;
>  
>  	/*	mga_resume(crtc);*/
> @@ -1353,7 +1353,7 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
>  static void mga_crtc_commit(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
>  	u8 tmp;
>  
> @@ -1495,7 +1495,7 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
>  				 struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = connector->dev;
> -	struct mga_device *mdev = (struct mga_device*)dev->dev_private;
> +	struct mga_device *mdev = to_mga_device(dev);
>  	int bpp = 32;
>  
>  	if (IS_G200_SE(mdev)) {
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
