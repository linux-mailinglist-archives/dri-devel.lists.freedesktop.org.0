Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CF97BD1E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C021910E59F;
	Wed, 18 Sep 2024 13:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N/ktmbCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F93B10E59B;
 Wed, 18 Sep 2024 13:35:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B0D85C5CB3;
 Wed, 18 Sep 2024 13:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3022FC4CEC3;
 Wed, 18 Sep 2024 13:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726666536;
 bh=k0YjMuTyRy6bW50pv7BP9O8+81yBsHxqndrsew5qUZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/ktmbCmZzdggB7E6Vq1nfM+HnGQhLNDv8Ev4R6If75ikZzzy5m3aSZ8By9c1FkWb
 kz+ztXFqXOeh/nAZLUz7QhEkmewR4Ec4rtlcbTrDMM/gujbjWDayjECwN383ZWyUp3
 yKnpzLCEmk7b/u3PS5l+/tgxICiPmge4+MAOmfaKgTMIGxeukjogXKlo0+d3ALP1ke
 Uopha1T4fV2LFikMBorpQG5zvSS8dqaev690IL5CuQxMDydxeLN/ryXe/1FbKvJw1s
 u8zrRw/xD/bh608Qj/n/46ImSsWv2GSGM++etwOGiWxU9SmddqJdC8DvQIeoySKjCn
 xKOn9dYCSfQ4A==
Date: Wed, 18 Sep 2024 15:35:31 +0200
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
Subject: Re: [PATCH v6 02/12] spi: intel-dg: implement region enumeration
Message-ID: <ZurXI2g00duqMUjo@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-3-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4E2vtPXFpUvSi0jO"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-3-alexander.usyskin@intel.com>
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


--4E2vtPXFpUvSi0jO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 04:49:18PM +0300, Alexander Usyskin wrote:

> In intel-dg spi, there is no access to the spi controller,
> the information is extracted from the descriptor region.

Which information?  I can't tell what this patch is supposed to do; as
with the first patch this shouldn't be standalone.

> +static inline u32 spi_error(struct intel_dg_spi *spi)
> +{

> +static inline u32 spi_read32(struct intel_dg_spi *spi, u32 address)
> +{

At least these names are too generic, please use driver specific
prefixes.

--4E2vtPXFpUvSi0jO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbq1yMACgkQJNaLcl1U
h9CPYgf/ZjVGyEO9Y7iKYItfa+LbEduFBmRksC7xQpoW/Uh4qJfkXH37ns53BxNZ
FthkWsw64WaUfLhv5HtPzk9tMtNuojS/m1tao0FxZlXzgUhFylgCbhLEzutdKvtv
CQ7ghKdjhhUaELp5Cw1e1OsOwjKirsgMGBgvjUBlFCEWpgWQfxkYKDiS1sD/lkSv
xN2f/tV6BHbW9/mc+9hrfL3y/RV1OvMpv5NLRFgOnBpNndEGyRr0r3jdiMY0ZkWX
krmmNCFPoCbbm1qAJBUopFmb2+jnXtal//XbtGMUNf63wc2IYr6RVSWC39LaylHZ
eVX878zAvbZAo1XvV1MMaVo60yc9xQ==
=P3sn
-----END PGP SIGNATURE-----

--4E2vtPXFpUvSi0jO--
