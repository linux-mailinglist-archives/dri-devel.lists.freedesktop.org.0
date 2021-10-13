Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F342BB04
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 10:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8A6E82C;
	Wed, 13 Oct 2021 08:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B866E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634115565; x=1665651565;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=ZlBU797THpcOyV2xk/zMyG8zPnxIHCk4stnE0VSNmfQ=;
 b=GpvkmH2MkrshglK9+10hAIT8suV0WIRnvQaIpPUKrtrVxdL99HfQ8DvN
 Iwve4SoZRy9K21pu//ZugXEa60eDQBQF/asCh/GTKe59kWoGw8cog8my6
 vd7/KHzDdk55jvs/9ejVEB8HT/Fgl5E+6U+gUjtwO53oOXNjVTrKHgsg+
 BqpEkJopQ5M2FWFq8FeuQJ6lgIKOfRxOeVUkn3rnnFa87mqz3Yngoc01o
 4F3wmJph5yuYO3oPzy+52FV6uIgndSrVB0azyx2qoRmYv0v0uDmm68qs9
 V242zAoPmUnm6tGtj9NSpJXUWZHzrCGIyIm1Oqprvpl1jTaSReag1kowC g==;
X-IronPort-AV: E=Sophos;i="5.85,370,1624312800"; d="scan'208";a="20017026"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2021 10:59:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 13 Oct 2021 10:59:23 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 13 Oct 2021 10:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634115563; x=1665651563;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=ZlBU797THpcOyV2xk/zMyG8zPnxIHCk4stnE0VSNmfQ=;
 b=YxZa/7IcnFgUHgF0ajaCusRbMxm16RD1pYmpgiJNo5gtkBKKfrVHoIFf
 MsW0R2d84xIu7d35gjA3GiAIhIzEsEm5OpRZ1eYOrhC6gmCdoz3qNfFvN
 coz2eEZNezqzNDpi9Ct6fRekOB0Swkpi8YHCYCDIt3s0sE+tcivYU2Xc1
 34KN2zhhiZ83R75r4h+G8QbqzAOB/g3yU0ug2BIbPM88udXR1onzezIlK
 rQnu25NCVxSjQZbOIYNgRs1lJ0SlruoU/v6yDFyL3dKh8KRpLhdtvPkWL
 siS+QidF9+Uq45fk9gV1jSc6bau9rz5defTT8Um+c83n1F+OJjse32t2k g==;
X-IronPort-AV: E=Sophos;i="5.85,370,1624312800"; d="scan'208";a="20017025"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Oct 2021 10:59:22 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id BB4D9280065;
 Wed, 13 Oct 2021 10:59:22 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Wed, 13 Oct 2021 10:59:22
 +0200
Subject: AW: (EXT) Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi83: Add vcc
 supply regulator support
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "David Airlie" <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 "Andrzej Hajda" <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "Robert Foss" <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 =?us-ascii?Q?dri-devel=40lists=2Efreedesktop=2Eorg?=
 <dri-devel@lists.freedesktop.org>, 
 =?us-ascii?Q?devicetree=40vger=2Eke?= =?us-ascii?Q?rnel=2Eorg?=
 <devicetree@vger.kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>
Date: Wed, 13 Oct 2021 08:59:22 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.wBDDeOkQQ0CwJna1+1hciA.AJExnRDA1wE@vtuxmail01.tq-net.de>
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

Hello Laurent,

On Tue, Oct 12, 2021 at 10:43 +0200, Laurent Pinchart wrote:
> On Tue, Oct 12, 2021 at 08:48:43AM +0200, Alexander Stein wrote:
> > VCC needs to be enabled before releasing the enable GPIO.
> >=20
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 9072342566f3..a6b1fd71dfee 100644
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
> > +=09if (IS_ERR(ctx->vcc))
> > +=09=09return dev_err_probe(dev, PTR_ERR(ctx->vcc),
> > +=09=09=09=09     "Failed to get supply 'vcc': %pe\n",
> > +=09=09=09=09     ctx->vcc);
> > +
> >  =09return 0;
> >  }
> > =20
> > @@ -691,7 +699,11 @@ static int sn65dsi83_probe(struct i2c_client *client,
> >  =09ctx->bridge.of_node =3D dev->of_node;
> >  =09drm_bridge_add(&ctx->bridge);
> > =20
> > -=09return 0;
> > +=09ret =3D regulator_enable(ctx->vcc);
> > +=09if (ret)
> > +=09=09dev_err(dev, "Failed to enable vcc: %i\n", ret);
>=20
> I think this should move to sn65dsi83_atomic_pre_enable() (and similarly
> for regulator_disable()) as keeping the regulator enabled at all times
> will cost power.

I get your idea. The thing is that unless 1V8 is provided the bridge is not
even accessible on I2C. So any access to sn65dsi83.regmap without the vcc
regulator enabled will fail. AFAICS this is not an issue right now, as regmap
is only used in sn65dsi83_atomic_enable(), sn65dsi83_atomic_disable() and
sn65dsi83_atomic_pre_enable(), so your sugestion would work, but I'm
hestitating a bit. The driver then has to ensure all regmap uses are done
only when vcc is enabled.

Best regards,
Alexander

