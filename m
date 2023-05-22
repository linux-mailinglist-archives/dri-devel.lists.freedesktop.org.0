Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE070BF8B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B508210E32D;
	Mon, 22 May 2023 13:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19CF10E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:21:06 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-561deaad117so77626417b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684761665; x=1687353665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=te6QRcnpJlK5rz5MOROStak0xNaxvC/mgPjGBRZqrEw=;
 b=yPR/vxi80ktVB9nBZ+gxEpqHthrrZrC1UyAfFROVYDLlGEj7ovedj6oNNIw+3f0MOf
 z3zwG4IfOmSW6CRb2rra4QVS4Dhm2TqZRzp6HgRvvaaeKpSFf8N2Yd8ug0rjRC/BfsZs
 0Gy3NEXsjoyB/EBGjX8QeHuYSJMq4akDiFD4zlp+27o8pOzHrwbnPA5E6zbc0RqXI60W
 8SR4GG+hcdg1KyP/eOj+sSxGVrhDgL9HGieztXbL3dPEKD3uqSer40aIu2n05D326mxT
 CiGzVH+sbPyN3jyR/zDyITYP5MRVcFqh9OzwxbizNsZYSfyV5JmeXs4Tn4jVCoTyqK6V
 PzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684761665; x=1687353665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=te6QRcnpJlK5rz5MOROStak0xNaxvC/mgPjGBRZqrEw=;
 b=dOj5V3ZmQFU/8PMEyVgI5Yllr89GAFy5iyOrY1ak84wPmarTNL3uW7T1GQB5J+g3gf
 MdPOM1dZCBZydRmd/CbhxUHPBzO3BE4f/KGnv2LYxC3zW0APbU16CE71rJi/d1wu0t5N
 rd6ayW6Poc+/Fofy7uhNih56gFyCvrfxy0Kehd3VFaVtl28hegOspzV7rRaDb5EnIBMl
 tiFGhYEvkf6NLEBMd2PuEnrMsT/poZMGg2/hrOo5ZDe9A2CwTTg9RZq7urOiYFVaxItq
 /tv81jMgMRVCXkohBsnj1a1QBDbCCxizalEUS21Nn1ytuN+Ky6Fc5HhvK49wHIXwkhoF
 hc6g==
X-Gm-Message-State: AC+VfDyIACs2wCHAOtNf+E6Mc7A1GwH/F6+xlUNerquakrtJLewnVhxC
 UPIFTDPKYMvRf6ekvnLjc+gyCGxppPvDtP5MO6vT+w==
X-Google-Smtp-Source: ACHHUZ4V34k1+A48kW0LeNO8AJ5hzoROAawtKyJZuPIJnbOsbTP9EI8ZTFZxqxCOc9Oyb+Q5NVr2AGZu2kbPcQ886F8=
X-Received: by 2002:a81:7b87:0:b0:559:f861:9e0b with SMTP id
 w129-20020a817b87000000b00559f8619e0bmr12608824ywc.5.1684761664777; Mon, 22
 May 2023 06:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230522122140.30131-1-tzimmermann@suse.de>
 <20230522122140.30131-12-tzimmermann@suse.de>
In-Reply-To: <20230522122140.30131-12-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 May 2023 16:20:53 +0300
Message-ID: <CAA8EJpp4Q0P7JSK=1igsQ4gbLjbW2X670CKQrZSm_epzqusYug@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 11/12] drm/fbdev-generic: Implement
 dedicated fbdev I/O helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 at 15:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Implement dedicated fbdev helpers for framebuffer I/O instead
> of using DRM's helpers. Fbdev-generic was the only caller of the
> DRM helpers, so remove them from the helper module.
>
> v2:
>         * use FB_SYS_HELPERS_DEFERRED option
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Kconfig             |   6 +-
>  drivers/gpu/drm/drm_fb_helper.c     | 107 ----------------------------
>  drivers/gpu/drm/drm_fbdev_generic.c |  47 ++++++++++--
>  include/drm/drm_fb_helper.h         |  41 -----------
>  4 files changed, 43 insertions(+), 158 deletions(-)

