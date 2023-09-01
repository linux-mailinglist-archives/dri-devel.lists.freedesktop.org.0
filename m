Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D678FA6E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A29510E184;
	Fri,  1 Sep 2023 09:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB28710E184
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:06:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38196QLq102794;
 Fri, 1 Sep 2023 04:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693559186;
 bh=vef8NocFfCln69pFHvQilWwSx80bSqDHP8O6RbxNn9g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=qE9V40uQdYPeZxv6T049Zd/wXhrKAmAoiXxUeW3HAv/z0P/BnESzpd/Th3sp9goqi
 s+3hhRVpxEHeOpD2CPDdyDgetQid9BtTTbA5pxaoblnOXylVOZPlgqoeYwP4vvtiL4
 /g4mszs4ntT5NEvWDfWInfZDFL5FXBXlIE5GiWQw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38196QMf081832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Sep 2023 04:06:26 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Sep 2023 04:06:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Sep 2023 04:06:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38196Pl7044561;
 Fri, 1 Sep 2023 04:06:26 -0500
Date: Fri, 1 Sep 2023 14:36:27 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Nishanth Menon <nm@ti.com>, Helen Mae Koike Fornazier
 <helen.koike@collabora.com>
Subject: Re: [PATCH] drm: bridge: it66121: Fix invalid connector dereference
Message-ID: <ljopjy4gjuduyjq6auhwi3jinblqagf6vghgvw3edfmj6tyerw@q2kglcng3glf>
References: <20230825-it66121_edid-v1-1-3ab54923e472@ti.com>
 <6fd4-64ecbf00-7-213b7840@157890373>
 <20230831122531.smmqt7ycupvum3gg@stereo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mwneqtaejeqscvrn"
Content-Disposition: inline
In-Reply-To: <20230831122531.smmqt7ycupvum3gg@stereo>
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
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devarsht@ti.com,
 Nicolas Belin <nbelin@baylibre.com>, "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--mwneqtaejeqscvrn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nishanth, Helen,

Thanks for the review.

On Aug 31, 2023 at 07:25:31 -0500, Nishanth Menon wrote:
> On 16:35-20230828, Helen Mae Koike Fornazier wrote:
> > On Friday, August 25, 2023 08:02 -03, Jai Luthra <j-luthra@ti.com> wrot=
e:
> >=20
> > > Fix the NULL pointer dereference when no monitor is connected, and the
> > > sound card is opened from userspace.
> > >=20
> > > Instead return an error as EDID information cannot be provided to
> > > the sound framework if there is no connector attached.
> > >=20
> > > Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> > > Reported-by: Nishanth Menon <nm@ti.com>
> > > Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@g=
ondola/
> > > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >=20
> > Reviewed-by: Helen Koike <helen.koike@collabora.com>
>=20
>=20
> Occurs on today's master: v6.5-8894-gb97d64c72259
> https://gist.github.com/nmenon/6c7166171729342ee0be7de90b65c5c6#file-v6-5=
-8894-gb97d64c72259-L821
>=20
> My only complaint with the patch is - yes, it does'nt crash, but I see
> this spam on my console:
> https://gist.github.com/nmenon/6c7166171729342ee0be7de90b65c5c6#file-with=
-patch-on-top-L236
>=20

Aradhya suggested an alternative approach [1] used by some bridges,=20
where we return a buffer of 0s instead of an error here.

That will fix the spam, but more importantly will also allow playback if=20
the HDMI monitor is hot-plugged later (after probe). I will send a new=20
revision of this patch that uses that approach.

[1] https://lore.kernel.org/dri-devel/d2deac24-d5ab-e1c4-81c5-4874c2f5ea07@=
ti.com/

>=20
> >=20
> > > ---
> > >  drivers/gpu/drm/bridge/ite-it66121.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/b=
ridge/ite-it66121.c
> > > index 466641c77fe9..d6fa00dea464 100644
> > > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > > @@ -1446,6 +1446,11 @@ static int it66121_audio_get_eld(struct device=
 *dev, void *data,
> > >  {
> > >  	struct it66121_ctx *ctx =3D dev_get_drvdata(dev);
> > > =20
> > > +	if (!ctx->connector) {
> > > +		dev_dbg(dev, "No connector present, cannot provide EDID data");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	mutex_lock(&ctx->lock);
> > > =20
> > >  	memcpy(buf, ctx->connector->eld,
> > >=20
> > > ---
> > > base-commit: 6269320850097903b30be8f07a5c61d9f7592393
> > > change-id: 20230825-it66121_edid-6ee98517808b
> > >=20
> > > Best regards,
> > > --=20
> > > Jai Luthra <j-luthra@ti.com>
> > >
> >=20
>=20
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--mwneqtaejeqscvrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmTxqZIACgkQQ96R+SSa
cUVbVQ/+PB+GU8igW/uP5w5EkVy0jwtOUsWb6GtyGMzZDCrUr94MczlnDtMjSy1k
f2mouYWWR4ZSUH7MBq4WvlQqmpAwqn0sPJCl2fH3wZSDI/YcYaqLYVoT1m2cqY+Y
XmOSkq2xyfgwwD87lvlNEVDfgwp66S/H51fhl00eolGt65vniXloBNh3UlT8qbJb
+n6suc32u71VnTzercwJl9adUazsKDqTnlOwx2fPLZ40r2+f9POHMQuzoORCB3AQ
Ti7Y8EqOuJuc1zAWEfUATqp4+LHI9QV5PfSgydbvTzBhPjEIRXFSOS6yE3L5IPWl
pRKte5mbp/Ooy/TThxEKvl7MFF397vW+EOxXbAsJDbcykb8COckNgS4orPNGVzp0
ysmqWShhzFfSYkwnH5ZzWDm92B9oB3lcX6sjgTzn7ZPNYsxL3MzjN350ehRhttEi
Ok8ggFCnXNugVCpQuKrJtQgDskJmloXJjt6dbKx37JRPDdSydIxSOnLbC6ZeakOw
QiguTnA3K4NLhjaRiE6pfmog24CitectbRPIjeTtAnUqs6WEEd9hsVBwdVHEzLlr
NOVWYWyQ19ImCVvXhWYdoOApND2UZb77VsX9JCNXzXTCmWimsOd2mzoQ+jh37efF
ouSUvH0hcYnboZJdc7vpFjcu/vm8euxNgM+nMHosw1QxARCzhUY=
=/IHg
-----END PGP SIGNATURE-----

--mwneqtaejeqscvrn--
