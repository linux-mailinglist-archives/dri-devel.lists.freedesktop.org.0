Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A1A033D6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 01:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C010E398;
	Tue,  7 Jan 2025 00:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ik1+s5Sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9210EA50
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 00:15:28 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so16525053e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 16:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736208866; x=1736813666;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH1upV2tbnw3qVJiGQgQGkM3WDk+2uIz2vLtQFCvzsE=;
 b=Ik1+s5Sr4/XH5uTMFSStcbpTgUqbQfbCQmiGkfvMn0pMkJWpwwqSvD3W85wt5Gyjvx
 EpznFnCV/sEcl4W4On/d+dmXofYEWcrksCuTb5lTMrxKnY30lFXGqoTIL7yrXgtWQzDb
 0S9xlwr820Y1/cIeQiw3rfAbQZIiA1ArWxmbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736208866; x=1736813666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH1upV2tbnw3qVJiGQgQGkM3WDk+2uIz2vLtQFCvzsE=;
 b=nM/ld/xIf+RK25K4rUdhqaIHDHRfS7uG7s6Cfm/q948xn7j5jr7Pi1mwiuAH6bHyM2
 pNqb4OktCweYFqgHjsqSjqvaRhkQ1kTN/g1fNBLNne7I7nfGgOxJBo4Nbm6VTuB5s+QO
 tuNpUPXYtX4iEwuEIGlxWxiW5vmRRok9CUAneI9CrApFqynrbItxYKQRO5lIL7nM3N0G
 sOCAQAZcs107TOq58MRSUVpYj14rTt0eIp1E3WK6Y4zF0+VrPyJKBwpFrJxr+DC0DbPf
 mdVkEWsgXIGmzG0sjJoQ29rNr8szitl03XknQo+I2LRfeeRrSBYRyr7s7lj5q+Dwu+6N
 M/iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiHMy3LnYAf3SZWBrKsyBewsdxaeLfDsPdw2EAGQoKz47wj7raW1Il68qEmWffogtPMQc2/gBdYc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9S42WQEsofqAFms8SbLCN1gnaYWALg3X00IxsyQETv7kLtc69
 BFopOBSwst7BOVdJL633Vqt3yaU0uZBtOgvU8UVWUgP8aca8LdbJnVHit9BRfssUqYRtokGqhw4
 McPwm
X-Gm-Gg: ASbGnctTq5wrE2vBsXBSEgXL3xPu/rnT0rxfwUNce3xDmOn08I5i5xqELSCZ8FNQEOu
 TQGMtKxbVYg4yBJkOQmqwALkqsk7f0EUjsGHXCNl6bmUdzPuzjwf1cbss/kSOCzeINg/r8WAL/7
 oYRuqYZRcRg4P9bxlbKZFKkRT8SKdOjItSwhnujT+5xmega/olehFWHQlMQNd4Z/70kJhjDZMIX
 ioLpU3xdUoIIoEX+mqJzIihPNzLS19EA9upRn2Iw629VDBH66w1fTXESljs12kE38YzhXgyh3FW
 unu+dGK6G3XG/qHPQmqn
X-Google-Smtp-Source: AGHT+IEgMmuUT8Ox8y4q9i1Edxmr1fY7vC1bI4nmjm4FzaFrYJPEFvrdl8TvmPDWiowsJuoCfQRNKw==
X-Received: by 2002:a2e:b8d2:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-30468551fe3mr165810381fa.2.1736208464651; 
 Mon, 06 Jan 2025 16:07:44 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b069f26sm56007451fa.87.2025.01.06.16.07.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 16:07:44 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so16520296e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 16:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8z80dO6BhVF46lQGVlSS40fVzLKtXFQI3xKEbrX2uiVj35ziKKax06rWwd6IgitcNbF6MRsIuTo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3f18:b0:540:23dd:2139 with SMTP id
 2adb3069b0e04-5422953fd6cmr17163958e87.29.1736208462991; Mon, 06 Jan 2025
 16:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20241223052049.419831-1-tejasvipin76@gmail.com>
 <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
In-Reply-To: <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2025 16:07:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
X-Gm-Features: AbW1kvYO5Kj31TQnpwZRsYJslWq3HLnR2cCe5oP6ZEnG3H8biXZ6B1dY1nvuF60
Message-ID: <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Mon, Dec 30, 2024 at 2:10=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> >   static int xpp055c272_unprepare(struct drm_panel *panel)
> >   {
> >       struct xpp055c272 *ctx =3D panel_to_xpp055c272(panel);
> >       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> > -     int ret;
> > -
> > -     ret =3D mipi_dsi_dcs_set_display_off(dsi);
> > -     if (ret < 0)
> > -             dev_err(ctx->dev, "failed to set display off: %d\n", ret)=
;
> > -
> > -     mipi_dsi_dcs_enter_sleep_mode(dsi);
> > -     if (ret < 0) {
> > -             dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret=
);
> > -             return ret;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> > +
> > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > +     if (dsi_ctx.accum_err) {
> > +             dev_err(ctx->dev, "failed to enter sleep mode: %d\n",
> > +                     dsi_ctx.accum_err);

You should delete the above error message, right?
mipi_dsi_dcs_enter_sleep_mode_multi() reports the error for you, I
think.


> > @@ -155,17 +147,19 @@ static int xpp055c272_prepare(struct drm_panel *p=
anel)
> >   {
> >       struct xpp055c272 *ctx =3D panel_to_xpp055c272(panel);
> >       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> > -     int ret;
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >
> >       dev_dbg(ctx->dev, "Resetting the panel\n");
> > -     ret =3D regulator_enable(ctx->vci);
> > -     if (ret < 0) {
> > -             dev_err(ctx->dev, "Failed to enable vci supply: %d\n", re=
t);
> > -             return ret;
> > +     dsi_ctx.accum_err =3D regulator_enable(ctx->vci);
> > +     if (dsi_ctx.accum_err) {
>
> I would rather keep ret instead of abusing dsi_ctx.accum_err, but it's al=
ready like
> that in other converted driver so I won't oppose it...

FWIW, we had this discussion before. I agree with what Tejas did here
and I managed to convince Dmitry Baryshkov in the past. See:

https://lore.kernel.org/all/CAA8EJpr_HYkXnP3XR9LpDhi1xkQfE_CKJzfzGrO5qd_pQY=
tiOw@mail.gmail.com/

Looking specifically at this driver, using "ret" would have added
complexity when we wanted to do "goto disable_vci" because in some
cases the error code would be in "ret" and sometimes in "accum_err"...


> > @@ -175,30 +169,19 @@ static int xpp055c272_prepare(struct drm_panel *p=
anel)
> >       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> >
> >       /* T8: 20ms */
> > -     msleep(20);
> > +     mipi_dsi_msleep(&dsi_ctx, 20);

Personally, I would have left the above msleep() alone. There can be
no errors at this point in the code, right?


> > -     ret =3D xpp055c272_init_sequence(ctx);
> > -     if (ret < 0) {
> > -             dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret=
);
> > -             goto disable_iovcc;
> > -     }
> > -
> > -     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > -     if (ret < 0) {
> > -             dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret)=
;
> > -             goto disable_iovcc;
> > -     }
> > +     xpp055c272_init_sequence(&dsi_ctx);
> > +     dev_dbg(ctx->dev, "Panel init sequence done\n");

Should the above print be only if "accum_err" is 0? That would match
the previous behavior. I guess I would have also left the print as
part of xpp055c272_init_sequence() unless there's a reason for moving
it...
