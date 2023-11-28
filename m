Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCE7FC496
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 21:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8B10E323;
	Tue, 28 Nov 2023 20:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7810E323
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F1i1qOexnD29UNSaoUftfhPgutwj/s+He7Ab8qarSNo=; b=FJpP0NRyGZhbrOEjE5kzL2h+bS
 FRvTd+FDTvXD4ch51QGHbDsUrBywJX/QiOQlgu9y1lr/ofjAublGXwhAmn6V4rm+hRk5RemEgzXIO
 Ep52FEkmkQnnzRuTaMMGEJrPU6R9z/+BYhWBG87EE8xf84pkyGusCYfg5vu4rCKVrhNAgjBykq7PA
 14mmV4dRF3eFHLQsFfd1acfHGRtjSM+OyLPCGO45qV3sQEpKJmWt49uDoarkXht/UVQ7uEOqV74Sj
 D4Q6xRuhyj+p2FQaJ8Sjh7fs212NwYySNiJ1rzuYjgPDZYN/xlP9LZ5eu7ApB0NfI+V0wqmj4luL9
 tilJwk2w==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1r842v-005u6O-2I;
 Tue, 28 Nov 2023 21:47:01 +0200
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 19:47:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <e27da7c3a2e19c52ada232b81fa7b8fb75c1960d@iki.fi>
To: "=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?="
 <u.kleine-koenig@pengutronix.de>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
References: undefined
 <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH v3 16/16] drm/tilcdc: Convert to platform remove
 callback returning void
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

November 2, 2023 at 6:56 PM, "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pen=
gutronix.de mailto:u.kleine-koenig@pengutronix.de?to=3D%22Uwe%20Kleine-K%=
C3%B6nig%22%20%3Cu.kleine-koenig%40pengutronix.de%3E > wrote:

>=20
>=20The .remove() callback for a platform driver returns an int which mak=
es
> many driver authors wrongly assume it's possible to do error handling b=
y
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is =
a
> quest to make the remove callback return void. In the first step of thi=
s
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
>=20There is one error path in tilcdc_pdev_remove() that potentially coul=
d
> yield a non-zero return code. In this case an error message describing
> the failure is emitted now instead of
>=20
>=20 remove callback returned a non-zero value. This will be ignored.
>=20
>=20before. Otherwise there is no difference. Also note that currently
> tilcdc_get_external_components() doesn't return negative values.
>=20
>=20Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied this on top of drm-misc-next, dug up my good old Beaglebone-Black=
,and tested that everything still works, so:

Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

I'll apply this shortly to drm-misc-next.

Best regards,
Jyri

> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index 8ebd7134ee21..137cd9f62e9f 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -570,19 +570,18 @@ static int tilcdc_pdev_probe(struct platform_devi=
ce *pdev)
>  match);
> }
>=20
>=20-static int tilcdc_pdev_remove(struct platform_device *pdev)
> +static void tilcdc_pdev_remove(struct platform_device *pdev)
> {
>  int ret;
>=20
>=20 ret =3D tilcdc_get_external_components(&pdev->dev, NULL);
>  if (ret < 0)
> - return ret;
> + dev_err(&pdev->dev, "tilcdc_get_external_components() failed (%pe)\n"=
,
> + ERR_PTR(ret));
>  else if (ret =3D=3D 0)
>  tilcdc_fini(platform_get_drvdata(pdev));
>  else
>  component_master_del(&pdev->dev, &tilcdc_comp_ops);
> -
> - return 0;
> }
>=20
>=20static void tilcdc_pdev_shutdown(struct platform_device *pdev)
> @@ -599,7 +598,7 @@ MODULE_DEVICE_TABLE(of, tilcdc_of_match);
>=20
>=20static struct platform_driver tilcdc_platform_driver =3D {
>  .probe =3D tilcdc_pdev_probe,
> - .remove =3D tilcdc_pdev_remove,
> + .remove_new =3D tilcdc_pdev_remove,
>  .shutdown =3D tilcdc_pdev_shutdown,
>  .driver =3D {
>  .name =3D "tilcdc",
> --=20
>=202.42.0
>
