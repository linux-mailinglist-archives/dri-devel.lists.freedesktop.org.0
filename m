Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D47C7F40
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 10:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53710E5C7;
	Fri, 13 Oct 2023 08:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3B10E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 08:02:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrD7I-00035s-Mq; Fri, 13 Oct 2023 10:01:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrD7F-001LQq-WA; Fri, 13 Oct 2023 10:01:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrD7F-00FPlj-Ma; Fri, 13 Oct 2023 10:01:49 +0200
Date: Fri, 13 Oct 2023 10:01:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm: remove unnecessary NULL check
Message-ID: <20231013080149.hbcuxww6w362g6xh@pengutronix.de>
References: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wji2ulhqnz43jxlv"
Content-Disposition: inline
In-Reply-To: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
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


--wji2ulhqnz43jxlv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Oct 13, 2023 at 10:17:08AM +0300, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
> to the _probe function") and now it's not.  The inconsistent NULL
> checking triggers a Smatch warning:
>=20
>     drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>     variable dereferenced before check 'mdp5_kms' (see line 782)
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

LGTM

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This patch opportunity is valid since commit 1f50db2f3e1e
("drm/msm/mdp5: move resource allocation to the _probe function") but
applies to older trees (where it introduces a bug).
On one hand it's not really a fix, but maybe still add a Fixes: line to
ensure it's not backported to older stables? Hmm, I don't know.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wji2ulhqnz43jxlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUo+WwACgkQj4D7WH0S
/k4sEAf/UXusWyq09WzDKD7Q9pMG1laxguZOi/eLb/9XaAILoRE0zOQmC0FxjO7q
23Ob8SBUww+V/X9zK1YOXP0gipT9qtG1RuEi5n02EArrrAs6cMbVYoAsuJ96JeaB
WMkYfZAQbyioIsWqY44m9NxQYK8fJSGn7sg7da7sJkljUlqNVrN/WIKVjyKWO37N
hA0ee7JDSOzjH5dN+n0CsYiBKSkapwUKbGm+SHFXhPSLfKsnYYl3vzTkVt26N1xo
h5JpqEaBCzMdzfWCaCwEMGfTjl/VAxWS7gsft/X6q2MHNQSyyoEFPqdu3qY4JEvo
3YEc6QGLuJlYfVNLxSwN8jm0zfIYlA==
=5nCZ
-----END PGP SIGNATURE-----

--wji2ulhqnz43jxlv--
