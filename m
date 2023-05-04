Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99D6F6C2B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8426810E51A;
	Thu,  4 May 2023 12:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090810E51A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683204040; x=1714740040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XjD5Lue9Lkf/dmQP/R8Jn9j1qoZB72NHWl/kVOiids0=;
 b=bQuI11Dwllt9pc1HtGGORwZ3OLkguawPcxCfIajlX1+k3aWDW1WciccM
 HBwtWn54i9odBo5SL73mLw3GN0lcTdm2XtpV0LjkQejq0t1IG2nywbOjc
 +hC76JMyzkvI/t5fJpdHk2QQwWKeqObWmKvmptdJtMLs/z9leRsrbH2zE
 KbJCxZadYV7mkw7ZJ7MfvT8pmvxAvOcsUJQeFDqVnIxYdpOYvUdFNN44c
 2P78HsOQXyavP1jpJxe6bpurLk28mKej9HHW+DncPceBVY/BbuY8zpXVr
 RmE9vsj0Otj11acRBZdMB0X3NnRdfa8qWwMYqNg+uYmcYWBtoKAgViz5a A==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30721542"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 14:40:36 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 14:40:37 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 14:40:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683204037; x=1714740037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XjD5Lue9Lkf/dmQP/R8Jn9j1qoZB72NHWl/kVOiids0=;
 b=cfKKuBCgLWD7c7nJ4RWavABYJt/bmpVc7s/NzVD+64y5qkj+Bz9YTj7D
 bqpLGYjr+616GSjF1P7NMmW9Fm2PUbn2RsCFrXshyGdckBSdwq1EbWfAg
 5NHtGpMXSvVdxIVM9CFZKxIwK+BWKbB6wmjzJHTOJwLkhQZJcUxwkwv+t
 5j7Hog7kCr+C85V3oE+aSz5SzpwO5Y0HA44nOaBvtt7B2Y7jZF32azCpt
 174/RWXpnEnyPovjQ/29N9Uy9tfXtPm+HRlbTWJx2ShrDFwmW+KUfnbP4
 HExUVarBS8E0J+OB/XvLh2QHohLvjNn7oUx96ku87ADBgdqqxigsYbwM1 Q==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30721541"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 14:40:36 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4EF22280056;
 Thu,  4 May 2023 14:40:36 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
Date: Thu, 04 May 2023 14:40:34 +0200
Message-ID: <1759996.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHCN7x+7YWyvy+cDXcD2D5twJt_Ys6tP+TsLgjH4TgcORW0LPA@mail.gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
 <7519081.EvYhyI6sBW@steina-w>
 <CAHCN7x+7YWyvy+cDXcD2D5twJt_Ys6tP+TsLgjH4TgcORW0LPA@mail.gmail.com>
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

Hi Adam,

Am Donnerstag, 4. Mai 2023, 14:00:08 CEST schrieb Adam Ford:
> On Thu, May 4, 2023 at 4:21=E2=80=AFAM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Am Dienstag, 2. Mai 2023, 03:07:55 CEST schrieb Adam Ford:
> > > Make the pll-clock-frequency optional.  If it's present, use it
> > > to maintain backwards compatibility with existing hardware.  If it
> > > is absent, read clock rate of "sclk_mipi" to determine the rate.
> > >=20
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >=20
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > b/drivers/gpu/drm/bridge/samsung-dsim.c index bf4b33d2de76..2dc02a9e3=
7c0
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct
> > > samsung_dsim *dsi) {
> > >=20
> > >       struct device *dev =3D dsi->dev;
> > >       struct device_node *node =3D dev->of_node;
> > >=20
> > > +     struct clk *pll_clk;
> > >=20
> > >       int ret;
> > >      =20
> > >       ret =3D samsung_dsim_of_read_u32(node,
> > >       "samsung,pll-clock-frequency",
> > >      =20
> > >                                      &dsi->pll_clk_rate);
> > >=20
> > > -     if (ret < 0)
> > > -             return ret;
> > > +
> > > +     /* If it doesn't exist, read it from the clock instead of faili=
ng
> > > */
> > > +     if (ret < 0) {
> > > +             pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> > > +             if (!IS_ERR(pll_clk))
> > > +                     dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> > > +             else
> > > +                     return PTR_ERR(pll_clk);
> > > +     }
> >=20
> > Now that 'samsung,pll-clock-frequency' is optional the error in
> > samsung_dsim_of_read_u32() should be changed. Otherwise you will get
> >=20
> > > /soc@0/bus@32c00000/dsi@32e10000: failed to get 'samsung,pll-clock-
> >=20
> > frequency' property
>=20
> I'll change the message from err to info with a message that reads "no
> samsung,pll-clock-frequency, using pixel clock"
>=20
> Does that work?

Having just a info is totally fine with me. Thanks.
Although your suggested message somehow implies (to me) using pixel clock i=
s=20
just a fallback. I'm a bit concerned some might think "samsung,pll-clock-
frequency" should be provided in DT. But this might just be me.

Best regards,
Alexander

> adam
>=20
> > Best regards,
> > Alexander
> >=20
> > >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-
> >=20
> > frequency",
> >=20
> > >                                      &dsi->burst_clk_rate);
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


