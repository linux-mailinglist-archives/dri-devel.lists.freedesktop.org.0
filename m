Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D0AA4B3D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214F10E744;
	Wed, 30 Apr 2025 12:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ej07RYaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89AE10E744
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:33:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 372655C4A0A;
 Wed, 30 Apr 2025 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7211AC4CEE9;
 Wed, 30 Apr 2025 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746016425;
 bh=CYlvTWDWhOgSaAty4rTheIQ+iS6Dm1BlS+jESU4cLTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ej07RYaBPnSgRT4rQciY+84QnmXBjw42Y5B0ot7gAr3j0265bSs7jsb0/K9jEA+Q8
 A+grj75Arf2GoSPQ31LJbADZ6G+2ouaByOPimfTO1nbD7pZ8NWGwTjKHOJimt8zS4N
 re3NeH0bbnXwMec0v+qoH++nVMF/ahAxoompySeNZ4dJlx6gyGmMV2aKQbHBvw9fCL
 pgODU3EdT6ATfPw74/vER8DcUASxAajBD74UXwS+bRDupd+dMesOhu+o4ueY8N9f2z
 /6tIgQZGY5KnyQYXvrqtFG/I68WrziuagzjyxDG4clYoCMaeyA9JsCQsZ/Sc2KpJjx
 yMujGNnKAGxuw==
Date: Wed, 30 Apr 2025 14:33:42 +0200
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
Message-ID: <5urcec625u3jva5kyf7bztehqijfhztmo4op25joqyt7gl6kjt@5tn2fbot3fri>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
 <Z8BjiRjLin8jTE8j@linaro.org>
 <rplq65h5k7kfu7anwhuh3w6lmwtm47lzeruofon4ilsxkhogjl@6k7nmeotjidd>
 <Z8CX3vr1xuaKT38m@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ysdmqcj2sl7kjzl"
Content-Disposition: inline
In-Reply-To: <Z8CX3vr1xuaKT38m@linaro.org>
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


--2ysdmqcj2sl7kjzl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
MIME-Version: 1.0

Hello Abel,

On Thu, Feb 27, 2025 at 06:50:38PM +0200, Abel Vesa wrote:
> On 25-02-27 16:51:15, Uwe Kleine-K=F6nig wrote:
> > On Thu, Feb 27, 2025 at 03:07:21PM +0200, Abel Vesa wrote:
> > > On 25-02-26 17:34:50, Uwe Kleine-K=F6nig wrote:
> > > > On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > > > > The current implementation assumes that the PWM provider will be =
able to
> > > > > meet the requested period, but that is not always the case. Some =
PWM
> > > > > providers have limited HW configuration capabilities and can only
> > > > > provide a period that is somewhat close to the requested one. This
> > > > > simply means that the duty cycle requested might either be above =
the
> > > > > PWM's maximum value or the 100% duty cycle is never reached.
> > > >=20
> > > > If you request a state with 100% relative duty cycle you should get=
 100%
> > > > unless the hardware cannot do that. Which PWM hardware are you usin=
g?
> > > > Which requests are you actually doing that don't match your expecta=
tion?
> > >=20
> > > The PWM hardware is Qualcomm PMK8550 PMIC. The way the duty cycle is
> > > controlled is described in the following comment found in lpg_calc_fr=
eq
> > > of the leds-qcom-lpg driver:
> > >=20
> > > /*
> > >  * The PWM period is determined by:
> > >  *
> > >  *          resolution * pre_div * 2^M
> > >  * period =3D --------------------------
> > >  *                   refclk
> > >  *
> > >  * Resolution =3D 2^9 bits for PWM or
> > >  *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolu=
tion PWM
> > >  * pre_div =3D {1, 3, 5, 6} and
> > >  * M =3D [0..7].
> > >  *
> > >  * This allows for periods between 27uS and 384s for PWM channels and=
 periods between
> > >  * 3uS and 24576s for high resolution PWMs.
> > >  * The PWM framework wants a period of equal or lower length than req=
uested,
> > >  * reject anything below minimum period.
> > >  */
> > >=20
> > > So if we request a period of 5MHz, that will not ever be reached no m=
atter what config
> > > is used. Instead, the 4.26 MHz is selected as closest possible.
> >=20
> > The trace in the other mail thread suggest that you asked for a period
> > of 5 ms, not 5 MHz. And that results in a period of 4.26 ms.
>=20
> OK. So unit is ms. Got it.
>=20
> >=20
> > > Now, the pwm_bl is not aware of this limitation and will request duty=
 cycle values that
