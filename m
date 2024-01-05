Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACE825AF7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 20:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4296D10E667;
	Fri,  5 Jan 2024 19:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D851910E667
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 19:12:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rLpbk-0005gn-FF; Fri, 05 Jan 2024 20:11:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rLpbi-000e8E-Ky; Fri, 05 Jan 2024 20:11:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rLpbi-003rVv-1k;
 Fri, 05 Jan 2024 20:11:50 +0100
Date: Fri, 5 Jan 2024 20:11:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 1/2] platform_device: add devres function region-reqs
Message-ID: <5k75ed3czl6rqzkykl7xc4dbyih2frunoor4ypfqxx7yzfs2vd@6ieg4dewtgxf>
References: <20240105172218.42457-2-pstanner@redhat.com>
 <20240105172218.42457-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3o2nisona3kyspak"
Content-Disposition: inline
In-Reply-To: <20240105172218.42457-3-pstanner@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Gow <davidgow@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3o2nisona3kyspak
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 06:22:18PM +0100, Philipp Stanner wrote:
> Some drivers want to use (request) a region exclusively but nevertheless
> create several mappings within that region.
>=20
> Currently, there is no managed devres function to request a region
> without mapping it.
>=20
> Add the function devm_platform_get_resource()
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/base/platform.c         | 37 +++++++++++++++++++++++++++++++++
>  include/linux/platform_device.h |  2 ++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 10c577963418..243b9ec54d04 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -82,6 +82,43 @@ struct resource *platform_get_mem_or_io(struct platfor=
m_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(platform_get_mem_or_io);
> =20
> +/**
> + * devm_platform_get_and_resource - get and request a resource

This function name is wrong.

> + *
> + * @pdev: the platform device to get the resource from
> + * @type: resource type (either IORESOURCE_MEM or IORESOURCE_IO)
> + * @num: resource index
> + * @name: name to be associated with the request
> + *
> + * Return: a pointer to the resource on success, an ERR_PTR on failure.
> + *
> + * Gets a resource and requests it. Use this instead of
> + * devm_platform_ioremap_resource() only if you have to create several s=
ingle
> + * mappings with devm_ioremap().
> + */
> +struct resource *devm_platform_get_resource(struct platform_device *pdev,
> +		unsigned int type, unsigned int num, const char *name)
> +{
> +	struct resource *res;
> +
> +	res =3D platform_get_resource(pdev, type, num);
> +	if (!res)
> +		return ERR_PTR(-EINVAL);

=46rom devm_platform_get_resource I'd expect that it only does
platform_get_resource() + register a cleanup function to undo it.

> +	if (type & IORESOURCE_MEM)
> +		res =3D devm_request_mem_region(&pdev->dev, res->start, res->end, name=
);
> +	else if (type & IORESOURCE_IO)
> +		res =3D devm_request_region(&pdev->dev, res->start, res->end, name);
> +	else
> +		return ERR_PTR(-EINVAL);

So this part is surprising. IMHO your function's name should include
"request".

> +	if (!res)
> +		return ERR_PTR(-EBUSY);
> +
> +	return res;
> +}
> +EXPORT_SYMBOL_GPL(devm_platform_get_resource);
> +
>  #ifdef CONFIG_HAS_IOMEM
>  /**
>   * devm_platform_get_and_ioremap_resource - call devm_ioremap_resource()=
 for a

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3o2nisona3kyspak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWYVHUACgkQj4D7WH0S
/k7XoQf/XQgujb3wJQ7wPs2niAnyXYWMuP6k5VtPrmtieV97iKmKJoovSFpNlN7z
i1CC2tHW8sXkAROPQmqKUjaYNhA7EaIcR1I5uAaE657JeEAvST4cmrrgH/lBE6XG
uov7/CgYQNxTRDbix2M47T2fj2BfQiQtPVVIkdYOhkJatWSq7FOx/2Fi74NzISHF
3GWVPlWVpT4U/hn78DsEmfxtWcw4cdoq3pVYZQyGHKzdEKu79IKgVjllgtBVNiMb
x0yJ+ifcj7OC2zbfCHjdgd5+igXKmSQw6OJdG6VOOmICgvNwTczUl/QvMCfOt7FB
sxivF8VqMGJ5VpFauMWtvBS/3oyKrw==
=2FhD
-----END PGP SIGNATURE-----

--3o2nisona3kyspak--
