Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F471B4AC74
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2D610E6DD;
	Tue,  9 Sep 2025 11:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VNBLk7SM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9410E6D1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:43:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F635449B9;
 Tue,  9 Sep 2025 11:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F7EC4CEF7;
 Tue,  9 Sep 2025 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757418201;
 bh=k7Fw2A2r8mmFKqXueaXMxt5mRMmiP/dlQAXyGiQJ0b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VNBLk7SMKJkp01G7W4KAsuWwERbuiyh1A27t7gbrZnj43YFyTTOlbmSufhgZ3tEgA
 memfQn6Q/9eEJig1qQuJuP+4YhMkexRpVXOESzACiL3F8Qb5loLYY4DHk+TGGbt9dI
 NNzGYPxkivm7FraCRgw5vyNH6IUnNVz8ayIJNIrC10CRmaxB28t9Kjf/D2oRtA4hDs
 SHcBup6TEb9+hdDisd1A4z4EC/y+i0uoYWzXB0s+H0cyChaJbOMXsEj66th59zhK/w
 m7PNVM0CpSPywnZAdpzZ6zFnFHHghEGcYAGW9ZDolsHQLsEQu3w02XH2x7qauKeHWw
 D0+NiZcc39XqA==
Date: Tue, 9 Sep 2025 13:43:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 acourbot@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
Message-ID: <20250909-fragrant-chameleon-of-democracy-5be519@houat>
References: <20250902190247.435340-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4akpkomsqg6h4mat"
Content-Disposition: inline
In-Reply-To: <20250902190247.435340-1-dakr@kernel.org>
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


--4akpkomsqg6h4mat
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 09:02:22PM +0200, Danilo Krummrich wrote:
> Nouveau patches usually flow through the drm-misc tree, while nova (and
> nova-core) are maintained through a dedicated driver tree and soon
> through drm-rust.
>=20
> Hence, fix up the corresponding X: entries to list nova instead of
> nouveau.
>=20
> Reported-by: Maxime Ripard <mripard@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/enuksb2qk5wyrilz3l2vnog45lghgmp=
lrav5to6pd5k5owi36h@pxdq6y5dpgpt/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dcfbd11efef..84e07eb11da3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8091,7 +8091,7 @@ X:	drivers/gpu/drm/i915/
>  X:	drivers/gpu/drm/kmb/
>  X:	drivers/gpu/drm/mediatek/
>  X:	drivers/gpu/drm/msm/
> -X:	drivers/gpu/drm/nouveau/

We should probably amend the nouveau entry to point to the drm-misc repo
if it's the de-facto tree these days?

> +X:	drivers/gpu/drm/nova/

For that part,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4akpkomsqg6h4mat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMAS1gAKCRAnX84Zoj2+
dlo5AX4t7Z8fFiyX921FP93Bc5SpEXxyjJqllu/+mpx+yMPODN5CASZcSA5NO9fq
o2TfViwBf1yFQ5+zxjv3VfI5aE7n80cvI0OHHarY+uSDPsomFgm4Au73P/J4xpMY
/BPX4yodXA==
=Smdh
-----END PGP SIGNATURE-----

--4akpkomsqg6h4mat--
