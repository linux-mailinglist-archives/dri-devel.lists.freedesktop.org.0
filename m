Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBE7CAE39
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9310E206;
	Mon, 16 Oct 2023 15:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132510E215
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 15:52:15 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1dceb2b8823so2407977fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697471534; x=1698076334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1FBRdXd0ZTfCpRP0qksgixNbe04Zemrx30DJLC8tcQ=;
 b=AKuFmcdhMqAOlV/0vNzvFikaIFQUgaCLhr2ixdB/KPTayICvpc+ImfKfA12UlTnfGf
 y3DH+1vzcNaP3woUbRANupcE2dtc1nCoWWM7IAdeQnfmLmS48Vt5XDuu4kBdIMtqMSPg
 2B21G8tfDhH2z19SpGNQw66eHV2HFfsVA2fEou1eVo3bNylPNsl9aRcBX8cuK72T+Tpo
 kz9laPkesoi+BWLjEbVNb8yIrYrg5baZ0XfO7CUNZqYqXMFYtTpgSBjqtCFwaDJt9xDe
 L6BgNzMUWYm2mHr7VFgeiTjuoc9N2bpC3YHmp20SdBnB2UPuT7cwKOvEDjumBZtOsj73
 8YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697471534; x=1698076334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1FBRdXd0ZTfCpRP0qksgixNbe04Zemrx30DJLC8tcQ=;
 b=wJRomAegWNfg/7LhqgLqcIJSSpuX5wGj76MXisGZ92mLlw399NUK3Z/na12zCzlTPf
 1jVY2X2RXvf/7SpBxCHXX9FX5i3eZST3Dr9ISZnescrGV6yJrIR06WyNF+ZHgHNpHFtl
 SFtoqTgy9q0E30d2ITmwvqqAbv4Vpu6X+Gd1j8bevPR4M7o9BiWyGPTSD4dYPkOYfy9o
 iXerf7vZmTpLlertNBz4vH/s+fhyQAOoNs1mtKk2I3r+dSzY3fa6ZGgH61DYmAZRdija
 +30Ejxd+2Ya/6VYcyxmcVpQa1TkXThlKRdGz/J7IMf4UuQEL/gHkjIjt3dE5vswJeeEa
 yy0w==
X-Gm-Message-State: AOJu0Yy9pcqAWu2R0l9LBcbypFLDYdkXY9S1zsAr++i9rYOHXXenFalh
 1BRA59FBQcbAd/zHySVqVaSab+XathQs+5EawCw=
X-Google-Smtp-Source: AGHT+IEkJW3B2LT9aMiu28v0r7JeNANZxcwwn00odqI2gRnjoomSDbvGNLpiee+Vb0METqXlOvqNrgaPcalnkv97BEI=
X-Received: by 2002:a05:6870:658b:b0:1e9:88e0:b8ba with SMTP id
 fp11-20020a056870658b00b001e988e0b8bamr4300611oab.29.1697471534468; Mon, 16
 Oct 2023 08:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231013183918.225666-1-macroalpha82@gmail.com>
 <20231013183918.225666-4-macroalpha82@gmail.com>
 <ZSz1PeHhFp0AHtMl@qwark.sigxcpu.org>
In-Reply-To: <ZSz1PeHhFp0AHtMl@qwark.sigxcpu.org>
From: Chris Morgan <macroalpha82@gmail.com>
Date: Mon, 16 Oct 2023 10:52:03 -0500
Message-ID: <CADcbR4+i_B26g_gLrjTm8dxVzprb-WHRrx=r07wKhcJuei+96w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <guido.gunther@puri.sm>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@puri.sm, krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Confirmed that those pending patches DO fix the panel suspend issues. Thank=
 you.

On Mon, Oct 16, 2023 at 3:41=E2=80=AFAM Guido G=C3=BCnther <guido.gunther@p=
uri.sm> wrote:
>
> Hi Chris,
> On Fri, Oct 13, 2023 at 01:39:16PM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel used in
> > the Powkiddy RGB30 handheld gaming device. Add support for it.
> >
> > TODO: The panel seems to not resume properly from suspend. I've
> > confirmed on the other ST7703 based devices it works correctly.
>
> Regarding drm-misc-next has improvements regarding this prompted by the
> PinePhone. Maybe that fixes suspend for you too?
>
> Cheers,
>  -- Guido
>
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gp=
u/drm/panel/panel-sitronix-st7703.c
> > index 6a3945639535..a9892a4447fb 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > @@ -433,6 +433,94 @@ static const struct st7703_panel_desc rg353v2_desc=
 =3D {
> >       .init_sequence =3D rg353v2_init_sequence,
> >  };
> >
> > +static int rgb30panel_init_sequence(struct st7703 *ctx)
> > +{
> > +     struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> > +
> > +     /* Init sequence extracted from Powkiddy RGB30 BSP kernel. */
> > +
> > +     /*
> > +      * For some reason this specific panel must be taken out of sleep
> > +      * before the full init sequence, or else it will not display.
> > +      */
> > +     mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +     msleep(250);
> > +
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83)=
;
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,=
 0xf9,
