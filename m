Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48256FB347
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 16:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160110E2E8;
	Mon,  8 May 2023 14:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2156 seconds by postgrey-1.36 at gabe;
 Mon, 08 May 2023 14:52:40 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E781A10E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CYta58IBtIXxkhezsoY3FH3+nATRTJi969qnxZV/jW4=; b=sch0hhWflzONo9+xbAPnrWagj8
 tJEydLtdUR3lOFC+8et16IHN7Q9LLCQWJ5ZuYqh2N9A0BN1K9wRCOCmJjlNLigFvfemFOuKLQaiKp
 JFXUSjnbboPqZ5M19MV7eO08eddQZmzWCZHPNPzWq4aMMXX2Lzga7S8sEGw7YJVOFUrrEaR1p4+T2
 eHjOwvqjx78hoBiDN4BtIFYei67hPBvy5x6bfjOtG+PuNiZignlby4zLE2TkN3vvLHma2G07nkf+O
 8R9BlNWqC02wFYPfxAQbrE6sEPbVsf/S6oBNWSUp/65dtDHmOuiIox1dDoETrWhf5WJN7sq9G21tW
 zoYiLXVQ==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jyri.sarha@iki.fi>)
 id 1pw1fG-00C27i-W1; Mon, 08 May 2023 17:16:35 +0300
MIME-Version: 1.0
Date: Mon, 08 May 2023 14:16:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <b0c8ed84f7c9b0f60d81015d53bb74b640bcec1c@iki.fi>
To: "=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?="
 <u.kleine-koenig@pengutronix.de>, "Jyri Sarha" <jyri.sarha@iki.fi>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
References: undefined <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
Subject: Re: [PATCH 47/53] drm/tilcdc: Convert to platform remove callback
 returning void
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

May 7, 2023 at 7:26 PM, "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutro=
nix.de mailto:u.kleine-koenig@pengutronix.de?to=3D%22Uwe%20Kleine-K%C3%B6=
nig%22%20%3Cu.kleine-koenig%40pengutronix.de%3E > wrote:

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
>=20Trivially convert this driver from always returning zero in the remov=
e
> callback to the void returning variant.
>=20
>=20Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>

> ---
> drivers/gpu/drm/tilcdc/tilcdc_panel.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/=
tilcdc/tilcdc_panel.c
> index 2729e16bc053..9aefd010acde 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> @@ -374,7 +374,7 @@ static int panel_probe(struct platform_device *pdev=
)
>  return ret;
> }
>=20
>=20-static int panel_remove(struct platform_device *pdev)
> +static void panel_remove(struct platform_device *pdev)
> {
>  struct tilcdc_module *mod =3D dev_get_platdata(&pdev->dev);
>  struct panel_module *panel_mod =3D to_panel_module(mod);
> @@ -387,8 +387,6 @@ static int panel_remove(struct platform_device *pde=
v)
>=20
>=20 tilcdc_module_cleanup(mod);
>  kfree(panel_mod->info);
> -
> - return 0;
> }
>=20
>=20static const struct of_device_id panel_of_match[] =3D {
> @@ -398,7 +396,7 @@ static const struct of_device_id panel_of_match[] =
=3D {
>=20
>=20static struct platform_driver panel_driver =3D {
>  .probe =3D panel_probe,
> - .remove =3D panel_remove,
> + .remove_new =3D panel_remove,
>  .driver =3D {
>  .name =3D "tilcdc-panel",
>  .of_match_table =3D panel_of_match,
> --=20
>=202.39.2
>
