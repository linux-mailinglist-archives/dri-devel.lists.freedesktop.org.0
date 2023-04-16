Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D526E3A5A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 18:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6A10E22D;
	Sun, 16 Apr 2023 16:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F3410E22D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 16:55:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1po5f0-0007Xl-9z; Sun, 16 Apr 2023 18:55:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1po5ew-00BgZ4-RG; Sun, 16 Apr 2023 18:55:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1po5ew-00DgyC-7U; Sun, 16 Apr 2023 18:55:26 +0200
Date: Sun, 16 Apr 2023 18:55:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
Message-ID: <20230416165526.ql7vcz3nos76du3o@pengutronix.de>
References: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
 <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
 <87bkjog7jo.fsf@minerva.mail-host-address-is-not-set>
 <878resg6mt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c5joprfllkbmkzdt"
Content-Disposition: inline
In-Reply-To: <878resg6mt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c5joprfllkbmkzdt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Sat, Apr 15, 2023 at 11:47:22PM +0200, Javier Martinez Canillas wrote:
> Javier Martinez Canillas <javierm@redhat.com> writes:
>=20
> > Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> >
> > Hello Uwe,
> >
> >> Hello,
> >>
> >> On Sat, Mar 18, 2023 at 11:10:27PM +0100, Uwe Kleine-K=F6nig wrote:
> >>> The driver needs the include <drm/drm_bridge.h>. WIth CONFIG_OF enabl=
ed
> >>
> >
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >
> >
> >> Just noticed: s/WIth/With/. Assuming no further review comments make a
> >> v2 necessary: Should I resend for that, or can you fixup when you apply
> >> this patch?
> >>
> >
> > No need to resend, I'll fix it when pushing to drm-misc-next.
> >
>=20
> This issue was already fixed by Dave in commit b24343eaceed ("Merge tag
> 'drm-misc-next-2023-03-16' of git://anongit.freedesktop.org/drm/drm-misc
> into drm-next").

FTR: s/b24343eaceed/c6265f5c2f50/

Thanks for looking into this, and also the other patch for imx-lcdc!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c5joprfllkbmkzdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ8KH0ACgkQj4D7WH0S
/k4Zcwf+PcMWa8+POcd4n8onCQ7RxdGYg36sXdP0CTL3QnGgdHCw0OpQ72DeOtgG
bJfQ+LTRZXtoQrP6nG/gCzmMkR4B81FyDKgDYZ6LP1wua2SJECWBBnryhGZIkAy2
7yUels+hE1kWEyM0YvEglzTBaN6kQoRtLjKSK517MutW73wCUeUGSwkgOX5MWaIr
iAprqmf7Cwzqg8suOmeKnZA3fHhSIOM6LcnkcZK5lTwfyaywhI4EdvezVyiUfCIW
IRMuBoWZGYyZXk2oEvhK3H/6Drmva3e+CwJd3ehPj58h7zxZA30bO0/Tput4fmLm
UvrBPW9o+YsLpB06s16aiCZqbGE3mQ==
=wTYM
-----END PGP SIGNATURE-----

--c5joprfllkbmkzdt--
