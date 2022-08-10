Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269758F7E9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555692736;
	Thu, 11 Aug 2022 06:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FA6B2E7D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:21:44 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z20so15774212ljq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=MDXsuS7bCLyJovVM/zN8Gc+YTKu8QKa1fCETEAhhdEc=;
 b=iEfQn8Ph3GPcCFZWReFNg8EC6VPFGukAxX54b92wWMnS8d8CJoCBoiY14N9uxO9KMX
 u0CLtO8vMByG+7eB9eUQ/2PzhGXDFibh75h4E+gr88WKce1Y2CgF4LAkSsCX4jUyOdnE
 UeINMuBnfwbUBG77tZQ5JRbzVaHnLWFoGFyzqXSHC8j2ct6tllOdW12jkdlNM5NvQI3b
 gW5sei7sm+x015PF2IubFBGVDWDFUEGHXovDm0ir3QVMJhxRST+4Er5S/GmEXV6NeVe9
 cTOxnMWLrhTwl/NiC1ojtif+Cw3RKZeZM7E9GenufC7lvSo8eZeUuL6kdC/p0vAiy8I/
 /xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=MDXsuS7bCLyJovVM/zN8Gc+YTKu8QKa1fCETEAhhdEc=;
 b=x0INprKra0j3VBHDJbUYm9n+r0JAlu1aGdQXKXRoqGlEmayz8idf2b6FsOdP4of9nk
 Oo5boWHxU3FgxjT05QcEEmd5p2qQQg4CoK3dqP019CuwwdU+w4jUApLLXnUJZihhnUoc
 i+YMB4BIQouR0pYyoGBGvAbQc40Y4DIOwjXsUZner4otzr5JXhLC/XDUeyMLbEiryWe8
 OGFlnhFin9y4OgSEIPOK++LvswL40X3h6kLirAzBHsQFWErEQlF20DqVPHy1BC2K2UP8
 vyVqms8TlLjtnUfR4PkejO0L34vxRmes1ZyhH7/t72BN0HOvbatb3CuZBFGAMn0O5TTU
 8x9w==
X-Gm-Message-State: ACgBeo069PnSWvaQoCuiHScKpGK9n1frqoo1I1Vq8uKEFAw49exbZcPw
 Y/mgxRDKI539YOta695wOdw=
X-Google-Smtp-Source: AA6agR72Sm3VXMvQ1lwL6i9KB9sJK09jFulLRlSgTvS9dZ4O15l427iKpq7AZ8NyU/Vy/lamLyX/kg==
X-Received: by 2002:a2e:9b0a:0:b0:25f:dd91:9413 with SMTP id
 u10-20020a2e9b0a000000b0025fdd919413mr4179368lji.225.1660130502577; 
 Wed, 10 Aug 2022 04:21:42 -0700 (PDT)
Received: from fedora ([213.255.186.46]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b0048b2cde8c3dsm300168lfc.269.2022.08.10.04.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 04:21:41 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:21:18 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [RFC PATCH 0/7] Devm helpers for regulator get and enable
Message-ID: <cover.1660127865.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pDdi69woxyL3F9N3"
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 11 Aug 2022 06:49:27 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Alexandru Ardelean <aardelean@deviqon.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-amlogic@lists.infradead.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pDdi69woxyL3F9N3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Devm helpers for regulator get and enable

First patch in the series is actually just a simple documentation fix
which could be taken in as it is now (even though the rest of the series
is a RFC).

A few* drivers seem to pattern demonstrated by pseudocode:

- devm_regulator_get()
- regulator_enable()
- devm_add_action_or_reset(regulator_disable())

(*) A rough idea what 'a few' means in this context can be get by issuing:
"git grep -In -A10 devm_regulator_get |grep -B5 -A5 add_action |less"
and then further checking some of the reported drivers. This is what I did
when I realized I needed to enable a regulator for accelerometer and
thought I'd go with devm-action...

Introducing devm helpers for this pattern would remove bunch of code from
drivers. Typically at least following:

- replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
  devm_add_action_or_reset()) with just one
  (devm_regulator_get_enable[_optional]()).
- drop disable callback.

