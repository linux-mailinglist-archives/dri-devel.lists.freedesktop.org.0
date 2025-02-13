Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B98A34CA2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A510EB64;
	Thu, 13 Feb 2025 17:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R52iamQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812F10EB64
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:59:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CED05C58EA;
 Thu, 13 Feb 2025 17:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537F5C4CEE5;
 Thu, 13 Feb 2025 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739469558;
 bh=Pgn2vbpHZGhCOn5YhZz8fN0a5lPUgj2hH+tawYr3GvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R52iamQnStdvdjPzrUWP5m3f6dlxeAVUJqqh2Zat/hZmMmlZ3FHIP25gpThz11R/D
 vg96qHC/2qAMYIMR6wmNuF/4329RLihz4GzMSQUEt68g3bpYzwf1dJzrZl3Rg7/t1p
 jvOBSQiBorqQZPb3p1svf5VOM8/TFStUBnvqPVCIw4pO27r3Z6Qnyi3pk4mD0z74yO
 B66OYoxbo/tqlkGISaWYvy3fvp2dC5W/XgM4ye3k/MUixPd3wsUdolVYLoaiZk9TAl
 7no88D98e6379shrdeW11gVSPGGHH/QAm4ezRmpsgWS00PbSjF8oG67spsPDlwYQfa
 cFQyhc2+LYypQ==
Date: Thu, 13 Feb 2025 17:59:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
Message-ID: <20250213-crown-clustered-81c6434c892b@spud>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hayvwxyUW11W/dJv"
Content-Disposition: inline
In-Reply-To: <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
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


--hayvwxyUW11W/dJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 06:27:59PM +0100, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>=20
> Use it and remove some boilerplate code.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-mpfs.c | 52 +++-------------------------------------=
------
>  1 file changed, 3 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fda=
a9e50ffac17c908 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device=
 *adev,
>  	return devm_reset_controller_register(dev, rcdev);
>  }
> =20
> -static void mpfs_reset_unregister_adev(void *_adev)
> -{
> -	struct auxiliary_device *adev =3D _adev;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static void mpfs_reset_adev_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk=
_dev)
> -{
> -	struct auxiliary_device *adev;
> -	int ret;
> -
> -	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> -	if (!adev)
> -		return ERR_PTR(-ENOMEM);
> -
> -	adev->name =3D "reset-mpfs";
> -	adev->dev.parent =3D clk_dev;
> -	adev->dev.release =3D mpfs_reset_adev_release;
> -	adev->id =3D 666u;
> -
> -	ret =3D auxiliary_device_init(adev);
> -	if (ret) {
> -		kfree(adev);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return adev;
> -}
> -
>  int mpfs_reset_controller_register(struct device *clk_dev, void __iomem =
*base)
>  {
>  	struct auxiliary_device *adev;
> -	int ret;
> =20
> -	adev =3D mpfs_reset_adev_alloc(clk_dev);
> +	adev =3D devm_auxiliary_device_create(clk_dev, "reset-mpfs",
> +					    (__force void *)base, 666u);

Moving the boilerplate into a helper makes sense:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

One think that's always felt a bit meh to me is this id number stuff,
I just threw in 666 for meme value. The whole thing seems super
arbitrary, do any of the users of this helper actually put meaningful
values into the id parameter?

>  	if (IS_ERR(adev))
>  		return PTR_ERR(adev);
> =20
> -	ret =3D auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	adev->dev.platform_data =3D (__force void *)base;
> -
> -	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, ad=
ev);
> +	return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
> =20
>=20
> --=20
> 2.45.2
>=20

--hayvwxyUW11W/dJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ64y1gAKCRB4tDGHoIJi
0tpDAQDNGTJm0hUvHu9/lgcEwur44fxS2Qlcl7n70eboDVTC6gD/VBr9uDAEKvks
C7yxajoK6tXd6NFsVd0104wfqGk41QU=
=kI4Q
-----END PGP SIGNATURE-----

--hayvwxyUW11W/dJv--
