Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26A6566980
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E926510FA44;
	Tue,  5 Jul 2022 11:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AC910E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:36:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuq-0001LC-19; Tue, 05 Jul 2022 12:36:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fue-004XxA-J7; Tue, 05 Jul 2022 12:36:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuh-0038F6-8t; Tue, 05 Jul 2022 12:36:15 +0200
Date: Tue, 5 Jul 2022 12:36:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705103615.ceeq7rku53x743ps@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <20220705120852.049dc235@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gut2agzhpaayxotv"
Content-Disposition: inline
In-Reply-To: <20220705120852.049dc235@endymion.delvare>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gut2agzhpaayxotv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 12:08:52PM +0200, Jean Delvare wrote:
> On Tue, 28 Jun 2022 16:03:12 +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >=20
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >=20
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> That's a huge change for a relatively small benefit, but if this is
> approved by the I2C core maintainer then fine with me. For:

Agreed, it's huge. The benefit isn't really measureable, the motivation
is to improve the situation for driver authors who with the change
cannot make wrong assumptions about what to return in .remove(). During
the preparation this uncovered a few bugs. See for example
bbc126ae381cf0a27822c1f822d0aeed74cc40d9.

> >  drivers/hwmon/adc128d818.c                                | 4 +---
> >  drivers/hwmon/adt7470.c                                   | 3 +--
> >  drivers/hwmon/asb100.c                                    | 6 ++----
> >  drivers/hwmon/asc7621.c                                   | 4 +---
> >  drivers/hwmon/dme1737.c                                   | 4 +---
> >  drivers/hwmon/f75375s.c                                   | 5 ++---
> >  drivers/hwmon/fschmd.c                                    | 6 ++----
> >  drivers/hwmon/ftsteutates.c                               | 3 +--
> >  drivers/hwmon/ina209.c                                    | 4 +---
> >  drivers/hwmon/ina3221.c                                   | 4 +---
> >  drivers/hwmon/jc42.c                                      | 3 +--
> >  drivers/hwmon/mcp3021.c                                   | 4 +---
> >  drivers/hwmon/occ/p8_i2c.c                                | 4 +---
> >  drivers/hwmon/pcf8591.c                                   | 3 +--
> >  drivers/hwmon/smm665.c                                    | 3 +--
> >  drivers/hwmon/tps23861.c                                  | 4 +---
> >  drivers/hwmon/w83781d.c                                   | 4 +---
> >  drivers/hwmon/w83791d.c                                   | 6 ++----
> >  drivers/hwmon/w83792d.c                                   | 6 ++----
> >  drivers/hwmon/w83793.c                                    | 6 ++----
> >  drivers/hwmon/w83795.c                                    | 4 +---
> >  drivers/hwmon/w83l785ts.c                                 | 6 ++----
> >  drivers/i2c/i2c-core-base.c                               | 6 +-----
> >  drivers/i2c/i2c-slave-eeprom.c                            | 4 +---
> >  drivers/i2c/i2c-slave-testunit.c                          | 3 +--
> >  drivers/i2c/i2c-smbus.c                                   | 3 +--
> >  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
> >  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
> >  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gut2agzhpaayxotv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLEFBwACgkQwfwUeK3K
7AkavggAgLmynakXX/rOF4Jwy2OuBXH29kecKqPd6xj4yHsu3ggy8kd/hlU4jJib
vV0H9ioq69hhMqjme5AHJJsueLFi/t/iwuQwuWUKluCBBlx0RXBsVx8qxV7A0uWa
mdKU3ApPaN7y0cS1jccdN7ydsL3H2ayzIwfQuNqx1G3P/uqXfkusV0fjwQ/rQct3
qs4t2/QiHUd0tStlGw2eSKxp1z5KRrDMstK17fiZSsw/SYoMyldV8Ame6+gaxx0X
e93FqM5jj67ovjD3jJanfOwI5vesu4+szu4GK6vHRWvpsieHsSeyS+GNgfM5oLA7
iguZ0rauzy0je3hrHuKgp1maJ59ibQ==
=fYiS
-----END PGP SIGNATURE-----

--gut2agzhpaayxotv--
