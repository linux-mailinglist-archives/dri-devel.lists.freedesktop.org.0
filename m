Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C018D97BD11
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9320210E59E;
	Wed, 18 Sep 2024 13:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JaFpgDg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D310E59B;
 Wed, 18 Sep 2024 13:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71CA4A438F1;
 Wed, 18 Sep 2024 13:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5A0C4CEC3;
 Wed, 18 Sep 2024 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726666390;
 bh=kRkUS7LO6EHDAgc6dBBV50sa5FPk23bEBsz9c+ckCac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JaFpgDg+fkD7VkuP8VmJqFyRKHCnEG1BWCXiezqQ67NNt1XGXE6+JMr0kMdoGzDqK
 KiF6h3eLM9t9YfLLf72JimYMHXzkHcv78uahqXPZdKxklDaaw7a//+OFZOdUkTtuXj
 v3BIka+rHr5fcYAkOogqWB2OGkt4IEfU3pQE5asdasKULjXrBF/y4+zULMPzlTaJMO
 bXOg1H9bGK/8m4HFSuoQAFu0a1kJVlUuzvf/mEURtUoTW9Jkc5VPbMeda0FK8eK3Jn
 FYv04z5LPRie7kr3ErbMIhKxkCVTf4CLT1ZyhwNM7I9KE3E+nnjCFp/xT+OmhAJ0TI
 WN2xxaVoFjJZA==
Date: Wed, 18 Sep 2024 15:33:07 +0200
From: Mark Brown <broonie@kernel.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Message-ID: <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5JWxWqEiot4+TAHg"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-2-alexander.usyskin@intel.com>
X-Cookie: Editing is a rewording activity.
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


--5JWxWqEiot4+TAHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 04:49:17PM +0300, Alexander Usyskin wrote:

> Add auxiliary driver for intel discrete graphics
> on-die spi device.

This doesn't actually do anything AFAICT?  It doesn't register with any
subsystem or anything.  Please don't submit empty boilerplate like this,
submit a driver that is at least minimally useful - assuming some other
patches in the series add functionality squash at least a basic set of
functionality into this.  This makes review and test easier.

> +++ b/drivers/spi/spi-intel-dg.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +struct intel_dg_spi {
> +	struct kref refcnt;
> +	void __iomem *base;
> +	size_t size;
> +	unsigned int nregions;
> +	struct {
> +		const char *name;
> +		u8 id;
> +		u64 offset;
> +		u64 size;
> +	} regions[];

Use __counted_by() for the benefit of the static checkers.

> +	size = sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
> +	spi = kzalloc(size, GFP_KERNEL);

Use at least array_size().

> +	kref_init(&spi->refcnt);

This refcount feels more complex than just freeing in the error and
release paths, it's not a common pattern for drivers.

> +	spi->nregions = nregions;
> +	for (n = 0, i = 0; i < INTEL_DG_SPI_REGIONS; i++) {
> +		if (ispi->regions[i].name) {
> +			name_size = strlen(dev_name(&aux_dev->dev)) +
> +				    strlen(ispi->regions[i].name) + 2; /* for point */
> +			name = kzalloc(name_size, GFP_KERNEL);
> +			if (!name)
> +				continue;
> +			snprintf(name, name_size, "%s.%s",
> +				 dev_name(&aux_dev->dev), ispi->regions[i].name);

kasprintf().

> +static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
> +{
> +	struct intel_dg_spi *spi = dev_get_drvdata(&aux_dev->dev);
> +
> +	if (!spi)
> +		return;
> +
> +	dev_set_drvdata(&aux_dev->dev, NULL);

If the above is doing anything there's a problem...

--5JWxWqEiot4+TAHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbq1pIACgkQJNaLcl1U
h9CHrAf+JYhpq4Fp7x6uc7TfLF7AbQh05EwZ+QlXdvKTdHZx82S8xbGy0SWmWK8u
+goH59ZuQvxCI1ZoDFsY9AeCyigxOKr9eqYREJLG1mQnx11zN/u6lJ+Fouv1bxXt
/vpIuFX4MMdknEs7FIESPYi2bCFetdlT48+3VEIla0MOgqnT8Dd9TTDt4eRJtmKe
kYAwMuZm49cUgaxTYeR7WU3jTmriqf9MKbIE///CXs53G3BuM7dwunwBpi6I4eG3
nswuncC3MUT/cZx+gjg6p4H/7Q28g+zuAZj34cUwUjhVCztrsjsZEKP6FU6WsL14
AQgc9yXj6lqL4izjKjJfwNNKqOqwTA==
=6UK8
-----END PGP SIGNATURE-----

--5JWxWqEiot4+TAHg--
