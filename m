Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46C8C7AEB
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359C10E386;
	Thu, 16 May 2024 17:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC6B10E386
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:13:13 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7efD-0005Hj-LM; Thu, 16 May 2024 19:13:07 +0200
Message-ID: <2c5b62e0898efc61da7bec7a261d10e89ccd4a1e.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: drop driver owner assignment
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 16 May 2024 19:13:06 +0200
In-Reply-To: <CAH9NwWfU5eaBRSqhgJgHwgphtL+KUAiX3Tx_7vO11N_BV7qUQQ@mail.gmail.com>
References: <20240330205241.92711-1-krzysztof.kozlowski@linaro.org>
 <CAH9NwWfU5eaBRSqhgJgHwgphtL+KUAiX3Tx_7vO11N_BV7qUQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Montag, dem 01.04.2024 um 12:26 +0200 schrieb Christian Gmeiner:
> >=20
> > Core in platform_driver_register() already sets the .owner, so driver
> > does not need to.  Whatever is set here will be anyway overwritten by
> > main driver calling platform_driver_register().
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

Applied to the etnaviv/next branch.

Regards,
Lucas

>=20
> > ---
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
> > =C2=A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index 734412aae94d..87b31cfee41d 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -1995,7 +1995,6 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops=
 =3D {
> > =C2=A0struct platform_driver etnaviv_gpu_driver =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "etnaviv-gpu",
> > -               .owner =3D THIS_MODULE,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.pm =3D pm_ptr(&etnaviv_gpu_pm_ops),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D etnaviv_gpu_match,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> > --
> > 2.34.1
> >=20
>=20
>=20

