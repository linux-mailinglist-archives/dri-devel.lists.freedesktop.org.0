Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE78C40FA7
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59C010EB21;
	Fri,  7 Nov 2025 17:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A1D10E0E4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:48:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1vHOhh-0003vL-EO; Fri, 07 Nov 2025 16:48:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mgr@pengutronix.de>) id 1vHOhg-007YOX-2q;
 Fri, 07 Nov 2025 16:48:44 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mgr@pengutronix.de>) id 1vHOhg-006qle-2T;
 Fri, 07 Nov 2025 16:48:44 +0100
Date: Fri, 7 Nov 2025 16:48:44 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <aQ4U3LHBQ7WcYKUd@pengutronix.de>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
 <aQNRK5ksNDMMve0x@aspen.lan>
 <t6wtfnmnclnzwdpbmdcalvyf3mulmpexnryolxkygqkpx7vdwz@dqwbwvlzawrr>
 <aQ4HY5Hncv1fvxVk@aspen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/DGy73+seDFVJgbs"
Content-Disposition: inline
In-Reply-To: <aQ4HY5Hncv1fvxVk@aspen.lan>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 07 Nov 2025 17:07:03 +0000
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


--/DGy73+seDFVJgbs
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 02:51:15PM +0000, Daniel Thompson wrote:
>On Fri, Nov 07, 2025 at 09:00:33AM +0100, Uwe Kleine-K=F6nig wrote:
>> On Thu, Oct 30, 2025 at 11:51:07AM +0000, Daniel Thompson wrote:
>> > On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
>> > > Currently when calling pwm_apply_might_sleep in the probe routine
>> > > the pwm will be configured with an not fully defined state.
>> > >
>> > > The duty_cycle is not yet set in that moment. There is a final
>> > > backlight_update_status call that will have a properly setup state.
>> > > However this change in the backlight can create a short flicker if t=
he
>> > > backlight was already preinitialised.
>> > >
>> > > We fix the flicker by moving the pwm_apply after the default duty_cy=
cle
>> > > can be calculated.
>> > >
>> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> >
>> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>>
>> I guess this tag resulted in Lee picking up the change. I wonder if you
>> share my concern and who's responsibility it is now to address it.
>
>You mean the ordering the backlight registration versus setting the
>properties in the probe method?
>
>I definitely share the concern that there's a short window where
>something could request a brightness via sysfs and then have it
>overwritten by the remains of the probe method. Likewise I can't see
>why there would be any problem moving the call to
>pwm_backlight_initial_power_state() before the backlight is registered.
>Thus I'd be happy to see the backlight registered later in the probe
>method.
>
>On the other hand I don't see any problem calling
>backlight_update_status() from the probe method. This is a relatively
>common approach in backlight drivers to impose the initial brightness
>on the hardware without needing extra code paths.
>backlight_update_status() is guarded with a mutex and should be
>idempotent for most drivers. Therefore it is OK even if something gets
>in via sysfs and provokes an update before the probe method has started
>it's own update.
>
>In terms of who should follow up I've got no strong opinions on that.
>It's worth noting that I don't own any hardware that uses a PWM
>backlight so I'm not in a position to test it!

Depending on the setup of the hardware, calling pwm_apply_might_sleep
inbetween before having a fixed definition of how the pwm should be
setup, makes the backlight flicker. Therefor it is better to touch
it as late as possible.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/DGy73+seDFVJgbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmkOFNkACgkQC+njFXoe
LGSKTQ//bm8FDOeYWnsvF9jE4OYmkN9C6U7e/pvbXazGuOH2vAskda9idMA38/4d
8w4cTUgMUCU3IzaTBXOnDC1Zsh1baUbrknKw40Zfp80S9GWubKljfkpjh8OANL8a
JP0SL+txKMAp0wC5KfNR1j4fDqwiYhTnc+G8nTL5idsmXuVWYOxKTydGJ/PHG2l5
1DEsDBKHMpA1p9m+oSlGuE4P0GjB/mQseJYvyS4GSVlI+PlqqR58PUSPqpCDQFVA
4kwvXbFnhZbuFTlgFUoCrZfHKO1CMCuEH384v2QoJiAl9P0jWsbWEOkf5CAqRRU9
CSA9R4ZOQ834QBhDUdCsTyhMPuSmex5tGLmvkeqtcq16n5SkJzL8BMYHGQHl8RQN
oI3/rwNIGJKGGWumv3kHIJsCcnDAcFS+cDgGbVdFfF+dpsGWiCO3BWCXXO7KMH4l
cWl2fUk9FgYAyqB8pUSFEmNdbx0/yIhtKjvSUq5ZTrwqtevSa67hpAijc8G+VorT
7l7f6Evl+iuQisHKRkdKgcpgWsRyekdnYa6JwVGak5oIj2FeymkxVY4+uMEBKaD9
8uP4/zJ1wMCMC6U/n87nzL/VR9oXDPtoM8LFeFF6BwQ5KuPxudKAVbTnm1P0NTmg
IpO5OUhlXOu4eQcEIFv7iJ8CVF7vvUcHNz0FSJIJHIm1sh8/Mn0=
=nlcW
-----END PGP SIGNATURE-----

--/DGy73+seDFVJgbs--
