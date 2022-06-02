Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18853B47F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11210E1E4;
	Thu,  2 Jun 2022 07:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D323F10E1E4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:43:11 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 129so4093161pgc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OThWHN0EYYEZSEUp0BQ5BonhRD6mun5pn/B9FKoFiOo=;
 b=Ki3wRoJC0DB/W4iahhKYcIExwfcbZVsDMShN3Hxj8nzxTKOjXYIwwUcKAZcgFyHN9Q
 mfDY53/w2slYeBSE7vxFm6iv508fnYzLFnQyCiiBKZE9ho0X1KaXvtBpb/Rcmeqtc+xc
 2FwMsuc4Vxj4j46e3pGr2eROuP5BpWls818Sm8AjU0KB9zzJdmORCETR/5T4FEg9IBSL
 298/MxR7Yk9HUhxH93P9O4/4E7wMDoWs113a+fgWbBcHBlxH9IoTp25YuKUBwTC5sUCq
 p3AzdOpvyw1x8vlWMdsgx0t1Gz5fNlTXBPnXGJQlmbmXrWbWXo8k5bgHNY83t15i9Oxk
 DBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OThWHN0EYYEZSEUp0BQ5BonhRD6mun5pn/B9FKoFiOo=;
 b=yWXK3moG/PAntZEZzcO+DcRd0KDuF1XE5M1xk7UV7/6q/YCGLizxf/PR2poosYKsLj
 Oggc75ue4EhJf7IUD6cHO+VEx09iXGmH/X9v5mHj+q3Y/394044NSbfXmy4wBCrdzFrF
 +8Ojgl6Hq9dCMs8QHhQ4B2PdbmoMm027KmkhEV9vySLhTk6w42DSj5oS7eMGpdWS6iSB
 Xdvk45II0MR51TtII62gBlpNxgm13rOmu8EwNYG9FhnQNWb5ORBVIzVpLn+8sXa6zhO3
 vwtyZRmnEeSNc7ukRioUgZVD7A5EobERclP3cVeMD+LgnDO/0NtYk+d+EGriBA/YQ1XX
 biPg==
X-Gm-Message-State: AOAM530fwZ7MIuOanOYJBuJ07b8j1o5yM8rEy5gjRWSgxV6sAsXEHliB
 Y1zq1J2/tVnTFHuYq8rzNbj8VPpqt272URVJZd4=
X-Google-Smtp-Source: ABdhPJzw+kjy+xk2U7D3cAvzAIwe3zyKa0mHwiICJwvaXKxzJ/Ci25uF0g1X9TJSpWplc7mLsLWl2H4US6/QHyTkItE=
X-Received: by 2002:a63:8749:0:b0:3fc:9fd7:1e20 with SMTP id
 i70-20020a638749000000b003fc9fd71e20mr3145016pge.619.1654155791439; Thu, 02
 Jun 2022 00:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-5-tzimmermann@suse.de>
 <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
In-Reply-To: <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:42:59 +0200
Message-ID: <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>
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

On Thu, Jun 2, 2022 at 9:25 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Expect the hardware to provide a DDC channel. Fail probing if its
> > initialization fails.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> It's funny how I just did the same thing to gma500. Great minds think alike ;)
>
> Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I just realized that the ast_i2c_chan is never freed. Could be fixed
in a follow-up patch?

