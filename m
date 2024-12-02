Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD09E06E4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F3B10E7A2;
	Mon,  2 Dec 2024 15:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6Itpbhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373710E7A2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 15:24:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4D3E5C674E;
 Mon,  2 Dec 2024 15:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED517C4CED1;
 Mon,  2 Dec 2024 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733153073;
 bh=XYQ0z1Uam77lItbs5TmeenkmhhhYCbef5wkE8j7DNxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6Itpbhg32uZaAfl/yleMRcAyuFbk6hyY6q62CjSVT5ePkBcDTqgCHMQflCRZPk3M
 mS7yABdBHT0BwG2EFPgBmiZaN+/l2JUlG4zdXhFOD7Ogq4aBLnI7qFXDKJqUIzto9D
 lATKQwjmIsLNaRhRU+p8KxkOl4cY1wyskRvCZFvvXo0GhKusl62rhNtUAb7LVlHUpH
 DKjyzFmiu2dAdvHzb2VI8GOOD7gvqGB7E9zcfT7sJwsz/b503QjgNsurAdHPHryYhx
 fIK9u421jmN5QOPoXjC3innffMfVLT2HiNHnJyDvEGsx9qbKoyXhuBfNdSdbFdbB2c
 5o7Xfgsz1Bg2w==
Date: Mon, 2 Dec 2024 16:24:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
Message-ID: <20241202-goose-of-pragmatic-sympathy-3fbbe7@houat>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
 <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u7k2sfuk7gzxc7b7"
Content-Disposition: inline
In-Reply-To: <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u7k2sfuk7gzxc7b7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 04:20:46PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:31, Dave Stevenson wrote:
> > Fixes up errors on HDMI and interrupt controllers that weren't
>=20
> What errors? I can't find anything in the commit. Describe the error.
>=20
> > noticed before merging.
> >=20
> > Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline suppor=
t to BCM2712")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boo=
t/dts/broadcom/bcm2712.dtsi
> > index 39305e0869ec..f42fad2d8b37 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
> >  			#size-cells =3D <0>;
> >  		};
> > =20
> > -		bsc_irq: intc@7d508380 {
> > +		bsc_irq: interrupt-controller@7d508380 {
>=20
>=20
> Do not mix cleanups with bugfixes.
>=20
> BTW, do not mix DTS to DRM. DRM has its own development style. DTS
> *cannot* be merged there, so combining these series is not welcomed and
> leads to issues (like DRM applying DTS!).

When did that ever happen?

Maxime

--u7k2sfuk7gzxc7b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ03RLgAKCRAnX84Zoj2+
dgeyAX9OFiJpZFQbio0wgmyjERHOVqZ0QnzuwU8/l4uYS3Js8d451pGqbMSkwSuV
y4TIeoEBf1bUqFd30CrhbLvlNqnr2LgNABbYjWU0AzVWN6SzLXWEYk4U7injMDWQ
ojUpgGixPg==
=czBy
-----END PGP SIGNATURE-----

--u7k2sfuk7gzxc7b7--
