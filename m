Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D66EC95A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017A810E452;
	Mon, 24 Apr 2023 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B3B10E475
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:47:17 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso26479221b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682329636; x=1684921636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAISL+GRpU6SsSBHg/ya3DxahdjCFsvz5twTkYKfKiE=;
 b=YhWlvytb/xX4K/sErPeoc2dMxv9ckbJwfV0cmffwJNnUv5vOv4cWew70RVrJ1hkN3O
 XCruppbjHm3iy7sp3d7uMKabTaAurcPEYa+rLp8LWMx47YJ6oWyuMPHt9b/3JcxZvB8z
 dcwg6V8nRRLgO+PQ2EJGZzKUvmmhKYtHQkgHrbuV/k6HGQ9Hx6Zf2mDpGgvwtSWIWuAV
 9wiNurJLOVc6/SXgEGr2jIQ3EeNyghtMEXMX9ag+IzjRvH7KygY61flkTANF1hybnVWw
 GwYT2B5bUor/gFsqaE5vtJDDC070yjb8a/b7VLjIPsybZDNF6zeoihePl58m4ORe+EZV
 YavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682329636; x=1684921636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAISL+GRpU6SsSBHg/ya3DxahdjCFsvz5twTkYKfKiE=;
 b=fnWOAd7deS/nJ++bE3lNSHHBRK7L3rbP5E6BoKsaVzaAHItheUTxB4yDKSJw27yQ8v
 eROtCv0XSsXlPR5r2scBlLNMNeRJkAHHHOdPu02GlV8nxg1xjATAy0W9Tve7R1pEGf5W
 FQ1lvitosSw2v7bgnJxC7B6QkIPI0l8q2o/ZfHaDSThtdsn/Xf53aUHkJ+KtYZdRxLrK
 1EmsuruhEycQtUbeXReowLR7SqNbg+/2IHgfhgW4iTijVi41J+NaG46sklurkYucoNzK
 PWyBUMpLquaW3fcfduRR3IjSA9PnnHQZR/8i7VfBViRmbDpWZNdmpJHTqYj1wNAapZLr
 GJzA==
X-Gm-Message-State: AAQBX9e5BsE7Roeahn7WVNaLAVtHdllac9ftymPSap8wOWzV/dxospxZ
 NJgd6CJacN5D5id7s1kKSX/2Xt+Rp2KREIiq9DQ=
X-Google-Smtp-Source: AKy350auTsyZsYtcMAYd1CDjkR0cyubUg/DY615MQDX3JNzgSgUqxq1TAK/QoEPqm9A/3FZFIMcr2dLOiKOcPpSjKrA=
X-Received: by 2002:a17:902:ce89:b0:1a9:778b:c1a8 with SMTP id
 f9-20020a170902ce8900b001a9778bc1a8mr3444487plg.12.1682329635853; Mon, 24 Apr
 2023 02:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-2-aford173@gmail.com>
 <CAMty3ZCn9_AT8SOfFD-MYox16ZcqOEezt_0x6aES6LWQFj8Kpg@mail.gmail.com>
In-Reply-To: <CAMty3ZCn9_AT8SOfFD-MYox16ZcqOEezt_0x6aES6LWQFj8Kpg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 24 Apr 2023 04:47:04 -0500
Message-ID: <CAHCN7xLYfEO9Pxq91vZSDG0QXjnx3BEKYdsTXgQ1BTbtuTbLGQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/6] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
To: Jagan Teki <jagan@amarulasolutions.com>
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
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 4:03=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Sun, Apr 23, 2023 at 5:42=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > Scale the blanking packet sizes to match the ratio between HS clock
> > and DPI interface clock. The controller seems to do internal scaling
> > to the number of active lanes, so we don't take those into account.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index e0a402a85787..2be3b58624c3 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(struct =
samsung_dsim *dsi)
> >         u32 reg;
> >
> >         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > +               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> > +               int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_k=
hz / m->clock;
>
> I do not quite understand why it depends on burst_clk_rate, would you
> please explain? does it depends on bpp something like this
>
> mipi_dsi_pixel_format_to_bpp(format) / 8

The pixel clock is currently set to the burst clock rate.  Dividing
the clock by 1000 gets the pixel clock in KHz, and dividing by 8
converts bits to bytes.
Later in the series, I change the clock from the burst clock to the
cached value returned from samsung_dsim_set_pll.

>
> > +               int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz /=
 m->clock;
> > +               int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_=
khz / m->clock;
> > +
> > +               /* remove packet overhead when possible */
> > +               hfp =3D max(hfp - 6, 0);
> > +               hbp =3D max(hbp - 6, 0);
> > +               hsa =3D max(hsa - 6, 0);
>
> 6 blanking packet overhead here means, 4 bytes + payload + 2 bytes
> format? does this packet overhead depends on the respective porch's
> like hpf, hbp and hsa has different packet overheads?

Lucas might be able to explain this better.  However, it does match
the values of the downstream NXP kernel, and I tried playing with
these values manually, and 6 appeared to be the only number that
seemed to work for me too.  I abandoned my approach for Lucas'
implementation, because it seemed more clear than mine.
Maybe Lucas can chime in, since this is really his patch.

adam
>
> Jagan.
