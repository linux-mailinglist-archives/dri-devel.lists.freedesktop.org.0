Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCB32B697
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 11:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFB06E0DA;
	Wed,  3 Mar 2021 10:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1676E0D8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 10:31:16 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id l27so4796127vsj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 02:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
 b=MUXW0BLcopSj2WEivWF6kbF45NTv7iE6q4bdW0n64jAOThRVEwx0mwL70/W8QAcW22
 kbp43yMWDe8/wr6M408sE0OwjffCirBG9ZLdfmUcFX2sgeaA6c0HU/locnDgty4g8tBY
 P1x3TV2Q9JYZyg4RAnN+KCw0Zda/CC2Tbyeok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
 b=cZpqR5itLU/rk60GXSbjKWV+ZMECRMmpPoKTW+XanB3wxQiBYM4v/GHIAZ/UxMP4Pl
 srqi3ob6P7UCxJQQm0CGuhNH+vyMWQBK+r8eQMuPyKWnTjn+S1eYU/yvoXO1etEWPA+B
 7fS3fPY2V+64IStvjJFGRXvjxI4UY7V+a6NoM++xnHfGeZ0MZtZZHOESFgca8/IQd01I
 YNDR+fDFfWaQOzN3pFOFEqHB3kpS1QqDMUkJLHSS7mEk6WzwqNZ4zr22X5JN8Xe5hoeR
 nx6JvlHnfT11XygSPxWHJas+HWOzSuhAuNkVR8HDr7rerVCSwMu2L+fHFCHui/5LCLr0
 5Ocw==
X-Gm-Message-State: AOAM531i+9GIW9AZtLeb2MzNGv4h0J7EoNemcrfICdBuMKrMPHtOKRL9
 7cMHi6XOPOCBHs1HyTdvDASPkqfT4NIIIluN83Wi9Q==
X-Google-Smtp-Source: ABdhPJzM84ST5K0eaxhWuR85D0QFzIegAthMVmk/sn+EGXAtrfigTFMmmkIb7ZyoUsPiJw5uyoHo0rSSZNkvG9/REng=
X-Received: by 2002:a67:1046:: with SMTP id 67mr5250935vsq.21.1614767475658;
 Wed, 03 Mar 2021 02:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
In-Reply-To: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 3 Mar 2021 18:31:04 +0800
Message-ID: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Unless someone like me interpreted it literally...
>
> Like in these:
>
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>
> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > index 2314c8122992..f4cdc3cfd7d0 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
> >                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> > -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> > +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> If you read the code you can see that this is interpreted as inserting
> an EOT packet, so here you need to change the logic such:
>
> if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>     val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> This will make sure the host generates the EOT packet in HS mode
> *unless* the flag is set.
>
> (I checked the data sheet.)
>
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > index b9a0e56f33e2..9d9334656803 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
> flag because this was used with the MCDE driver which interpret the
> flag literally.
>
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > index 4aac0d1573dd..b04b9975e9b2 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
> >          */
> >         dsi->mode_flags =
> >                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> > -               MIPI_DSI_MODE_EOT_PACKET |
> > +               MIPI_DSI_MODE_NO_EOT_PACKET |
> >                 MIPI_DSI_MODE_VIDEO_BURST;
>
> Same, just delete the flag.
>
> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > index 065efae213f5..6b706cbf2f9c 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
> >         else
> >                 dsi->mode_flags =
> >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> These are all just semantic bugs due to the ambiguity of the flags, it is
> possible to provide a Fixes: flag for each file using this flag the wrong way
> but I dunno if it's worth it.

Wow nice catch.

I think we should fix all of those _before_ my patch is applied, with
proper Fixes tags so that this can be backported to stable branches,
even if it's a no-op. I can look into it but that may take a bit of
time.

Thanks,

>
> Yours,
> Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
