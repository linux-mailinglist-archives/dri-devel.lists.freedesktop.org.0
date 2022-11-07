Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E062046B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A745310E37C;
	Tue,  8 Nov 2022 00:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1498 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 20:52:35 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A11B10E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mhxy5k+UO90ee/DYJ0f+UQwoC8MB8QgKlM5qkTcHKxk=; b=p3yQhIawv9MS9Agnnd3LQ7Yl1P
 lSL2hF1KFN7BOTVmLUWDhS1WMCZ7bAgpNaFpyGJptvzkYdu4S9Rd5jh0msp4lrzNW96XIapTKPUZb
 d1aj8iiOc2DO8UlkMmoZle3jMFIoC+PaNHtNMxPr/CHMZT8RfbE3Dt/cQmfqarFwRwqp8PAVdR+td
 payVxccfqk6M2VlEej0ShaUd0c+yrAwOUkSNXB1dMQwWpVWOPPXU2cdZFWyFLQwtJQQHrccVo3Fn7
 FGu0qFotkXCO6FKpqi30p/Du6uWhEWTBlWqDZCKa3FzYNDTMl0Y9zzz5qiVynRTcGTvH5V0Kc0eui
 GEPI7lwA==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sarha@kapsi.fi>)
 id 1os8it-00Cfbu-Qc; Mon, 07 Nov 2022 22:28:00 +0200
MIME-Version: 1.0
Date: Mon, 07 Nov 2022 20:27:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: sarha@kapsi.fi
Message-ID: <0c84acf54ab7db9210cede8ca210438c4c902324@kapsi.fi>
To: "Paul Cercueil" <paul@crapouillou.net>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
References: undefined <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 21/26] drm: tilcdc: Remove #ifdef guards for PM
 related functions
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
X-Mailman-Approved-At: Tue, 08 Nov 2022 00:03:28 +0000
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

November 7, 2022 at 7:52 PM, "Paul Cercueil" <paul@crapouillou.net mailto=
:paul@crapouillou.net?to=3D%22Paul%20Cercueil%22%20%3Cpaul%40crapouillou.=
net%3E > wrote:

>=20
>=20Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handl=
e
> the .suspend/.resume callbacks.
>=20
>=20These macros allow the suspend and resume functions to be automatical=
ly
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards.
>=20
>=20This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
>=20Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Jyri Sarha <jyri.sarha=C4=B1@iki.fi>

> ---
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index f72755b8ea14..cd5bdc2f803a 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -496,7 +496,6 @@ static const struct drm_driver tilcdc_driver =3D {
> * Power management:
> */
>=20
>=20-#ifdef CONFIG_PM_SLEEP
> static int tilcdc_pm_suspend(struct device *dev)
> {
>  struct drm_device *ddev =3D dev_get_drvdata(dev);
> @@ -518,11 +517,9 @@ static int tilcdc_pm_resume(struct device *dev)
>  pinctrl_pm_select_default_state(dev);
>  return drm_mode_config_helper_resume(ddev);
> }
> -#endif
>=20
>=20-static const struct dev_pm_ops tilcdc_pm_ops =3D {
> - SET_SYSTEM_SLEEP_PM_OPS(tilcdc_pm_suspend, tilcdc_pm_resume)
> -};
> +static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
> + tilcdc_pm_suspend, tilcdc_pm_resume);
>=20
>=20/*
> * Platform driver:
> @@ -597,7 +594,7 @@ static struct platform_driver tilcdc_platform_drive=
r =3D {
>  .remove =3D tilcdc_pdev_remove,
>  .driver =3D {
>  .name =3D "tilcdc",
> - .pm =3D &tilcdc_pm_ops,
> + .pm =3D pm_sleep_ptr(&tilcdc_pm_ops),
>  .of_match_table =3D tilcdc_of_match,
>  },
> };
> --=20
>=202.35.1
>
