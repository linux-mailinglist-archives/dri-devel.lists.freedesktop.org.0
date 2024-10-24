Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FD9AE914
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4F10E954;
	Thu, 24 Oct 2024 14:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oTa5I9R+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3F010E954
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:40:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD5FE5C061B;
 Thu, 24 Oct 2024 14:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80094C4CEC7;
 Thu, 24 Oct 2024 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729780831;
 bh=PLdPNWEGAxUx7bs29I+xXhoPOoEWXEpUgtcBm+uEJq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTa5I9R+zDvC61UZ/jQMxvUG/O2HJqLMjvYPNxvWoWZRvvUWKA+82QBebsQE4uVWI
 cPQIsEMF2VEIUjP6vYa6m8QRoSxuqSBBv2zbcYgnKtouSQoHvYzTpJ05nF1lUt/Rr4
 3oucgT721Ii9Q7Q/C2N7aUFOC7OsXN0MT9uGr9r2HzSYq62Y6ZTdoKQ4BznXZzJzQL
 4/OgXqYKXftwcyU3F68cLHDuUmaCJgulC0slRXttv88DVD35DHA1rjQTUupm/zeZPW
 rxVjJJ3R+Rh1IZtk08zn6WYA/gzf4cOfeivuNFzTPr06y9nd1a3LUNt+GO5XRMzZpl
 kMy+7rETutDsw==
Date: Thu, 24 Oct 2024 16:40:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
Message-ID: <20241024-intelligent-proficient-python-720a0c@houat>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="osg67ubcsv3cmq32"
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
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


--osg67ubcsv3cmq32
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 05:50:28PM +0100, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> For performance/power it is beneficial to adjust gpu clocks with arm cloc=
k.
> This is how the downstream cpufreq driver works
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 6d5ee1cddded..274176a938c6 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -156,7 +156,7 @@ static int raspberrypi_clock_property(struct rpi_firm=
ware *firmware,
>  	struct raspberrypi_firmware_prop msg =3D {
>  		.id =3D cpu_to_le32(data->id),
>  		.val =3D cpu_to_le32(*val),
> -		.disable_turbo =3D cpu_to_le32(1),
> +		.disable_turbo =3D cpu_to_le32(0),

I guess we can simply remove that line?

Maxime

--osg67ubcsv3cmq32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxpcVwAKCRAnX84Zoj2+
dhWuAYD5PMJD9prMYHyBdObDqF92o81SwNrQ04NtnD5jG5jYeEpmA3MzmyqCAh/o
7YBXa68BgIzZ4yp54frmW6KMod1/8J/vZSTgQD/IZkrDqafE7+wZ06WmivkbUo6B
zfJw7nahEg==
=mmzK
-----END PGP SIGNATURE-----

--osg67ubcsv3cmq32--
