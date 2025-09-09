Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC4B4FDFD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D967910E760;
	Tue,  9 Sep 2025 13:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GUNS3aBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FDF10E760
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:49:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BC0A60224;
 Tue,  9 Sep 2025 13:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2CAC4CEF7;
 Tue,  9 Sep 2025 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757425764;
 bh=49gZNr2H7kccNqE5XR78ZGc2FVHa7pQDJF9bw7z2c/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUNS3aBv17s4mfY42cI+aghlpnercgKfmDtnImYtucNS6mqCKtDfNjOg7amxH+TCK
 lcRE+yACfehHA02LBH75TsHgCypy4X7IrXAltdoQE1cU+5/lT/mA6gHsaxgtTnb13f
 M2UTl1+Lq722rHyS6+Ti0VxP+8qZk+dOau/p9c2RMWfY78/iVUO2mzjsLyG6DLb12X
 ocIzKXKbBHI9TBREkqbp1DPYZNq4GU6GIPzALkARqLgs+PPfAdwldPFrV/44sYB6DM
 ykflOQV27hBIj8dmdVDne81ZDm2DHnJLUWiGMnW57Tl6x1WVcoQEL3UdT8IZrpFW2T
 N1nep5yJQq4EA==
Date: Tue, 9 Sep 2025 15:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <7zae3uaz5wdk2ktmg44aqdnfjglklqujtktslvlye3ssd3xvbv@qwwjiip6kgfo>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
 <n6rltuxqwybh2mwzz3hxi3tzix2c7q3mbovscobzzmkj6puo6w@gc3qnchjlagq>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d5ajcr2dlqwa72tk"
Content-Disposition: inline
In-Reply-To: <n6rltuxqwybh2mwzz3hxi3tzix2c7q3mbovscobzzmkj6puo6w@gc3qnchjlagq>
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


--d5ajcr2dlqwa72tk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
MIME-Version: 1.0

Hello Michael,

On Fri, Aug 01, 2025 at 08:32:20AM +0200, Uwe Kleine-K=F6nig wrote:
> Hallo Michael,
>=20
> On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight=
/pwm_bl.c
> > index 237d3d3f3bb1a..5924e0b9f01e7 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -518,13 +518,6 @@ static int pwm_backlight_probe(struct platform_dev=
ice *pdev)
> >  	if (!state.period && (data->pwm_period_ns > 0))
> >  		state.period =3D data->pwm_period_ns;
> > =20
> > -	ret =3D pwm_apply_might_sleep(pb->pwm, &state);
> > -	if (ret) {
> > -		dev_err_probe(&pdev->dev, ret,
> > -			      "failed to apply initial PWM state");
> > -		goto err_alloc;
> > -	}
> > -
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> > =20
> >  	if (data->levels) {
> > @@ -582,6 +575,15 @@ static int pwm_backlight_probe(struct platform_dev=
ice *pdev)
> >  	pb->lth_brightness =3D data->lth_brightness * (div_u64(state.period,
> >  				pb->scale));
> > =20
> > +	state.duty_cycle =3D compute_duty_cycle(pb, data->dft_brightness, &st=
ate);
> > +
> > +	ret =3D pwm_apply_might_sleep(pb->pwm, &state);
> > +	if (ret) {
> > +		dev_err_probe(&pdev->dev, ret,
> > +			      "failed to apply initial PWM state");
> > +		goto err_alloc;
> > +	}
> > +
>=20
> I wonder why the PWM is updated at all in .probe(). Wouldn't it be the
> natural thing to keep the PWM configured as it was (in its reset default
> state or how the bootloader set it up)?
>=20
> Orthogonal to your change, while looking at the driver I wondered about:
>=20
>         bl =3D backlight_device_register(dev_name(&pdev->dev), &pdev->dev=
, pb,
>                                        &pwm_backlight_ops, &props);
>         if (IS_ERR(bl)) {
>                 ret =3D dev_err_probe(&pdev->dev, PTR_ERR(bl),
>                                     "failed to register backlight\n");
>                 goto err_alloc;
>         }
>=20
>         if (data->dft_brightness > data->max_brightness) {
>                 dev_warn(&pdev->dev,
>                          "invalid default brightness level: %u, using %u\=
n",
>                          data->dft_brightness, data->max_brightness);
>                 data->dft_brightness =3D data->max_brightness;
>         }
>=20
>         bl->props.brightness =3D data->dft_brightness;
>         bl->props.power =3D pwm_backlight_initial_power_state(pb);
>         backlight_update_status(bl);
>=20
> Shoudn't setting data->dft_brightness, bl->props.brightness and
> bl->props.power better happen before backlight_device_register()? Also
> calling backlight_update_status() after backlight_device_register()
> seems wrong to me, I'd claim the backend driver shouldn't call that.

Do you intend to work on this orthogonal feedback? If not, I'll put it
on my todo list.

Best regards
Uwe

--d5ajcr2dlqwa72tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjAMFsACgkQj4D7WH0S
/k4BWQgAuXV/ULnAxDCQ3VIqXyMJPZ9q/2BOe6oUyBZUls9TN9oBBE97kCYQT03v
nY/10hGSr8Pf3XZ/VJfXQX7LCV/Scc0U0Ufz2Pwtb01s7zERx4SgBlHW9k/a4IB8
UQ/BmYixfkuQoVFsNhjzgsyzR0Yul5abMKBwWme86iu3L4PWWzs0Nt8p0otOV5Yw
HabxoMBQTTVx2MvK8u9tWB3xkinIzXxVDowWKB7FR7kQpcoCxy6XJnAI0BSwDvNV
8YywwiaiNGdecrHj0vBDY7yTPiiT8BKAi1H3SiwFdn3cO//lnhbqzNHntPQ1N67V
ZoGfcECUaGfqJL2w5nsRXewnLty7qA==
=YVsb
-----END PGP SIGNATURE-----

--d5ajcr2dlqwa72tk--
