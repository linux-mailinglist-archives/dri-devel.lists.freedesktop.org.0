Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2C58F7EB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE352A4733;
	Thu, 11 Aug 2022 06:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E640914AC81
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:32:02 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o2so13491324lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=0n1Y/OzhfJeE+j8g4UzOYZL6N5O4tDg71xSPH024khI=;
 b=kA7ZPWE9auNagXtgXGfNtwEbiMHmU8S7bBqOGTC5NBs+JJVZUXFFFEKRBKXN0LiZTT
 8P2baQgcumnHOmqX6NsVEjubxnpriOq+frTO+MO9OeJaYrKLoifhAi7spYfhjOGPpc3y
 /ymTjg8OFT7ro70OslfoDXPppb7eNMwKTJTDA30Gddtjtl4aCrS5bq2+0lwscyTjwPgZ
 9XqVPHRM7dh7/p8X7XwoaajDzVBGXk1VM6g2+HW02gSiMnKvuyadkG18Jhgnln7nzXph
 qujTz7lr0LXTEintAq/wjENu1LQF89E4HU2Wm7mJglCYq5s9eQaZghukzoNwdYwEdEpF
 TaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0n1Y/OzhfJeE+j8g4UzOYZL6N5O4tDg71xSPH024khI=;
 b=lQ9Fvm5ezvQpY2mmdSyF9jhyvI5HVkgLAZw/l/56uSOXm5xoEoQG6aDiitPmVYUoCN
 GsxN/KTg5OwD2NMIQhHOi1Yj0mq5iOjUyjz7r/gO3h79YRWqe30k67zc6ZYEBApNSO/m
 YL6LmSMXO8ZO8PtekN3MZuqK2SIQI9wbrnW0IVfP+KvBGrEv4h1XUexExh8Gy1FGatYI
 xk/yegehhmrRyuSsY8XOjZGOesQd5mCdt1wLVxToonKeazzqrTNxkyFc3B8pxE07txpk
 BNbC7Jnhrmlr2RAHr6oUVmjQfFc88G4hyMoVESq01eFCIG35TQv+WwzSg18t0JdJ3iu3
 ECcQ==
X-Gm-Message-State: ACgBeo2ABrYwV7GTAjJe9/JMmHwHNgE1fo+38kagqHgpQA977OFTVEHK
 Js2FDwfSYnahWbO4Gs5Unzs=
X-Google-Smtp-Source: AA6agR4HJ7z9C6Qx/mQgUXeus0gaIaf5bRpOkkYd5YSpgaeaMscj9In5G4yyt6jyUcuHoI4k+C+cpw==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id
 p36-20020a05651213a400b00477a28a2280mr8901373lfa.689.1660131121036; 
 Wed, 10 Aug 2022 04:32:01 -0700 (PDT)
Received: from fedora ([213.255.186.46]) by smtp.gmail.com with ESMTPSA id
 v10-20020a2ea60a000000b0026008acb55asm134927ljp.113.2022.08.10.04.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 04:32:00 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:31:46 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Subject: [RFC PATCH 5/7] gpu: drm: meson: simplify using
 devm_regulator_get_enable_optional()
Message-ID: <cc21cea63a24bf5d372e4a5903de303516c3db98.1660127865.git.mazziesaccount@gmail.com>
References: <cover.1660127865.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ON+BJfnFjobaZBs+"
Content-Disposition: inline
In-Reply-To: <cover.1660127865.git.mazziesaccount@gmail.com>
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
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ON+BJfnFjobaZBs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
add_action_or_reset(regulator_disable)' and use the
devm_regulator_get_enable_optional(). Also drop the seemingly unused
struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/=
meson_dw_hdmi.c
index 5cd2b2ebbbd3..7642f740272b 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -140,7 +140,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
 	struct drm_bridge *bridge;
@@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *m=
eson_dw_hdmi)
=20
 }
=20
-static void meson_disable_regulator(void *data)
-{
-	regulator_disable(data);
-}
-
 static void meson_disable_clk(void *data)
 {
 	clk_disable_unprepare(data);
@@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, stru=
ct device *master,
 	meson_dw_hdmi->data =3D match;
 	dw_plat_data =3D &meson_dw_hdmi->dw_plat_data;
=20
-	meson_dw_hdmi->hdmi_supply =3D devm_regulator_get_optional(dev, "hdmi");
-	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
-		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) =3D=3D -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		meson_dw_hdmi->hdmi_supply =3D NULL;
-	} else {
-		ret =3D regulator_enable(meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-		ret =3D devm_add_action_or_reset(dev, meson_disable_regulator,
-					       meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-	}
+	ret =3D devm_regulator_get_enable_optional(dev, "hdmi");
+	if (ret !=3D -ENODEV)
+		return ret;
=20
 	meson_dw_hdmi->hdmitx_apb =3D devm_reset_control_get_exclusive(dev,
 						"hdmitx_apb");
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

--ON+BJfnFjobaZBs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmLzlyIACgkQeFA3/03a
ocVZnwf+Lv1xHGjupIg4noibrWXhjS6WmrvGpZqs49VnTsvbxRbVPjEzn6JfF+8i
SbHdoe+KSl5d/OfYx7CtXlQnJwJ5qLZHIaYcMewnJHMzQwSWQdeu+/W6DbAmuPPi
rOZtSzW/jDUANoxUtDX5sfgimagrnUWh1VPSxOz4CYjq6r77TquMfF1hclrECSVD
DrElf2B0R3Yw2OHJmoWsg80uk96ZURuXJB1/H5entU0CMKZZbpEeX2hhYDu7c6rl
EXbfot5+kVmIc7PwYI0D8ysIXmylHqKzJUqy8kMiL9zHXNm+eXeBvpxry7ryt2S5
7wITQS0z6ReN4U0nhXrniyBKGJ8MIw==
=4h4p
-----END PGP SIGNATURE-----

--ON+BJfnFjobaZBs+--
