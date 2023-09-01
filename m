Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A400378FCA1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F62010E1A3;
	Fri,  1 Sep 2023 11:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10227 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 11:49:13 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782D10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:49:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3818wUXb045711;
 Fri, 1 Sep 2023 03:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693558710;
 bh=XcSo3Spyd3peDcjzflCFCScb83JaVwSA5Q2X+aOS4Uk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QeQB1BKwA/AVw38gesLnwCoUATHjkn1SVN/ttukb8HRG4ib00oGitWHA7eTeXgiVD
 w4YfQkHPu6saTb+NNMMgTUXG9TKywiuyVCp79WVVn8HNNy7SNro3Zap//ikA4TsY9a
 tqSjl9BtDNl6sC1It8fXbpTt4+1HFQ6nudEV8c6g=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3818wUGt073983
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Sep 2023 03:58:30 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Sep 2023 03:58:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Sep 2023 03:58:29 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3818wS4u057677;
 Fri, 1 Sep 2023 03:58:29 -0500
Date: Fri, 1 Sep 2023 14:28:30 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm: bridge: it66121: Fix invalid connector dereference
Message-ID: <sfqdspjo5p4s3xpumgqqutgdcfyfwdtmvnrnfbft2d32mpqs7w@p2rs336yyfsj>
References: <20230825-it66121_edid-v1-1-3ab54923e472@ti.com>
 <d2deac24-d5ab-e1c4-81c5-4874c2f5ea07@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h4avs5zu4gsb4w7f"
Content-Disposition: inline
In-Reply-To: <d2deac24-d5ab-e1c4-81c5-4874c2f5ea07@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, nm@ti.com,
 Robert Foss <rfoss@kernel.org>, devarsht@ti.com,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nicolas Belin <nbelin@baylibre.com>,
 "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--h4avs5zu4gsb4w7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Aradhya,

Thanks for the comments.

On Aug 28, 2023 at 16:34:30 +0530, Aradhya Bhatia wrote:
> Hi Jai,
>=20
> Thanks for debugging the issue.
>=20
> On 25-Aug-23 16:32, Jai Luthra wrote:
> > Fix the NULL pointer dereference when no monitor is connected, and the
> > sound card is opened from userspace.
> >=20
> > Instead return an error as EDID information cannot be provided to
> > the sound framework if there is no connector attached.
> >=20
> > Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> > Reported-by: Nishanth Menon <nm@ti.com>
> > Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@gon=
dola/
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it66121.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bri=
dge/ite-it66121.c
> > index 466641c77fe9..d6fa00dea464 100644
> > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > @@ -1446,6 +1446,11 @@ static int it66121_audio_get_eld(struct device *=
dev, void *data,
> >  {
> >  	struct it66121_ctx *ctx =3D dev_get_drvdata(dev);
> > =20
> > +	if (!ctx->connector) {
> > +		dev_dbg(dev, "No connector present, cannot provide EDID data");
> > +		return -EINVAL;
> > +	}
> > +
>=20
> There are not many HDMI bridges that support codecs in the kernel, but
> upon a quick look, bridge/analogix/anx7625.c and
> bridge/synopsys/dw-hdmi* gracefully return a buffer of 0s when the
> connector is unavailable.

Interesting, that sounds cleaner to me.

>=20
> I am not sure why that is done, but I also don't see the hdmi-codec
> driver handle the 0s situation properly. It is business as usual for the
> hdmi-codec.

Chasing this down through the hdmi-codec driver and sound framework, it=20
will use sane defaults for supported channels and sample rates if the=20
actual EDID struct we are passing is all 0s. I tested it out on the=20
beagle play board and did not see any crashes.

>=20
> Did you come across some observation when you were testing?

Yes, with the current state of the patch, if I plug-in a monitor after=20
the soundcard is probed I cannot playback audio, because we returned an=20
error initially.

This issue goes away if we return a buffer of 0s like those other=20
bridges. Overall I'm happy with this idea, so I will send a v2 fixing=20
this.

>=20
> Regards
> Aradhya
>=20
> >  	mutex_lock(&ctx->lock);
> > =20
> >  	memcpy(buf, ctx->connector->eld,
> >=20
> > ---
> > base-commit: 6269320850097903b30be8f07a5c61d9f7592393
> > change-id: 20230825-it66121_edid-6ee98517808b
> >=20
> > Best regards,
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--h4avs5zu4gsb4w7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmTxp7MACgkQQ96R+SSa
cUWB1BAA1POMzZ6VOKt9P5havK6UGc1Vh3QvEguAY6I2hvSKSdG6KpOGzGgDJpXS
BE+imKr6mK4p6hwVbsLqiv1Ov1ZpthUfyY3Q4/Tq2A5HfleUAQlOsQe2Ug8Iqhab
Y83Bi1qVZ7P+AWAmzWZemFphNy2Aurq5in0yUaks0H4uQu+A8PITsk8PAmY3Ryul
POeTvXAsWaPvUkZY9TXJbp3T9DWWLoiHBuk+hiZKKOgXKjuCtR8m2x4zgqb13hMo
L7cL7j0p1m5Eu83CGctvuMY+3hCxhB0eVS8UfbJ4D9GdQC7zpks0890ZUElwhQl0
B4HpAvAwWbx01y9Tyydv3vzMwdcB1DVCY/UPpMIUSgBMHo4RJwbY5QRs+vqJ2JuS
9KWkJyQZZ9uBRX5BeP6ZK0UcI/Lgx6fmnxcOAWdL9xCEUW5u1rKx/14y0vWmXb3R
+dagmYuPxGAxh49Sswfwv0W+kEf7d1vgJpNLVwzQmmcfuDmGCZCGJVOrleCjPkTE
hgaTqOMOLlr5b8CyXw2IvCl3eRA1lOYu33xUs3Tg9iD/voy8d0QSb7Eih9VWXd+K
wdnPXz0Z8ChK6PR4UZ07mni/BS9KisDRg3dbSrcDx3vhtD9pp+VmmyojLODhR2+5
ougvzQssnbpKaBKm3KEkVPVbT3r0W4d/Y5z6/oiGN0bhXaqps1c=
=CxMm
-----END PGP SIGNATURE-----

--h4avs5zu4gsb4w7f--
