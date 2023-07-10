Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC074DDF7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 21:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DC010E185;
	Mon, 10 Jul 2023 19:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30DC10E185
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 19:11:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qIwHP-00057Q-Im; Mon, 10 Jul 2023 21:10:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qIwHO-00DUHC-7r; Mon, 10 Jul 2023 21:10:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qIwHN-003rOB-I8; Mon, 10 Jul 2023 21:10:37 +0200
Date: Mon, 10 Jul 2023 21:10:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 4/4] fbdev: imxfb: remove unneeded lable
Message-ID: <20230710191035.nxazpwdhqulbegsg@pengutronix.de>
References: <20230710132001.50764-1-frank.li@vivo.com>
 <20230710132001.50764-4-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eidfnx3p3pfbmdcd"
Content-Disposition: inline
In-Reply-To: <20230710132001.50764-4-frank.li@vivo.com>
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Helge Deller <deller@gmx.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eidfnx3p3pfbmdcd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 09:20:01PM +0800, Yangtao Li wrote:
> These lables are redundant and don't do anything, let's remove it.

s/lable/label/ here an in the subject line.

Are you using this driver, or did you just stumble over it while looking
for some janitorial todo? If the former, I suggest you look into the drm
driver (imx-lcdc) instead.

Having said that, I'm not sure this cleanup is really valuable. While
a single jump target position has several names,=20

  	ret =3D imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
  	of_node_put(display_np);
  	if (ret)
  		goto failed_of_parse;

is more obvious correct than

  	ret =3D imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
  	of_node_put(display_np);
  	if (ret)
  		goto failed_init;

=2E *shrug*

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eidfnx3p3pfbmdcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSsV6sACgkQj4D7WH0S
/k5b8Qf+IN365SKDDLXyi0u6+8iebC+94VaaWfL3Hts3Nqmhkz8dU+3pFLTznxyp
3LSfnYLL1r1wmZZmXwjmam8547qkxRe6RNWr6jXCZT5DLbENHn/tHIU9dhHnHee6
QL/HzDAX3BGDfxMI75KeUzJ+KYJA/XsYIMePLs6Y2GeAVZUxm3EzucMX1pSiBqpb
GVe0X14LefFTVCA1OfZPjgGuDWxc0v9KE6NhlGdQRn8q16vbyyZMtfKzjbEBMew9
wWD6Uh77bUTlnDCB83Xyf61Vun5wNZl8sN7F+7EAAVwTHAFXaHZV71Qsr0UEtA2y
c8n7vRCUrmhVVdLSQ8soWv3GdkBeAA==
=5kPp
-----END PGP SIGNATURE-----

--eidfnx3p3pfbmdcd--
