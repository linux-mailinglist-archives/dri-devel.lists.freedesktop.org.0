Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CFA53B44B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5BF10F7CE;
	Thu,  2 Jun 2022 07:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5E10F2D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:25:27 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id cx11so4184398pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNvjcnNMLfJljnCCVC9aiskHW8ogxyZ9DcuxT/I7+d0=;
 b=LzPqT+8iVUlloIPSfqIxloMnRKmvhhLVGoyTWNu4zTlVdamR9i6LrtWp2RaumMlKtk
 8dNdhOCLHQrLPskRxqKVA6DZjxmRVwEk3EYRRuozVBsjVd8RoHWUy3E/OK/fdVE2/y+Z
 knSaR3UgJS0rXOQ2JS7crZXkdbDeV2pfOHRZ/AfAJZxxXaE0mHx+RLPhvx1LToLE9m/r
 6PHEOi8zXLxRYA+q+zf+8RtqnHMAoxwBJrh/QUcvJ3aRoCFNE0dTU0OYAkeq0AereGGc
 sL/rczFk7FpQJCBaOe8mKVDUgOVwjlX6xrTlXlrHsYu0fbjLmwWoDgi6x2byVv9RHniR
 LBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNvjcnNMLfJljnCCVC9aiskHW8ogxyZ9DcuxT/I7+d0=;
 b=nCGWoHxo/XVjSttEZVu0g70dTnyOZa+F2SkqrBP2u2W0WbvJGLyIEBm27ngY1Cjv6I
 n9HLDHtzbwqpqqgu2ZFOVE/QEa8r49F0/p53/n9VFd8C9n1wm/BcJwwtT7p6OgFU5jqv
 bJ9j5I46p+l6m81KS1zj26Oaih+qu8G7VLfvynkAvxywD9lm/3omGTHWB5t7UBwPvtuo
 q2KYY9vzGm2iuRBx1dsJiKxwJ1XJkOnltsJtFP1VhgB1rpynQsl6knh5g75W93weY+uA
 LLWaNd7YQmnGLgwoa8f8sYk8FA06LlsAIpgjq8s6CwwfptNJXRzeujWLbB91hyM9LOV8
 w6YQ==
X-Gm-Message-State: AOAM533POdbMthdyxWzht3DZC05/mM5ogKyW4fixRk6ypgvWwSoEG5zp
 7CaKOQG6fC5KnRshS2bsfGoQHDWFNmtdiyMzZjqfmH+OD9c=
X-Google-Smtp-Source: ABdhPJxfFvcWg9mOpmvxsUjTiXuS7+NhpsNcQbRlzQHqHy2xco8whhcf/cJb4Dt2ToThTUeyEU1qQS9I6CmRGG7uvnc=
X-Received: by 2002:a17:903:3015:b0:163:c6a5:dcb with SMTP id
 o21-20020a170903301500b00163c6a50dcbmr3576251pla.38.1654154727185; Thu, 02
 Jun 2022 00:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-5-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-5-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:25:15 +0200
Message-ID: <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/ast: Fail probing if DCC channel could not be
 initialized
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Expect the hardware to provide a DDC channel. Fail probing if its
> initialization fails.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

It's funny how I just did the same thing to gma500. Great minds think alike ;)

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
>  drivers/gpu/drm/ast/ast_drv.h  |  2 --
>  drivers/gpu/drm/ast/ast_i2c.c  |  7 ++++---
>  drivers/gpu/drm/ast/ast_mode.c | 38 ++++++++++++++++------------------
>  3 files changed, 22 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 3055b0be7b67..2a55fc7303b9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -132,7 +132,6 @@ struct ast_i2c_chan {
>
>  struct ast_vga_connector {
>         struct drm_connector base;
> -       struct ast_i2c_chan *i2c;
>  };
>
>  static inline struct ast_vga_connector *
> @@ -143,7 +142,6 @@ to_ast_vga_connector(struct drm_connector *connector)
>
>  struct ast_sil164_connector {
>         struct drm_connector base;
> -       struct ast_i2c_chan *i2c;
>  };
>
>  static inline struct ast_sil164_connector *
> diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
> index 93e91c36d649..1d039ff1396e 100644
> --- a/drivers/gpu/drm/ast/ast_i2c.c
> +++ b/drivers/gpu/drm/ast/ast_i2c.c
> @@ -117,7 +117,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>
>         i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
>         if (!i2c)
> -               return NULL;
> +               return ERR_PTR(-ENOMEM);
>
>         i2c->adapter.owner = THIS_MODULE;
>         i2c->adapter.class = I2C_CLASS_DDC;
> @@ -143,10 +143,11 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>
>         ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
>         if (ret)
> -               return NULL;
> +               return ERR_PTR(ret);
> +
>         return i2c;
>
>  out_kfree:
>         kfree(i2c);
> -       return NULL;
> +       return ERR_PTR(ret);
>  }
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index bbc566c4c768..5f273b5dd769 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1334,19 +1334,18 @@ static int ast_vga_connector_init(struct drm_device *dev,
>                                   struct ast_vga_connector *ast_vga_connector)
>  {
>         struct drm_connector *connector = &ast_vga_connector->base;
> +       struct ast_i2c_chan *i2c;
>         int ret;
>
> -       ast_vga_connector->i2c = ast_i2c_create(dev);
> -       if (!ast_vga_connector->i2c)
> -               drm_err(dev, "failed to add ddc bus for connector\n");
> +       i2c = ast_i2c_create(dev);
> +       if (IS_ERR(i2c)) {
> +               ret = PTR_ERR(i2c);
> +               drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
> +               return ret;
> +       }
>
> -       if (ast_vga_connector->i2c)
> -               ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> -                                                 DRM_MODE_CONNECTOR_VGA,
> -                                                 &ast_vga_connector->i2c->adapter);
> -       else
> -               ret = drm_connector_init(dev, connector, &ast_vga_connector_funcs,
> -                                        DRM_MODE_CONNECTOR_VGA);
> +       ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> +                                         DRM_MODE_CONNECTOR_VGA, &i2c->adapter);
>         if (ret)
>                 return ret;
>
> @@ -1406,19 +1405,18 @@ static int ast_sil164_connector_init(struct drm_device *dev,
>                                      struct ast_sil164_connector *ast_sil164_connector)
>  {
>         struct drm_connector *connector = &ast_sil164_connector->base;
> +       struct ast_i2c_chan *i2c;
>         int ret;
>
> -       ast_sil164_connector->i2c = ast_i2c_create(dev);
> -       if (!ast_sil164_connector->i2c)
> -               drm_err(dev, "failed to add ddc bus for connector\n");
> +       i2c = ast_i2c_create(dev);
> +       if (IS_ERR(i2c)) {
> +               ret = PTR_ERR(i2c);
> +               drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
> +               return ret;
> +       }
>
> -       if (ast_sil164_connector->i2c)
> -               ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> -                                                 DRM_MODE_CONNECTOR_DVII,
> -                                                 &ast_sil164_connector->i2c->adapter);
> -       else
> -               ret = drm_connector_init(dev, connector, &ast_sil164_connector_funcs,
> -                                        DRM_MODE_CONNECTOR_DVII);
> +       ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> +                                         DRM_MODE_CONNECTOR_DVII, &i2c->adapter);
>         if (ret)
>                 return ret;
>
> --
> 2.36.1
>
