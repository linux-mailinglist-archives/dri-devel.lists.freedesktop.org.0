Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0E74811C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0B810E172;
	Wed,  5 Jul 2023 09:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F3F10E172
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688549901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXLsTS7KaoyUn3o3Li2lCti5SQIdGRyASkhZ/jCo3J4=;
 b=yXsvFk2x0L31gpfHefOp6MZcJRAUdCiZMsvz/dSYZSfdG68trY+SzYsk34D7vDxIqT+w2d
 9Pm6fmbjeAnnSuIg5mxZN00qBgMqW659gmNkeVvcpSlJELRbJERfoJom8wqLdHeoCEa5C4
 huetSgKD9HB33Kev/uAlIt/cz9sCGAE=
Message-ID: <efc14246bd9613e4f0cb579e2dd14d64d715d829.camel@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
From: Paul Cercueil <paul@crapouillou.net>
To: =?UTF-8?Q?=EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen?= Platform
 =?UTF-8?Q?Lab=28SR=29/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90?=
 <inki.dae@samsung.com>, 'Krzysztof Kozlowski'
 <krzysztof.kozlowski+dt@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, 
 'Conor Dooley' <conor+dt@kernel.org>, 'Alim Akhtar'
 <alim.akhtar@samsung.com>, 'Neil Armstrong' <neil.armstrong@linaro.org>,
 'Sam Ravnborg' <sam@ravnborg.org>
Date: Wed, 05 Jul 2023 11:38:19 +0200
In-Reply-To: <0f0c01d9ae09$0d3a17f0$27ae47d0$@samsung.com>
References: <20230703214715.623447-1-paul@crapouillou.net>
 <CGME20230703214744epcas1p1d2763aa96e694d0e1693fabf953e83f6@epcas1p1.samsung.com>
 <20230703214715.623447-3-paul@crapouillou.net>
 <0f0c01d9ae09$0d3a17f0$27ae47d0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

Le mardi 04 juillet 2023 =C3=A0 08:49 +0900, =EB=8C=80=EC=9D=B8=EA=B8=B0/Ti=
zen Platform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
a =C3=A9crit=C2=A0:
> Hi,
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > Of
> > Paul Cercueil
> > Sent: Tuesday, July 4, 2023 6:47 AM
> > To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Rob
> > Herring
> > <robh+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Alim
> > Akhtar
> > <alim.akhtar@samsung.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Sam
> > Ravnborg <sam@ravnborg.org>
> > Cc: devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > linux-
> > kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Paul
> > Cercueil
> > <paul@crapouillou.net>; linux-arm-kernel@lists.infradead.org
> > Subject: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
> >=20
> > Register a backlight device to be able to switch between all the
> > gamma
> > levels.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40
> > ++++++++++++++++++++
> > =C2=A01 file changed, 40 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > index 7fd9444b42c5..b4f87d6244cb 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > @@ -8,6 +8,7 @@
> > =C2=A0 * Andrzej Hajda <a.hajda@samsung.com>
> > =C2=A0*/
> >=20
> > +#include <linux/backlight.h>
> > =C2=A0#include <linux/delay.h>
> > =C2=A0#include <linux/gpio/consumer.h>
> > =C2=A0#include <linux/module.h>
> > @@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> >=20
> > +static int ld9040_bl_update_status(struct backlight_device *dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ld9040 *ctx =3D dev_g=
et_drvdata(&dev->dev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctx->brightness =3D dev->pro=
ps.brightness;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ld9040_brightness_set(ctx);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +
> > +static int ld9040_bl_get_intensity(struct backlight_device *dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev->props.fb_blank =3D=
=3D FB_BLANK_UNBLANK &&
>=20
> fb_blank member is deprecated according to the description of
> backlight.h
> file so you could drop above condition I think.

Thanks. I'll send a V2.

Cheers,
-Paul
