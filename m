Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72F62BED8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43BF10E0AC;
	Wed, 16 Nov 2022 13:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C958C10E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:03:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b3so29378466lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 05:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yj1uHK7HEYHiWFNEA4c6ztqJMkzjkf4XEFeM+LwxtIg=;
 b=DQqtzDKWBRTTXrTN9hNrp+mtDefk1sMRvbwnlYah2vXNkxG9puls0fYPV+phkNSdFW
 tlfwHOcvpqNA18GculZlgXIGwceB/LVIJlVMRIf8G1z0/6CGdTd1VWLUJMsP4tZbVaFS
 YLYSNYLsZBmUxGis5weeBHTPBW+KWHEhG0hF2k8uXZvRiX1phQBxlAweebBbn5MCDYAf
 KZPP80JcWP/6zUqVaO2p3aC7OvanvwK1xmSQBsThqwNsfFHpRKEniRUyASzYJsX8VafY
 I41RtTe4Vq1DAUdY6ZsZlHmgB3Vh826+JdSXO14quqCwX6XhtZeOtni3R+MY5QkXtexS
 KV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yj1uHK7HEYHiWFNEA4c6ztqJMkzjkf4XEFeM+LwxtIg=;
 b=UWGwk1HQuuHBCNceAantAY0jBeI7+34TQEZ1Gm9w/kt8clR+mfaQKL2FGldOhzk0PR
 ANVkXetjus4tiVWs4ort+uW/rGyf8ECELPyLJxZ/RJu6muZuSTh+82NcFBjv6qqc4ijk
 Ek8GZ+Ozw9VGztmz83NrQKrb3q+0BMgA67SqoW6S8rFh3BFjgjKHlkSAjosQL0Sxo0JU
 lne+Wn7NVy5FiEV/wRhDzrNL6wrOXiyHNx9ASpplEByHi2rnUhWJQFNezJ9wrmx/1CDc
 hZyendzpu7G+tdr9k5c7QpLNy6NLpgMlnhw/Wd3gFEfDR2qAoKY7OMYsdu+hv996cnlW
 XFiw==
X-Gm-Message-State: ANoB5pk/hcVq4zQ7ApvDF6nouA8ZDw0z+m0pz30Cx2XYJY+gfWLkEPs2
 CpelglZtYlKe4vzjFaHFdsk=
X-Google-Smtp-Source: AA0mqf7AzfIzexM2z7u+Uqd3EVkiLAzQw1oHH8gedmcDfckXG3tZna2CfFK4Bwj1l2ZwJnkRNoljSA==
X-Received: by 2002:ac2:55a1:0:b0:494:9680:5036 with SMTP id
 y1-20020ac255a1000000b0049496805036mr6845823lfg.416.1668603791679; 
 Wed, 16 Nov 2022 05:03:11 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a2e8e32000000b0026c4305e5e2sm3002831ljk.53.2022.11.16.05.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:03:10 -0800 (PST)
Date: Wed, 16 Nov 2022 15:02:41 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH RESEND v4 0/2] Use devm helpers for regulator get and enable
Message-ID: <cover.1668602942.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Tght3fByM0oHga+"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5Tght3fByM0oHga+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify couple of drivers by using the new devm_regulator_*get_enable*()

Found these patches when doing some clean-up for my local git. Seems
like these two fell through the cracks while other were merged. So, this is
a respin of subset of original series v4.



These patches were previously part of the series:
https://lore.kernel.org/lkml/cover.1660934107.git.mazziesaccount@gmail.com/
"Devm helpers for regulator get and enable". I did keep the patch series
versioning even though I changed the series name (subject of this mail)
to "Use devm helpers for regulator get and enable". Name was changed
because the devm helpers are already in 6.1-rc1.

Also, most of the patches in the series are already merged to subsystem
trees so this series now contains only the patches that have not yet
been merged. I hope they can be now directly taken sirectly into
respective subsystem trees as the dependencies should be in v6.1-rc1.

Please note that these changes are only compile-tested as I don't have
the HW to do proper testing. Thus, reviewing / testing is highly
appreciated.

Revision history:

v3 =3D> v4:
	- Drop applied patches
	- rewrite cover-letter
	- rebase on v6.1-rc1
	- split meson and sii902x into own patches as requested.
	- slightly modify dev_err_probe() return in sii902x.

Matti Vaittinen (2):
  gpu: drm: sii902x: Use devm_regulator_bulk_get_enable()
  gpu: drm: meson: Use devm_regulator_*get_enable*()

 drivers/gpu/drm/bridge/sii902x.c      | 26 ++++----------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 2 files changed, 7 insertions(+), 42 deletions(-)


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
--=20
2.38.1


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

--5Tght3fByM0oHga+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmN032MACgkQeFA3/03a
ocUEvAgAjCWRtr46zfwvyaXn0DSSFgdHBz/YLZoO1HrDpIxcZuWYpBU4QHi5DzcN
dYCTy1OXLEYBx1FQarMFxcV/DsSskwDPzz/+XvlZH5crOqRPg71QTYZ6FO1xCVK+
Ws9cAFNhFU5EYjZcxG/AVkLAMTaQlcPlPu4hIog283gobsq40ApJbCdQGY5v8QXp
YhMiAnjeHOR3P3mEpTb6dV32WwDykP1a9bPuKb4yPT4F80sPLb7DGKYsAeeMBj2+
M1tuYjMHIJn8lERaCV28WudVTYU9BOCsXxRuitVRn3ro+wDIH9H/YhRuj3ylGLvf
OgiXECbDMP4UlrQdgHmh3TeaTZGxGw==
=joFx
-----END PGP SIGNATURE-----

--5Tght3fByM0oHga+--
