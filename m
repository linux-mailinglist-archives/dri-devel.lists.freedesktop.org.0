Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F563D1A7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1EF10E0BB;
	Wed, 30 Nov 2022 09:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345D10E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:13 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id x6so6016987lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YrYQxj8rjyddDjRsu3FuqRZBUQ9RMmMk5gv8riRQFOM=;
 b=Q8M4gPDYB4jwdz4f2CMBq+WCzhqoJPnVSqxDPcnPj237ydBotlIL0qg+XZelvewFI4
 OYBGVoLIpcRmD/dWxXTigKma4q45VwiPVPD7Nlvw6ph0ziLAIl8p1blWCCHtUDHwt2e6
 Ia5q8KfFnpMt58kN67cQiP9MuNYK1hyJRvZjnci9KBUH7BNWct8m1a8cHJFQ6o84G/zw
 Oiu/1nOmQ3vkdqPk547uJSzTRtywI/gbFpbJzLKiqkES5ZTXHp9/XAK1l77tq2Zu4JLb
 wTbUAPIfwhT4Xz9Eeuym5sC72XZBR3tzQbYnxinYcZDlj0xUPdzobKS7vbmthCRfNLq9
 ly4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YrYQxj8rjyddDjRsu3FuqRZBUQ9RMmMk5gv8riRQFOM=;
 b=CwBtDbwfv9kDcbHpjN3wYfdD8pMsSurZ5NOqsI36zIDc5+GrE9ZnStqFugpEsq+5G8
 t3V3HfckqWvX4V8Wu54+TTlKt3H2AjiHgj+74lox2PAiQPIqsg9x1UcgIZGPWwOoKfKC
 RwbW8B0fSnOjHfhUJILSOpBj2Ff0dRGI9TWETZWatbAdCmhq/sBNy6eTrrI8JZFJgrFH
 4TVYAF6wEH3r+kWJQ1l7yietEA7sCYzGOL14FrOUAuoYr8EGwQCrAzLeh4JsjOzMl8ex
 zuzGXLREsaZiQx57wuLgJmkyPT7fxKcZ8Z5z9oHZpbmN1ViHwojoqPiDgD46t4D95SGc
 TU1Q==
X-Gm-Message-State: ANoB5pkCGNQfqgd3CAdPjVS1/yZIEEKCvJCcOdwie3x/ha06gf8Qn1QH
 v8VIyrT/s8uYakD8K+eCL+k=
X-Google-Smtp-Source: AA0mqf4Rchr13o2XY80vRF849S2N11ziLsgahYBib0CNIMQAIIbfLZwyHl7Mga5wg7zBXockjzBaDg==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id
 h12-20020a05651c158c00b0026c090ff8femr20464441ljq.2.1669800132086; 
 Wed, 30 Nov 2022 01:22:12 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
 by smtp.gmail.com with ESMTPSA id
 u20-20020ac258d4000000b004b5241dc8cfsm190594lfo.10.2022.11.30.01.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 01:22:11 -0800 (PST)
Date: Wed, 30 Nov 2022 11:21:51 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH RESEND2 v4 0/2] Use devm helpers for regulator get and enable
Message-ID: <cover.1669799805.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wDEAM8gkULDvl3zl"
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


--wDEAM8gkULDvl3zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify couple of drivers by using the new devm_regulator_*get_enable*()

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

v4: RESEND2:
	- resend code unchanged. Commit titles and and commit messages
	  improved.

v4: RESEND:
	- resend only the drm patches - others have been applied

v3 =3D> v4:
	- Drop applied patches
	- rewrite cover-letter
	- rebase on v6.1-rc1
	- split meson and sii902x into own patches as requested.
	- slightly modify dev_err_probe() return in sii902x.

---


Matti Vaittinen (2):
  drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
  drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()

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

--wDEAM8gkULDvl3zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmOHIKIACgkQeFA3/03a
ocXYwAf+KjfV0msgFQZGZRTYzXQoNbPiRpwjEi03SryY+FAWtPZVLMI0VkM97vbS
eHNUOroZCLa8tqllqsFAbqc2/6PC7pS4hmU4HoFFgFnVhscCECxtJJ6F/MOYb++Y
cHAcMhAXrKbaCcyGHR+y+oW0SktYYIC3nEVwxaR3G3JE3Te4moZWO/0X3B6/WH11
Pg6XPTaclOeTWtw4sqLWDIAjjeGEkjtA16yze+GdPlo4SiS1vem6M/Z0cAWi6jiG
9GzEE8SwWcRSqqdFgMwSX1PIZgQgim6h0fDfhrj43pws4reeUXRP4bcGqUeKCVrf
uyIJN40u03Upe82WPq+z9D6aDrotYA==
=c7ic
-----END PGP SIGNATURE-----

--wDEAM8gkULDvl3zl--
