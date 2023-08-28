Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E878B71E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DDE10E32F;
	Mon, 28 Aug 2023 18:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490A10E328
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:17:55 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-26d0d376ec7so2232202a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693246675; x=1693851475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ST1QjTKCc82SZdk+pNvbsP6NakS7LSM94lfvcXXT4Qg=;
 b=qQP8XUJEPoevDAA/CsB7DhvBH4Lw1P3PzFuEm1zPg3eUmryY0kG/kzqjhP8W6JfPhM
 cbJkZUcwBCuHyoOZRmidZBsJMY/jygNtYMbGEqjdV1SaRsT5uwywTrhHiVQFgxXn00+s
 HrobdMW2o8Rqf278qbVtnUUUhNRBGioSEGS8IMwoWQQQvq7RaarvGrXuW9aHYUfODmMQ
 wxhPr6AkfQ48hy+MnuLMWCGwjQAKLbMeX3CSlLrv1ipp5QJShQ5hjnYVbON9/FYJF9Ey
 jOb3T7vvH7IX0VMkG9Z1y65gZ1lYLME5NXaHszK6B5coVPAXmeGwk7aA/JZYv/ZTYoqH
 uJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693246675; x=1693851475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ST1QjTKCc82SZdk+pNvbsP6NakS7LSM94lfvcXXT4Qg=;
 b=doRS7JMU838pdNFXVORyUfNHe9IaLn4r8Yih4AjdmixWDv4jBXC9O+oyzfH2xnjTcq
 fYlBGVmirfBCpleO8fq1n+PU8Y9NeExek5+10OOwfSeL5+UnR1SXV3ijuR3+vFhL/N8a
 oyI4NZ9pXRu8kfcKqxwMJr9gYFUtDRLhE5UDHgM/Ud24/65yl4F9TCeyN1HlJzorLGqH
 dDdO2Sx/vRHyWBKvk/koKRBv+C13L0Db05AEhjzBGtfvlqecly5FAd+inPrc+SR8zqOW
 1zv/k3wXkStTtPAI1aKZ7e6RJBA4UPKS47tr372blD/v6zmADNd//V/eVcoTdj1shKZt
 G5Ig==
X-Gm-Message-State: AOJu0Yy94uoA9O1zKHA3YDSwX1lCh+n08+7RU8bzR5IzOHBbQMzyA0yP
 X1LPczEQ5auigkjyBvmuLWlgl37u+REQC5CcyjKND1Wg
X-Google-Smtp-Source: AGHT+IFldvTwxr1MrZWlFZtUS+bR3qje25kLJgKcGa+/Fu6RdkJkExz6Cg34NH055QMabPBepYhdiGy3F5NwscJxVMQ=
X-Received: by 2002:a17:90b:3ec8:b0:268:1b62:2f6c with SMTP id
 rm8-20020a17090b3ec800b002681b622f6cmr25435521pjb.2.1693246675300; Mon, 28
 Aug 2023 11:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
 <20230828164148.tm23yudt76eqefzh@pengutronix.de>
In-Reply-To: <20230828164148.tm23yudt76eqefzh@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 28 Aug 2023 13:17:44 -0500
Message-ID: <CAHCN7xL8nMs3w82EWtxr1DGncejZtwDgVfR6KBxmkJdD7xAYQg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
To: Marco Felsch <m.felsch@pengutronix.de>
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
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Michael Tretter <m.tretter@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 11:42=E2=80=AFAM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> On 23-08-28, Michael Tretter wrote:
> > The PLL requires a clock between 2 MHz and 30 MHz after the pre-divider=
.
> > The reference clock for the PLL may change due to changes to it's paren=
t
> > clock. Thus, the frequency may be out of range or unsuited for
> > generating the high speed clock for MIPI DSI.
> >
> > Try to keep the pre-devider small, and set the reference clock close to
> > 30 MHz before recalculating the PLL configuration. Use a divider with a
> > power of two for the reference clock as this seems to work best in
> > my tests.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index da90c2038042..4de6e4f116db 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -611,10 +611,21 @@ static unsigned long samsung_dsim_set_pll(struct =
samsung_dsim *dsi,
> >       u16 m;
> >       u32 reg;
> >
> > -     if (dsi->pll_clk)
> > +     if (dsi->pll_clk) {
> > +             /*
> > +              * Ensure that the reference clock is generated with a po=
wer of
> > +              * two divider from its parent, but close to the PLLs upp=
er
> > +              * limit of the valid range of 2 MHz to 30 MHz.
> > +              */
> > +             fin =3D clk_get_rate(clk_get_parent(dsi->pll_clk));
> > +             while (fin > 30 * MHZ)
> > +                     fin =3D fin / 2;
>
> Really just a cosmetic nit: fin /=3D 2;
>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>
> > +             clk_set_rate(dsi->pll_clk, fin);
> > +
> >               fin =3D clk_get_rate(dsi->pll_clk);
> > -     else
> > +     } else {
> >               fin =3D dsi->pll_clk_rate;
> > +     }

I don't have all the code style rules memorized.  Did you run it
through checkpatch?  I wonder if the braces here are appropriate for a
1-line after the else.  If checkpatch is happy, I am fine with it.

adam
> >       dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
> >
> >       fout =3D samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
> >
> > --
> > 2.39.2
> >
> >
> >
