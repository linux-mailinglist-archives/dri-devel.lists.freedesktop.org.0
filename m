Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1692F6EC9A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 12:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3C10E467;
	Mon, 24 Apr 2023 10:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685A10E467
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 10:00:22 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5191796a483so3299640a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682330420; x=1684922420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUMRNHc1IOPvtn61NaRliWajnbOQ2JnYVpMoyrR6jps=;
 b=ksjcdvRamKkSMZEKA/vEAJ0XlgtzkXUIkC/Du4VtUU9X7CTiVzPMYUvDjSa3c5+4li
 x1zzd+9epZfHWAAwIcEa2E/n6sf5GZnQS4iYJM++OotNWPsHxewi3uPc686+XmMJik9G
 I/9DjXUg04FNDgiZg5B0QHdVjT4f5SlszJEUtAc1tVWLaemQmdo20Qo7bgpjARJVqXKx
 bMFlNL9lpNmTRCmBHrVDjDMiB56wJnhJAZnXTbeGw9zf9EYvQphDYAhm4Y7ytviRrH9o
 ezkINx3DgZirGId7U4BLS4yEg7J0cE+Aq3uGNCWl2yesZsmq2y9wO4Pg8T+DCIEioLIU
 3J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682330420; x=1684922420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pUMRNHc1IOPvtn61NaRliWajnbOQ2JnYVpMoyrR6jps=;
 b=ZfjHOTVkfxdJ5YeCglznGc4u6v0d9OCAO3Zlq6QRNHdqN+nKPnWFlUWOVkiytUN/Tr
 oBpEDKfi+hw4FTHp/SaSjW3Syu2WI8bKo6cCO6Fa1HTosLmtg2hYPYflLkP4Y7dc8LGW
 mChYb3+JvEbqA8GQ/CEO9y1Xjd0OsFzNMDOL5sjw8j2jpNsT1gVllchnRiUD/xgAIQzs
 46gpyy+LI68oHDKGzl3Op6Zwi52Wgzd2wOQUUpuZgZKeXh9JM1b3abvMB5fLtXHf4nEw
 UBxqXLktCy468CTqF56EqTwSqP1oUM/WCKGNmfKk+IyXb9X5yHxDAPP/LPccTAmhOJTh
 wLkg==
X-Gm-Message-State: AAQBX9e5BVP1ZUwAUbElxA8aCICDh3csiWTCm+R1qmCRYv66BzGkXZ0h
 YbLHce7t7vDnvrJwY0V1KO1RWlZgJ4OMv28EUWk=
X-Google-Smtp-Source: AKy350YUY1ReqHJOT7z0DA806c3GV+dlkDAcLbZdmJUpeKLYce3dM6MZm7Bi7vtEySOMlCMSPrH6x1xFWGYiPL+w734=
X-Received: by 2002:a17:90a:4b42:b0:247:944d:b75e with SMTP id
 o2-20020a17090a4b4200b00247944db75emr13573601pjl.12.1682330420421; Mon, 24
 Apr 2023 03:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <CGME20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2@eucas1p2.samsung.com>
 <20230423121232.1345909-6-aford173@gmail.com>
 <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
In-Reply-To: <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 24 Apr 2023 05:00:09 -0500
Message-ID: <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 3:25=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 23.04.2023 14:12, Adam Ford wrote:
> > The high-speed clock is hard-coded to the burst-clock
> > frequency specified in the device tree.  However, when
> > using devices like certain bridge chips without burst mode
> > and varying resolutions and refresh rates, it may be
> > necessary to set the high-speed clock dynamically based
> > on the desired pixel clock for the connected device.
> >
> > This also removes the need to set a clock speed from
> > the device tree for non-burst mode operation, since the
> > pixel clock rate is the rate requested from the attached
> > device like an HDMI bridge chip.  This should have no
> > impact for people using burst-mode and setting the burst
> > clock rate is still required for those users.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> This one breaks Exynos-5433 based TM2e board with a DSI panel.

Marek S,

Thank you for testing!  I knoiw there are several of us who appreciate
your testing this since it's hard to know if something broke without
hardware.  Is there any way you can tell me if the flag is set to
enable MIPI_DSI_MODE_VIDEO_BURST?
I was trying to be diligent about not breaking your boards, but
without your boards, it's difficult.  The theory was that if
MIPI_DSI_MODE_VIDEO_BURST is set and there is a burst clock set in the
device tree, it would use the burst clock.

As a fall-back I could just simply check for the presence of the
burst_clock_rate instead of both MIPI_DSI_MODE_VIDEO_BURST and
burst_clock_rate.


>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index f165483d5044..cea847b8e23c 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -657,11 +657,21 @@ static unsigned long samsung_dsim_set_pll(struct =
samsung_dsim *dsi,
> >
> >   static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
> >   {
> > -     unsigned long hs_clk, byte_clk, esc_clk;
> > +     unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
> >       unsigned long esc_div;
> >       u32 reg;
> > +     struct drm_display_mode *m =3D &dsi->mode;
> > +     int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +     /* m->clock is in KHz */
> > +     pix_clk =3D m->clock * 1000;
> > +
> > +     /* Use burst_clk_rate for burst mode, otherwise use the pix_clk *=
/
> > +     if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->burst_c=
lk_rate)

Would you be willing to test this if this line just read:

              if (dsi->burst_clk_rate)

That would tell me if my fallback idea works.

Thank you,

adam

> > +             hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate)=
;
> > +     else
> > +             hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk=
 * bpp, dsi->lanes));
> >
> > -     hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
> >       if (!hs_clk) {
> >               dev_err(dsi->dev, "failed to configure DSI PLL\n");
> >               return -EFAULT;
> > @@ -1800,10 +1810,11 @@ static int samsung_dsim_parse_dt(struct samsung=
_dsim *dsi)
> >                       return PTR_ERR(pll_clk);
> >       }
> >
> > +     /* If it doesn't exist, use pixel clock instead of failing */
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequ=
ency",
> >                                      &dsi->burst_clk_rate);
> >       if (ret < 0)
> > -             return ret;
> > +             dsi->burst_clk_rate =3D 0;
> >
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequen=
cy",
> >                                      &dsi->esc_clk_rate);
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
