Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFA9153D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC4289B57;
	Mon, 24 Jun 2024 16:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G4Wo0tvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DCC89B57
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:31:31 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-44056f72257so1114661cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719246690; x=1719851490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4fofXsIYYcUkuRwyEj47LNTu/GpV5ONYOayCRpxVsE=;
 b=G4Wo0tvHp7QmwPsZMEGQQnj6WBrKvkK0kO+i6c2+cOW4X3bfNt0Z8usKdq2FVLjimF
 mXgKToTtOCp0qKEAQ9bDJwHw92Mm4SQZToQilAKwshH+Jyw2H3cWeAB6qCuiRbcCwGch
 nWxn5KDmX+JCxzfSfc/5odIqIUeJ9QCWOWMdPmQCHaBojFppJd5uuiqeowEUOFBVZa4H
 hasGGMFUW0TVg7ql2s5mZ3J0UrkzYI8WOYq3YbpnPy5cRK4ko4kjONZxhGK4EjlAsTHa
 BP4Yg1a52cVnqyaS8mo3QmyEwV8uVdIJqFWDWbdZAl+gKZimKcds9ImdJntvun4pIQ5y
 Od0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719246690; x=1719851490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4fofXsIYYcUkuRwyEj47LNTu/GpV5ONYOayCRpxVsE=;
 b=RjO1hgSDoRN7tlJAS8Yk89dJD5zJO22R0HBz98YzBTorExmLcvEKhuorTuj/r1G2rX
 o9bbIMZ+PVV3WkC95LjEfGZ42AF7SQ/BZCRW8P4rBd3g29bH8fGA4FUONA5qksd8RmdG
 TU7uhWrbpCnhUYSiXr49vX7LEyYJXDmpfYM2hsjJyrO3vwnjmprDAoILpo3HyvVaHQjg
 WLrt3QvPL5QimnULpWH9OCeJpmgRiiM+0V8fWa9C4CykAEqkot/kf8/FUu3xni+nqcb1
 4FH5q7UZu4zb9/evnqE6vQmt9BvEx6GzwJvJN5ReAWgt5ggo/+1NQYjSkVHrcGOFi1cA
 zPIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvpVdWDFu3aplO+fwN4M2cPT6DNNXTz4ePzic5BCJ3vhJznc4DHTmDrglckLbUQZkvGiPHDuFa/Pq+kqKvXETda+Cp3G0xXH6cgTM6PFR6
X-Gm-Message-State: AOJu0YwStxV3DPQjjYBK3am30+UUyH10xeOwC8dIU755TojKw6yvRUCd
 ed4GKcIzrodmtZrAntrYLcBc5dEvA5OcOLXjbJ1OJizKKYdCEtocmM2Vnpjiirv0G2+JZ5Jg3Ez
 fGZ1O9guMJKV+DUdq9mEJu1yvnbyiGIORJxOn
X-Google-Smtp-Source: AGHT+IG1zecr1N057X6yYwZ08s24kL36wYtFxRzdL/X3h8Y/3cfMKPcsBorSUybV7L06JvCRqb1FevbPjxKkeKOWoKk=
X-Received: by 2002:a05:622a:6fc7:b0:444:e366:3fda with SMTP id
 d75a77b69052e-444e36643aamr4050431cf.27.1719246690014; Mon, 24 Jun 2024
 09:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-4-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zvkl2wyqp3iem4ln4qkbhgvxafsfn5wkkmqwhufabm2gqs3eqw@vmqs3lx72ekk>