Looking at this patch makes me wonder if we should have implemented
fb_dirty for the MSM driver. We have drm_framebuffer_funcs::dirty()
implemented (by wrapping the drm_atomic_helper_dirtyfb()).

>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 77fb10ddd8a2..92a782827b7b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -95,6 +95,7 @@ config DRM_KUNIT_TEST
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> +       select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>         help
>           CRTC helpers for KMS drivers.
>
> @@ -135,11 +136,6 @@ config DRM_FBDEV_EMULATION
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
> -       select FB_DEFERRED_IO
> -       select FB_SYS_FOPS
> -       select FB_SYS_FILLRECT
> -       select FB_SYS_COPYAREA
> -       select FB_SYS_IMAGEBLIT
>         select FRAMEBUFFER_CONSOLE if !EXPERT
>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>         default y
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 8724e08c518b..ba0a808f14ee 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -729,113 +729,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>  }
>  EXPORT_SYMBOL(drm_fb_helper_deferred_io);
>
> -/**
> - * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to read from framebuffer memory
> - * @count: number of bytes to read from framebuffer memory
> - * @ppos: read offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes read on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -                              size_t count, loff_t *ppos)
> -{
> -       return fb_sys_read(info, buf, count, ppos);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_read);
> -
> -/**
> - * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
> - * @info: fb_info struct pointer
> - * @buf: userspace buffer to write to framebuffer memory
> - * @count: number of bytes to write to framebuffer memory
> - * @ppos: write offset within framebuffer memory
> - *
> - * Returns:
> - * The number of bytes written on success, or an error code otherwise.
> - */
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -                               size_t count, loff_t *ppos)
> -{
> -       struct drm_fb_helper *helper = info->par;
> -       loff_t pos = *ppos;
> -       ssize_t ret;
> -       struct drm_rect damage_area;
> -
> -       ret = fb_sys_write(info, buf, count, ppos);
> -       if (ret <= 0)
> -               return ret;
> -
> -       if (helper->funcs->fb_dirty) {
> -               drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> -               drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> -                                    drm_rect_width(&damage_area),
> -                                    drm_rect_height(&damage_area));
> -       }
> -
> -       return ret;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_write);
> -
> -/**
> - * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
> - * @info: fbdev registered by the helper
> - * @rect: info about rectangle to fill
> - *
> - * A wrapper around sys_fillrect implemented by fbdev core
> - */
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -                               const struct fb_fillrect *rect)
> -{
> -       struct drm_fb_helper *helper = info->par;
> -
> -       sys_fillrect(info, rect);
> -
> -       if (helper->funcs->fb_dirty)
> -               drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
> -
> -/**
> - * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
> - * @info: fbdev registered by the helper
> - * @area: info about area to copy
> - *
> - * A wrapper around sys_copyarea implemented by fbdev core
> - */
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -                               const struct fb_copyarea *area)
> -{
> -       struct drm_fb_helper *helper = info->par;
> -
> -       sys_copyarea(info, area);
> -
> -       if (helper->funcs->fb_dirty)
> -               drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
> -
> -/**
> - * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
> - * @info: fbdev registered by the helper
> - * @image: info about image to blit
> - *
> - * A wrapper around sys_imageblit implemented by fbdev core
> - */
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -                                const struct fb_image *image)
> -{
> -       struct drm_fb_helper *helper = info->par;
> -
> -       sys_imageblit(info, image);
> -
> -       if (helper->funcs->fb_dirty)
> -               drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> -
>  /**
>   * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
>   * @info: fb_info struct pointer
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 8e5148bf40bb..f53fc49e34a4 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -34,6 +34,43 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
>         return 0;
>  }
>
> +static ssize_t drm_fbdev_generic_fb_write(struct fb_info *info, const char __user *buf,
> +                                         size_t count, loff_t *ppos)
> +{
> +       struct drm_fb_helper *helper = info->par;
> +       loff_t pos = *ppos;
> +       ssize_t ret;
> +
> +       ret = fb_sys_write(info, buf, count, ppos);
> +       if (ret > 0)
> +               drm_fb_helper_damage_range(helper, pos, ret);
> +       return ret;
> +}
> +
> +static void drm_fbdev_generic_fb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> +{
> +       struct drm_fb_helper *helper = info->par;
> +
> +       sys_fillrect(info, rect);
> +       drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
> +}
> +
> +static void drm_fbdev_generic_fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
> +{
> +       struct drm_fb_helper *helper = info->par;
> +
> +       sys_copyarea(info, area);
> +       drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
> +}
> +
> +static void drm_fbdev_generic_fb_imageblit(struct fb_info *info, const struct fb_image *image)
> +{
> +       struct drm_fb_helper *helper = info->par;
> +
> +       sys_imageblit(info, image);
> +       drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
> +}
> +
>  static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>  {
>         struct drm_fb_helper *fb_helper = info->par;
> @@ -56,12 +93,12 @@ static const struct fb_ops drm_fbdev_generic_fb_ops = {
>         .owner          = THIS_MODULE,
>         .fb_open        = drm_fbdev_generic_fb_open,
>         .fb_release     = drm_fbdev_generic_fb_release,
> -       .fb_read        = drm_fb_helper_sys_read,
> -       .fb_write       = drm_fb_helper_sys_write,
> +       .fb_read        = fb_sys_read,
> +       .fb_write       = drm_fbdev_generic_fb_write,
>         DRM_FB_HELPER_DEFAULT_OPS,
> -       .fb_fillrect    = drm_fb_helper_sys_fillrect,
> -       .fb_copyarea    = drm_fb_helper_sys_copyarea,
> -       .fb_imageblit   = drm_fb_helper_sys_imageblit,
> +       .fb_fillrect    = drm_fbdev_generic_fb_fillrect,
> +       .fb_copyarea    = drm_fbdev_generic_fb_copyarea,
> +       .fb_imageblit   = drm_fbdev_generic_fb_imageblit,
>         .fb_mmap        = fb_deferred_io_mmap,
>         .fb_destroy     = drm_fbdev_generic_fb_destroy,
>  };
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 80c402f4e379..e3240d749a43 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -259,18 +259,6 @@ void drm_fb_helper_damage_range(struct drm_fb_helper *helper, off_t off, size_t
>
>  void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>
> -ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -                              size_t count, loff_t *ppos);
> -ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
> -                               size_t count, loff_t *ppos);
> -
> -void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -                               const struct fb_fillrect *rect);
> -void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -                               const struct fb_copyarea *area);
> -void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -                                const struct fb_image *image);
> -
>  ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>                                size_t count, loff_t *ppos);
>  ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> @@ -398,35 +386,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>         return -ENODEV;
>  }
>
> -static inline ssize_t drm_fb_helper_sys_read(struct fb_info *info,
> -                                            char __user *buf, size_t count,
> -                                            loff_t *ppos)
> -{
> -       return -ENODEV;
> -}
> -
> -static inline ssize_t drm_fb_helper_sys_write(struct fb_info *info,
> -                                             const char __user *buf,
> -                                             size_t count, loff_t *ppos)
> -{
> -       return -ENODEV;
> -}
> -
> -static inline void drm_fb_helper_sys_fillrect(struct fb_info *info,
> -                                             const struct fb_fillrect *rect)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_copyarea(struct fb_info *info,
> -                                             const struct fb_copyarea *area)
> -{
> -}
> -
> -static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
> -                                              const struct fb_image *image)
> -{
> -}
> -
>  static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
>                                              size_t count, loff_t *ppos)
>  {
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
