Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13D7D696B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 12:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23EB10E58D;
	Wed, 25 Oct 2023 10:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60DC10E59E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 10:48:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qvbQQ-0001DN-Q8; Wed, 25 Oct 2023 12:47:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qvbQO-0049gV-FC; Wed, 25 Oct 2023 12:47:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qvbQO-005ubj-4j; Wed, 25 Oct 2023 12:47:44 +0200
Date: Wed, 25 Oct 2023 12:47:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Message-ID: <20231025104743.56elaloj3jmojz2v@pengutronix.de>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
 <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
 <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
 <20231023133417.GE49511@aspen.lan>
 <ZTjll7oTNVWqygbD@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kdxw67dv7iobkbz2"
Content-Disposition: inline
In-Reply-To: <ZTjll7oTNVWqygbD@gofer.mess.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-input@vger.kernel.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, intel-gfx@lists.freedesktop.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kdxw67dv7iobkbz2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Oct 25, 2023 at 10:53:27AM +0100, Sean Young wrote:
> On Mon, Oct 23, 2023 at 02:34:17PM +0100, Daniel Thompson wrote:
> > On Sun, Oct 22, 2023 at 11:46:22AM +0100, Sean Young wrote:
> > > On Sat, Oct 21, 2023 at 11:08:22AM +0200, Hans de Goede wrote:
> > > > On 10/19/23 12:51, Uwe Kleine-K=F6nig wrote:
> > > > > On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
> > > > >> On 10/17/23 11:17, Sean Young wrote:
> > > > > I think it's very subjective if you consider this
> > > > > churn or not.
> > > >
> > > > I consider it churn because I don't think adding a postfix
> > > > for what is the default/expected behavior is a good idea
> > > > (with GPIOs not sleeping is the expected behavior).
> > > >
> > > > I agree that this is very subjective and very much goes
> > > > into the territory of bikeshedding. So please consider
> > > > the above my 2 cents on this and lets leave it at that.
> > >
> > > You have a valid point. Let's focus on having descriptive function na=
mes.
> >=20
> > For a couple of days I've been trying to resist the bikeshedding (esp.
> > given the changes to backlight are tiny) so I'll try to keep it as
> > brief as I can:
> >=20
> > 1. I dislike the do_it() and do_it_cansleep() pairing. It is
> >    difficult to detect when a client driver calls do_it() by mistake.
> >    In fact a latent bug of this nature can only be detected by runtime
> >    testing with the small number of PWMs that do not support
> >    configuration from an atomic context.
> >=20
> >    In contrast do_it() and do_it_atomic()[*] means that although
> >    incorrectly calling do_it() from an atomic context can be pretty
> >    catastrophic it is also trivially detected (with any PWM driver)
> >    simply by running with CONFIG_DEBUG_ATOMIC_SLEEP.

Wrongly calling the atomic variant (no matter how it's named) in a
context where sleeping is possible is only a minor issue. Being faster
than necessary is hardly a problem, so it only hurts by not being an
preemption point with PREEMPT_VOLUNTARY which might not even be relevant
because we're near to a system call anyhow.

For me the naming is only very loosely related to the possible bugs. I
think calling the wrong function happens mainly because the driver author
isn't aware in which context the call happens and not because of wrong
assumptions about the sleepiness of a certain function call.
If you consider this an argument however, do_it + do_it_cansleep is
better than do_it_atomic + do_it as wrongly assuming do_it would sleep
is less bad than wrongly assuming do_it wouldn't sleep. (The latter is
catched by CONFIG_DEBUG_ATOMIC_SLEEP, but only if it's enabled.)

Having said that while my subjective preference ordering is (with first
=3D best):

	do_it + do_it_cansleep
	do_it_atomic + do_it_cansleep
	do_it_atomic + do_it

wi(th a _might_sleep or _mightsleep suffix ranging below _cansleep)
I wouldn't get sleepless nights when I get overruled here
(uwe_cansleep :-).

> >    No objections (beyond churn) to fully spelt out pairings such as
> >    do_it_cansleep() and do_it_atomic()[*]!
>=20
> I must say I do like the look of this. Uwe, how do you feel about:
> pwm_apply_cansleep() and pwm_apply_atomic()? I know we've talked about
> pwm_apply_atomic in the past, however I think this this the best=20
> option I've seen so far.
>=20
> > 2. If there is an API rename can we make sure the patch contains no
> >    other changes (e.g. don't introduce any new API in the same patch).
> >    Seperating renames makes the patches easier to review!
> >    It makes each one smaller and easier to review!
>=20
> Yes, this should have been separated out. Will fix for next version.

+1

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kdxw67dv7iobkbz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmU48k8ACgkQj4D7WH0S
/k6W3AgAk4aFQs6woLctFKPwObedmFaF4LVusjnyP2JYEuwOcWzfmL/W31PFxuWP
KEm7kc/16r0LD6qbwwgpOGUucBHmXKkmJa+0tdj/pRKkbkBfbA/RDaly9ZNh9Aql
dZEuZ4CyAE7Pw6ea3ZQhQL1W4x37ZZwVPMvNmQaydtP5VBP1cBrml1SBcrT+6r0j
j6N5LZR1Jb1+8XuisgUnufJAbBpykKTDJSdqwsREGb93kuDzhiTB7/YDFXe9P8fs
NOvV78af278xkuohhXrWRRdqJSd+/PDGii+WImHHQpWcJPmcgwsXMCnjnK7DruZR
Ket6emGp+CLdMp+GKhD7b53atfLNjQ==
=7sp5
-----END PGP SIGNATURE-----

--kdxw67dv7iobkbz2--
