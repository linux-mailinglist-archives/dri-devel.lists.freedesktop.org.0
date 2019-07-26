Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD689764A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 13:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322F46ED21;
	Fri, 26 Jul 2019 11:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0F6ED21
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:33:43 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqyTc-0001Mp-Sb; Fri, 26 Jul 2019 11:33:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2EC622742B63; Fri, 26 Jul 2019 12:33:32 +0100 (BST)
Date: Fri, 26 Jul 2019 12:33:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
Message-ID: <20190726113332.GD4902@sirena.org.uk>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-5-paul@crapouillou.net>
MIME-Version: 1.0
In-Reply-To: <20190725220215.460-5-paul@crapouillou.net>
X-Cookie: List at least two alternate dates.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Gf3w/MVbMZMYK8bIC4gRWxvIqP0knReDLN6eNPEqKM=; b=xDuN5S0H1Z90uPzdw6R64amMy
 gnMBiADJuFYD7QblFkqSVwB6tn/WF7BGvvo30k/J0aPMmA1HEiUnpoQWAzka7PaHDQ4Joyhpn28yE
 EF2CUDXHQO0sCka8C6a7kNpPIaO1hAAThEsGBgsnR0u9wX9Txm8yC32A/rlHacR2+gL5o=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0741771259=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0741771259==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 06:02:08PM -0400, Paul Cercueil wrote:
> The board now uses the simple-audio-card driver.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Mark Brown <broonie@kernel.org>

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl065QsACgkQJNaLcl1U
h9AE2wf7BtVnDND6hd0UergsxXl5U3RJXvpiGgm/0yVLxuFEWPiM0EFqLGMWqoxE
3l20EeSRpPmuyPH/GyBi4VYbtfk/QkickfZgmRTnK53CZURHGm15Dr9Prj6WJ5Vp
H8QHogCOvGkoZGZh0E7Upp1Ofw05EC/ZStES9Ptw0TRNRENeP6SIRNDZJSBp7A5/
TpEw+fvcu9R2andSKgKYEsZJhppM9oSRB6H4XRNM1Zxu6FTNfkmMG0ycTRjwJPvz
ZXt6d0bq7TrYHkNajY1Wk1JwfM/wPlcW3xATpeBcp6RgazsL+i2T3fe2J541EGzJ
KSs0o9NZufIfr1QaVv4L9HrMAsSE0A==
=jJYl
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--

--===============0741771259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0741771259==--
