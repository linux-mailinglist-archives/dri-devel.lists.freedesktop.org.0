Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5197BD29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF410E5A4;
	Wed, 18 Sep 2024 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sr881fBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD510E1AE;
 Wed, 18 Sep 2024 13:38:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73A28A438D4;
 Wed, 18 Sep 2024 13:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49985C4CEC3;
 Wed, 18 Sep 2024 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726666729;
 bh=yRPq43EYLk/2EzyDM6tG0c8iqpX450B91OXwoyOimAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sr881fBs+dGrmaBALleXBYM+IUQ9mG5hugrO//ONmJXr4DUIShArn1NXHSbUP5AIn
 uQpfwbInbK3PvcGjrGts+InBaRSv+dsjJ3kOSStZKmRRyCPi4TGjCr1A8PgMSPWS27
 LgQ5D8hiKFSXj7s/1noF4MbJ1q67H/K5roJE0vw5Of2+1N4wBXgEhEaM+hKGXGFNwR
 kGbr25WPzBuXBsi+oYCVYUQzQtvvecFgHLPmPyeEgQCcDKRHNrCGnUPEgPIkRjdLD0
 AGj7Oe+7k5UCzUKAr1Elfep6IJsmMyyx3Wm+a5gIW0/FbqaTm8akh8ah+vGruMQvDw
 k30EeF6xvYdug==
Date: Wed, 18 Sep 2024 15:38:43 +0200
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
Subject: Re: [PATCH v6 04/12] spi: intel-dg: spi register with mtd
Message-ID: <ZurX4xcy7TK45Omq@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-5-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BOpsQOSM3Yla4fmU"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-5-alexander.usyskin@intel.com>
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


--BOpsQOSM3Yla4fmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 04:49:20PM +0300, Alexander Usyskin wrote:

> From: Tomas Winkler <tomas.winkler@intel.com>
>=20
> Register the on-die spi device with the mtd subsystem.
> Refcount spi object on _get and _put mtd callbacks.

This is a MTD driver, it should be in drivers/mtd.

> +static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *i=
nfo)
> +{
> +	return 0;
> +}
> +
> +static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t l=
en,
> +			     size_t *retlen, u_char *buf)
> +{
> +	return 0;
> +}
> +
> +static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t le=
n,
> +			      size_t *retlen, const u_char *buf)
> +{
> +	return 0;
> +}

If these functions can legitimately be empty they should be removed.

--BOpsQOSM3Yla4fmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbq1+MACgkQJNaLcl1U
h9Ayagf9GPGo4W57/efjC84ILvNOGI01XOT5VcydyCnDW7yLFbLVZx4itXNHOQdo
FxDfbUojjK/z4006rT0QARLDtVZASgEy27GwNRwNvbVCFHghZbjx4YA8PWuj0dFx
QuN1M0gGrzkXlDIjdKfv521VwYjzvcxjGFKjFJu3qP10UkhL57dS/0Do/Wpdxy0I
lTPf0CiK9k4qKoLBRMnQQl3Zu31EtVI2fIHd9K+2ZAiWodDEW+RlO/v/ScCLd8jT
otJ2YUe+jBVaUZrMVhZxazYCOGAhhGXIfY5HRe5KyKFaDaVBUvjKFtgREomKPh8y
dyFiKCPztQSgFSPjfD8lr5D+5Usd9A==
=lK/X
-----END PGP SIGNATURE-----

--BOpsQOSM3Yla4fmU--
