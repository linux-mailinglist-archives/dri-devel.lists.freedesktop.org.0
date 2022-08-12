Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A55590EC2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 12:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AA4AC6C5;
	Fri, 12 Aug 2022 10:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE693AC6B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 10:08:40 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y23so460649ljh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=Lmz4Vp5Brwa2cnS1Itqbq4P7WlJbdn5Ij99xtrfTr8M=;
 b=iEyjjw4/6LOvsqXXLJfKSDsKCPFS1lsCd3GFjln5BRbpEVK+IxPLTm7rcyG93QIZk+
 88yi8KH6gvXJDvAT2iJmEEgic6e5xx0q1DKAArQr6IsDtfmi59kqWYa2UGaGfXS3VSaK
 Ue1RRivzkHWRRntJf8Nj3UygycU591g7FvDbXXPISHrJl0pSI+iaxhQbKbKFIDo009Nx
 YRbrQ96bnjJ32m+mQlKOnmdnhn9CdHqdOUXvvoSlLCe1vmnHBmTBp6k2Z+fdg9MFNnzG
 j1uItRCaZ/Xq/eonFgQcwhzRDK2O+3EbVyX7YZw1+qPPUoViEfraU5/ALcyhG2omF8g+
 Zsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=Lmz4Vp5Brwa2cnS1Itqbq4P7WlJbdn5Ij99xtrfTr8M=;
 b=Y3/o1nzUkFf1Dt6tvyK+i6LbMoEiBMhfHPN+OHWIHM1hHZOYtr9tvlnAWQ4fcsuv0u
 G44YqGKoK85s/IU6QE+3B4pUEpl4OYxh7f8BAE+Bye1vorxoTnOSpTlOWseJenEwjLGq
 Qh/QsAwKfO7kQz9smWebGTF0Ll/97qrCNQWOoPpXoheK06kzzhkn9mLJnHaGl6sNQ2ET
 d0vap35ZUAAuBquhmLT26CoDRmxoI2/zT1jUq7U9yaMTIgYkylwR9yVi77Al1Y7vvCkX
 kWvBw11ddbNy1TRN4SSV6RMCMrw9/BBeOT0mIPBE2hjVVxpJ0WYPp2H3PVda+7iy/qqc
 rn6g==
X-Gm-Message-State: ACgBeo37qNPsMv3ImhdajY/3pFJbs9ZQ2BRLfKSJGH4v7XxvC4vHnpH0
 z2iNSKQV636wy56pqKx8Yq8=
X-Google-Smtp-Source: AA6agR48G+sAfnTk456AdMmoWmwqiUxwIqWZm+aCORAI6x+9Wf6EMIhQ9lCGq1KjCDmWMsEc4se5Fg==
X-Received: by 2002:a2e:7311:0:b0:25e:c66f:2be0 with SMTP id
 o17-20020a2e7311000000b0025ec66f2be0mr908055ljc.100.1660298919064; 
 Fri, 12 Aug 2022 03:08:39 -0700 (PDT)
Received: from fedora ([213.255.186.46]) by smtp.gmail.com with ESMTPSA id
 k2-20020ac24562000000b0048a79e3dd6csm165585lfm.26.2022.08.12.03.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 03:08:38 -0700 (PDT)
Date: Fri, 12 Aug 2022 13:08:17 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <cover.1660292316.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="THWirS5KE0K9xFXH"
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--THWirS5KE0K9xFXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Devm helpers for regulator get and enable

First patch in the series is actually just a simple documentation fix
which could be taken in as it is now.

A few* drivers seem to use pattern demonstrated by pseudocode:

- devm_regulator_get()
- regulator_enable()
- devm_add_action_or_reset(regulator_disable())

Introducing devm helpers for this pattern would remove bunch of code from
drivers. Typically following:

- replace 3 calls (devm_regulator_get[_optional](), regulator_enable(),
  devm_add_action_or_reset()) with just one
  (devm_regulator_get_enable[_optional]()).
- drop disable callback.
- remove stored pointer to struct regulator - which can lead to problem
  when an devm action for regulator_disable is used.

