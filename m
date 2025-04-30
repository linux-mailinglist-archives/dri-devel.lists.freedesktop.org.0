Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40428AA4B05
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1E10E77D;
	Wed, 30 Apr 2025 12:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hEYXF3HH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514F010E789
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:25:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E9605C0465;
 Wed, 30 Apr 2025 12:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F518C4CEE9;
 Wed, 30 Apr 2025 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746015903;
 bh=zYcXsPEfolrkTF/EjgW5Q6PjxiTC+RAO6eFXhCXjLJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hEYXF3HHx4Jjp5gmOoqEvysofVXezNK88qkWvDIFPH6iGtr78U+uwk3PDqTWsMvqV
 HJ4wWYgoc0umg94St/LeVHjIvwcvAbkLpi36JkeCwJyrt0qysgNaTRyzZ9T5qt+qT2
 UAQngA49z+Y1a6FqojpCVKVODIQaYLCzKC0MQa0UEPYmm+0Rkvivk1iriyyyRIFnsM
 l74kdRZc5ZCMyR7/ousHEQyGImR5tlZPkS574e7wRWMe2YPoNBix81j0YeZ1SxZXk4
 l9jp2LgdM3ZVLMhh9hehViB3OHHX9wGbuavDA+AIzUQbWFJRtajCTgWusWThcMo2ET
 Ck+qcj7MPpgeQ==
Date: Wed, 30 Apr 2025 14:25:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Thompson <danielt@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <eexaex3ped44yszqaiedh23hjsivddmpjtij2pjciayt2z2o3l@bd4jlol6nvuq>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
 <cmjyaveolhjtfhqbjpc6ghh7g2f5jmeyavoms5lqup6dyidngl@ljvxgoyw57md>
 <Z9lFg98srzYivGoI@aspen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="354souy6or7rgjzd"
Content-Disposition: inline
In-Reply-To: <Z9lFg98srzYivGoI@aspen.lan>
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


--354souy6or7rgjzd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
MIME-Version: 1.0

Hello Daniel,

On Tue, Mar 18, 2025 at 10:05:55AM +0000, Daniel Thompson wrote:
> On Thu, Feb 27, 2025 at 04:06:47AM +0100, Sebastian Reichel wrote:
> > On Wed, Feb 26, 2025 at 05:34:50PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > > > The current implementation assumes that the PWM provider will be ab=
le to
> > > > meet the requested period, but that is not always the case. Some PWM
> > > > providers have limited HW configuration capabilities and can only
> > > > provide a period that is somewhat close to the requested one. This
> > > > simply means that the duty cycle requested might either be above the
> > > > PWM's maximum value or the 100% duty cycle is never reached.
> > >
> > > If you request a state with 100% relative duty cycle you should get 1=
00%
> > > unless the hardware cannot do that. Which PWM hardware are you using?
> > > Which requests are you actually doing that don't match your expectati=
on?
> >
> > drivers/leds/rgb/leds-qcom-lpg.c (which probably should at least get
> > a MAINTAINERS entry to have you CC'd considering all the PWM bits in
> > it). See the following discussion (I point you to my message in the
> > middle of a thread, which has a summary and probably is a good
> > starting point):
> >
> > https://lore.kernel.org/all/vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zj=
cd67pd2@cz2dcracta6w/
>=20
> I had a quick glance at this thread.
>=20
> It sounded to me like the PWM driver was scaling the requested period
> to match h/ware capability but then neglected to scale the requested
> duty cycle accordingly.

Well, I'd not call the period adaption "scaling", it just gets fitted to
the hardware capabilities. The same happens for duty_cycle, it's just
that the absolute duty_cycle value is reduced to the next value that is
possible to implement. Obviously that modifies the ratio between
duty_cycle and period (requested vs. implemented), but you cannot
prevent that anyhow and it makes handling easier for the lowlevel driver
with less corner cases. And whatever policy is chosen to be the right
one, it becomes ridiculous in the corner cases, so picking the simplest
to implement is the sane option in my eyes.

> That means the qcomm PWM driver programming a
> fractional value into the hardware that was not being anywhere close
> to duty_cycle / period.
>=20
> So the recommendation was to fix the PWM driver rather than have
> pwm_bl.c work around it?

No, the lowlevel driver is fine.

With the new-style driver callbacks it becomes possible to query the
hardware capabilities enough to implement a helper that determines the
actually implementable waveform that is best for your use-case, whatever
"best" means here.

Best regards
Uwe

--354souy6or7rgjzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgSFpkACgkQj4D7WH0S
/k5w4wgArhgbgew7qw0lAMKfRIaQrUs3HhB6o4qTL/cx0/JHMbYlixpsFiFJohJv
ThcgFesVLDRe5gbSnkc2yopRKeyq5uyFPdZOJmmmteBRL4LDB+ZSc2QlnVV/QoBA
O3BQxlH+wpiq00lEo4riwa4qraK87cZgBtkyf+w6GfNDhfCv8qNlDkqoXs66b83Y
iAvGmxYEFn1Rj9U9EDbPLpc5BqVVunxkoYi7h51FrUnw3p1LtbGSgSJhPIeZTdT8
MSzV9xQj8Kht9JW2LMuVbwduJpexoRjnx9kImFxw7NqBc6Nv5MRcKRkZJsrLVrO6
9OSpwGNx0aWGrwQX4V8Abfkm1D3tbQ==
=Laha
-----END PGP SIGNATURE-----

--354souy6or7rgjzd--
