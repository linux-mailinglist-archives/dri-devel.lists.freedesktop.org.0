Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1333429E27
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6DF6E532;
	Tue, 12 Oct 2021 06:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37A189F07
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634020528; x=1665556528;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=AqDXFNbyoaiHXtkNnJ8/WYQC55Sps3VC5kkKVFJsr5M=;
 b=ogASa9vPtJgnQIRsUM5WsEsKvR86do7aT7HL3aeaijw+DC+2C8E2KWUI
 9HjZ3+I+sFuWaFCAz81CsWYOByUR4wqf0r1hfb3P9qZoDseX4+o6FM9eg
 5WwgJ/i26BsWrx1BNLkrJ7RRkLuvu8aRv7055RlHD7AA8B0LCI+QD43S0
 CInHJKfQwofnJ2432MhyRMVcPe/Z4W6JbR7OWu6ZG7e1olutM2pWBHn4a
 NuuPLDkDRlktqXZ5T8zqO+BLPqubC+gMEWUPQZGgFE8wfuFiqcrh96HJi
 +cDln53qY4YXChWVT+yTfnJyERLdqlPKlN6SB7OFlLhq80l4fzNBtP2dK Q==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984664"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:35:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:35:25 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:35:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634020525; x=1665556525;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=AqDXFNbyoaiHXtkNnJ8/WYQC55Sps3VC5kkKVFJsr5M=;
 b=HAqA0TsVQhFrkbLFrudlNC2FwdDH8j8XKR6L+ERpOvMDoiIlsGWIZzQR
 9dgBm5Urz4xteN5nsmERvhXZmT1nr7kbWyoDVaoUYLBfsnxUB+QBTbW/U
 53+6f20dBUN31QW0kYT8wJ/hfEGjdoSOfOTWz4RByEEXcv6ovyftQbdZd
 hQluNvg6+15WUM56sgf5MeGA+N0jvyX1y5wYQjMsAt63uTlDekFnr8X+d
 x28w3+qpU8nTi3oAoMBnr6hSkONQvXBz1PUPqt0uDDMylv9vTAaeQ1FoD
 Ke97GU0pwGqiw89xWoqV9TrTQB2pCSQ7DBSjF+VqJ3QuCzghqj1VJacze w==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984663"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:35:25 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id 3B6EB280065;
 Tue, 12 Oct 2021 08:35:25 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Tue, 12 Oct 2021 08:35:25
 +0200
Subject: AW: (EXT) Re: [PATCH 1/3] drm/bridge: ti-sn65dsi83: Add vcc supply
 regulator support
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Sam Ravnborg" <sam@ravnborg.org>
Cc: "David Airlie" <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 "Andrzej Hajda" <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "Robert Foss" <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 =?us-ascii?Q?dri-devel=40lists=2Efreedesktop=2Eorg?=
 <dri-devel@lists.freedesktop.org>, 
 =?us-ascii?Q?devicetree=40vger=2Eke?= =?us-ascii?Q?rnel=2Eorg?=
 <devicetree@vger.kernel.org>
Date: Tue, 12 Oct 2021 06:35:25 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.3XovpxrPSziglCoQmtmkFQ.gDS6VjO/1wE@vtuxmail01.tq-net.de>
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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

Hi Sam,

On Mon, 11 Oct 2021 22:29:30 +0200, Sam Ravnborg wrote:
> > VCC needs to be enabled before releasing the enable GPIO.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index a32f70bc68ea..5fab0fabcd15 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > =20
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > @@ -143,6 +144,7 @@ struct sn65dsi83 {
> >  =09struct mipi_dsi_device=09=09*dsi;
> >  =09struct drm_bridge=09=09*panel_bridge;
> >  =09struct gpio_desc=09=09*enable_gpio;
> > +=09struct regulator=09=09*vcc;
> >  =09int=09=09=09=09dsi_lanes;
> >  =09bool=09=09=09=09lvds_dual_link;
> >  =09bool=09=09=09=09lvds_dual_link_even_odd_swap;
> > @@ -647,6 +649,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx,
> enum sn65dsi83_model model)
> > =20
> >  =09ctx->panel_bridge =3D panel_bridge;
> > =20
> > +=09ctx->vcc =3D devm_regulator_get(dev, "vcc");
> In the binding the vcc regulator is required, but devm_regulator_get()
> will create a dummy regulator if not found. Maybe this is on purpose and
> all is good.

Thanks for addressing this. I was slightly unsure myself, but IMHO this is
all good as this makes the driver backward compatible with older DT
which lack the regulator. If there was no vcc regulator necessary and the bridge
was working,then a dummy regulator is fine, as the DT fix would be adding a
always-on, regulator-fixed without any enable/disable possibility anyway.

Best regards,
Alexander

