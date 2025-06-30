Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195AAED7D5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031EA10E218;
	Mon, 30 Jun 2025 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rnb7/Q99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1B910E218
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:52:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32FCB5C435C;
 Mon, 30 Jun 2025 08:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676EBC4CEE3;
 Mon, 30 Jun 2025 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751273527;
 bh=Ahg7O8Gxk7QZFJYCUmSIfBJCpuOCz2nYvFMbHrP/2iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rnb7/Q99npxt4+sy/4HSiKFvZo1MlJGgYUvd+KkLm835TKC5xc/yyut+O67fq3GGT
 1n3VjxFgdQbvnJwr26mFQFA82wR2A5bWwo3gravRfVxm0WIQJqCJ491xxxn8troo/U
 SZ85xtS3gtBB31B6Vmye7O4FpLEHEq2OtOrbySpB6U61gIO4LsTVJXm4FhugCHPOHH
 1rQoedpYHAW0UEgGGlbRs4IDVJtyTJKTxRxBzlsBdVRFyQxDwt5Gmd+e3TMfBh8KG0
 7GqmP5hVj7tfjNxzvm74MenTq7ZDeQFk0BsnPEoyOxcSVxTmeEaNZTO0XwFql1ZN3X
 YwQldfgAN/3hQ==
Date: Mon, 30 Jun 2025 10:52:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
Message-ID: <20250630-sheep-of-fantastic-defiance-fb90c5@houat>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
 <20250627192347.GA4032621-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="azr4p4pnlcb6447b"
Content-Disposition: inline
In-Reply-To: <20250627192347.GA4032621-robh@kernel.org>
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


--azr4p4pnlcb6447b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
MIME-Version: 1.0

On Fri, Jun 27, 2025 at 02:23:47PM -0500, Rob Herring wrote:
> > +static int __init carveout_heap_init(void)
> > +{
> > +	struct device_node *rmem_node;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	rmem_node =3D of_find_node_by_path("/reserved-memory");
> > +	if (!rmem_node)
> > +		return 0;
> > +
> > +	for_each_child_of_node(rmem_node, node) {
> > +		if (!of_device_is_compatible(node, "carved-out"))
> > +			continue;
> > +
> > +		ret =3D carveout_heap_setup(node);
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> /reserved-memory nodes get a platform_device, so why not make this a=20
> driver?

Because I never realised we could :)

Thanks, I'll fix it for the next version

Maxime

--azr4p4pnlcb6447b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJQNAAKCRAnX84Zoj2+
djLaAYD2EgQb4dg3meUoXBv7w6f/79iKVhck4zIqbs31UtjQyNcrVEBaEwjtBsNJ
YgB/3oQBgIY3V9gHlCVKbJ+ggP4KJRA02e5r9V6Jxeq9kBkBXfo5q+IgLtEti0vG
8D95b72b7w==
=eHPZ
-----END PGP SIGNATURE-----

--azr4p4pnlcb6447b--
