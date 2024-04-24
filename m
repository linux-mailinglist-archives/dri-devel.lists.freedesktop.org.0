Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7088B08A5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560FA113AA0;
	Wed, 24 Apr 2024 11:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YJmbSgpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E3E113A9E;
 Wed, 24 Apr 2024 11:51:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98D1261986;
 Wed, 24 Apr 2024 11:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80F1C113CE;
 Wed, 24 Apr 2024 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713959514;
 bh=+s/MCfSXIP6jF3Ri9RzT+nYsE3LGvA7kXkWcB8qG+aM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJmbSgpr/LwWN+XyQa1iaouCJenrU5xhvN+TQMID8HjChAwy0omYdoJZcho6KN5kQ
 yvt9U1KrxLV1xrMjQUJYIRasOqRCeYW7XkM2IYMdfnNF/99NYVmD/KROqtSLv0jpuG
 N4mBVBx4OoLUX4Sb4adgcCW+PWZmZWPBiQYAJtnetHKSnpjqZWy62aVk/R/9u8xjuy
 0x400iQo4p1mIVINxE3kldSg1cmjcyVRWJYi1BALIPGzk69UlzcXdOzc3AtCpsf3cP
 PdhjrZFrjnxl7sLpNRCL4PZk/Y284g0/BwIKiY9K1gtnGyBGS3s4xQsS/HEYCzoav4
 fGNhVz3YTWnaA==
Date: Wed, 24 Apr 2024 13:51:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <20240424-garrulous-realistic-pronghorn-fbfcd5@houat>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fxw7weqrw4thkvz4"
Content-Disposition: inline
In-Reply-To: <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
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


--fxw7weqrw4thkvz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
>=20
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
>=20
> v3: add kernel-doc (Maxime Ripard)
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
>  include/drm/drm_drv.h     |  2 ++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..9d0409165f1e 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
> =20
> +/**
> + * devm_drm_dev_release_action - Call the final release action of the de=
vice
> + * @dev: DRM device
> + *
> + * In scenarios where drm_dev_put is directly called by driver we want t=
o release
> + * devm_drm_dev_init_release action associated with struct drm_device.
> + */

I'm not entirely sure what you mean by that documentation. "In scenarios
where drm_dev_put is directly called by the driver", we wouldn't need to
consider that function at all, right?

Also, we should reference it in drm_dev_put and devm_drm_dev_alloc too.

Maxime

--fxw7weqrw4thkvz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZijyVwAKCRDj7w1vZxhR
xTVHAQCfk24B/9t8zzj04IPsMjSBSpS+nRhDfc4Y8f1IGcKJkQD+IxBoqs9qlWhU
wyex6D/Ix2FtoZgfmUIFOptoDzXr6AI=
=xDyJ
-----END PGP SIGNATURE-----

--fxw7weqrw4thkvz4--
