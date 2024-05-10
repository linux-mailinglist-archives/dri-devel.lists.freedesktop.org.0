Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4608C1E58
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 08:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7605C10E45D;
	Fri, 10 May 2024 06:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MDVuA995";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E710E435
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 06:47:06 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2a2da57ab3aso1405327a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 23:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715323626; x=1715928426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBCt7hEw3xnKO8V8Yx6BUx3zL0FQuskSiNDFxdqn1dw=;
 b=MDVuA995wCgUQitd+rmo5gCenmMcMuViRTx2Ftz+tolPb2tzyZhyBIO7RW3qUWobwL
 2vbjUjzBlZgPNLR5YAbL2iA/qHfyXnVNgVtEQ0897LcUFwUdrA9Q1Zadh8osjQQNSUrD
 bd0w3N4R3KevUwrTuk5l5xXRZoZp5AWU15nRzEIgrRcy4btpwyijC0HnyjxGliRlC92E
 6UnsYjPlzUlruQa1XLt/nwDoIwmQmCMyrdyfuA63kJsiZ6fyYauIVtEPRbB9Mar+Mr9h
 QRtXuaWpk/DnPoa7O9lif8yfFe8ogbyXQD06DG3vkBSY+E0r3B8LnafuY8SRg89QaJzQ
 w6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715323626; x=1715928426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBCt7hEw3xnKO8V8Yx6BUx3zL0FQuskSiNDFxdqn1dw=;
 b=BjbuPgwun3kzmSkBaTbupXPAVdIbsyRXUbIphqywgNbDrBecac2/ulhzJgyqXORMPm
 oaTT2PMnGI50cF3pwtYm/VmzL7Kqz1Mx9chhmcr+O7rB0K0z096BThjvb481BkcGMj4f
 V12itMhPk03NS8jCjFqGcSQeTbewOLVEPoO0lTRL3ESyWn3XUYwTW38R422zCvy/EB6f
 znIKhapt1oYviS2F4Iafh/hIz6RsqrBIocnsUTCO5eRxmPjZqCZ2NE4ogf/u6JHgzQCz
 wniu0GzQfVpqYC2zqmoeY92O3NUHwj1X4bd+2BddWsvBeUrJvwfVPGnpeXXUZddOxPXN
 ijeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj/aPUzPlut+kxoVYHuMnqf2lwTNLsmbkbUfgtmd2E5D8hTrO9BFSwueLAGdPAZRiimVpFxAMKbNfXZg6uTPPNCBaF3wonBeAUq/tJW4oI
X-Gm-Message-State: AOJu0Yz/kmx8pcImNfti2b4rbtUjHnUCtAcNM4/xa7oeP7c1+TDPF+tT
 7z2dK9KLSr0pGu0pjh/wxC7U/3wGrXmEIaqj4rA7xcFncoJV5y48P/Sf0/D3zopWHadpsMeessb
 3D5i+tuTyXjFVrfP3W8g553zciaQ=
X-Google-Smtp-Source: AGHT+IGNLD+9hQhByE/EztiLG2Xy1YFt5qfzKCrrLqgcm5OcHvlEy/8DCfsm0OHnO7Wb8zNWGPNBuzHNY1619CPAEKs=
X-Received: by 2002:a17:90a:fc89:b0:2b2:468c:9fdd with SMTP id
 98e67ed59e1d1-2b6cc3429ecmr1732360a91.8.1715323625926; Thu, 09 May 2024
 23:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
 <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
In-Reply-To: <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Fri, 10 May 2024 08:46:54 +0200
Message-ID: <CAGsSOWWAotJPz+o8HSYTrXtq6H7Vrw9KXZX1jDZLgqfudKsnyg@mail.gmail.com>
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

On Fri, May 10, 2024 at 2:56=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, May 09, 2024 at 08:14:07PM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> > Move DCS off commands from .unprepare to .disable so that they
> > actually reach the DSI host.
> >
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
>
> I don't think this is correct. If the driver sends enable commands in
> prepare, it should be able to send commands during unprepare too.
>
It cannot send commands in unprepare, there are multiple panel drivers
what do the same.
Every panel drivers which have DCS commands to be sent in unprepare
has similar error messages with mdp5/dpu.

[   92.322564] panel-td4320-boeplus c994000.dsi.0: sending command
0x28 failed: -22
[   92.322635] panel-td4320-boeplus c994000.dsi.0: Failed to
un-initialize panel: -22


> >
> > diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu=
/drm/panel/panel-jdi-fhd-r63452.c
> > index 483dc88d16d8..f7222974d6ed 100644
> > --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> > +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> > @@ -169,6 +169,15 @@ static int jdi_fhd_r63452_prepare(struct drm_panel=
 *panel)
> >  }
> >
> >  static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
> > +{
> > +     struct jdi_fhd_r63452 *ctx =3D to_jdi_fhd_r63452(panel);
> > +
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static int jdi_fhd_r63452_disable(struct drm_panel *panel)
> >  {
> >       struct jdi_fhd_r63452 *ctx =3D to_jdi_fhd_r63452(panel);
> >       struct device *dev =3D &ctx->dsi->dev;
> > @@ -178,8 +187,6 @@ static int jdi_fhd_r63452_unprepare(struct drm_pane=
l *panel)
> >       if (ret < 0)
> >               dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> >
> > -     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > -
> >       return 0;
> >  }
> >
> > @@ -219,6 +226,7 @@ static int jdi_fhd_r63452_get_modes(struct drm_pane=
l *panel,
> >  static const struct drm_panel_funcs jdi_fhd_r63452_panel_funcs =3D {
> >       .prepare =3D jdi_fhd_r63452_prepare,
> >       .unprepare =3D jdi_fhd_r63452_unprepare,
> > +     .disable =3D jdi_fhd_r63452_disable,
> >       .get_modes =3D jdi_fhd_r63452_get_modes,
> >  };
> >
> >
> > ---
> > base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> > change-id: 20240509-jdi-use-disable-ee29098d9c81
> >
> > Best regards,
> > --
> > Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> >
>
> --
> With best wishes
> Dmitry