I believe this simplifies things by removing some dublicated code.

The suggested managed 'get_enable' APIs do not return the pointer to
regulators for user because any call to regulator_disable()
(or regulator_enable()) may easily lead to regulator enable count imbalance
upon device detach. (Eg, if someone calls regulator_disable() and the
device is then detached before user has re-enabled the regulator). Not
returning the pointer to obtained regulator to caller is a good hint that
the enable/disable should not be manually handled when these APIs are used.

OTOH, not returning the pointer reduces the use-cases by not allowing
the consumers to perform other regulator actions. For example request the
voltages. A few drivers which used the "get, enable,
devm_action_to_disable" did also query the voltages. The API does not suit
needs of such users.

This series reowrks only a few drivers as I am short of time. So, there is
still plenty of fish in the sea for people who like to improve the code
(or count the beans ;]).

Finally - most of the converted drivers have not been tested (other than
compile-tested) due to lack of HW. All reviews and testing is _highly_
appreciated (as always!).

Revision history:

RFCv1 =3D> v2:
	- Add devm_regulator_bulk_get_enable() and
	  devm_regulator_bulk_put()
	- Convert a couple of drivers to use the new
	  devm_regulator_bulk_get_enable().
	- Squash all IIO patches into one.

Patch 1:
	Fix docmentation (devres API list) for regulator APIs
Patch 2:
	The new devm helpers.
Patch 3:
	Add new devm-helper APIs to docs.
Patch 4:
	simplified CLK driver(s)
Patch 5:
	simplified GPU driver(s)
Patch 6:
	simplified hwmon driver(s)
Patch 7:
	simplified IIO driver(s)

---

Matti Vaittinen (7):
  docs: devres: regulator: Add missing devm_* functions to devres.rst
  regulator: Add devm helpers for get and enable
  docs: devres: regulator: Add new get_enable functions to devres.rst
  clk: cdce925: simplify using devm_regulator_get_enable()
  gpu: drm: simplify drivers using devm_regulator_*get_enable*()
  hwmon: lm90: simplify using devm_regulator_get_enable()
  iio: Simplify drivers using devm_regulator_*get_enable()

 .../driver-api/driver-model/devres.rst        |  11 ++
 drivers/clk/clk-cdce925.c                     |  21 +--
 drivers/gpu/drm/bridge/sii902x.c              |  22 +--
 drivers/gpu/drm/meson/meson_dw_hdmi.c         |  23 +--
 drivers/hwmon/lm90.c                          |  21 +--
 drivers/iio/adc/ad7192.c                      |  15 +-
 drivers/iio/dac/ltc2688.c                     |  23 +--
 drivers/iio/gyro/bmg160_core.c                |  24 +--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |   2 -
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  |  30 +---
 drivers/regulator/devres.c                    | 164 ++++++++++++++++++
 include/linux/regulator/consumer.h            |  27 +++
 12 files changed, 227 insertions(+), 156 deletions(-)

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

--THWirS5KE0K9xFXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmL2JpAACgkQeFA3/03a
ocUSNQgAuAnEh7oW1oRPo5wLIiymBTMRDGKLvapsGYq8bT8IiRWVR/NN37Qd9GHU
VgE85GmmR24A+GFaR7q+L+mQWvDaumb+BgzGbPbeXnm5Dveh1vORzNhM6TvAgGCM
VpCgwcMRbSzCGEiYEvHcp5tiZ5Np7fUSmSuLz30BMES+TDdENIMbxGWb4Qa1pG3o
/5DaGsNxfF2H/5tdaH4S8t9MSKBvCXn4BmrIAEjCVRGZj9+2kSMb8cwNnrp9RBES
aePeoFBXuq8yiDwtJZn4vkzSle448d+Sg/VqDI0CFD/DBCa1/TAhQmuUM0f17KSD
wsLBh7G8SRracLoYB+zXLFT7fBaIHg==
=AV00
-----END PGP SIGNATURE-----

--THWirS5KE0K9xFXH--
