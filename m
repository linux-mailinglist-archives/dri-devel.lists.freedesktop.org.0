Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC9AC3CF9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6E410E2D2;
	Mon, 26 May 2025 09:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EPVHJ9jE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27FC10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:35:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C2FC6113B;
 Mon, 26 May 2025 09:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6883BC4CEE7;
 Mon, 26 May 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748252108;
 bh=r93NbYDed9zaS/RBCBLrh1Zis4qfZlyaGqT8FkweLBg=;
 h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
 b=EPVHJ9jEGd+pA0ljBNPM8drPh6Qk1JoqRC1heEs1n2paDFA7s73uT6u+wltA+UrjH
 XFBYgtaT5gMxC/xxzVsq05/1Jpma/6qDqx4xCxLNARQa79ZYanzRuLKfnQPIJZbqn5
 Uq8BTKzTzvVp+crO/FLhiSjjtNyyT7v6NJpzjzDKW7dHSYnFyTRHCZHsrx1W1Omcnv
 bsAz+xpkykgDIrTXm2YB1u6/EYcGcYTW/NisXS8xTU/MRdg37Gezs1YPRCNRSBTEIF
 SkO6PjQUfQI+3yjkDgem4LM64wjo0h/HUpfdJuC9vtJcy7YEXiR6WZgSCN8j4zSUqO
 Guygy3B+iCjkA==
Content-Type: multipart/signed;
 boundary=31bb1853cc872e42b7b8767fc44049f04692353a59676d9b610244c9e800;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 26 May 2025 11:35:04 +0200
Message-Id: <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Devarsh Thakkar" <devarsht@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Jayesh Choudhary" <j-choudhary@ti.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "DRI Development List"
 <dri-devel@lists.freedesktop.org>, "Devicetree List"
 <devicetree@vger.kernel.org>, "Linux Kernel List"
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250525151721.567042-5-aradhya.bhatia@linux.dev>
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

--31bb1853cc872e42b7b8767fc44049f04692353a59676d9b610244c9e800
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Aradhya,

> +static int get_oldi_mode(struct device_node *oldi_tx, int *companion_ins=
tance)
> +{
> +	struct device_node *companion;
> +	struct device_node *port0, *port1;
> +	u32 companion_reg;
> +	bool secondary_oldi =3D false;
> +	int pixel_order;
> +
> +	/*
> +	 * Find if the OLDI is paired with another OLDI for combined OLDI
> +	 * operation (dual-link or clone).
> +	 */
> +	companion =3D of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
> +	if (!companion)
> +		/*
> +		 * The OLDI TX does not have a companion, nor is it a
> +		 * secondary OLDI. It will operate independently.
> +		 */
> +		return OLDI_MODE_SINGLE_LINK;

How is this supposed to work? If I read this code correctly, the
second (companion) port is always reported as SINGLE_LINK if its
device tree node doesn't have a ti,companion-oldi property. But
reading the device tree binding, the companion-old property is only
for the first OLDI port.

FWIW, I've tested this series and I get twice the clock rate as
expected and the second link is reported as "OLDI_MODE_SINGLE_LINK".
I'll dig deeper into this tomorrow.

-michael

> +
> +	if (of_property_read_u32(companion, "reg", &companion_reg))
> +		return OLDI_MODE_UNSUPPORTED;
> +
> +	if (companion_reg > (TIDSS_MAX_OLDI_TXES - 1))
> +		/* Invalid companion OLDI reg value. */
> +		return OLDI_MODE_UNSUPPORTED;
> +
> +	*companion_instance =3D (int)companion_reg;
> +
> +	if (of_property_read_bool(oldi_tx, "ti,secondary-oldi"))
> +		secondary_oldi =3D true;
> +
> +	/*
> +	 * We need to work out if the sink is expecting us to function in
> +	 * dual-link mode. We do this by looking at the DT port nodes, the
> +	 * OLDI TX ports are connected to. If they are marked as expecting
> +	 * even pixels and odd pixels, then we need to enable dual-link.
> +	 */
> +	port0 =3D of_graph_get_port_by_id(oldi_tx, 1);
> +	port1 =3D of_graph_get_port_by_id(companion, 1);
> +	pixel_order =3D drm_of_lvds_get_dual_link_pixel_order(port0, port1);
> +	of_node_put(port0);
> +	of_node_put(port1);
> +	of_node_put(companion);
> +
> +	switch (pixel_order) {
> +	case -EINVAL:
> +		/*
> +		 * The dual-link properties were not found in at least
> +		 * one of the sink nodes. Since 2 OLDI ports are present
> +		 * in the DT, it can be safely assumed that the required
> +		 * configuration is Clone Mode.
> +		 */
> +		return (secondary_oldi ? OLDI_MODE_CLONE_SECONDARY_SINGLE_LINK :
> +					 OLDI_MODE_CLONE_SINGLE_LINK);
> +
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		return (secondary_oldi ? OLDI_MODE_SECONDARY_DUAL_LINK :
> +					 OLDI_MODE_DUAL_LINK);
> +
> +	/* Unsupported OLDI Modes */
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +	default:
> +		return OLDI_MODE_UNSUPPORTED;
> +	}
> +}

--31bb1853cc872e42b7b8767fc44049f04692353a59676d9b610244c9e800
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaDQ1yBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jAzgF6AkVGrAk/6h2BAeQEXBltBp+1QBZ84LPQ
Dv52KJMtbstY+6/r0wtMRRrZGAstxWMJAYCZLaVgc4bS24ZFzmrdIpubVsEb09Ip
2uv8nw+GT9zpWx5YommjdhMDmzR8DhBJ8Ts=
=e4BZ
-----END PGP SIGNATURE-----

--31bb1853cc872e42b7b8767fc44049f04692353a59676d9b610244c9e800--
