Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB5A4734E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 04:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE210EA18;
	Thu, 27 Feb 2025 03:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKOIEVIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4E10EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 03:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5977461155;
 Thu, 27 Feb 2025 03:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC92BC4CED6;
 Thu, 27 Feb 2025 03:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740625610;
 bh=q2ghoz1pWJEIqwjf30Ucg7t93D2Nrvj2VISWKXWFeS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XKOIEVItYrAj/NHvNuhYHb1TLQ0uWUr6Cfms8KX4vn/wJBClj/nY8frxgb/Uc4f9F
 eBPOTrxKFeK0bhW86VnrG78WQXS614b953FFfZEnwXD+vynPLg2MdMKDLDhqrNw9Lb
 gL87zVRHdia/yyl5wGrhI4dcgu4aux5HeF/km2dVwo8F0fh6Jou02XLsO503f3ZTuf
 MgZxMB+pYdH+zLZFVQtJsf3WE31XgskWhHJ6J7114z31SqyGdDmyhdrwZ5nSxJ5NVM
 8je6WFfjt3CYVTVckaoBkvxKLMHK+6crHGpgiRVQOMYs9GTnyvw9bhltXv66apH9XT
 xXxJC0D5wudzQ==
Received: by venus (Postfix, from userid 1000)
 id ADF6718066B; Thu, 27 Feb 2025 04:06:47 +0100 (CET)
Date: Thu, 27 Feb 2025 04:06:47 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <cmjyaveolhjtfhqbjpc6ghh7g2f5jmeyavoms5lqup6dyidngl@ljvxgoyw57md>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a5rbsad7opocfj4r"
Content-Disposition: inline
In-Reply-To: <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
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


--a5rbsad7opocfj4r
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
MIME-Version: 1.0

Hi,

On Wed, Feb 26, 2025 at 05:34:50PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > The current implementation assumes that the PWM provider will be able to
> > meet the requested period, but that is not always the case. Some PWM
> > providers have limited HW configuration capabilities and can only
> > provide a period that is somewhat close to the requested one. This
> > simply means that the duty cycle requested might either be above the
> > PWM's maximum value or the 100% duty cycle is never reached.
>=20
> If you request a state with 100% relative duty cycle you should get 100%
> unless the hardware cannot do that. Which PWM hardware are you using?
> Which requests are you actually doing that don't match your expectation?

drivers/leds/rgb/leds-qcom-lpg.c (which probably should at least get
a MAINTAINERS entry to have you CC'd considering all the PWM bits in
it). See the following discussion (I point you to my message in the
middle of a thread, which has a summary and probably is a good
starting point):

https://lore.kernel.org/all/vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67=
pd2@cz2dcracta6w/

Greetings,

-- Sebastian

> > This could be easily fixed if the pwm_apply*() API family would allow
> > overriding the period within the PWM state that's used for providing the
> > duty cycle. But that is currently not the case.
>=20
> I don't understand what you mean here.
>=20
> > So easiest fix here is to read back the period from the PWM provider via
> > the provider's ->get_state() op, if implemented, which should provide t=
he
> > best matched period. Do this on probe after the first ->pwm_apply() op =
has
> > been done, which will allow the provider to determine the best match
> > period based on available configuration knobs. From there on, the
> > backlight will use the best matched period, since the driver's internal
> > PWM state is now synced up with the one from provider.
> > [...]
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight=
/pwm_bl.c
> > index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01b1=
94d7466978f1ca78e 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_dev=
ice *pdev)
> >  		goto err_alloc;
> >  	}
> > =20
> > +	/*
> > +	 * The actual period might differ from the requested one due to HW
> > +	 * limitations, so sync up the period with one determined by the
> > +	 * provider driver.
> > +	 */
> > +	ret =3D pwm_get_state_hw(pb->pwm, &pb->pwm->state);
>=20
> As a consumer you're not supposed to write to &pb->pwm->state. That's a
> layer violation. Please call pwm_get_state_hw() with a struct pwm_state
> that you own and save the relevant parts in your driver data.
>=20
> > +	if (ret && ret !=3D -EOPNOTSUPP) {
> > +		dev_err(&pdev->dev, "failed to get PWM HW state");
> > +		goto err_alloc;
> > +	}
> > +
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> > =20
> >  	if (data->levels) {
>=20
> Best regards
> Uwe



--a5rbsad7opocfj4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme/1sMACgkQ2O7X88g7
+pp2axAAjUk/lD0Uk4ltqhBQwfAEUqmFf1DoyH07Pzeqgx00DfAcBr2cL/Nae/by
vz0CXq2TrsiJG9tYNV/YzQfTq21f6xNhg+HYVqRnw4M6N5NEubL3FFxDUG7aug5r
vJsbi/ZMqRla7FtyH6fVC2r51AZqI1/+BdB1zuN5k8TB8t7NHWe6gSTcxTL++TfS
EzOrvlAwTyFJkGCbLw5laeXQ7OdZCdPF0ASms+r6p4FTASs0351udCRSy6wWSvg5
oRrY8U59bkjRB9r8/0LiT6k3eQkvhlNpknYqwdDAZc4DK/X9Pg2ssHBDKjOxJNyP
fymMw/yRJ/yGBMlzcdRJhmEZUc6ruDWmAi6GaNOCndslanwZUDge+dalgtyYa6HQ
JzIDINQM4r4hDnNXSrAL/JIXNUpbldjJzR4gbz9rmDcFyf7MovcBOY/FspXHSxZA
L6D/DEF1HeMVl/qIJJGDQvJ35hUcGE9C6oFA+pEz0IxDyi1kUmYPVdZNmJ9nriYM
k9OZmU/C8Mqch9E0cQFceRbE+/U0PyZZ2Mafv2Aju99OqV9vplUCDHyNqu82tdZW
IXRvpWgf5qk5SzXLS8TkNyfkDGofP4JN6SbT/te1gCRHOi1oOs05kYjtb4xpCB51
MMjrboCZedmzGwmsM3Evbw+e0W04zIwNiEeDBUElo20hdw9Idjw=
=dIdK
-----END PGP SIGNATURE-----

--a5rbsad7opocfj4r--
