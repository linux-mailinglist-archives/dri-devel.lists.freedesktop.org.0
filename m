Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDC528CD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 11:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490D6E0BC;
	Tue, 25 Jun 2019 09:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3D46E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:58:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so15922898wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 02:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z2FC5ARETFnUnn2kCEl6AER1qtcj7xB4LnbOY4f3FIw=;
 b=gp1BYcdaIVm8AhlwfKh1b5TbCY26YEnBdj1ijJh565g9TWUUf7ddAatHvYhsZmZZlS
 HfO/4TPb41hnZk+jQ1iWriBz23QOq/IR2oq59ZriUscwtAMXJeI5vAhc6YbKCv4YBibB
 zDNS39ZgWrYyDqCwK4fwpDEa1JXxhYGIvGdWwtk+cY1hAQPntGucmNMCD+eCKFtPXKYz
 SwxuAYcCEBQ1f9pQkYneztMOL25RZWxh8km1TmIwN3b8hKqie/xKZ2DVlBvztrXZ6YZA
 TxxmfcyqimPUYNaTxM3KtIt5sD9A8TMQ0L2Rq73NPcZWhxDCJienBN9XeoZ3XdvLOApM
 5GnQ==
X-Gm-Message-State: APjAAAWYfPBMk1eRCAvAbxDzq31LCJzfOAqVgzoDuqPwsPZrk/dnOhZ6
 oK7Vrlikfx3BXsFrhNKdDgE=
X-Google-Smtp-Source: APXvYqxN12se0+0LURby+qcAbr9bevP6FmWbz8ooSxv4a55hUEaAVYAlG+JSJTOD90CxDX92yxSXIQ==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr19269936wrt.84.1561456703106; 
 Tue, 25 Jun 2019 02:58:23 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id o4sm1847384wmh.35.2019.06.25.02.58.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 02:58:22 -0700 (PDT)
Date: Tue, 25 Jun 2019 11:58:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
Message-ID: <20190625095821.GD1516@ulmo>
References: <20190522163428.7078-1-paul@crapouillou.net>
 <20190625074220.ckj7e7gwbszwknaa@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190625074220.ckj7e7gwbszwknaa@pengutronix.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z2FC5ARETFnUnn2kCEl6AER1qtcj7xB4LnbOY4f3FIw=;
 b=cfcIKl5l+OVBRuwna6QPhC+ZpgUs5RO/jLDMwyUevqsGrkNw6y31buH/n5QB5foXJD
 TMYGpLVlCdzHviBV0L1NSK60gbZdb10Y+7sAdqCjj0YuBsD0EIB9mJzJ13GnnZBmo3yF
 y/OZQfUjrGHoQIgXE0Ro94987iy0iOA+huwKOWY3mPL4KZpWulkxZ1mrOWb10Tw4hK8M
 B2cyYS1KA57dWjDIuBc5phai18eodDtHzwko1ToXYKTKT6xOli0f6rhqu+CN/q9Go5o7
 r5uf8TYLczg9SRU89VD15I2GKnboTw+ZpM2Xwh/scm+Wo+N2tqHWyrfZm954GqpthvGQ
 EnYQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, kernel@pengutronix.de,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============1360809117=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1360809117==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 09:42:20AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, May 22, 2019 at 06:34:28PM +0200, Paul Cercueil wrote:
> > When the driver probes, the PWM pin is automatically configured to its
> > default state, which should be the "pwm" function. However, at this
> > point we don't know the actual level of the pin, which may be active or
> > inactive. As a result, if the driver probes without enabling the
> > backlight, the PWM pin might be active, and the backlight would be
> > lit way before being officially enabled.
>=20
> I'm not sure I understand the problem completely here. Let me try to
> summarize the problem you solve here:
>=20
> The backlight device's default pinctrl contains the PWM function of the
> PWM pin. As the PWM is (or at least might be) in an undefined state the
> default pinctrl should only be switched to when it's clear if the
> backlight should be on or off.
>=20
> So you use the "init"-pinctrl to keep the PWM pin in some (undriven?)
> state and by switching to "sleep" you prevent "default" getting active.
>=20
> Did I get this right? If not, please correct me.
>=20
> What is the PWM pin configured to in "init" in your case? Is the pinctrl
> just empty? Or is it a gpio-mode (together with a gpio-hog)?
>=20
> My thoughts to this is are:
>=20
>  a) This is a general problem that applies (I think) to most if not all
>     PWM consumers. If the PWM drives a motor, or makes your mobile
>     vibrate, or drives an LED, or a clk, the PWM shouldn't start
>     to do something before its consumer is ready.

Yes, it shouldn't start before it is explicitly told to do so by the
consumer. One exception is if the PWM was already set up by firmware
to run. So I think in general terms we always want the PWM to remain
in the current state upon probe.

The atomic PWM API was designed with that in mind. The original use-
case was to allow seamlessly taking over from a PWM regulator. In order
to do so, the driver needs to be able to read back the hardware state
and *not* initialize the PWM to some default state.

