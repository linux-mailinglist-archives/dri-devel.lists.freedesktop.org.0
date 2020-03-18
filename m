Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E818AE11
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B26E9BE;
	Thu, 19 Mar 2020 08:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE5B89BAF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1E0CF294B84
Date: Wed, 18 Mar 2020 09:11:14 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v5 5/5] drm/panfrost: Register devfreq cooling and
 attempt to add Energy Model
Message-ID: <20200318131114.GA1812@kevin>
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-6-lukasz.luba@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200318114548.19916-6-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: multipart/mixed; boundary="===============0555024440=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0555024440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Wed, Mar 18, 2020 at 11:45:48AM +0000, Lukasz Luba wrote:
> Register devfreq cooling device and attempt to register Energy Model. This
> will add the devfreq device to the Energy Model framework. It will create
> a dedicated and unified data structures used i.e. in thermal framework.
> The last NULL parameter indicates that the power model is simplified and
> created based on DT 'dynamic-power-coefficient', voltage and frequency.
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 413987038fbf..8759a73db153 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,7 +105,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfd=
ev)
>  	}
>  	pfdev->devfreq.devfreq =3D devfreq;
> =20
> -	cooling =3D of_devfreq_cooling_register(dev->of_node, devfreq);
> +	cooling =3D devfreq_cooling_em_register(devfreq, NULL);
>  	if (IS_ERR(cooling))
>  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
>  	else
> --=20
> 2.17.1
>=20

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl5yHe0ACgkQ/v5QWgr1
WA3gpxAAhQnRoPbq6S2+0Lb7C5bP7Ta67p3aDFRc/xxNEKsqRl5YcErm72knMqpa
ojkyaIkecKFeI6D1QS9UpFtSDzHdq+HsBJSnSBsR8ND6GOlUv3ZQhl7dQAf37exS
Kq64qQnpJfy/kcF5zStxtD145VJDXoX1By4AdnSg+kOuYi2HAKQ2SbQvYDd5ffk0
9fe6YagwE/iaz2o5z0c2EO6nBjstSo91/AKx99MwW7IfgJmgMZCGE0Q4UTduryr2
tFSBzWTStKCWxI2lDsrRQcF7KN4mZ2dZWgNFo4UU5tp36/kGHqKQ+Vzyaay8WWGU
IHgjKW+vo9TH8QyayRCCljtl/iYUbhrEa9n6APCnmW6sNsxPuO6KbZ3vzMz6WkLJ
/W1M+XIchveNFRZB7ku8DG4nLgISikgjMnPCO/F/y0NOQ8YaU7GeyeGj7yRom6LY
e4Oz34cToBULP5m6B1b/KGu013TwkRqwAoc2qHAlB5TXBXm/zOdyLqPo1/pgul30
H4+YKSUEl95b5w8URYnoKvf3sS0wocG4GvdC2pY8IOYRUNSmfsxiPW33Y7wcavgj
WF9YUFO5mRV1b+2QppuWp2UIwSjC7Uuh2lCTFhK4hod+RptE5h1MoKmQa2jSegr8
3uvfCXtDGQskJ+MDv9aUtGYTX14nPfwXUO3RPidKGgMF8r6W3to=
=pczP
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

--===============0555024440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0555024440==--
