Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6DB556C1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 21:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88510ECD2;
	Fri, 12 Sep 2025 19:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LaTzOMoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D2E10ECD2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 19:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757704195;
 bh=KDpUCAOBtWF69qJMfJjQ3usUv32LD4r7imjHYzXST6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LaTzOMoNH6D7e1L/23QbA/VsLKJJBUZMaQa2Ist5t7sw5d1m0z7m7591DMTaNWQjl
 4HKJ/6fO03nWswfMLc+UD1OXzW1rPuiHf1VnnDiMjox/4uNH4tu3BYjFdaiXGlB/Hw
 wIHt23UxQQnYuyZ6Uu5Ax7+WSWjxxiPZdJQasIvCmc2ybWlA3t7zCIn4yZ5VqmcOEV
 UfOaZczZMF/C3TzaIbB9d+MkPvjlfvfAGHOv7BvSh6K7iT3IM38ySoFrQ8pWFMHT0L
 VxzAFlweK/ETKiWwkG/eRyXuMGo0/inIJXJ8MTpZ9So9Zq33kl0KZjelF9cxlQ/DCo
 zUjlkaQThPzrw==
Received: from xpredator (unknown
 [IPv6:2a02:2f05:840b:7800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D24517E0100;
 Fri, 12 Sep 2025 21:09:55 +0200 (CEST)
Date: Fri, 12 Sep 2025 22:09:54 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <aMRwAmxQmHCmWBzY@xpredator>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <20250912-efficient-pistachio-tiger-a7ce06@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tSRQeL9vwWXHNYfA"
Content-Disposition: inline
In-Reply-To: <20250912-efficient-pistachio-tiger-a7ce06@penduick>
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


--tSRQeL9vwWXHNYfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 05:33:42PM +0200, Maxime Ripard wrote:
> On Thu, Sep 11, 2025 at 04:07:36PM +0300, Marius Vlad wrote:
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/media=
tek/mtk_dpi.c
> > index 61cab32e213a..15820e6ba057 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -1057,7 +1057,7 @@ static int mtk_dpi_bind(struct device *dev, struc=
t device *master, void *data)
> >  	if (ret)
> >  		goto err_cleanup;
> > =20
> > -	dpi->connector =3D drm_bridge_connector_init(drm_dev, &dpi->encoder);
> > +	dpi->connector =3D drm_bridge_connector_init(drm_dev, &dpi->encoder, =
BIT(HDMI_COLORSPACE_RGB));
> >  	if (IS_ERR(dpi->connector)) {
> >  		dev_err(dev, "Unable to create bridge connector\n");
> >  		ret =3D PTR_ERR(dpi->connector);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/media=
tek/mtk_dsi.c
> > index d7726091819c..91afdbf676f0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -930,7 +930,7 @@ static int mtk_dsi_encoder_init(struct drm_device *=
drm, struct mtk_dsi *dsi)
> >  	if (ret)
> >  		goto err_cleanup_encoder;
> > =20
> > -	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder);
> > +	dsi->connector =3D drm_bridge_connector_init(drm, &dsi->encoder, BIT(=
HDMI_COLORSPACE_RGB));
> >  	if (IS_ERR(dsi->connector)) {
> >  		DRM_ERROR("Unable to create bridge connector\n");
> >  		ret =3D PTR_ERR(dsi->connector);
> > diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/d=
rm/meson/meson_encoder_cvbs.c
> > index dc374bfc5951..a475fc34ca23 100644
> > --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> > +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> > @@ -275,7 +275,8 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
> >  	}
> > =20
> >  	/* Initialize & attach Bridge Connector */
> > -	connector =3D drm_bridge_connector_init(priv->drm, &meson_encoder_cvb=
s->encoder);
> > +	connector =3D drm_bridge_connector_init(priv->drm,
> > +			&meson_encoder_cvbs->encoder, BIT(HDMI_COLORSPACE_RGB));
> >  	if (IS_ERR(connector))
> >  		return dev_err_probe(priv->dev, PTR_ERR(connector),
> >  				     "Unable to create CVBS bridge connector\n");
>=20
> Why do we need to pass an HDMI color format for a DSI, DPI or Analog TV
> driver?
That's what drm_bridge_connector_init() had initially set as supported
color format. I just pulled that out for every other driver that made
use of drm_bridge_connector_init. So I guess the answer is we don't
actually need to do that.
>=20
> Maxime



--tSRQeL9vwWXHNYfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjEb/4ACgkQ9jQS5glH
1u95NhAAyLqFh8v/hl6UF8EJI/ubJea7Sx2y4yO2Nd7Nj8EMoHlYV/DczWe3Ucs0
1OxX8wCj4PGUF6LNjg+nIlYyFve2HnuKc2kbcWBW2xW4yhgZMtRAzk8Ff81i+qRu
ljvC3lsM9Voz0xrUd4+J4gIif5T6Z40i1oaP6M1JmAyqG+aQ9/kE6VWXaE3CLFXp
niHUB3qjOxwqURoUeG/Evx5JVsSXRblNKVTIeny7i1PFZpzgYiWw4+g0YrNA97jg
Ioy/BrIOnmrR5cQgjy3ZpK3iBuwJAHvfFy6w7iDnNNYu5vTBRh9B4/8BDTRBnjXi
ahm98MwaSm+i/JOjBlO0sQGnIEngBhgfCQnQpf1gBK0JIqNy9RitZQT4pKNCfAb/
lcymCv3XIfM1h0P6qrf8E6g0H0UVTqeFsv156nsL1Pn/Rd+T4q4I9i88dAmxXaq5
qerL4HbinvtO6q3LIDkuDIa/3v1zCQcnYUhfMI+pmj/REj8eTugTvIMyghcxp2Hr
fjeCYnpzHTJ8CYC59aTAKYaJs4Xt8GafwzaWUkdbWu4o+Foy5swGVRLTV8VV6EjP
BM84xkQoPT7Mw/QMWTeaTy9m381k0z9B/4iXOeIut9qZl1iCOcwYz7gQ4alyUw+2
3JJFtPTiIjHA5g7XL2eE98/Qq0+kBmCW3XxFonLn+16+wV/+K/M=
=b1NQ
-----END PGP SIGNATURE-----

--tSRQeL9vwWXHNYfA--
