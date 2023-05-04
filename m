Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0776F6CCD
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91E10E52B;
	Thu,  4 May 2023 13:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4D110E53B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683206290; x=1714742290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWGSg6d1nhW2VOQBIw4YIvEy4bV7o1yT12cZc0wNGSw=;
 b=Y5rK8amhwh013Wsg7lpA/dP+AX18VP6sumfQ0K7bcFdmdnj+vAuEWcGP
 yQcOVR5e3sJfFTKKD74sXsXM18V6M7t4Gc/YKPodzoBWatYTcYcYBIzce
 OwLvXavz16C9oV4ldvU3zaBnIjvNOwmoLH7VFEgHOm0KrwXOxl7ieUTFn
 FKUKxvMq48aha4eHsW+PYcklVTjkbrM0/nDVfI2kRBuIQpdRyctIocinq
 /Z6ZFiaX4cWpvXxZgTKlc9n/l3fzCAE2cMSDAtHAReuWCte0vRLRW0n/h
 eFbQ5kor/BSPY1kRaJHgN2HGjOs3doHobH3xTnneHI/GUc+g/KIq4UHzZ g==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30722926"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 15:18:07 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 15:18:07 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 15:18:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683206287; x=1714742287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWGSg6d1nhW2VOQBIw4YIvEy4bV7o1yT12cZc0wNGSw=;
 b=pYrRRUo7K3oo5ylmXUGvA0xcMVhThxeQfKdUBtEEfT7FWDNWM7eSawar
 D0o1YNNaNiu3xTmsLzGOCu+3/leMpZulGEhQWA2pawngn5hM+qmjLix8J
 JTQw9QWgNVzpi2bwB4Va9CXV/IKJ454kOvY8tJ/ap0jJJ090UtcvZ+Uk6
 da8W7Zu1Hg3CBPciEuWnxPE9Y4NPCmidyUyIjVrAcGvVTPb9VvruJE3lG
 vBsOvqYZoV+jbRrONHn9rnk0+5FoeWg7wWGqnGDVvZ9QpLmVy9k32y0MO
 HBgOW+jWSo1vOPX1e0oW9pcY4b3pDDfRsuRphOMXT0nfOYxI+bh2ghau8 g==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30722925"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 15:18:07 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A0123280056;
 Thu,  4 May 2023 15:18:06 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
Date: Thu, 04 May 2023 15:18:07 +0200
Message-ID: <1856543.CQOukoFCf9@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHCN7x+Me-wbUNNyN9fJwg3KETE+0S2MfPOsAb=-CSuSUvZvPg@mail.gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
 <1759996.VLH7GnMWUR@steina-w>
 <CAHCN7x+Me-wbUNNyN9fJwg3KETE+0S2MfPOsAb=-CSuSUvZvPg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Am Donnerstag, 4. Mai 2023, 14:57:01 CEST schrieb Adam Ford:
> On Thu, May 4, 2023 at 7:40=E2=80=AFAM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Adam,
> >=20
> > Am Donnerstag, 4. Mai 2023, 14:00:08 CEST schrieb Adam Ford:
> > > On Thu, May 4, 2023 at 4:21=E2=80=AFAM Alexander Stein
> > >=20
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Am Dienstag, 2. Mai 2023, 03:07:55 CEST schrieb Adam Ford:
> > > > > Make the pll-clock-frequency optional.  If it's present, use it
> > > > > to maintain backwards compatibility with existing hardware.  If it
> > > > > is absent, read clock rate of "sclk_mipi" to determine the rate.
> > > > >=20
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > ---
> > > > >=20
> > > > >  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
> > > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > b/drivers/gpu/drm/bridge/samsung-dsim.c index
> > > > > bf4b33d2de76..2dc02a9e37c0
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct
> > > > > samsung_dsim *dsi) {
> > > > >=20
> > > > >       struct device *dev =3D dsi->dev;
> > > > >       struct device_node *node =3D dev->of_node;
> > > > >=20
> > > > > +     struct clk *pll_clk;
> > > > >=20
> > > > >       int ret;
> > > > >      =20
> > > > >       ret =3D samsung_dsim_of_read_u32(node,
> > > > >       "samsung,pll-clock-frequency",
> > > > >      =20
> > > > >                                      &dsi->pll_clk_rate);
> > > > >=20
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > +
> > > > > +     /* If it doesn't exist, read it from the clock instead of
> > > > > failing
> > > > > */
> > > > > +     if (ret < 0) {
> > > > > +             pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > > > > +             if (!IS_ERR(pll_clk))
> > > > > +                     dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> > > > > +             else
> > > > > +                     return PTR_ERR(pll_clk);
> > > > > +     }
> > > >=20
> > > > Now that 'samsung,pll-clock-frequency' is optional the error in
> > > > samsung_dsim_of_read_u32() should be changed. Otherwise you will get
> > > >=20
> > > > > /soc@0/bus@32c00000/dsi@32e10000: failed to get 'samsung,pll-cloc=
k-
> > > >=20
> > > > frequency' property
> > >=20
> > > I'll change the message from err to info with a message that reads "no
> > > samsung,pll-clock-frequency, using pixel clock"
> > >=20
> > > Does that work?
> >=20
> > Having just a info is totally fine with me. Thanks.
> > Although your suggested message somehow implies (to me) using pixel clo=
ck
> > is just a fallback. I'm a bit concerned some might think
> > "samsung,pll-clock- frequency" should be provided in DT. But this might
> > just be me.
>=20
> Oops, I got the PLL and burst burst clock confused.  I think both
> burst-clock and pll clock messages should get updates.
>=20
> The pll clock should say something like "samsung,pll-clock-frequency
> not defined, using sclk_mipi"
>=20
> The imx8m n/m/p have the sclk_mipi defined in the device tree, and
> this patch allows them to not have
> to manually set the pll clock since it can be read.  This allows to
> people to change the frequency of the PLL in
> in one place and let the driver read it instead of having to set the
> value in two places for the same clock.

That's why I would like to make it sound less error-like.
How about "Using sclk_mipi for pll clock frequency"?

> For the burst clock, I'd like to propose
> "samsung,burst-clock-frequency not defined, using pixel clock"

Similar to above how about "Using pixel clock for burst clock frequency"?

> Does that work for you?

But I'm okay with both ways. Up to you.

Thanks and best regards,
Alexander


> > frequency
> >=20
> >=20
> > Best regards,
> > Alexander
> >=20
> > > adam
> > >=20
> > > > Best regards,
> > > > Alexander
> > > >=20
> > > > >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-
> > > >=20
> > > > frequency",
> > > >=20
> > > > >                                      &dsi->burst_clk_rate);
> > > >=20
> > > > --
> > > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefe=
ld, Germany
> > > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, St=
efan Schneider
> > > > http://www.tq-group.com/
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > http://www.tq-group.com/


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


