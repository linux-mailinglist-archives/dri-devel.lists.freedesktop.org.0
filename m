Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E78A48385
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BE710EB1A;
	Thu, 27 Feb 2025 15:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OLqv+e+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212DB10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9963B61133;
 Thu, 27 Feb 2025 15:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599BBC4CEDD;
 Thu, 27 Feb 2025 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740671477;
 bh=ri05F7cC86UnYnQNMheooJpCPDcVZpn8dX8V6aSe5oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OLqv+e+a7KP1PPlTvxg6cJs71jtOcfvzj6gcrifrx+QM5CfWWzB9OOsrrLqnVuVa0
 OBUTA+xpG0VJVFXcuKBlE8OKUqWuvEpWRAWm9tsgVbqsaUayKUnnFFwe6HrEgB6BVO
 VB2B9uGtpKdyWo385nG7ZQwkfTb50qJvOH4T0XXPpVP7v3hbsLdZWoOVTBwzJCgotx
 RFOpoxs9cy7No/uoGUJBOfLpEDsDcEJUN0Wd72ZxsWD+AYw720lChulXzmK7FJQDKp
 XHqY/ChRA+6ccHe/gVzjQFvIPfzywXufZl6NAd6+d0x3vlBPgR9QuY1RJuBZv+Tej+
 ZKgt6f6n+f0oA==
Date: Thu, 27 Feb 2025 16:51:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 linux-pwm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <rplq65h5k7kfu7anwhuh3w6lmwtm47lzeruofon4ilsxkhogjl@6k7nmeotjidd>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
 <Z8BjiRjLin8jTE8j@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hmvo4tqnjxsagleh"
Content-Disposition: inline
In-Reply-To: <Z8BjiRjLin8jTE8j@linaro.org>
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


--hmvo4tqnjxsagleh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
MIME-Version: 1.0

Hello Abel,

On Thu, Feb 27, 2025 at 03:07:21PM +0200, Abel Vesa wrote:
> On 25-02-26 17:34:50, Uwe Kleine-K=F6nig wrote:
> > On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > > The current implementation assumes that the PWM provider will be able=
 to
> > > meet the requested period, but that is not always the case. Some PWM
> > > providers have limited HW configuration capabilities and can only
> > > provide a period that is somewhat close to the requested one. This
> > > simply means that the duty cycle requested might either be above the
> > > PWM's maximum value or the 100% duty cycle is never reached.
> >=20
> > If you request a state with 100% relative duty cycle you should get 100%
> > unless the hardware cannot do that. Which PWM hardware are you using?
> > Which requests are you actually doing that don't match your expectation?
>=20
> The PWM hardware is Qualcomm PMK8550 PMIC. The way the duty cycle is
> controlled is described in the following comment found in lpg_calc_freq
> of the leds-qcom-lpg driver:
>=20
> /*
>  * The PWM period is determined by:
>  *
>  *          resolution * pre_div * 2^M
>  * period =3D --------------------------
>  *                   refclk
>  *
>  * Resolution =3D 2^9 bits for PWM or
>  *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution=
 PWM
>  * pre_div =3D {1, 3, 5, 6} and
>  * M =3D [0..7].
>  *
>  * This allows for periods between 27uS and 384s for PWM channels and per=
iods between
>  * 3uS and 24576s for high resolution PWMs.
>  * The PWM framework wants a period of equal or lower length than request=
ed,
>  * reject anything below minimum period.
>  */
>=20
> So if we request a period of 5MHz, that will not ever be reached no matte=
r what config
> is used. Instead, the 4.26 MHz is selected as closest possible.

The trace in the other mail thread suggest that you asked for a period
of 5 ms, not 5 MHz. And that results in a period of 4.26 ms.

> Now, the pwm_bl is not aware of this limitation and will request duty cyc=
le values that
> go above 4.26MHz.

It requests .period =3D 5 ms + .duty_cycle =3D 5 ms. This is fine, and
according to the trace this results in both values becoming 4.26 ms in
real life. Seems fine to me.

