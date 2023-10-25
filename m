Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8A7D6837
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 12:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F3A10E634;
	Wed, 25 Oct 2023 10:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A80710E634
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 10:20:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CA00FCA477
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 10:12:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A37F20008;
 Wed, 25 Oct 2023 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1698228716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jMgzyZYNsSoPrwlsfPulfu89a5fDVLfcw7ByX5WjeTo=;
 b=ddT6BDRR9O7epnBawoXXQ8dPgmHv24ToL0cgK8xuNm0EhnMN8LW8Evwdc9RCyNyIFyGZYL
 X/w7FYx5V3wCLGtxZSB0jtPtCapnSpYFVAEybX7yJrA39Mt0pcjoXOoRCy/nvCaAibSVYN
 /30pYO0xrmP1Ox5TwOawuSlun9zJm+0kZmJUHWM0jsmPGBkOdSuBppCyubzAAWiPt79I2V
 RTyw2eIGYeAq1xJcBdtdRt0LE/z9K7ZT/R4jwQH9f43QJp3bjRQIJolyY5rzLiPKIc1Vfj
 gR5UhTv3bQJdfS91Br+he1NDv4BT8lKm6yAz64QERZcqNhTWo8f4scGALGl5rw==
Date: Wed, 25 Oct 2023 12:11:55 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Message-ID: <ZTjp65yjul76zKWm@aptenodytes>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
 <50fbc003-fd3c-c7c4-9c6b-76d14a0babfc@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XXhJRH2iPVVMBxvn"
Content-Disposition: inline
In-Reply-To: <50fbc003-fd3c-c7c4-9c6b-76d14a0babfc@loongson.cn>
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XXhJRH2iPVVMBxvn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 20 Jun 23, 11:56, Sui Jingfeng wrote:
> Hi,
>=20
> On 2023/6/8 15:15, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
> > > drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select=
 this
> > > two kconfig option, otherwise the driver failed to compile on platform
> > > without REGMAP_MMIO selected:
> > >=20
> > > ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicv=
c/logicvc-drm.ko] undefined!
> > > make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> > > make: *** [Makefile:1978: modpost] Error 2
> > >=20
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > Thanks for the fix, looks good to me!
> >=20
> > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Thanks a lot,
>=20
> Please don't forget to push this to drm-misc or drm-tip if you has the ti=
me,
> as (even though trivial) it's precious for me.

So I totally forgot about this and only pushed it to drm-misc-fixes now.
Sincere apologies for this.

Thanks again for spotting this issue and submitting the fix.

Paul

>=20
>=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > ---
> > >   drivers/gpu/drm/logicvc/Kconfig | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicv=
c/Kconfig
> > > index fa7a88368809..1df22a852a23 100644
> > > --- a/drivers/gpu/drm/logicvc/Kconfig
> > > +++ b/drivers/gpu/drm/logicvc/Kconfig
> > > @@ -5,5 +5,7 @@ config DRM_LOGICVC
> > >   	select DRM_KMS_HELPER
> > >   	select DRM_KMS_DMA_HELPER
> > >   	select DRM_GEM_DMA_HELPER
> > > +	select REGMAP
> > > +	select REGMAP_MMIO
> > >   	help
> > >   	  DRM display driver for the logiCVC programmable logic block from=
 Xylon
> > > --=20
> > > 2.25.1
> > >=20
> --=20
> Jingfeng
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--XXhJRH2iPVVMBxvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmU46esACgkQ3cLmz3+f
v9EH4gf/VK82kGc+gRu4ZBrSXUXxeldKDvts/KckGQ3xfUFQ76tKkHrR56m40o27
TxykXP+jx3dTssP2hl89LmWVGdpTml8xE7raVAsat3HoVoXz56hEffNIUVxwRjzJ
V9NuRUjaYK9VIuxC55XNAFVPTnKkYNFAdIc7I8YfjJIRQkNdbFW6IuA2rcmyp+ir
zgZJ7Kfw3tG2TGIKGCoVAIwlU7mfMSTSzNjAsl/sH82QRaVAGaIDo9FTpfv3z15/
c9DH6C97RPl6jh3cMulCbSuc6Q63kudr5SnDsQXyDpGw++QzaAl+r4OjwQCl7F5M
n6iaNFoVMEH085TZ4SPwba0I2ZqkDA==
=GJ09
-----END PGP SIGNATURE-----

--XXhJRH2iPVVMBxvn--