I believe this simplifies things by removing some dublicated code.

The other RFC aspect besides the question if this actually is useful, is
whether the devm_regulator_get_enable[_optional]() should return a pointer
to the obtained regulator or not. This RFC version does not return the
pointer for user because any call to regulator_disable() may lead to
regulator enable count imbalance upon device detach. (Eg, if someone calls
regulator_disable() and the device is then detached before user has
re-enabled the regulator). Not returning the pointer to obtained regulator
to caller is a good hint that the enable/disable should not be manually
handled when this API is used.

OTOH, not returning the pointer reduces the use-cases by not allowing
the consumers to perform other regulator actions. For example request the
voltages. A few drivers which used the "get, enable,
devm_action_to_disable" did also query the voltages. The suggested form of
the API does not suit needs of such users. The new API in its current form
really allows to only cover the very dummy cases where regulator is only
enabled for a lifetime of the driver. I am unsure if this is really
beneficial (well, there seems to be bunch of drivers doing just this) - or
if we should go with a version returning the struct regulator *

Some drivers did also manually disable the regulator (even though they had
registered the devm-action for disable) for PM functionality. I am unsure
if such use for suspend is actually safe(?) I didn't check if we can
guarantee that the driver is not detached after the PM suspend has disabled
the regulator(?)

This RFC converts only few a drivers to demonstrate benefits. This makes it
easier to rework the series if people thinks returning the pointer to
struct regulator should be done. I can't promise I'll convert all drivers
so, there is still plenty of fish in the sea for people who like to improve
the code (or count the beans ;]).

Finally - most of the converted drivers have not been tested (other than
compile-tested) due to lack of HW. All reviews and testing is _highly_
appreciated (as always!). I have the driver changes in individual patches
to make reviewing easier. I will squash the driver changes into one patch /
subsystem when I'll drop the "RFC" from the series.

Patch 1:
	Fix docmentation (devres API list) for regulator APIs
Patch 2:
	The devm helpers.
Patch 3:
	Add new devm-helper APIs to docs.
Patches 4 ... 7:
	Example drivers.

---

Matti Vaittinen (7):
  docs: devres: regulator: Add missing devm_* functions to devres.rst
  regulator: Add devm helpers for get and enable
  docs: devres: regulator: Add new get_enable functions to devres.rst
  clk: cdce925: simplify using devm_regulator_get_enable()
  gpu: drm: meson: simplify using devm_regulator_get_enable_optional()
  hwmon: lm90: simplify using devm_regulator_get_enable()
  adc: ad7192: simplify using devm_regulator_get_enable()

 .../driver-api/driver-model/devres.rst        |  9 +++
 drivers/clk/clk-cdce925.c                     | 21 ++-----
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 23 +-------
 drivers/hwmon/lm90.c                          | 21 +------
 drivers/iio/adc/ad7192.c                      | 15 +----
 drivers/regulator/devres.c                    | 59 +++++++++++++++++++
 include/linux/regulator/consumer.h            | 13 ++++
 7 files changed, 92 insertions(+), 69 deletions(-)

--=20
2.37.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--pDdi69woxyL3F9N3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmLzlJcACgkQeFA3/03a
ocV2PQgArPtq6fGhnguN4T+treXljaUZmu/KeIDzK/puztafyKwaM8MjOI2N1+u9
kYlGFs2SNWiHi1k2ten+7jFiAblcg6WUIduMx3fDa+WLpBiY3U5IzAttE6GwWws2
wwCI+3z57pBMTGJ2QBw4QQqpTR0H9A2oSxN4mlp7ogSsAi4iZkVZKUiFo0Cnu1zb
nhDs1Z6ARm7XFRy6Bu0rJt8FJSk493fIIrUYasd/0avkheuGRNTur3MpN2IC4Lxt
2sifYC51mh3VKVcHAV2iNetItGmOKqgDSd/lk73fukoFWOvbdQhGkDrzFZ5NBdgT
fvMsE5gmqvUTGdsNVLyqHH3omMJopQ==
=uzmB
-----END PGP SIGNATURE-----

--pDdi69woxyL3F9N3--