> > > This could be easily fixed if the pwm_apply*() API family would allow
> > > overriding the period within the PWM state that's used for providing =
the
> > > duty cycle. But that is currently not the case.
> >=20
> > I don't understand what you mean here.
>=20
> What I was trying to say is that the PWM generic framework currently does=
n't
> allow overriding the PWM state's period with one provided by the consumer,
> when calling pwm_apply_might_sleep().

Either I still don't understand what you want, or that is impossible or
useless. If you target .period =3D 5 ms and the hardware can only do 4.26
ms, why would you want to override period to 5 ms?

> Also, the pwm_get_state_hw() doesn't cache the state either.

*shrug*.

> This results in always having to call pwm_get_state_hw() before calling
> pwm_apply_might_sleep().

I cannot follow this conclusion. At least one of us two didn't
understand some detail yet.

> On top of that, pwm_get_state_hw() doesn't default to the cached value if=
 the
> provider doesn't implement the ->get_state() op.

If it did that, the consumer wouldn't know if the request was
implemented exactly or if there is no way to read back the actual
configuration.

> Please correct me if I'm wrong about these.
>=20
> >=20
> > > So easiest fix here is to read back the period from the PWM provider =
via
> > > the provider's ->get_state() op, if implemented, which should provide=
 the
> > > best matched period. Do this on probe after the first ->pwm_apply() o=
p has
> > > been done, which will allow the provider to determine the best match
> > > period based on available configuration knobs. From there on, the
> > > backlight will use the best matched period, since the driver's intern=
al
> > > PWM state is now synced up with the one from provider.
> > > [...]
> > > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlig=
ht/pwm_bl.c
> > > index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01=
b194d7466978f1ca78e 100644
> > > --- a/drivers/video/backlight/pwm_bl.c
> > > +++ b/drivers/video/backlight/pwm_bl.c
> > > @@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_d=
evice *pdev)
> > >  		goto err_alloc;
> > >  	}
> > > =20
> > > +	/*
> > > +	 * The actual period might differ from the requested one due to HW
> > > +	 * limitations, so sync up the period with one determined by the
> > > +	 * provider driver.
> > > +	 */
> > > +	ret =3D pwm_get_state_hw(pb->pwm, &pb->pwm->state);
> >=20
> > As a consumer you're not supposed to write to &pb->pwm->state. That's a
> > layer violation. Please call pwm_get_state_hw() with a struct pwm_state
> > that you own and save the relevant parts in your driver data.
>=20
> Yep, that is indeed wrong. Maybe making the pwm opaque might be a good id=
ea as well.
>=20
> [1] Calling pwm_get_state_hw() would be wrong if the provider doesn't imp=
lement the ->get_state(),
> as I mentioned above.
>=20
> But are you suggesting we replace all calls to pwm_get_state() with
> pwm_get_state_hw() in pwm_bl?

No, I still didn't understand the problem you want to fix here. So I'm
not suggesting anything yet.
=20
Best regards
Uwe

--hmvo4tqnjxsagleh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfAifAACgkQj4D7WH0S
/k5GVAf+Ne90W9R6DJzu7F15xKAgbNP+mt/jszXOLh4LRcjLIKKifcAKObKaDYaj
GStwyIpfoSP947UsZBtvZDVlLE9tz3Is3irAYJsmJTXcbHSzoWE3RDpPM1DqA/G+
0yvQEZv4S+xl7df7a6uWDcDvz01wbfJxrtL01kw6AGQhWyg205Qrnoo/zf/H3xKH
2Kp/PcY/JlRBMplSOUeL6ZpgcC3EPkzB5m399UJV3YAfPkmu29l7s3G9Lx/6KDoR
Yd8El/gpiFStoyfCwxyQDD3k4AQfOVgkeYoKtyOqPUq7nbnMdWZdvAn8HOFve63u
oTIsDE2i9VftIHJ58rDfeZzunflL6A==
=4+tm
-----END PGP SIGNATURE-----

--hmvo4tqnjxsagleh--
