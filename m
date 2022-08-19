Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2BA59A606
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795A110E96E;
	Fri, 19 Aug 2022 19:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9536D10E969
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 19:17:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q7so3613822lfu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=9edAeyqaKV/eGnwpb24p/sONsQF5z28Zi5ENLBQsjis=;
 b=h6ypV1yJJL0qgQWg/+xo1mrjVedomBmbMvZzcElTA/w5mp5AzC6W+u6FM9JDglXkIG
 f0EFLHWGo01cUs200DNYrrE6L7hXnRJgrmsN3nxPtq0WRtbiVaWN0fK7/Bozw+co8ct3
 N7jegGVnAPQ6/HVWGzefch1Xj7qjpj5QD9aeg6b/BAwEzRoHMSeCzqFpyzI7bt44XxEf
 PkgVNQHotIjqfqbYWMSGqsZl1QgjFRS16rUzvyO+euq9YakFRFWR0EKnqy86MKW/Qf2G
 +C/mu5/XgdOkFRaygzwDwmWhPYn3zHZ7r39kQU7pF39sfCqo+neujKXn6s0k1jENe6My
 ngQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=9edAeyqaKV/eGnwpb24p/sONsQF5z28Zi5ENLBQsjis=;
 b=rXPxb/SqyHGxjkcIpa8RTUEqSKSUEAOtcSZgB18AD4hD5cpkEFrBZ9YWY1zzfQ7QEs
 UpWssBLSZIDkNlkYNMahWRgtCyafzKIAvVE/WYRpqA5bwnnN5EbK8qAxPas5c0BITwj6
 dnAoUhzL3WTv0Lhe9tmtWmxLbZU/g66M+c7wgXTsEDBpj9DL6B91lcf1ul0ktmVvv6EO
 2D5NZXpKshI7sd5g/W4m/UMhCPmZn9s6gWTukHEnpstnG34n8uJTRRmXTU/J0fv3zMb3
 jdwoiNrokDGNSTsLOMzNY2EOkcz3jiI1Hf/d48Q4IZ3nPcvObcVvHy92aTvc5vm2mBns
 +RIg==
X-Gm-Message-State: ACgBeo2Bhe1kLliRr2Nm+vSuZXg7pizKFCFy5rbXjHXCqZRFxM/1+ABX
 jWsIJtWCoZ/q6Rd6hGguVIk=
X-Google-Smtp-Source: AA6agR6L/s1W7mzQnKhc+50x8bAWnpqHS1+yAXDPOhAZzl8NwA/GrakaeTQCnoodLt11WOWWYq+qjA==
X-Received: by 2002:a05:6512:23a7:b0:492:b613:817 with SMTP id
 c39-20020a05651223a700b00492b6130817mr2872025lfv.492.1660936632748; 
 Fri, 19 Aug 2022 12:17:12 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 u17-20020ac243d1000000b0048afeb4ea32sm737760lfl.100.2022.08.19.12.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:17:11 -0700 (PDT)
Date: Fri, 19 Aug 2022 22:16:48 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v3 00/14] Use devm helpers for regulator get and enable
Message-ID: <cover.1660934107.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+OPEAUCAFHQMa3jU"
Content-Disposition: inline
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Xiang wangx <wangxiang@cdjrlc.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Alexandru Lazar <alazar@startmail.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+OPEAUCAFHQMa3jU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Use devm helpers for regulator get and enable

NOTE: The series depends on commit
ee94aff2628b ("Devm helpers for regulator get and enable")
which currently sits in Mark's regulator/for-next

A few* drivers seem to pattern demonstrated by pseudocode:

- devm_regulator_get()
- regulator_enable()
- devm_add_action_or_reset(regulator_disable())

devm helpers for this pattern were added to remove bunch of code from
drivers. Typically following:

- replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
  devm_add_action_or_reset()) with just one
  (devm_regulator_get_enable[_optional]()).
- drop disable callback.

I believe this simplifies things by removing some dublicated code.

This series reowrks a few drivers. There is still plenty of fish in the
sea for people who like to improve the code (or count the beans ;]).

