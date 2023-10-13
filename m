Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557537C8290
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 11:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FEC10E09B;
	Fri, 13 Oct 2023 09:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CBF10E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:54:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrEsQ-0007Xb-Kn; Fri, 13 Oct 2023 11:54:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrEsP-001Mg2-3t; Fri, 13 Oct 2023 11:54:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrEsO-00FU43-QC; Fri, 13 Oct 2023 11:54:36 +0200
Date: Fri, 13 Oct 2023 11:54:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Message-ID: <20231013095436.fo5rieew5z74ck42@pengutronix.de>
References: <ZSj+6/J6YsoSpLak@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="azie4tzhhm5wnxd7"
Content-Disposition: inline
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--azie4tzhhm5wnxd7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:25:15AM +0300, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
>=20
>     drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>     variable dereferenced before check 'mdp5_kms' (see line 782)
>=20
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _prob=
e function"
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

(already provided for (implicit) v1, but wasn't picked up)

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--azie4tzhhm5wnxd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUpE9sACgkQj4D7WH0S
/k7/mgf/eePbGSTxnx4bSU48gePsiOai39SNEhuEk2iMBkHEaEE8kbcY9d2HO/Fn
ULnenRAalSQCnIDqzahTlQLieRBsBHdyT68+Y+4TS3n6gpGKUxi03gq1NJiIeql2
tNtmWBtntXzSBb02rbdzJEfoWUu9VUajD6cY+PVPSDMLnwMImygX+0WFsM3AACPG
eTb1bwsu08/JRAzkj5nWqshlZekBEVg3KKucphJA+jKP0R9yCkR1ErzACUSFrK1E
yTBJYS28zv3OfxKUUoEGQ0S7BHZiYCMjALJk1C1sUDmYoLDkI0MtRQ5o83d79kPx
2c64Eqk0cGyDnsy6ygTwEFkI6DvwXw==
=UDqN
-----END PGP SIGNATURE-----

--azie4tzhhm5wnxd7--
