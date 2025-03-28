Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F1A74D18
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BEF10E1E7;
	Fri, 28 Mar 2025 14:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sl2O/IJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DE10E1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:49:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99BFB5C5AE7;
 Fri, 28 Mar 2025 14:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1728C4CEE4;
 Fri, 28 Mar 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743173363;
 bh=nCNyUjLSyc/6W6kjqwkGb3v5fugdXcWu3vUlj0/J0io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sl2O/IJ3kxY83bZbkqCJ8RQmekSAMV5eHsQ5zUkzVYUYOt8af1jeJmXFyGfS8hSrJ
 QMVZ7whp0cxe+PqsFK38DbXMJ4FfNyEpcg4oJ6x52W46ND7FfBiZ1Zrd4QlOD7ZyI9
 FR7+VUAeL6lt5SmXC7NB++7ja6O/thAgFq+i9bojip+PQg6V8GBH051pk7k7Tbd/s1
 b85DYxQHMstt8uWc1H4BEFYLLFwMe8odD+y570IuvyvI1CBiRtAQh4FQZo4Szw7gGX
 p32DfkYocqmrmbWnmy0nbtn5KwAwh+EBZulYxJdE65ANQqr2ZODkfTjxbkAoBImZgB
 rqyjtEwnbbvPg==
Date: Fri, 28 Mar 2025 15:49:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Message-ID: <20250328-pink-ferret-of-engineering-bf7818@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-9-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qeasnvjyl35m5qhj"
Content-Disposition: inline
In-Reply-To: <20250325235522.3992-9-dakr@kernel.org>
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


--qeasnvjyl35m5qhj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:54:35AM +0100, Danilo Krummrich wrote:
> Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de46acc247c3..c704431f02aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/
> +F:	rust/kernel/drm/
>  F:	include/drm/
>  F:	include/linux/vga*
>  F:	include/uapi/drm/

Our MAINTAINERS entry is pretty weird and kind of duplicated between drm
and drm-misc, we should probably put it under drm-misc too?

Maxime

--qeasnvjyl35m5qhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+a28AAKCRDj7w1vZxhR
xRGtAP0VrYpSSrZzNC5PFcDo/LsX6mq9K1YbjE+oo4gH1ajFdgD/Q6K8PqStFyYI
bymn5NJfQqYNLiouUXJmKW1Qfngs8As=
=U4t+
-----END PGP SIGNATURE-----

--qeasnvjyl35m5qhj--
