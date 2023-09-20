Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF97A8D03
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3461710E541;
	Wed, 20 Sep 2023 19:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7C10E53F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:41:21 +0000 (UTC)
Received: from mercury (unknown [185.254.75.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7903D66071F1;
 Wed, 20 Sep 2023 20:41:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695238880;
 bh=ExX3SvDujzr9QOpYWZy4A/ye4S8keoato3pYxi1LhpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AksLgzMXB+z48x+InzKNNqPPjq/AXKREYxp6x7rX/QNcZE+8CSwd7mQ2JzsvQkyaL
 w0/e6NF86FBC0KhrNsNN8+uVpaybpsmjiv3Ohm2FA4hMcTMEhqT4LDsZhcbfPFOzMa
 EwZ8dXyg2rYJMKPGv6BHHxbEXQqj99Z+oppaiIDheJ+dDCWViLABLsmLMT3h7ROH79
 HxgVbYSQjn6odD80LPscplxnRVT69BnUZhdWwjUOoXigXQuuuBQNmKVlfG33XQZ7Kk
 EDnOdy0BwCE0tcKYjqB/UvNoJe63Rmbk5CT/3XvOJAZQVzbAvqajBrO9gjjcQbJwWR
 dDcqEoS/qQ3hA==
Received: by mercury (Postfix, from userid 1000)
 id CDD29106091E; Wed, 20 Sep 2023 21:41:17 +0200 (CEST)
Date: Wed, 20 Sep 2023 21:41:17 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] omap: dsi: do not WARN on detach if dsidev was never
 attached
Message-ID: <20230920194117.ghllpy7ubghakdrv@mercury.elektranox.org>
References: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q5rykixsz2od4xko"
Content-Disposition: inline
In-Reply-To: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, Arnd Bergmann <arnd@arndb.de>,
 tony@atomide.com, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 kernel@pyra-handheld.com, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q5rykixsz2od4xko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 19, 2023 at 03:37:28PM +0200, H. Nikolaus Schaller wrote:
> dsi_init_output() called by dsi_probe() may fail. In that
> case mipi_dsi_host_unregister() is called which may call
> omap_dsi_host_detach() with uninitialized dsi->dsidev
> because omap_dsi_host_attach() was never called before.
>=20
> This happens if the panel driver asks for an EPROBE_DEFER.
>=20
> So let's suppress the WARN() in this special case.

=2E..

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index ea63c64d3a1ab..c37eb6b1b9a39 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_hos=
t *host,
>  {
>  	struct dsi_data *dsi =3D host_to_omap(host);
> =20
> -	if (WARN_ON(dsi->dsidev !=3D client))
> +	if (!dsi->dsidev || WARN_ON(dsi->dsidev !=3D client))
>  		return -EINVAL;
> =20
>  	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> --=20
> 2.42.0
>=20

--q5rykixsz2od4xko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmULStoACgkQ2O7X88g7
+pqrDw//Z5G3Hdy4Q4+9AMElzRUARdvuxAIbYZf+Y6k/YyfadUCHAWHTltHB9QmK
kMpmTIWlR+FWLxocOQSO1opLR4hyDuvG9EDiz3a6ke4lEB59LDQ++JmGTYqtS2c/
YITY5z0xBXjNArIdVUiQLlhlyHrIyowC7JxMn/kEG9J1lSgkWJqn2REXad7Lc/Bi
IKJyhgwszDfks2ryjx6CL2lXwDuwP51TPxxhBUIre7hxlYwzyZnt/3c/xUa+2ri8
PmyHZxi/OWUi2CmJBkThyIrc+DoyevVo/q0GZqyq+mMwEAeuLY0CWpm7ZfmVph3c
JkNlQFUhugQQZAekQ6kQB0fUy9+iz+3XrnBCeHiXEpJZwTpYWAUuXbZurnXZjesL
XKro/5vXxklANhwTuodben/CQiBqQWDeAxHhgi0Gd3wGIB84sdE/PWapFOvzmTVj
EmSmH77zdpCs8vuLCVIghiFchjs6tCLfeIS+nR2Sbup7s9Ye59V+/GNU2xirb4AM
CJR5RyxXXYI9TRDhLyPKJCt29CefOzgxbrr54NHwLfrloVNXNkkuv5gI3O3aE/tS
TreXxz7GTTpKQfW+wsCbD9xh78wBza2NEatYPUTTPk92rqT/ubf5KgKXTVIBE4Qb
yy+aK7RUkKZ9dNXO7WJzPcmEzrBBd9Ky7232jsp9qMZlbnj/0Dg=
=NcVx
-----END PGP SIGNATURE-----

--q5rykixsz2od4xko--