> > +                            0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a, =
0x00,
> > +                            0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22, =
0xf0,
> > +                            0x63);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x=
00);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28=
,
> > +                            0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, =
0x50,
> > +                            0x00, 0x00, 0x12, 0x70, 0x00);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x46);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x3c, 0x12, 0x30)=
;
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0=
x0b,
> > +                            0x03, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, =
0x00,
> > +                            0xc0, 0x10);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x36, 0x00, 0x32=
,
> > +                            0x32, 0x77, 0xf1, 0xcc, 0xcc, 0x77, 0x77, =
0x33,
> > +                            0x33);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x88, 0x88);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x0a,=
 0x10,
> > +                            0x0f, 0xa1, 0x80, 0x12, 0x31, 0x23, 0x47, =
0x86,
> > +                            0xa1, 0x80, 0x47, 0x08, 0x00, 0x00, 0x0d, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, =
0x00,
> > +                            0x48, 0x02, 0x8b, 0xaf, 0x46, 0x02, 0x88, =
0x88,
> > +                            0x88, 0x88, 0x88, 0x48, 0x13, 0x8b, 0xaf, =
0x57,
> > +                            0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x96, 0x12, 0x01,=
 0x01,
> > +                            0x01, 0x78, 0x02, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x4f, 0x31, 0x8b, 0xa8, 0x31, 0x75, 0x88, =
0x88,
> > +                            0x88, 0x88, 0x88, 0x4f, 0x20, 0x8b, 0xa8, =
0x20,
> > +                            0x64, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, =
0x00,
> > +                            0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x40, 0xa1, 0x80, 0x00, 0x00, =
0x00,
> > +                            0x00);
> > +     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x0a, 0x0f=
,
> > +                            0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, 0x0d, =
0x10,
> > +                            0x13, 0x15, 0x14, 0x15, 0x10, 0x17, 0x00, =
0x0a,
> > +                            0x0f, 0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, =
0x0d,
> > +                            0x10, 0x13, 0x15, 0x14, 0x15, 0x10, 0x17);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode rgb30panel_mode =3D {
> > +     .hdisplay       =3D 720,
> > +     .hsync_start    =3D 720 + 45,
> > +     .hsync_end      =3D 720 + 45 + 4,
> > +     .htotal         =3D 720 + 45 + 4 + 45,
> > +     .vdisplay       =3D 720,
> > +     .vsync_start    =3D 720 + 15,
> > +     .vsync_end      =3D 720 + 15 + 3,
> > +     .vtotal         =3D 720 + 15 + 3 + 11,
> > +     .clock          =3D 36570,
> > +     .flags          =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +     .width_mm       =3D 76,
> > +     .height_mm      =3D 76,
> > +};
> > +
> > +static const struct st7703_panel_desc rgb30panel_desc =3D {
> > +     .mode =3D &rgb30panel_mode,
> > +     .lanes =3D 4,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +                   MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .init_sequence =3D rgb30panel_init_sequence,
> > +};
> > +
> >  static int st7703_enable(struct drm_panel *panel)
> >  {
> >       struct st7703 *ctx =3D panel_to_st7703(panel);
> > @@ -694,6 +782,7 @@ static void st7703_remove(struct mipi_dsi_device *d=
si)
> >
> >  static const struct of_device_id st7703_of_match[] =3D {
> >       { .compatible =3D "anbernic,rg353v-panel-v2", .data =3D &rg353v2_=
desc },
> > +     { .compatible =3D "powkiddy,rgb30-panel", .data =3D &rgb30panel_d=
esc },
> >       { .compatible =3D "rocktech,jh057n00900", .data =3D &jh057n00900_=
panel_desc },
> >       { .compatible =3D "xingbangda,xbd599", .data =3D &xbd599_desc },
> >       { /* sentinel */ }
> > --
> > 2.34.1
> >
>
