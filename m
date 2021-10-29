Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB84400BC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 18:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE096E156;
	Fri, 29 Oct 2021 16:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B3E6EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:55:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d3so17161117wrh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qw9eUIKKFJxw16iLE6OQRzEo/+G/I/ws7yCWh747U2o=;
 b=C33kUFoG9cb+/x4ofa7cyBAQz8S60FQ2WR7DHWWhEHMtAldrpfZ+Kz1wQR24R9ycHV
 doAAwbMrY7jOyC5XLNlKpO91th966/kivL9zrq/piWrb26fJgxUQv1F9O61VH6kdBNzt
 +6BL9AF6JJ7XnWdS8opuTknLO53PvYwsRmoJsf0qkj71r4Nsr/8m2M46CoUEwAhLvlrL
 toJ0YR7QeeuofH8MmTcQWH8qKHbGo31SV5ZE/Rvq8ao2kNXNWCfHuq8NkAP0IpCL4pMp
 /JY4GuanuhM+eVhfdlG4qCdWSn4rJnYdNCd5AepgKcG4v1vIX6i+IVSSA4qkGaaHldmL
 8DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qw9eUIKKFJxw16iLE6OQRzEo/+G/I/ws7yCWh747U2o=;
 b=sFdidpHDx6Vn0+JzYKL7LKMIMYTonJ0fUrTw+6nGK14ZQ0Gdql+0JpJlQadCdQMWXc
 uVrxtg+/xMaSwuE0PF0rVk7uuMK5Oux/apvLATKS6+b23FudRPgaV2Ox0nxrI+hbOdIV
 sm/sitN+4M8cN8LazSbHtBQ/K0drsslKkQAixXL6xvyrisBzH10kTRTcxre+F12LFpkZ
 QKqvjler6ase7+X1bTVipABcH3wxnSurOHsVeD7nOA1MrG2C8zciKAKWYdPq7wxFRcpb
 dzqkdtwCoi9jcKpzopOu528G/6Ln9hAqF8MCpH3+oNzTZ/+auBWoHDp9qX2NIXu/eDWi
 FCgA==
X-Gm-Message-State: AOAM533D/2eJ++S4W1EPITbGevPOun8b4H+AJJrgSe/vzgUOlIRDebbf
 +sWtRwnNtwKFZ/jd/iqH3edFsdMbx35mA96z8Uw=
X-Google-Smtp-Source: ABdhPJw9Owdy8eqtoHZ5MoZTgP0TClCRwRmVH+TYJJzZNR9zxAAgQQGskCuZ+tXGL5hUOLwwgf46l8LFmPR+RPpxbVo=
X-Received: by 2002:a5d:64c5:: with SMTP id f5mr5832309wri.222.1635526549506; 
 Fri, 29 Oct 2021 09:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181240.213806-1-paul@crapouillou.net>
 <20211026181240.213806-6-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-6-paul@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Fri, 29 Oct 2021 18:55:38 +0200
Message-ID: <CAFsFa86QaujdmGMLC6R8p15HKv3er3dN9dirgfu6aWCdjQNJ5A@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 5/6] drm/ingenic: Upload palette before frame
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie <paul@boddie.org.uk>,
 list@opendingux.net, 
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>

On Tue, Oct 26, 2021 at 8:13 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> When using C8 color mode, make sure that the palette is always uploaded
> before a frame; otherwise the very first frame will have wrong colors.
>
> Do that by changing the link order of the DMA descriptors.
>
> v3: Fix ingenic_drm_get_new_priv_state() called instead of
>     ingenic_drm_get_priv_state()
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 53 ++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index cbc76cede99e..a5e2880e07a1 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -66,6 +66,7 @@ struct jz_soc_info {
>
>  struct ingenic_drm_private_state {
>         struct drm_private_state base;
> +       bool use_palette;
>  };
>
>  struct ingenic_drm {
> @@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct drm_private_state *state)
>         return container_of(state, struct ingenic_drm_private_state, base);
>  }
>
> +static struct ingenic_drm_private_state *
> +ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
> +{
> +       struct drm_private_state *priv_state;
> +
> +       priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
> +       if (IS_ERR(priv_state))
> +               return ERR_CAST(priv_state);
> +
> +       return to_ingenic_drm_priv_state(priv_state);
> +}
> +
> +static struct ingenic_drm_private_state *
> +ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
> +{
> +       struct drm_private_state *priv_state;
> +
> +       priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
> +       if (!priv_state)
> +               return NULL;
> +
> +       return to_ingenic_drm_priv_state(priv_state);
> +}
> +
>  static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
>  {
>         switch (reg) {
> @@ -183,11 +208,18 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>                                            struct drm_atomic_state *state)
>  {
>         struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> +       struct ingenic_drm_private_state *priv_state;
> +       unsigned int next_id;
> +
> +       priv_state = ingenic_drm_get_priv_state(priv, state);
> +       if (WARN_ON(IS_ERR(priv_state)))
> +               return;
>
>         regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
>
> -       /* Set address of our DMA descriptor chain */
> -       regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
> +       /* Set addresses of our DMA descriptor chains */
> +       next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
> +       regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
>         regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
>
>         regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
> @@ -393,6 +425,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>         struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>                                                                                  plane);
>         struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
> +       struct ingenic_drm_private_state *priv_state;
>         struct drm_crtc_state *crtc_state;
>         struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
>         int ret;
> @@ -405,6 +438,10 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       priv_state = ingenic_drm_get_priv_state(priv, state);
> +       if (IS_ERR(priv_state))
> +               return PTR_ERR(priv_state);
> +
>         ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>                                                   DRM_PLANE_HELPER_NO_SCALING,
>                                                   DRM_PLANE_HELPER_NO_SCALING,
> @@ -423,6 +460,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>              (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
>                 return -EINVAL;
>
> +       priv_state->use_palette = new_plane_state->fb &&
> +               new_plane_state->fb->format->format == DRM_FORMAT_C8;
> +
>         /*
>          * Require full modeset if enabling or disabling a plane, or changing
>          * its position, size or depth.
> @@ -583,6 +623,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>         struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state, plane);
>         struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state, plane);
>         unsigned int width, height, cpp, next_id, plane_id;
> +       struct ingenic_drm_private_state *priv_state;
>         struct drm_crtc_state *crtc_state;
>         struct ingenic_dma_hwdesc *hwdesc;
>         dma_addr_t addr;
> @@ -600,19 +641,19 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>                 height = newstate->src_h >> 16;
>                 cpp = newstate->fb->format->cpp[0];
>
> -               hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
> +               priv_state = ingenic_drm_get_new_priv_state(priv, state);
> +               next_id = (priv_state && priv_state->use_palette) ? HWDESC_PALETTE : plane_id;
>
> +               hwdesc = &priv->dma_hwdescs->hwdesc[plane_id];
>                 hwdesc->addr = addr;
>                 hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> +               hwdesc->next = dma_hwdesc_addr(priv, next_id);
>
>                 if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>                         fourcc = newstate->fb->format->format;
>
>                         ingenic_drm_plane_config(priv->dev, plane, fourcc);
>
> -                       next_id = fourcc == DRM_FORMAT_C8 ? HWDESC_PALETTE : 0;
> -                       priv->dma_hwdescs->hwdesc[0].next = dma_hwdesc_addr(priv, next_id);
> -
>                         crtc_state->color_mgmt_changed = fourcc == DRM_FORMAT_C8;
>                 }
>
> --
> 2.33.0
>
