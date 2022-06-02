Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10F53B75B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C5112EDB;
	Thu,  2 Jun 2022 10:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6D112EDA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:34:38 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w3so4151487plp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CD5X1PkPV9WQXcpjBxOI2IjqEZgdqz/Z+xAq6O+or1E=;
 b=S+JCvIcSS+n1SdB0+k/g5uENPdE3BX7Xy49FMjtEDz6k7pMl7RiQW4prqrWXYQccsR
 11OQNZUuvyRLLkROoBrbbdPUGZo6oQ9QyHCLfc6KCw5iJTkHQqvDKLybnAcP6ZlaXvag
 lXu8GRyLUV+Oiy0N/FljkU43LhwhBa+iEUmIw4PxLK5DhSr641vXt5+dgxfHX/NUDlpx
 4vCSkQALrOfyx62FPc58QUb2NwefflxJBU+eWRHtpfJf8vhc31nSeCDE+6MDiS8lc6V0
 sCQww+gQT/HFbr58Fflj1ZJyhTURjccIjAMQ5ZjLMBkjOnDO7PjzEy91AkJItk8VeMa/
 wVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CD5X1PkPV9WQXcpjBxOI2IjqEZgdqz/Z+xAq6O+or1E=;
 b=LXewIItT5B7EgPvwsiPUSH73tvWOQiEtekHtY4dnCTks/qKAiCRf8ShgJBPowXpfbP
 GmIMTCGUsXJoN+nS3ouPxrnTObKjadRM/4oH5wQCE30339YEk2mTI8EXtx/02Eht62CS
 4qkg+MejwM/UVBJhurfSCoaoU1oFlMhzm4yitHB+zsj+g1a6SkzCBhdqXRrIQyHXwAty
 IAQ68bS4m9TfzTWijamAczWGHOzH4gpeNYQzkJG4jzKrtsRj8j/6PqMngEJsobgVm4S7
 B9JJjVKDjZYl+ty2XSRVRD6x0cTnGJVAev/q9EK+ZN24/4hLYtd2ecwUO5wATJt4CxEW
 bNjg==
X-Gm-Message-State: AOAM531r98zji/Nq3dElbSm7XBu6d0ov8MpZ9SuxmdY1FROCJ2DmSiR7
 1Zx/vlEY+m0Tr74nZtB8j6tkL0TQvZT/f9WLnmc=
X-Google-Smtp-Source: ABdhPJzk/Fy1UsKgIv1JSTT0QJzYv1KzMdrryZc2iIiGAeeqtMKXoztsAXxrzD9FcC/c+/ARhZwHqAHLe6bAcNrM+0I=
X-Received: by 2002:a17:90a:c981:b0:1e6:75f0:d4f1 with SMTP id
 w1-20020a17090ac98100b001e675f0d4f1mr4671006pjt.62.1654166077744; Thu, 02 Jun
 2022 03:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-5-tzimmermann@suse.de>
 <CAMeQTsZHH0XOwXrogeWpeHjFHNeHCnwZT6aYR7G2dv1bM6F=kA@mail.gmail.com>
 <CAMeQTsaFg4Rq=WCv=GFuc2+fp-ePuuQQpJvgE3V3N9s+tps0sQ@mail.gmail.com>
 <78f8bd77-3dca-9cc6-b8e4-49d811d9dd47@suse.de>
In-Reply-To: <78f8bd77-3dca-9cc6-b8e4-49d811d9dd47@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 12:34:26 +0200
Message-ID: <CAMeQTsZVJ=8g6SUrc7Hadq60LJ8=fBOB3yUmC2b8iN3-cFkdQA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/ast: Fail probing if DCC channel could not be
 initialized
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 2, 2022 at 11:32 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Patrik
>
> Am 02.06.22 um 09:42 schrieb Patrik Jakobsson:
> > On Thu, Jun 2, 2022 at 9:25 AM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> >>
> >> On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >>>
> >>> Expect the hardware to provide a DDC channel. Fail probing if its
> >>> initialization fails.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> It's funny how I just did the same thing to gma500. Great minds think =
alike ;)
> >>
> >> Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> >
> > I just realized that the ast_i2c_chan is never freed. Could be fixed
> > in a follow-up patch?
>
> In ast_i2c_create(), there's a call to drmm_add_action_or_reset(), which
> sets up ast_i2c_release(), which in turn kfree's the memory. Unless I'm
> totally missing something here.

Oh, I missed that. Then never mind :)