I think that same approach can be extended to backlights. The driver's
probe needs to determine what the current state of the backlight is and
preferable not touch it. And that basically propagates all the way to
the display driver, which ultimately needs to determine whether or not
the display configuration (including the backlight) is enabled.

>  b) Thierry made it quite clear[1] that the PWM pin should be configured
>     in a pinctrl of the pwm device, not the backlight (or more general:
>     the consumer) device.
>=20
> While I don't entirely agree with b) I think that even a) alone
> justifies to think a bit more about the problem and preferably come up
> with a solution that helps other consumers, too. Ideally if the
> bootloader sets up the PWM to do something sensible, probing the
> lowlevel PWM driver and the consumer driver should not interfere with
> the bootloader's intention until the situation reaches a controlled
> state. (I.e. if the backlight was left on by the bootloader to show a
> nice logo, it should not flicker until a userspace program takes over
> the display device.)

Yes, exactly that.

> A PWM is special in contrast to other devices as its intended behaviour
> is only fixed once a consumer is present. Without a consumer it is
> unknown if the PWM is inverted or not. And so the common approach that
> pinctrl is setup by the device core only doesn't work without drawbacks
> for PWMs.

Actually I don't think PWMs are special in this regard. A GPIO, for
example, can also be active-low or active-high, and without a consumer
there's not enough context to determine which one it should be.

So this is really a more general problem. Whenever you want to take over
some bootloader configuration, basically all of your OS drivers have to
be taught to handle it properly, which usually means not touching any
hardware at probe time, preferably reading back the current hardware
state and "apply the delta" once the consumer says so.

Thierry

> So if a PWM driver is probing and the PWM hardware already runs at say
> constant one, some instance must define if the pin is supposed to be
> configured in its "default" or "sleep" pinctrl. IMHO this isn't possible
> in general without knowing the polarity of the PWM. (And even if it were
> known that the polarity is inversed, it might be hard to say if your
> PWM's hardware doesn't implement a disabled state and has to simulate
> that using a 0% duty cycle.)
>=20
> Another thing that complicates the matter is that at least pwm-imx27 has
> the annoying property that disabling it (in hardware) drives the pin low
> irrespective of the configured polarity. So if you want this type of
> device to behave properly on disable, it must first drive a 0% duty
> cycle, then switch the pinctrl state and only then disable the hardware.
> This rules out that the lowlevel driver is unaware of the pinctrl stuff
> which would be nice (or an inverted PWM won't be disabled in hardware or
> you need an ugly sequence of callbacks to disable glitch-free). Also if
> there is no sleep state, you better don't disable an inversed pwm-imx27
> at all (in hardware)? (Alternatively we could drop the (undocumented)
> guarantee that a disabled PWM results in the pin staying in its idle
> level.)
>=20
> What are the ways out? I think that if we go and apply your patch, we
> should at least write some documentation with the details to provide some
> "standard" way to solve similar problems.
>=20
> Also it might be a good idea to let a PWM know if it is inverted or not
> such that even without the presence of a consumer it can determine if
> the hardware is active or not at probe time (in most cases at least).
>=20
> Best regards
> Uwe
>=20
> [1] https://www.spinics.net/lists/linux-pwm/msg08246.html
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0R8DsACgkQ3SOs138+
s6G4SA/9G/RR8wadIG+NTTjQjNlcqNQAxMww/G0ZY3WkofecUPpDWm6oRHkBPqQW
2nZeOKQBmiisMDXvXTCEljq/i+3dtHxsPlGtEHdCsnBsf6YVE67UGx3F1q6jwGLn
SUxgcwxmtnV395YKmgF2QR90m+HsVynAm4rYI9CoAXwVBrsStbH71KVW1h3H6sSU
EJUJ+ZcmWoidjKu6hNlUzfXPEkOnB9gLQTSOzHadng+4Wd9MARX7z4nDIalaobDS
hNWVEBf0telxb5HZyBJRYx9QAuzBO+UJrbn6Gcy2NuFON4KCfqwF/ftfgBbEgt4A
xDKs/HzcjfXkFYkPaughMYpbxMECP6yRg66GBs6poDIhMtGTNDdPXzSatAvwiCtT
Htu0PMzBljY6445V+gHNgmHK1P86SiLc+xW99V9TWl5yFAjJkMLV9j4v1OfGLnPh
LO4tzlltQp+Gkfv3zIYfAN78azC4pICOwbTUscwnD5oWoRpTEPJosIeHMY/7tpTs
YC1KeT9pGd8BuVYd8F+sIMe8LDqAJ95gqsEc1KQTLH+BQjkRk3udpxZd2KuJ0doj
d2ugvpgPy6r2o7PviB1DZlP1Fh7qAQiSQYDtCGGjipY1Esm7YcAjRo9RQF6aB+io
2N0M1K5VYxwD0TosVnTPqKtQ+sFUPiysL1CCuXnx5Ux4+DvQfos=
=lyNf
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--

--===============1360809117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1360809117==--
