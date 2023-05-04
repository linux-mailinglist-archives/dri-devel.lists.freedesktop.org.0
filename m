Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D66F6AAB
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836610E246;
	Thu,  4 May 2023 12:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5A010E246
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 12:00:21 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64359d9c531so333576b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201621; x=1685793621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyXif4sCtHvoN5uI5jyPj3Z5NBr5S8ivL+oLwWNb3rg=;
 b=f5GVgLtQqOiovcWwoZPI+yiTb7UcRkGusHC/AMfo1LJYOXrnLlIrhjZ6oEjU9QxJmt
 DwsdrOdUGf6ddzyxiBZItfwQokSfb+CEmrJ+3J3rB+8TH4gB58ddqnPZqVqdfBdNuh/M
 hbrBB89EuGX4Ffv7Y4BBViMl44W298gSC7c4LCxEime69AVP16mtiDk/UbsQzDpKbM5g
 J4VBTwV00WxmQog5AvZdlq5OeoDrka2AhiJ2kt54yMycTG4RlHQOI+LWjuGo7ksISWbP
 gSltMvNmuGnUI91ZsxH5izfGiwR1xFhxtnYoAiT5GUkMKupcjLVXbSCyha1bsKqBCmwW
 hUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201621; x=1685793621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyXif4sCtHvoN5uI5jyPj3Z5NBr5S8ivL+oLwWNb3rg=;
 b=dP828GlT+K7EuOs2O2cHgTzbXzmXDAErY2MlW28NG2F31aPqr/FrRTn5US2PXzANV5
 +1QCabbTZEQAFscFBDcORxUvL3q3yFNyHw/7dzY/mw+kWKRefRkeJNgVKymxa0sjbVou
 Vum/mNqpA5+ZUW32pQOKglm4sNhrIa7ntI3ExHjUiTKfqbsiZZFwzGnEJI5wm/qXO4Wh
 2TPy2m0Vy2WO/LI+ljDwSZquPsdt7yLnFKvY1xa/V6BaHGE7ZFyWBA7HbLpYHeaonVVc
 2oKwCVRFHdPwzUSuqfrYg1Qq88MYJ2zy0rjO60NQA9stqvrCOjFJnWbFXZCu+yTIXE/h
 1kfg==
X-Gm-Message-State: AC+VfDyDUqtRTzobKtGAE94Tn25CqkV5rX84hMGCSqKEjvwvbtqedyDC
 OnnPLT4kBboIZlJWdrHBJOTkeU8JYmaNTqRbwBw=
X-Google-Smtp-Source: ACHHUZ4zmxrnrJ7nTQLL/tZMBkjpJRFnRzCfUvzZOGNrKids1H1zwqdvrvPVhgjMU5zX8H8xhA9SXNBC+ghaJWP7gBE=
X-Received: by 2002:a17:902:70cb:b0:1a6:4016:8974 with SMTP id
 l11-20020a17090270cb00b001a640168974mr2971499plt.31.1683201620554; Thu, 04
 May 2023 05:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-4-aford173@gmail.com>
 <7519081.EvYhyI6sBW@steina-w>
In-Reply-To: <7519081.EvYhyI6sBW@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 May 2023 07:00:08 -0500
Message-ID: <CAHCN7x+7YWyvy+cDXcD2D5twJt_Ys6tP+TsLgjH4TgcORW0LPA@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 4, 2023 at 4:21=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 2. Mai 2023, 03:07:55 CEST schrieb Adam Ford:
> > Make the pll-clock-frequency optional.  If it's present, use it
> > to maintain backwards compatibility with existing hardware.  If it
> > is absent, read clock rate of "sclk_mipi" to determine the rate.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/samsung-dsim.c index bf4b33d2de76..2dc02a9e37c=
0
> > 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung=
_dsim
> > *dsi) {
> >       struct device *dev =3D dsi->dev;
> >       struct device_node *node =3D dev->of_node;
> > +     struct clk *pll_clk;
> >       int ret;
> >
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
> >                                      &dsi->pll_clk_rate);
> > -     if (ret < 0)
> > -             return ret;
> > +
> > +     /* If it doesn't exist, read it from the clock instead of failing=
 */
> > +     if (ret < 0) {
> > +             pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > +             if (!IS_ERR(pll_clk))
> > +                     dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> > +             else
> > +                     return PTR_ERR(pll_clk);
> > +     }
> >
>
> Now that 'samsung,pll-clock-frequency' is optional the error in
> samsung_dsim_of_read_u32() should be changed. Otherwise you will get
> > /soc@0/bus@32c00000/dsi@32e10000: failed to get 'samsung,pll-clock-
> frequency' property

I'll change the message from err to info with a message that reads "no
samsung,pll-clock-frequency, using pixel clock"

Does that work?

adam
>
> Best regards,
> Alexander
>
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-
> frequency",
> >                                      &dsi->burst_clk_rate);
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
