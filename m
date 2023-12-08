Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401B809E34
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4010EA16;
	Fri,  8 Dec 2023 08:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209010EA16
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 08:34:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9efa1ab7fso21998571fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 00:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702024492; x=1702629292;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlzW/rf2HelGsf6Q2WVJDDVEnvIjksUp/xAKKkchs/Y=;
 b=WcIGvIeKab5FTGSEJagmgkxFMRRO+YukN2LBZWw6MtSfrabhL7BONqNOryeKRMyW59
 2Me/hzO1aBh1uBwoMewW7RQ/kTh2/GsrMDsnVOY81U/Se8xkw/G2GOBgTBM3+HhQG3/v
 gGSkyaVOWpzz3v/698g+jrNnMNrS90DgbXp3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702024492; x=1702629292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlzW/rf2HelGsf6Q2WVJDDVEnvIjksUp/xAKKkchs/Y=;
 b=LeaJbLhima4gG8k1FW6qzQTOvNhLaxPLgCxfkBknGwK67qnVkctfAsFYjsYaxjUDiV
 fF/0x9MrLI/ni+oV0To6mssZbFw0enFeGw5MKlDHDRYp/9dnmFRRuua7ZavAlmRARI6N
 qWKWxqFwcMeFeamzBz/f0uWotzvITwMrc3CJbDWhmzRrjeZYhIi9JLk0oYnkdfzyta3D
 resGWT97KPxwqMh1Lmm1bpil+Y0YU6qjDGma15M2Jxo1uNDs1wS83GciFoWjuzEQSvEj
 qDCDB8x+9qbOPB2PqJqkuWg5mNIweu++HSK00VFIYy3QiGpBhnBLZw0QVMdXcFSvfuQE
 zYWg==
X-Gm-Message-State: AOJu0YyP/h3f2xvnYG8GkXtRoG9MRktBZvZUcC5+MREAOszX7rzu40nj
 Qha4LGVfMQeQKtX5WcLz3QBsYlexgTefJPxhH2//Jg==
X-Google-Smtp-Source: AGHT+IHYQcXvlIHXkV8cyjUJ8LSw43LcQtotQfIhLDNGWBEFVxXJ+v1X/BS2BxUNwhyW1CzLftaqo0T1DNz3Z4mDFeo=
X-Received: by 2002:a2e:98d4:0:b0:2ca:14ef:3845 with SMTP id
 s20-20020a2e98d4000000b002ca14ef3845mr1210470ljj.160.1702024491938; Fri, 08
 Dec 2023 00:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
 <20231207141723.108004-5-dario.binacchi@amarulasolutions.com>
 <21e1b508-328a-4ec0-9f1f-75773f2686c3@kontron.de>
In-Reply-To: <21e1b508-328a-4ec0-9f1f-75773f2686c3@kontron.de>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 8 Dec 2023 09:34:41 +0100
Message-ID: <CAOf5uwmcCA8hxeDv4dDPe1PRag2Gj_myHrGhuF7c2=-e=NPcfQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] drm: bridge: samsung-dsim: complete the
 CLKLANE_STOP setting
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder

On Thu, Dec 7, 2023 at 5:58=E2=80=AFPM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 07.12.23 15:16, Dario Binacchi wrote:
> > The patch completes the setting of CLKLANE_STOP for the imx8mn and imx8=
mp
> > platforms (i. e. not exynos).
>
> This also affects i.MX8MM, so better just mention i.MX in general in the
> commit message.
>
> >
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 15bf05b2bbe4..13f181c99d7e 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -96,6 +96,7 @@
> >  #define DSIM_MFLUSH_VS                       BIT(29)
> >  /* This flag is valid only for exynos3250/3472/5260/5430 */
> >  #define DSIM_CLKLANE_STOP            BIT(30)
> > +#define DSIM_NON_CONTINUOUS_CLKLANE  BIT(31)
> >
> >  /* DSIM_ESCMODE */
> >  #define DSIM_TX_TRIGGER_RST          BIT(4)
> > @@ -945,8 +946,12 @@ static int samsung_dsim_init_link(struct samsung_d=
sim *dsi)
> >        * power consumption.
> >        */
> >       if (driver_data->has_clklane_stop &&
> > -         dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +         dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> > +             if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> > +                     reg |=3D DSIM_NON_CONTINUOUS_CLKLANE;
> > +
> >               reg |=3D DSIM_CLKLANE_STOP;
> > +     }
>
> I really wonder what the difference between DSIM_NON_CONTINUOUS_CLKLANE
> and DSIM_CLKLANE_STOP is.
>
> If Exynos only has the latter, it's pretty clear what to use. But as
> i.MX has both of these bits, should both be set? Or is setting
> DSIM_NON_CONTINUOUS_CLKLANE enough and we should leave DSIM_CLKLANE_STOP
> alone?
>

We add the DSIM_NON_CONTINUOUS_CLKLANE because there was a similar
commit in NXP bsp.
Now according to the datasheet the DSIM_NON_CONTINUOUS_CLKLANE should
be the right bit.

NXP guys should clarify then a bit

Michael

> Maybe someone has a clue here. The description of the bits in the RM is:
>
> DSIM_NON_CONTINUOUS_CLKLANE - Non-continuous clock mode
> DSIM_CLKLANE_STOP -  PHY clock lane On/Off for ESD
>
> >       samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
> >
> >       lanes_mask =3D BIT(dsi->lanes) - 1;
