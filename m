Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A36716979
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 18:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1214510E3DF;
	Tue, 30 May 2023 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1376F10E3DF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:27:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q42CF-0000dq-8p; Tue, 30 May 2023 18:27:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q42C1-003ury-3q; Tue, 30 May 2023 18:27:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q42C0-009Yrb-9p; Tue, 30 May 2023 18:27:28 +0200
Date: Tue, 30 May 2023 18:27:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Message-ID: <20230530162728.sexlrqhkoflvuu7m@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
 <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
 <3010bce3-cc66-4ad6-50b1-7bc66bd532d4@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qztz57ioqwbtiw2f"
Content-Disposition: inline
In-Reply-To: <3010bce3-cc66-4ad6-50b1-7bc66bd532d4@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Kitt <steve@sk2.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Wang Qing <wangqing@vivo.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Jones <pjones@redhat.com>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Xu Panda <xu.panda@zte.com.cn>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dongliang Mu <dzm91@hust.edu.cn>, NXP Linux Team <linux-imx@nxp.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe <yuzhe@nfschina.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Zeng Heng <zengheng4@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Hyunwoo Kim <imv4bel@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yihao Han <hanyihao@vivo.com>,
 Timur Tabi <timur@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qztz57ioqwbtiw2f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Helge,

On Tue, May 30, 2023 at 06:12:09PM +0200, Helge Deller wrote:
> Btw... I cleaned up some minor whitespace issues in patch 3 (au1100fb).

We both did some different cleanup, on top of your
87be5a5d9a5c5b00505181eedbee62134f07d11d we could further cleanup doing

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index fb38557a9b63..648d6cac86e8 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -590,7 +590,7 @@ static struct platform_driver au1100fb_driver =3D {
 	.probe		=3D au1100fb_drv_probe,
 	.remove_new	=3D au1100fb_drv_remove,
 	.suspend	=3D au1100fb_drv_suspend,
-        .resume		=3D au1100fb_drv_resume,
+	.resume		=3D au1100fb_drv_resume,
 };
 module_platform_driver(au1100fb_driver);
=20
Feel free to squash this into 87be5a5d9a5c5b00505181eedbee62134f07d11d.
If you want to apply it separately, either tell me to post a proper
patch, or apply it under your name with my Suggested-by -- whatever
suits you best.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qztz57ioqwbtiw2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR2I+8ACgkQj4D7WH0S
/k7CEgf9HN29rwU092Bc2Tl1Vf/PyR+jNepuopjfzHl2b6k+lm5QOL98qbjIcNMo
1XlmG713mqZsuV4dnvLg9foBP0z2RbGZR6QrhOx2KlQ+B7NouQ4/VfcQME/EVvRy
rGMW6isCJ2moPgrRcAlpA9/fgsnCCT9Xxk/ZwCp9BkubbPsSh0bZDcN0uN+nilnL
SkvEZ5dvvckOPQtWUFj4bo2CSCzpU7OX8f01r3JDdXKy63Bk8NHy9aeY+SCYRr0h
56gx6kaDuaOu3oj07R7P2zhgkGYXj/9aNHFh92LDZ9tLS9+M4cEJYEjKg6SfaS7T
25jqnMhHVhSdcupCuCJ/WcrQX/uMHA==
=5BaR
-----END PGP SIGNATURE-----

--qztz57ioqwbtiw2f--