> > > go above 4.26MHz.
> >=20
> > It requests .period =3D 5 ms + .duty_cycle =3D 5 ms. This is fine, and
> > according to the trace this results in both values becoming 4.26 ms in
> > real life. Seems fine to me.
>=20
> Right, but as I keep trying to explain is that, the consumer keeps
> asking for duty cycles that go over the 4.26ms, which is the period that
> the provider decided it can do instead of 5ms.

I see no problem here. Yes, requests are not implemented exactly in
general, but there is no way around that. For some use-cases the picked
configuration is sensible, for others less so. There is also no way
around that.

> > > > > This could be easily fixed if the pwm_apply*() API family would a=
llow
> > > > > overriding the period within the PWM state that's used for provid=
ing the
> > > > > duty cycle. But that is currently not the case.
> > > >=20
> > > > I don't understand what you mean here.
> > >=20
> > > What I was trying to say is that the PWM generic framework currently =
doesn't
> > > allow overriding the PWM state's period with one provided by the cons=
umer,
> > > when calling pwm_apply_might_sleep().
> >=20
> > Either I still don't understand what you want, or that is impossible or
> > useless. If you target .period =3D 5 ms and the hardware can only do 4.=
26
> > ms, why would you want to override period to 5 ms?
>=20
> Meaning the consumer should become aware of the period the provider can
> do before asking for a duty cycle.=20

There is pwm_round_waveform_might_sleep() that you could use. Downside
is that is currently only works for two lowlevel drivers.

> If you look at the other mail thread, the trace there shows the
> following sequence for every new backlight update request:
>=20
> 1. pwm_apply with consumer's period (5ms)
> 2. pwm_get reads the provider's period (4.25ms)=20
>    - which is what the provider is able to do instead of 5ms
> 3. pwm_apply (due to debug) which uses the state from 2.
> 4. pwm_get reads back exactly as 2.
>=20
> So we can ignore 3 and 4 for now as they are there due to debug,
> but the step 1 still requests a value over the 4.26ms (5ms),
> which in the provider will translate to a pwm value higher than allowed
> by the selected configuration.

The lowlevel driver sees the request e.g.

	.period =3D 5000
	.duty_cycle =3D 4600

and is supposed to implement (I guess)

	.period =3D 4260
	.duty_cycle =3D 4260

=2E I don't see a technical problem here (apart from you being unlucky
about the choice made?).

Best regards
Uwe

--2ysdmqcj2sl7kjzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgSGKQACgkQj4D7WH0S
/k44Rwf/aNKxkT+yPlC4Q8XTXzFe99nZwAn4OVpAe8qXQ6H3PeeU4CGPHDxPomi5
QPpT0x53dWtJbk0qe9vr6fs6smmhN0w/kIVCaBj1eRUYKQdPnAE0lmPz01njPeM1
1ASwQxqhOS2ikZHvwgm7hZlXee5nW39R6Fdx/aC/8ff+Xiv+wk283f8aXQwFaYv8
C6W9z98zQ/51YZpmDATg6K9tD0uhMwfYsO5sikUNdZFv6rNosqzcd5DX+lQGE1ud
SxUJprwiGIgi/sy0Yhy3JKAYK4+ktk27E+j+VX8qi2lsrLWqtvT54eulUcRX+tAj
5ra7VKQWNbSMFO38wT6AIB3z3uzI7g==
=B4w0
-----END PGP SIGNATURE-----

--2ysdmqcj2sl7kjzl--
