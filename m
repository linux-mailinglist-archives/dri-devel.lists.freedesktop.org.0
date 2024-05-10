Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91F8C1EAD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D510E580;
	Fri, 10 May 2024 07:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nn9n6Z9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5742510E580
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:10:46 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-620e30d8f37so1427310a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715325045; x=1715929845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVljsLizj8mP9c78/jZ2/IPg3S8NkJuDIppx14crPK4=;
 b=nn9n6Z9Zu/fR0YJY+RDI4LFC+3GlsncbvLCEuMQLXS0B9kF5g6zRn6XEfUBw/KNk0I
 t0Oya0MKb+qlJ309doZ08M1h+9U8xZfT+IGb6CEYsMMXco3e0eXhkk36slOEx6qm7Dsr
 ulRlsfXjj9my21SCZVCmJ2qkgiMjfsgdFjm10L6nVS/mW0RzZMUlBM3RiQmuPijG4E7A
 rp3EvbXK67tDtpbzml2C+wMj45y1MDThqPy4OFLEscrPJhFK5b6pSv4EPErtrjP1vg9K
 XHh+PUEROUhPGXO9Giv6KJI99yTn3V5KiLR4KD9s8CVRuWGU6qFeeymCyFu3MsNKItSs
 1x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715325045; x=1715929845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVljsLizj8mP9c78/jZ2/IPg3S8NkJuDIppx14crPK4=;
 b=atHYpjKaaAYx8u6YN+8X8OKvJ72isS4iA4hoOcUQ3Ojotqv0jb5EggZEP2puw4u7xb
 nlP8JjGrgKuKdh4YJxmHLqmft/BQqvm1WCo81oA8Cuiyq3TCPOBnY6wjZWMA8JS2zp2W
 i7fhsvdZ9idcBXU9Bu3eZUWzIwZ5ylkQvPO5vu4Tr+ry35mKOmke6v7XBIlduY6P4GS+
 zQ1+wugQDQT53sg7ILNUPzoiwPIzS7Ps31cmFmanbsX9PK6ZcmvWcQ3QqQYI8ZrZO9JV
 J1px4cwyFZvqwiINvmUbNJ18M+HH3bQwHCbxD9HaNurXni8tC1sjFXw9VMy4j4ec6CXg
 wpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH1fFrcJHYe12KkRr3Shfcx9ewXEVxAfY4XfrJATjXXnvx+g7WSOsXJRWV0yx84fMrfBZD9oAN2d39M+8aJQMc0j37q0gzf9x/T/Uyl/gT
X-Gm-Message-State: AOJu0Yw02jyVO6MB/aADUS8ygKM9X34OFo172sb8NyX1OZAcle4/9SAw
 GZoNr4Van2pxWnrkOo3RFxV7lMLYEhMBDB63y6p+ZHJ8LOmX456y7DtzzRcgGJPbZhelErW/mgX
 NXvceT+1h5dOj+QlNehvxhYvrAFE=
X-Google-Smtp-Source: AGHT+IF9rZ9n8tSjSA58jwlP66LzJNDN8/JzJWa7zXl65JzLQFRx/MPhn99g9O+7T+04G3i6KEDTkfwPRzgbC+cuBuI=
X-Received: by 2002:a17:90a:4589:b0:2a5:2ef2:4ce4 with SMTP id
 98e67ed59e1d1-2b6ccd85d1amr1723878a91.41.1715325045544; Fri, 10 May 2024
 00:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
 <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
 <CAGsSOWWAotJPz+o8HSYTrXtq6H7Vrw9KXZX1jDZLgqfudKsnyg@mail.gmail.com>
In-Reply-To: <CAGsSOWWAotJPz+o8HSYTrXtq6H7Vrw9KXZX1jDZLgqfudKsnyg@mail.gmail.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Fri, 10 May 2024 09:10:34 +0200
Message-ID: <CAGsSOWX9YcuBpxQZ5kPm6zbMbM6iZqPK3bk=dgKyUZPjq++GXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: move DCS off commands to
 disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, May 10, 2024 at 8:46=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n <tra=
barni@gmail.com> wrote:
>
> On Fri, May 10, 2024 at 2:56=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, May 09, 2024 at 08:14:07PM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1=
n wrote:
> > > Move DCS off commands from .unprepare to .disable so that they
> > > actually reach the DSI host.
> > >
> > > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > I don't think this is correct. If the driver sends enable commands in
> > prepare, it should be able to send commands during unprepare too.
> >
> It cannot send commands in unprepare, there are multiple panel drivers
> what do the same.
> Every panel drivers which have DCS commands to be sent in unprepare
> has similar error messages with mdp5/dpu.
>
> [   92.322564] panel-td4320-boeplus c994000.dsi.0: sending command
> 0x28 failed: -22
> [   92.322635] panel-td4320-boeplus c994000.dsi.0: Failed to
> un-initialize panel: -22
>
>
Here is the error messages, these are comes from unprepare by every panel o=
ff:
[  121.295290] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed: -22
[  121.295368] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
un-initialize panel: -22
[  184.783019] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed: -22
[  184.783066] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
un-initialize panel: -22
with this patch these errors no more.
.prepare works because of this flag ctx->panel.prepare_prev_first =3D true;
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/g=
pu/drm/panel/panel-jdi-fhd-r63452.c
> > > index 483dc88d16d8..f7222974d6ed 100644
> > > --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> > > +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> > > @@ -169,6 +169,15 @@ static int jdi_fhd_r63452_prepare(struct drm_pan=
el *panel)
> > >  }
> > >
> > >  static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
> > > +{
> > > +     struct jdi_fhd_r63452 *ctx =3D to_jdi_fhd_r63452(panel);
> > > +
> > > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int jdi_fhd_r63452_disable(struct drm_panel *panel)
> > >  {
> > >       struct jdi_fhd_r63452 *ctx =3D to_jdi_fhd_r63452(panel);
> > >       struct device *dev =3D &ctx->dsi->dev;
> > > @@ -178,8 +187,6 @@ static int jdi_fhd_r63452_unprepare(struct drm_pa=
nel *panel)
> > >       if (ret < 0)
> > >               dev_err(dev, "Failed to un-initialize panel: %d\n", ret=
);
> > >
> > > -     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > > -
> > >       return 0;
> > >  }
> > >
> > > @@ -219,6 +226,7 @@ static int jdi_fhd_r63452_get_modes(struct drm_pa=
nel *panel,
> > >  static const struct drm_panel_funcs jdi_fhd_r63452_panel_funcs =3D {
> > >       .prepare =3D jdi_fhd_r63452_prepare,
> > >       .unprepare =3D jdi_fhd_r63452_unprepare,
> > > +     .disable =3D jdi_fhd_r63452_disable,
> > >       .get_modes =3D jdi_fhd_r63452_get_modes,
> > >  };
> > >
> > >
> > > ---
> > > base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> > > change-id: 20240509-jdi-use-disable-ee29098d9c81
> > >
> > > Best regards,
> > > --
> > > Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > >
> >
> > --
> > With best wishes
> > Dmitry