>
>
> > ---
> >  drivers/gpu/drm/ast/ast_drv.h  |  2 --
> >  drivers/gpu/drm/ast/ast_i2c.c  |  7 ++++---
> >  drivers/gpu/drm/ast/ast_mode.c | 38 ++++++++++++++++------------------
> >  3 files changed, 22 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> > index 3055b0be7b67..2a55fc7303b9 100644
> > --- a/drivers/gpu/drm/ast/ast_drv.h
> > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > @@ -132,7 +132,6 @@ struct ast_i2c_chan {
> >
> >  struct ast_vga_connector {
> >         struct drm_connector base;
> > -       struct ast_i2c_chan *i2c;
> >  };
> >
> >  static inline struct ast_vga_connector *
> > @@ -143,7 +142,6 @@ to_ast_vga_connector(struct drm_connector *connector)
> >
> >  struct ast_sil164_connector {
> >         struct drm_connector base;
> > -       struct ast_i2c_chan *i2c;
> >  };
> >
> >  static inline struct ast_sil164_connector *
> > diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
> > index 93e91c36d649..1d039ff1396e 100644
> > --- a/drivers/gpu/drm/ast/ast_i2c.c
> > +++ b/drivers/gpu/drm/ast/ast_i2c.c
> > @@ -117,7 +117,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
> >
> >         i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
> >         if (!i2c)
> > -               return NULL;
> > +               return ERR_PTR(-ENOMEM);
> >
> >         i2c->adapter.owner = THIS_MODULE;
> >         i2c->adapter.class = I2C_CLASS_DDC;
> > @@ -143,10 +143,11 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
> >
> >         ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
> >         if (ret)
> > -               return NULL;
> > +               return ERR_PTR(ret);
> > +
> >         return i2c;
> >
> >  out_kfree:
> >         kfree(i2c);
> > -       return NULL;
> > +       return ERR_PTR(ret);
> >  }
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> > index bbc566c4c768..5f273b5dd769 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -1334,19 +1334,18 @@ static int ast_vga_connector_init(struct drm_device *dev,
> >                                   struct ast_vga_connector *ast_vga_connector)
> >  {
> >         struct drm_connector *connector = &ast_vga_connector->base;
> > +       struct ast_i2c_chan *i2c;
> >         int ret;
> >
> > -       ast_vga_connector->i2c = ast_i2c_create(dev);
> > -       if (!ast_vga_connector->i2c)
> > -               drm_err(dev, "failed to add ddc bus for connector\n");
> > +       i2c = ast_i2c_create(dev);
> > +       if (IS_ERR(i2c)) {
> > +               ret = PTR_ERR(i2c);
> > +               drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
> > +               return ret;
> > +       }
> >
> > -       if (ast_vga_connector->i2c)
> > -               ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> > -                                                 DRM_MODE_CONNECTOR_VGA,
> > -                                                 &ast_vga_connector->i2c->adapter);
> > -       else
> > -               ret = drm_connector_init(dev, connector, &ast_vga_connector_funcs,
> > -                                        DRM_MODE_CONNECTOR_VGA);
> > +       ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> > +                                         DRM_MODE_CONNECTOR_VGA, &i2c->adapter);
> >         if (ret)
> >                 return ret;
> >
> > @@ -1406,19 +1405,18 @@ static int ast_sil164_connector_init(struct drm_device *dev,
> >                                      struct ast_sil164_connector *ast_sil164_connector)
> >  {
> >         struct drm_connector *connector = &ast_sil164_connector->base;
> > +       struct ast_i2c_chan *i2c;
> >         int ret;
> >
> > -       ast_sil164_connector->i2c = ast_i2c_create(dev);
> > -       if (!ast_sil164_connector->i2c)
> > -               drm_err(dev, "failed to add ddc bus for connector\n");
> > +       i2c = ast_i2c_create(dev);
> > +       if (IS_ERR(i2c)) {
> > +               ret = PTR_ERR(i2c);
> > +               drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
> > +               return ret;
> > +       }
> >
> > -       if (ast_sil164_connector->i2c)
> > -               ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> > -                                                 DRM_MODE_CONNECTOR_DVII,
> > -                                                 &ast_sil164_connector->i2c->adapter);
> > -       else
> > -               ret = drm_connector_init(dev, connector, &ast_sil164_connector_funcs,
> > -                                        DRM_MODE_CONNECTOR_DVII);
> > +       ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> > +                                         DRM_MODE_CONNECTOR_DVII, &i2c->adapter);
> >         if (ret)
> >                 return ret;
> >
> > --
> > 2.36.1
> >
