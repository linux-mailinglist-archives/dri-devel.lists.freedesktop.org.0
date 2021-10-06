Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7444246A9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F486EE13;
	Wed,  6 Oct 2021 19:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6566EE13
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:24:55 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so671244oou.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDFkYpBLosMxYGZY/CSFRmwq0TA2J/uDPiB9rdiCrxo=;
 b=QYBIPrg2eaz3wvbHzdK8druUTk4RvAXaIqY3jq6a7XTOjoSbzytp4oRw/HNHFITESb
 R5oXYE/V9KPMxOHgy6P1uIsiRt18H7GwNbi9EtYgmSGtphzlqP6JqsT3kjscyARWMRBv
 pH6CDaW8u7ygyS0WsQLoJUB5kErLh+xQNXv7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDFkYpBLosMxYGZY/CSFRmwq0TA2J/uDPiB9rdiCrxo=;
 b=rSJ3UXIhgJ9q8sMN3iXiO/YYFkpeesV5HXWgUDfcFBa9Y4byQUaImNdYn/dqs/YZ26
 yRiuSvObVTE+MJpaEI+a4g1w7FQD1UxFgM5otUtilx9Mwqr/yLf8/QIE/35Mk/BvhMlx
 VBRL+4WhafKiqxvVSSSmIT7P3MbJ/3iRkNZpMFW6S/Sdufg2LuISG5nftniPQeiHwxHo
 Sc3Ga6ypKuB+NykFENU5IZ+I2+3/MMmOGfHD2hJf2lbTVmAIvR2njHNTktqu1/b4C4NS
 HS+ercTA31muTzLzOvSRkWGAIuZg0ur9csGQFb7ckw4aupfZJst/n7B6n1v9GchC3zBq
 xrDQ==
X-Gm-Message-State: AOAM531G5qLimJtAXHvujDE6SJanOWp2nFHM9lErdb49pACvT0z2fgEG
 fdGDKjxEcEG27M0/iRiIN7aYAPaEROKLLmHGUVRZkg==
X-Google-Smtp-Source: ABdhPJzlXfhvxJdefJkXGBA71LCE/K891OK21Kjnag+DHtdAi6HqdOLbsJMrNRX3fqn2DKQftz0Cr03YScpfrQcDRjE=
X-Received: by 2002:a4a:d814:: with SMTP id f20mr115483oov.66.1633548295016;
 Wed, 06 Oct 2021 12:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211006151921.312714-1-contact@emersion.fr>
In-Reply-To: <20211006151921.312714-1-contact@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 6 Oct 2021 21:24:44 +0200
Message-ID: <CAKMK7uGsFDGR7TFR1A5utrtyOL19Vc2=MEXO3XLbEOexJcuj0A@mail.gmail.com>
Subject: Re: [PATCH RFC] drm: introduce DRM_MODE_FB_PERSIST
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Dennis Filder <d.filder@web.de>, Pekka Paalanen <ppaalanen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 6, 2021 at 5:19 PM Simon Ser <contact@emersion.fr> wrote:
> This new ADDFB2 flag allows callers to mark a framebuffer as
> "persistent", and no longer have RMFB semantics when the DRM
> file is closed.
>
> [1]: https://lore.kernel.org/dri-devel/YTJypepF1Hpc2YYT@reader/
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Dennis Filder <d.filder@web.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>
> I'm not sure this is enough, but posting this to get initial
> feedback and allow to start e.g. Plymouth experiments. I'll
> follow up with an IGT test soon.
>
>  drivers/gpu/drm/drm_framebuffer.c |  6 ++++--
>  include/uapi/drm/drm_mode.h       | 15 +++++++++++++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..9b398838e1f4 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -292,7 +292,8 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>         struct drm_framebuffer *fb;
>         int ret;
>
> -       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS)) {
> +       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS |
> +                        DRM_MODE_FB_PERSIST)) {
>                 DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flags);
>                 return ERR_PTR(-EINVAL);
>         }
> @@ -789,7 +790,8 @@ void drm_fb_release(struct drm_file *priv)
>          * at it any more.
>          */
>         list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
> -               if (drm_framebuffer_read_refcount(fb) > 1) {
> +               if (drm_framebuffer_read_refcount(fb) > 1 &&
> +                   !(fb->flags & DRM_MODE_FB_PERSIST)) {
>                         list_move_tail(&fb->filp_head, &arg.fbs);
>                 } else {
>                         list_del_init(&fb->filp_head);
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index e1e351682872..c7a7089ec31e 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -662,6 +662,21 @@ struct drm_mode_fb_cmd {
>
>  #define DRM_MODE_FB_INTERLACED (1<<0) /* for interlaced framebuffers */
>  #define DRM_MODE_FB_MODIFIERS  (1<<1) /* enables ->modifer[] */
> +/**
> + * DRM_MODE_FB_PERSIST
> + *
> + * DRM framebuffers are normally implicitly removed when their owner closes the
> + * DRM FD. Passing this flag will make the framebuffer persistent: it will not
> + * be implicitly removed. This is useful to implement flicker-free transitions
> + * between two processes.
> + *
> + * This flag doesn't change the behavior of &DRM_IOCTL_MODE_RMFB.
> + *
> + * User-space should ensure the framebuffer doesn't expose any sensitive user
> + * information: persistent framebuffers can be read back by the next DRM
> + * master.

Should probably explain here that the persistent fb stays around for
as long as it's still in use by a plane, but will disappear
automatically when it's no longer in active use.

Also I guess there was some discussion I've missed on why we exclude
rmfb from this (unlike the CLOSEFB thing robclark proposed ages ago).
The nice thing about closefb is that you can give it persistent
semantics retroactively, so don't need to re-wrap an gem_bo and do a
page flip when you quit.
-Daniel

> + */
> +#define DRM_MODE_FB_PERSIST (1 << 2)
>
>  struct drm_mode_fb_cmd2 {
>         __u32 fb_id;
> --
> 2.33.0
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
