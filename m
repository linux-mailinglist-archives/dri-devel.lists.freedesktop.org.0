Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3E62BEDF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F5910E167;
	Wed, 16 Nov 2022 13:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588F410E167
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:04:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b3so29382066lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 05:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/w2U0GiGwFFrflmNCFpCFLaMnMdqbHDas4my61VJ3H4=;
 b=KAgIfzEgdBLkeRinXDVjGiOgDz4zxSP/Q12JRlfv9kc3Z0v1GoUvkrvMdg61Aye5RF
 TzgwQMoR19i2nvfMfobkJVN2k2PS8K7zB7qRjke7MIHjC325iSFR6fcT1OZOg6XqS+6q
 4UbQn7/DqGiydfHGtx6F9lW/VEz0B5KI+bf5I3OniXwsnHcI/QxY4PLrgXhKLHFzJXGD
 OFtQbFrp+uvaLYFxXYJ6TAmoz78B1tV58ztVPwWKLQ+GV/B/qLrdt5GFNd1PAziSQmZH
 W1FBb8NEZYMss5dOJyo/D8lgckfchWPB1dn+MJOQH1vmqmCiIyJMuIzJGH/zsEL9HtRq
 9MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/w2U0GiGwFFrflmNCFpCFLaMnMdqbHDas4my61VJ3H4=;
 b=STfrz9n0zxoF3KH70L2S5mBnE9hc6Fckfmk4wcpqEwnMFa346HYfnxAzAEv3Wdhnzn
 8eX26Ds5/AeIqPi7dj5iiGi1rXvrvyF+ZgJjy40E4K3RcSeylk7Nf89HjOEAkBgNK9wv
 34SJI7hQiDbRCo21qjKQFH09XszUozNAvmY7VF7LefA17Oh8F6DMmw4pH/vP1c8Z3LlZ
 Mt3F0w42M95LMUu/60l8t+c7IOH5gnWhrcIjWYiUw4yIJTMxNia8c00HnAVfOMQGz6xv
 e8YPSCf+a1U5aI3CzAdflSktTgDj7Rt4tMb7evW2s3iM6ixLSFgTjRJcCq328Mjqv/PD
 G/zQ==
X-Gm-Message-State: ANoB5plzvlAobV2Haj8LVF89hQghn8YiUVI8zJxmCKj3G89LkLSwL7E0
 ObOm/pvhQUa+RMc9zMtHnfM=
X-Google-Smtp-Source: AA0mqf5bbbM2Ey8aDDMRRxoQANiNABBR5EuqgbA88InhXkY5YtNllspX8hGfwRC2BZ1dEtaaBfF7Sw==
X-Received: by 2002:a19:8c1e:0:b0:4b4:6460:24d with SMTP id
 o30-20020a198c1e000000b004b46460024dmr6846311lfd.386.1668603838350; 
 Wed, 16 Nov 2022 05:03:58 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a056512388500b00492ea54beeasm2590371lft.306.2022.11.16.05.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:03:57 -0800 (PST)
Date: Wed, 16 Nov 2022 15:03:51 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH RESEND v4 2/2] gpu: drm: meson: Use
 devm_regulator_*get_enable*()
Message-ID: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
References: <cover.1668602942.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+AsYBOOQaVjrzzJT"
Content-Disposition: inline
In-Reply-To: <cover.1668602942.git.mazziesaccount@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+AsYBOOQaVjrzzJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using the devm_regulator_get_enable_optional(). Also drop the
seemingly unused struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
I am doing a clean-up for my local git and encountered this one.
Respinning as it seems this one fell through the cracks.
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

--+AsYBOOQaVjrzzJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmN037cACgkQeFA3/03a
ocUqbwgAr9qOikS0LMJyO5GovQMABn825PnykrWGi+dZ6sDx5/TPtK3c6Wa+M75x
AarIBszsCEdzLvBgGZs1OvcsAUvoV/8Xxeg8LkysmC6MOXrHVlklb2ybdezc13Xr
/1ZT1lfyVl+FdgzLgcM6PzjOobO0YDxS8GMoIXft5WeEbsOM5O8/CW7CgOHbi8QP
//3f3nJu8bTsJOZRjgcNEw9InElYaZYwPJUktYOfQ0qTSWSO9HCaeWYV13KQlAP8
7YcST0Jm3ywbRiQAv5hzZhjkcZ634PVGsTpNlLgy+2MHrLOnHIQEw0vPiwKeYiJH
XIT3agwTeqk+1JCl0jFIpZgiepnk7Q==
=WwI9
-----END PGP SIGNATURE-----

--+AsYBOOQaVjrzzJT--