Finally - most of the converted drivers have not been tested (other than
compile-tested) due to lack of HW. All reviews and testing is _highly_
appreciated (as always!).

Revision history:

v3:
	- Drop already applied helper patches
	- Add a few more drivers

RFCv1 =3D> v2:
	- Add devm_regulator_bulk_get_enable() and
	  devm_regulator_bulk_put()
	- Convert a couple of drivers to use the new
	  devm_regulator_bulk_get_enable().
	- Squash all IIO patches into one.

Patch 1:
	Add new devm-helper APIs to docs.
Patch 2:
	simplified CLK driver(s)
Patch 3:
	simplified GPU driver(s)
Patch 4 - 5:
	simplified hwmon driver(s)
Patch 6 - 14:
	simplified IIO driver(s)

---

Matti Vaittinen (14):
  docs: devres: regulator: Add new get_enable functions to devres.rst
  clk: cdce925: simplify using devm_regulator_get_enable()
  gpu: drm: simplify drivers using devm_regulator_*get_enable*()
  hwmon: lm90: simplify using devm_regulator_get_enable()
  hwmon: adm1177: simplify using devm_regulator_get_enable()
  iio: ad7192: Simplify using devm_regulator_get_enable()
  iio: ltc2688: Simplify using devm_regulator_*get_enable()
  iio: bmg160_core: Simplify using devm_regulator_*get_enable()
  iio: st_lsm6dsx: Simplify using devm_regulator_*get_enable()
  iio: ad7476: simplify using devm_regulator_get_enable()
  iio: ad7606: simplify using devm_regulator_get_enable()
  iio: max1241: simplify using devm_regulator_get_enable()
  iio: max1363: simplify using devm_regulator_get_enable()
  iio: hmc425a: simplify using devm_regulator_get_enable()

 .../driver-api/driver-model/devres.rst        |  4 +++
 drivers/clk/clk-cdce925.c                     | 21 +++----------
 drivers/gpu/drm/bridge/sii902x.c              | 22 ++------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 23 ++------------
 drivers/hwmon/adm1177.c                       | 27 ++---------------
 drivers/hwmon/lm90.c                          | 15 ++--------
 drivers/iio/adc/ad7192.c                      | 15 ++--------
 drivers/iio/adc/ad7476.c                      | 11 +------
 drivers/iio/adc/ad7606.c                      | 22 ++------------
 drivers/iio/adc/ad7606.h                      |  1 -
 drivers/iio/adc/max1241.c                     | 28 ++---------------
 drivers/iio/adc/max1363.c                     | 11 +------
 drivers/iio/amplifiers/hmc425a.c              | 17 +----------
 drivers/iio/dac/ltc2688.c                     | 23 ++------------
 drivers/iio/gyro/bmg160_core.c                | 24 ++-------------
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  2 --
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 30 ++++---------------
 17 files changed, 41 insertions(+), 255 deletions(-)

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

--+OPEAUCAFHQMa3jU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmL/4ZsACgkQeFA3/03a
ocX/Ggf7BfEmlDeq8mQqIXNuIXUyS1wDwJS/W6gY4qdxaESlklGTEbvGXSG+Ve1e
6z2kt2sAFyfZgJSLaTDNzwzp2ddc6FvVVxzdvFlb1cbJdr3Js/Tl+HGFM327Qjl3
lP8vDwi2tXXnaVyjY0/18mp6HkaziCMhzqN9LNBmF2XSs3F8pGfu5cs+EabMIo7Q
EOF+5ZbFeXeL9I7Kk5Y17WDenMn+glY/1mQnPjkSYoNX7riqZLY5clklNTHzcxPT
ADtFQBjEbRSgWzs2BApI3nDFMtjzqHewqo4iLodHgg1REBOoPDCP6PaKfKVDcArw
9GdbTYiQd0lG5g9zBodvD9ZjaVpRlQ==
=C7qu
-----END PGP SIGNATURE-----

--+OPEAUCAFHQMa3jU--
