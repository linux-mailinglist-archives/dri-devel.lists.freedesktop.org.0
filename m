Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A590029F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF6410EC01;
	Fri,  7 Jun 2024 11:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lZJ6VZDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47F10EC09
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:51:22 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2eabd22d404so21261171fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717761081; x=1718365881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhDrz62n+ztyqmEd4RfJ3EmQklHy8GEz9uvsxkZobnQ=;
 b=lZJ6VZDuAtI4wCxbLFFoY1d91pWsdoqTKiUYgYu4lkLEQhxFc39WiiaAFN5hPgTT3s
 8BOVaBGkcpZFJ/dlP/gS4/96oKk8DCwsyk7BtO2L6M98niMzpNMonmaPuowHHLCzGuPb
 kqC/sJ1E6j6BD8dKMJY9M3VhhQnsL95lEyp6cwSQ8H2Kj2HhVpt+viZ1Lz1+5w3NWyB/
 WNeuMCpgYgfgXeBjZI1QpGLoYp44SV14AF1jrRP8QfC/g3HLt4cMou3QwyX0NXMIgwGJ
 B/GVNG8PuHEiWIgQ0J5ro8qxBfNNe9Mi8g2NEKHIG3y6NKSHcJLn48GXbmjKdwgevpLw
 whlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717761081; x=1718365881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhDrz62n+ztyqmEd4RfJ3EmQklHy8GEz9uvsxkZobnQ=;
 b=a0XeuLcysFoeey5o4XXdu18MosWWUuDi5qZytthp9ayOPtZFGIIWWgTJ+xJ3u2fhP/
 IoMatb3xotkxd7J6P9ZWMgekY9La2d87t3+/86Mc56NgahG14unzFDbWRsUGXxNOtssS
 olnfpu/XGxsRiEVSwJh460zacQfGqQkay+V6Z6QIJZrUxXmCxY/+ZGCXV3/Lxfi0Ol+I
 A2B6s69/PtMDkO2sUyxEBQI4wlrEdSWGdMr+M/271ugUpRv6AsXKoPEQX+diezAW1Vo/
 0JuCWkTCiF0hucgylxb8qtSBnuaMVKf6GkcwX82Zc9DT7kiZPDWiSHPDhnpU3+VF7YZ5
 k4Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnnsNPg+pVPP+7ILjEn7EvY86Cdm//KeYyC2SpHYXdtJKysaiMGmGu98J++Fa64a+ht1CRycrJpD37kryEnRDoBofmyTY/tUy6Ap68y65Z
X-Gm-Message-State: AOJu0Yy6Z0e4dUBeijeEiDmmlz/ZYUWWYWD7imkRKj7zDVzavq+PsW38
 Fb4Fv/KF/y4L6N6ps9Fdd+ffD7xXf7taazshtismly50jsoBaH3PIeSgpTvXPRmL027DsZLCjVI
 rot9hgSnaZXPUsB4rvBYKD/5eugjijWpJ8z/+KPiu+IVwnF16Z0Y=
X-Google-Smtp-Source: AGHT+IFBK0heFzeF0N2SPKbri8wRDMU9LXSUwP3Gak+5PRtaL+LlYKTsBI/+mzGL7GE1f/AoyiE9LJqIAQwz/pvIXuU=
X-Received: by 2002:a2e:bea4:0:b0:2de:7cc5:7a27 with SMTP id
 38308e7fff4ca-2eadce1f0dfmr17452241fa.5.1717761080827; Fri, 07 Jun 2024
 04:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com>
 <5yz4uct3dnxqflij34zasu6fhr42gyl6kjfjobftrwpsl6j4y6@3kzp4s3dxktw>
In-Reply-To: <5yz4uct3dnxqflij34zasu6fhr42gyl6kjfjobftrwpsl6j4y6@3kzp4s3dxktw>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Fri, 7 Jun 2024 19:51:09 +0800
Message-ID: <CA+6=WdSpHp6WRwZ3ta6ZR585ON9XSjWB5s1EjbhpBnWGWmhRAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel: starry: add new panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
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

hi Dmitry

These two panels are not the same IC but their timing is the same,
only the init cmd and panel parameters are different, so I made it
compatible on the kingdisplay driver.

Similar to this driver:  panel-boe-tv101wum-nl6.c

thanks

