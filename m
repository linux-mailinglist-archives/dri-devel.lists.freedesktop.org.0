Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A3A18D5C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1410E686;
	Wed, 22 Jan 2025 08:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180D510E686
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:07:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1taVjr-0002Z2-O6; Wed, 22 Jan 2025 09:05:27 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1taVjr-001Fbd-1A;
 Wed, 22 Jan 2025 09:05:27 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id F3C0D3AE291;
 Wed, 22 Jan 2025 08:05:26 +0000 (UTC)
Date: Wed, 22 Jan 2025 09:05:26 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch
Subject: Re: undefined reference to `drm_fb_helper_fini'
Message-ID: <20250122-phenomenal-robin-of-essence-b11416-mkl@pengutronix.de>
References: <20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de>
 <a5a98971-405e-496b-89a4-75a61fd6d898@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="crcaedikgoumvnhf"
Content-Disposition: inline
In-Reply-To: <a5a98971-405e-496b-89a4-75a61fd6d898@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
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


--crcaedikgoumvnhf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: undefined reference to `drm_fb_helper_fini'
MIME-Version: 1.0

On 22.01.2025 08:48:16, Thomas Zimmermann wrote:
> thanks for the bug report. Arnd just sent a fix, I think.

Yes, that fixes my problem.

> https://lore.kernel.org/dri-devel/20250122064655.1095176-1-arnd@kernel.or=
g/T/#u

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--crcaedikgoumvnhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmeQpsMACgkQKDiiPnot
vG9RSwf5ASbGTdjCDzqe8NJgO9Pc7bHcTJj/+hBZR/V2kg703XdWhmTZhKN9hDL4
zlQL3ozAHEYjRCcGx92vUw+aoLfGXAYTHD7fOtM10czDm+i02SrSNJ/mPRmyke7C
3X8VLrUxlG0Lz5ol01TQW0AJxCIt0O7JXO+ST6BwRUzAkhNOKQxeSDKlii2JSo1t
nkV65vdpMrKnFGTDVaaM8EPHbK4YEi+u+6Zv+UkbVJMdl8WmzgmOi2hbOuV6w+Hr
scV8BsFcrUtrQc1v22BeNWWlk0uQ+aZDw9G5/Hui7iYxT07PUsFsx5AGK4aqPBeq
s2mzVmenGWaZ/aXb8FxD/9tAL3XnnQ==
=m/ln
-----END PGP SIGNATURE-----

--crcaedikgoumvnhf--
