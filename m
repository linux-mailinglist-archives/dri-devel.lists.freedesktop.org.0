Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7F97E884
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61710E3C0;
	Mon, 23 Sep 2024 09:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BSckRZ0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3D810E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c42bad4eb9so666963a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727083352; x=1727688152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7cmHyBl9nc6KTcNNqA/aAzbevaaSNsmEu/DrICna2o=;
 b=BSckRZ0OY0r7ZNgPJ0/Ynjhw/Z53+X4XotUSb0fj8d4ZM4k76D4813ZTWglM2XTo8A
 ALNUcGXlltrNj9oZ4S6KpzSh6fmkCLmC0jBxtMxe+p/DRYYUWTHYDjdw4joHXs3zAKVm
 CPa+sS1xQAHE6L7WKbk1cNtVjBJL9vYYUou9/P9TT14dX4UzfktW7jsaR3VugyrSgHB8
 LQS7tIh2HSAUo/8Sxih/TQweBAwOEtkMDmWfP+mNl6p2vIFJ96phXDF5c0yYvdfwvXXN
 zAaZFVDMsIlzBPOLinaniVTePCIe5lcHYTqJwcs/4Sr5GwVWEbjdqijEYeQQcIoi023m
 lqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727083352; x=1727688152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7cmHyBl9nc6KTcNNqA/aAzbevaaSNsmEu/DrICna2o=;
 b=H+9SAum8MKHHbEFIvq/og44CvK05TUTc1p2WoA1pC1gDJAQpPnMrHFK0fRQIfru2Ma
 5mvy0Nw1/5jh03aat0vUh+e7ufUYBJuWBDMMd8j6XXwKq1hlI24CK+KRSJBPTiBCrwVv
 H4/2FKGiMsYfurqbD+CH/hNFpOouLCbmI5wfvxUJZ6IjEUrr0dGUoQCRW+biaT4QDyb+
 wW5SC2Z2Gso6XJ/5EzK9XD6frj/JxvMb5eigLrX+MSYgi2YPjpahDEEKpPsgFIRiztMI
 /qa5SUKHNq8mCwESHRuA8XREO5vf2dpXA0lHf/VvU+cphd0mDUalPhC/nYQcCoGyhUvV
 beLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7MrYCmTzQj8gmwPWPYtkPHnXU8Dm1egqsz8lwk4haRIvyqLYWQCcpBeuP+m366fpGYWOuA/vjgC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZR5gnBwTUmN3op9+h/lZwN4VcYZAyZKcmVu07IKM+Ere+tRzb
 y9yfYBM015eiuKuBNh6UOkSLffHe+pWozSyhwzgBMIEy+TLRFV1D0VXxXh6KPtXavSnWFlqpaLW
 s7a0YpmJ9nmF9Nq5wYbzrhJXFh0hmzeYkVOzLtQ==
X-Google-Smtp-Source: AGHT+IHhp17g5Fbe+7A2S2wLr+KiDdABA/q1DteOxMrJXmxR3bBqCME6Ga+w6RWL0BpYabZkxl8ORE3TkRZB3gZj4dU=
X-Received: by 2002:a05:6402:268b:b0:5c5:c5fc:1aa6 with SMTP id
 4fb4d7f45d1cf-5c5c5fc1b0amr152694a12.5.1727083351600; Mon, 23 Sep 2024
 02:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 23 Sep 2024 17:22:20 +0800
Message-ID: <CA+6=WdR6+nh9e2HCuCVdR6uw3vuJoWfKCG4gPjJMp9db+Quimw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 16, 2024 at 1:15=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Same comment as the one that I've provided to the other patch, plus:
>
> On Sun, 15 Sept 2024 at 10:11, Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > In order to meet the timing, remove the delay between "backlight off"
> > and "display off", and reduce the delay between "display_off" and
> > "enter_sleep"
>
> Separate commit, separate _justification_. Why, not what.
>
> >
> > Removing variables: display_off_to_enter_sleep_delay_ms
>
> This phrase is useless.
>
hi Dmitry

As in another patch reply, in order to solve a black screen problem,
the delay is reduced.
The panel spec:
1. https://github.com/Vme5o/power-on-off-sequential

> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/dri=
vers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > index 0b87f1e6ecae..c2d0ec199829 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > @@ -29,7 +29,7 @@ struct panel_desc {
> >         bool lp11_before_reset;
> >         unsigned int vcioo_to_lp11_delay_ms;
> >         unsigned int lp11_to_reset_delay_ms;
> > -       unsigned int backlight_off_to_display_off_delay_ms;
> > +       unsigned int display_off_to_enter_sleep_delay_ms;
> >         unsigned int enter_sleep_to_reset_down_delay_ms;
> >         unsigned int power_off_delay_ms;
> >  };
> > @@ -184,12 +184,10 @@ static int boe_th101mb31ig002_disable(struct drm_=
panel *panel)
> >                                                       panel);
> >         struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi }=
;
> >
> > -       if (ctx->desc->backlight_off_to_display_off_delay_ms)
> > -               mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_d=
isplay_off_delay_ms);
> > -
> >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >
> > -       mipi_dsi_msleep(&dsi_ctx, 120);
> > +       if (ctx->desc->display_off_to_enter_sleep_delay_ms)
> > +               mipi_dsi_msleep(&dsi_ctx, ctx->desc->display_off_to_ent=
er_sleep_delay_ms);
> >
> >         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >
> > @@ -275,6 +273,7 @@ static const struct panel_desc boe_th101mb31ig002_d=
esc =3D {
> >                           MIPI_DSI_MODE_NO_EOT_PACKET |
> >                           MIPI_DSI_MODE_LPM,
> >         .init =3D boe_th101mb31ig002_enable,
> > +       .display_off_to_enter_sleep_delay_ms =3D 120,
> >  };
> >
> >  static const struct drm_display_mode starry_er88577_default_mode =3D {
> > @@ -302,7 +301,7 @@ static const struct panel_desc starry_er88577_desc =
=3D {
> >         .lp11_before_reset =3D true,
> >         .vcioo_to_lp11_delay_ms =3D 5,
> >         .lp11_to_reset_delay_ms =3D 50,
> > -       .backlight_off_to_display_off_delay_ms =3D 100,
> > +       .display_off_to_enter_sleep_delay_ms =3D 50,
> >         .enter_sleep_to_reset_down_delay_ms =3D 100,
> >         .power_off_delay_ms =3D 1000,
> >  };
> > --
> > 2.17.1
> >
>
>
> --
> With best wishes
> Dmitry