In-Reply-To: <zvkl2wyqp3iem4ln4qkbhgvxafsfn5wkkmqwhufabm2gqs3eqw@vmqs3lx72ekk>
From: Doug Anderson <dianders@google.com>
Date: Mon, 24 Jun 2024 09:31:14 -0700
Message-ID: <CAD=FV=V9tjY-g=w1Dwj+9oiTWfku8Bt48OUPJqYUqZaJrY8C1Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped
 MIPI DCS functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jikos@kernel.org, benjamin.tissoires@redhat.co, hsinyi@google.com, 
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 24, 2024 at 8:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jun 24, 2024 at 10:19:24PM GMT, Zhaoxiong Lv wrote:
> > Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers t=
o
> > simplify driver's init/enable/exit code.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 793 +++++++++---------
> >  1 file changed, 390 insertions(+), 403 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers=
/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index a9c483a7b3fa..e836260338bf 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -19,17 +19,13 @@
> >  #include <linux/of.h>
> >  #include <linux/regulator/consumer.h>
> >
> > -#define JD9365DA_INIT_CMD_LEN                2
> > -
> > -struct jadard_init_cmd {
> > -     u8 data[JD9365DA_INIT_CMD_LEN];
> > -};
> > +struct jadard;
> >
> >  struct jadard_panel_desc {
> >       const struct drm_display_mode mode;
> >       unsigned int lanes;
> >       enum mipi_dsi_pixel_format format;
> > -     const struct jadard_init_cmd *init_cmds;
> > +     int (*init)(struct jadard *jadard);
> >       u32 num_init_cmds;
> >  };
> >
> > @@ -50,46 +46,33 @@ static inline struct jadard *panel_to_jadard(struct=
 drm_panel *panel)
> >
> >  static int jadard_enable(struct drm_panel *panel)
> >  {
> > -     struct device *dev =3D panel->dev;
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > -     struct mipi_dsi_device *dsi =3D jadard->dsi;
> > -     int err;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> >
> >       msleep(120);
> >
> > -     err =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > -     if (err < 0)
> > -             DRM_DEV_ERROR(dev, "failed to exit sleep mode ret =3D %d\=
n", err);
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >
> > -     err =3D  mipi_dsi_dcs_set_display_on(dsi);
> > -     if (err < 0)
> > -             DRM_DEV_ERROR(dev, "failed to set display on ret =3D %d\n=
", err);
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> >
> > -     return 0;
> > +     return dsi_ctx.accum_err;
> >  }
> >
> >  static int jadard_disable(struct drm_panel *panel)
> >  {
> > -     struct device *dev =3D panel->dev;
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > -     int ret;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> >
> > -     ret =3D mipi_dsi_dcs_set_display_off(jadard->dsi);
> > -     if (ret < 0)
> > -             DRM_DEV_ERROR(dev, "failed to set display off: %d\n", ret=
);
> > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >
> > -     ret =3D mipi_dsi_dcs_enter_sleep_mode(jadard->dsi);
> > -     if (ret < 0)
> > -             DRM_DEV_ERROR(dev, "failed to enter sleep mode: %d\n", re=
t);
> > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >
> > -     return 0;
> > +     return dsi_ctx.accum_err;
> >  }
> >
> >  static int jadard_prepare(struct drm_panel *panel)
> >  {
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > -     const struct jadard_panel_desc *desc =3D jadard->desc;
> > -     unsigned int i;
> >       int ret;
> >
> >       ret =3D regulator_enable(jadard->vccio);
> > @@ -109,13 +92,9 @@ static int jadard_prepare(struct drm_panel *panel)
> >       gpiod_set_value(jadard->reset, 1);
> >       msleep(130);
> >
> > -     for (i =3D 0; i < desc->num_init_cmds; i++) {
> > -             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[i]=
;
> > -
> > -             ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365D=
A_INIT_CMD_LEN);
>
> This function usesd mipi_dsi_dcs_write_buffer()...
>
> > -             if (ret < 0)
> > -                     return ret;
> > -     }
> > +     ret =3D jadard->desc->init(jadard);
> > +     if (ret)
> > +             return ret;
> >
> >       return 0;
>
> [...]
>
> > +static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
>
> ... while your code uses mipi_dsi_dcs_write_seq_multi(), which
> internally calls mipi_dsi_generic_write_multi(). These two function use
> different packet types to send the payload. To be conservatite, please
> use mipi_dsi_dcs_write_buffer_multi().

Are you certain about this? I see that mipi_dsi_dcs_write_seq_multi()
is just a wrapper on mipi_dsi_dcs_write_buffer_multi(). Specifically,
I see:

#define mipi_dsi_dcs_write_seq_multi(ctx, cmd, seq...)                  \
  do {                                                            \
    static const u8 d[] =3D { cmd, seq };                     \
    mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
  } while (0)

Certainly I could be confused...

-Doug