>
> Best regards
> Thomas
>
> >
> >>
> >>
> >>> ---
> >>>   drivers/gpu/drm/ast/ast_drv.h  |  2 --
> >>>   drivers/gpu/drm/ast/ast_i2c.c  |  7 ++++---
> >>>   drivers/gpu/drm/ast/ast_mode.c | 38 ++++++++++++++++---------------=
---
> >>>   3 files changed, 22 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_=
drv.h
> >>> index 3055b0be7b67..2a55fc7303b9 100644
> >>> --- a/drivers/gpu/drm/ast/ast_drv.h
> >>> +++ b/drivers/gpu/drm/ast/ast_drv.h
> >>> @@ -132,7 +132,6 @@ struct ast_i2c_chan {
> >>>
> >>>   struct ast_vga_connector {
> >>>          struct drm_connector base;
> >>> -       struct ast_i2c_chan *i2c;
> >>>   };
> >>>
> >>>   static inline struct ast_vga_connector *
> >>> @@ -143,7 +142,6 @@ to_ast_vga_connector(struct drm_connector *connec=
tor)
> >>>
> >>>   struct ast_sil164_connector {
> >>>          struct drm_connector base;
> >>> -       struct ast_i2c_chan *i2c;
> >>>   };
> >>>
> >>>   static inline struct ast_sil164_connector *
> >>> diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_=
i2c.c
> >>> index 93e91c36d649..1d039ff1396e 100644
> >>> --- a/drivers/gpu/drm/ast/ast_i2c.c
> >>> +++ b/drivers/gpu/drm/ast/ast_i2c.c
> >>> @@ -117,7 +117,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_de=
vice *dev)
> >>>
> >>>          i2c =3D kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
> >>>          if (!i2c)
> >>> -               return NULL;
> >>> +               return ERR_PTR(-ENOMEM);
> >>>
> >>>          i2c->adapter.owner =3D THIS_MODULE;
> >>>          i2c->adapter.class =3D I2C_CLASS_DDC;
> >>> @@ -143,10 +143,11 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_=
device *dev)
> >>>
> >>>          ret =3D drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
> >>>          if (ret)
> >>> -               return NULL;
> >>> +               return ERR_PTR(ret);
> >>> +
> >>>          return i2c;
> >>>
> >>>   out_kfree:
> >>>          kfree(i2c);
> >>> -       return NULL;
> >>> +       return ERR_PTR(ret);
> >>>   }
> >>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast=
_mode.c
> >>> index bbc566c4c768..5f273b5dd769 100644
> >>> --- a/drivers/gpu/drm/ast/ast_mode.c
> >>> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >>> @@ -1334,19 +1334,18 @@ static int ast_vga_connector_init(struct drm_=
device *dev,
> >>>                                    struct ast_vga_connector *ast_vga_=
connector)
> >>>   {
> >>>          struct drm_connector *connector =3D &ast_vga_connector->base=
;
> >>> +       struct ast_i2c_chan *i2c;
> >>>          int ret;
> >>>
> >>> -       ast_vga_connector->i2c =3D ast_i2c_create(dev);
> >>> -       if (!ast_vga_connector->i2c)
> >>> -               drm_err(dev, "failed to add ddc bus for connector\n")=
;
> >>> +       i2c =3D ast_i2c_create(dev);
> >>> +       if (IS_ERR(i2c)) {
> >>> +               ret =3D PTR_ERR(i2c);
> >>> +               drm_err(dev, "failed to add ddc bus for connector; re=
t=3D%d\n", ret);
> >>> +               return ret;
> >>> +       }
> >>>
> >>> -       if (ast_vga_connector->i2c)
> >>> -               ret =3D drm_connector_init_with_ddc(dev, connector, &=
ast_vga_connector_funcs,
> >>> -                                                 DRM_MODE_CONNECTOR_=
VGA,
> >>> -                                                 &ast_vga_connector-=
>i2c->adapter);
> >>> -       else
> >>> -               ret =3D drm_connector_init(dev, connector, &ast_vga_c=
onnector_funcs,
> >>> -                                        DRM_MODE_CONNECTOR_VGA);
> >>> +       ret =3D drm_connector_init_with_ddc(dev, connector, &ast_vga_=
connector_funcs,
> >>> +                                         DRM_MODE_CONNECTOR_VGA, &i2=
c->adapter);
> >>>          if (ret)
> >>>                  return ret;
> >>>
> >>> @@ -1406,19 +1405,18 @@ static int ast_sil164_connector_init(struct d=
rm_device *dev,
> >>>                                       struct ast_sil164_connector *as=
t_sil164_connector)
> >>>   {
> >>>          struct drm_connector *connector =3D &ast_sil164_connector->b=
ase;
> >>> +       struct ast_i2c_chan *i2c;
> >>>          int ret;
> >>>
> >>> -       ast_sil164_connector->i2c =3D ast_i2c_create(dev);
> >>> -       if (!ast_sil164_connector->i2c)
> >>> -               drm_err(dev, "failed to add ddc bus for connector\n")=
;
> >>> +       i2c =3D ast_i2c_create(dev);
> >>> +       if (IS_ERR(i2c)) {
> >>> +               ret =3D PTR_ERR(i2c);
> >>> +               drm_err(dev, "failed to add ddc bus for connector; re=
t=3D%d\n", ret);
> >>> +               return ret;
> >>> +       }
> >>>
> >>> -       if (ast_sil164_connector->i2c)
> >>> -               ret =3D drm_connector_init_with_ddc(dev, connector, &=
ast_sil164_connector_funcs,
> >>> -                                                 DRM_MODE_CONNECTOR_=
DVII,
> >>> -                                                 &ast_sil164_connect=
or->i2c->adapter);
> >>> -       else
> >>> -               ret =3D drm_connector_init(dev, connector, &ast_sil16=
4_connector_funcs,
> >>> -                                        DRM_MODE_CONNECTOR_DVII);
> >>> +       ret =3D drm_connector_init_with_ddc(dev, connector, &ast_sil1=
64_connector_funcs,
> >>> +                                         DRM_MODE_CONNECTOR_DVII, &i=
2c->adapter);
> >>>          if (ret)
> >>>                  return ret;
> >>>
> >>> --
> >>> 2.36.1
> >>>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