On Sun, Jun 2, 2024 at 12:26=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Jun 01, 2024 at 04:45:28PM +0800, Zhaoxiong Lv wrote:
> > This Starry panel has the same timing as the Kingdisplay panel,
> > so add starry configuration in the Kingdisplay driver.
>
> Do these two panels share the same driver IC? Programming sequences do
> not seem common, so it might be better to have a separate driver for
> this panel.
>
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >
> > Chage since V2:
> >
> > -  Add compatible for Starry er88577 in panel-kingdisplay-kd101ne3 driv=
ers.
> >
> > ---
> >  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/drive=
rs/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > index 8994a1c9afb5..b614d28475a6 100644
> > --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> > @@ -267,6 +267,67 @@ static int kingdisplay_kd101ne3_init(struct kingdi=
splay_panel *kingdisplay)
> >       return 0;
> >  };
> >
> > +static int starry_er88577_init(struct kingdisplay_panel *kingdisplay)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D kingdisplay-=
>dsi };
> > +
> > +     /* T5:HWreset to init_code >=3D 120ms */
> > +     msleep(120);
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0x=
ff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x=
50, 0x50, 0x14);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x=
10, 0x00, 0x10, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x=
49, 0x40);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x61, 0x4f, 0x=
42, 0x3e, 0x2d, 0x31,
> > +                                  0x1a, 0x33, 0x33, 0x33, 0x52, 0x40, =
0x47, 0x38, 0x34, 0x26,
> > +                                  0x0e, 0x06, 0x7c, 0x61, 0x4f, 0x42, =
0x3e, 0x2d, 0x31, 0x1a,
> > +                                  0x33, 0x33, 0x33, 0x52, 0x40, 0x47, =
0x38, 0x34, 0x26, 0x0e,
> > +                                  0x06);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xcc, 0x76, 0x12, 0x=
34, 0x44, 0x44, 0x44,
> > +                                  0x44, 0x98, 0x04, 0x98, 0x04, 0x0f, =
0x00, 0x00, 0xc1);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x=
85, 0x9f, 0x00, 0x6f,
> > +                                  0x00, 0x54, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x=
89, 0x08, 0x11, 0x22,
> > +                                  0x20, 0x44, 0xff, 0x18, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x87, 0x47, 0x05, 0x=
05, 0x1c, 0x1c, 0x1d,
> > +                                  0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, =
0x0f, 0x0f, 0x0d, 0x0d,
> > +                                  0x13, 0x13, 0x11, 0x11, 0x24);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x06, 0x06, 0x04, 0x=
04, 0x1c, 0x1c, 0x1d,
> > +                                  0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f, =
0x0e, 0x0e, 0x0c, 0x0c,
> > +                                  0x12, 0x12, 0x10, 0x10, 0x24);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x=
42, 0x34, 0x16);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x=
20, 0x19, 0x6b, 0x06,
> > +                                  0xb3);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x=
08);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x=
0e, 0x04, 0x44, 0x08,
> > +                                  0x10, 0x00, 0x00, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x09, 0xff, 0x=
ff, 0xff, 0xff, 0xff,
> > +                                  0xff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x=
00, 0xff);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
> > +     if (dsi_ctx.accum_err)
> > +             return dsi_ctx.accum_err;
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE);
> > +     if (dsi_ctx.accum_err)
> > +             return dsi_ctx.accum_err;
> > +
> > +     msleep(120);
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON);
> > +     if (dsi_ctx.accum_err)
> > +             return dsi_ctx.accum_err;
> > +
> > +     msleep(20);
>
> Most of the comments from the patch 2 apply:
> - drop conditions
> - use mipi_dsi_dcs_set_display_on_multi(),
>   mipi_dsi_dcs_exit_sleep_mode_multi() and mipi_dsi_msleep().
>
> > +
> > +     return 0;
> > +};
> > +
> >  static inline struct kingdisplay_panel *to_kingdisplay_panel(struct dr=
m_panel *panel)
> >  {
> >       return container_of(panel, struct kingdisplay_panel, base);
> > @@ -391,6 +452,34 @@ static const struct panel_desc kingdisplay_kd101ne=
3_40ti_desc =3D {
> >       .lp11_before_reset =3D true,
> >  };
> >
> > +static const struct drm_display_mode starry_er88577_default_mode =3D {
> > +     .clock =3D 77380,
> > +     .hdisplay =3D 800,
> > +     .hsync_start =3D 800 + 80,
> > +     .hsync_end =3D 800 + 80 + 20,
> > +     .htotal =3D 800 + 80 + 20 + 80,
> > +     .vdisplay =3D 1280,
> > +     .vsync_start =3D 1280 + 20,
> > +     .vsync_end =3D 1280 + 20 + 4,
> > +     .vtotal =3D 1280 + 20 + 4 + 12,
> > +     .type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> > +};
> > +
> > +static const struct panel_desc starry_er88577_desc =3D {
> > +     .modes =3D &starry_er88577_default_mode,
> > +     .bpc =3D 8,
> > +     .size =3D {
> > +             .width_mm =3D 135,
> > +             .height_mm =3D 216,
> > +     },
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> > +                   MIPI_DSI_MODE_LPM,
> > +     .init =3D starry_er88577_init,
> > +     .lp11_before_reset =3D true,
> > +};
> > +
> >  static int kingdisplay_panel_get_modes(struct drm_panel *panel,
> >                              struct drm_connector *connector)
> >  {
> > @@ -514,6 +603,9 @@ static const struct of_device_id kingdisplay_of_mat=
ch[] =3D {
> >       { .compatible =3D "kingdisplay,kd101ne3-40ti",
> >         .data =3D &kingdisplay_kd101ne3_40ti_desc
> >       },
> > +     { .compatible =3D "starry,er88577",
> > +       .data =3D &starry_er88577_desc
> > +     },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, kingdisplay_of_match);
> > --
> > 2.17.1
> >
>
> --
> With best wishes
> Dmitry
