Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A314BA3D507
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BA010E15F;
	Thu, 20 Feb 2025 09:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C4blYxCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D7410E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:43:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 55A0461357;
 Thu, 20 Feb 2025 09:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405DAC4CED1;
 Thu, 20 Feb 2025 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740044606;
 bh=Rervc4K6IK6z3wDlFY4lh0T75HvSwycQ75TaiQNg8AE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4blYxCr+s9ZMpboatq3WcW8OV1FXLirXFmumOvmvfJfwgc+tbjCOA1U75DvvyWk8
 a5Hg9GT7SCNwZPqlfOaqwZQX1i+v4AnVmTdvLisRRUOoA0zwgnyDiQ9GHgdn3GLAVg
 eYWIn49roZPbksy8fhngURrn4iKGDVg7AGxYjMItY5aLC6L0I9U5UZNOqLS8M+FlRi
 9BQGiqtkR8CxrlglFkST9ZNzr9G7K3dc7eJoBLbiWX6n1yDX87Wkb8Zf9Fd2A0bxzq
 3q35rnHDqgFX0IDq6L7q85dz/OeHgfIEregchdxXfy1qT6IOnMUlx2rtwMDdw4aw3r
 EcyoKaC7T36Wg==
Date: Thu, 20 Feb 2025 10:43:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Shixiong Ou <oushixiong1025@163.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
Message-ID: <20250220-spiked-quirky-nightingale-6ad2ed@houat>
References: <20250220085358.232883-1-oushixiong1025@163.com>
 <20250220-tiny-pragmatic-pug-5addfc@houat>
 <c3b340a6-04fe-adc2-d9e5-be95135aa0ab@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dfzhoh7bq5tokgfb"
Content-Disposition: inline
In-Reply-To: <c3b340a6-04fe-adc2-d9e5-be95135aa0ab@163.com>
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


--dfzhoh7bq5tokgfb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/arm/komeda: Add a condition check before removing
 sysfs attribute
MIME-Version: 1.0

On Thu, Feb 20, 2025 at 05:20:48PM +0800, Shixiong Ou wrote:
>=20
> =E5=9C=A8 2025/2/20 17:12, Maxime Ripard =E5=86=99=E9=81=93:
> > On Thu, Feb 20, 2025 at 04:53:58PM +0800,oushixiong1025@163.com  wrote:
> > > From: Shixiong Ou<oushixiong@kylinos.cn>
> > >=20
> > > [WHY] If the call to sysfs_create_group() fails, there is
> > >        no need to call function sysfs_remove_group().
> > >=20
> > > [HOW] Add a condition check before removing sysfs attribute.
> > >=20
> > > Signed-off-by: Shixiong Ou<oushixiong@kylinos.cn>
> > What are you trying to fix exactly? AFAIK, there's no code path that
> > calls komeda_dev_destroy() after komeda_dev_create() has failed.
>
> |if calling |||sysfs_create_group() fails, it will go to lable
> 'err_cleanup:', and it will call |komeda_dev_destroy() laterly.

Ah, right. Then that's what you should fix.

Maxime

--dfzhoh7bq5tokgfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7b5NwAKCRAnX84Zoj2+
dhEsAYDGy/OEZUIBXjEWZz2IvJT25BidrqUoLDbizs7KqicTq0LkJ7lid+iu0i/n
PszTkeIBfAmbu9/3RnueHcnt2+beEl9IbIwkRunrNMr4YtvjA8rVm5yqZ03niU60
9n7SXNRTew==
=Pkhr
-----END PGP SIGNATURE-----

--dfzhoh7bq5tokgfb--
