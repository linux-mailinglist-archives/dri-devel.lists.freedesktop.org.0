Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D696A523
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0090510E096;
	Tue,  3 Sep 2024 17:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GuRAngMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39F10E096
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4CF73A429C2;
 Tue,  3 Sep 2024 17:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238D9C4CEC4;
 Tue,  3 Sep 2024 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725383686;
 bh=qW0RktGoVkbp3dbELJ0XnlGsWcBLW434fwCOzn74Vkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuRAngMw4FtK7TyflROsYBV1lYCTKtUT1bir8ZZY8wNReUFtnfddZvBvkFwjVTRym
 b0Ao6qM8UI9rNBWicO+BMdEQMpNhOj1Rvbvou5lenbKL5r7AYzNMtp66G4GV83QiO4
 ySeux05NNkyQIkpAOs/iEeofWo4KInG6x3Kb53MbNhZYux9jHVNuAzD9w56B3eHRb1
 1wMjoqQy7sVJedE2hizsg2pd5hE7tb8i9AZ/dzRaIFxBNpWbiTBRKHnvhdoNgvgS8q
 +5FSuI3B0GX3tCbf6hjjFEbar8JPcn2SRQOGe3JJw7ivrMWZk+JHr9Gz0KhHSqDJcH
 b1fj3m/Ktu8gg==
Date: Tue, 3 Sep 2024 18:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: amergnat@baylibre.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v7 12/16] ASoC: codecs: add MT6357 support
Message-ID: <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OMC7w3ub4Px9anag"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
X-Cookie: Please take note:
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


--OMC7w3ub4Px9anag
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 08:53:41AM +0200, amergnat@baylibre.com wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Add the support of MT6357 PMIC audio codec.

This breaks the build:

/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt6357_p=
latform_driver_probe=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:1824:55: error: too many argum=
ents for format [-Werror=3Dformat-extra-args]
 1824 |                 return dev_err_probe(&pdev->dev, ret, "Failed to pa=
rse dts\n", __func__);
      |                                                       ^~~~~~~~~~~~~=
~~~~~~~~~~
cc1: all warnings being treated as errors

--OMC7w3ub4Px9anag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXQ/0ACgkQJNaLcl1U
h9CpOQf/TZgfm5Me95NAaeAf3HC8+QtPbX8C2nII9zKTnbEfLCDi/g1gWoJoK6ge
FBcp4NuLABoPKK/c0mXC0iSzZ8mjHoHX08LBYnh3Q+BZFvOy+6hXTs/cr6/RMtDR
OQ7lNNGHEhH5YZvCMPrt+3p2BnWcLGvbreX+xIa1PfT91BvUGpEhxPMkPe/UQKkk
+sGgJdVgQRZgjtoaqZXWBsVYD2fUK6CJwb4w14Gm+BwFYwvrIj7Tq8FpnDdmUawg
SYP7QBsvrhWdYaAOAfRi0cpusU8wgwSjvUOu2md93uMVLke+S0T+8dkw/tkPnJcS
XvtVy+qXZ/rNyGhr44XT3XZmwXdOTw==
=ZHfg
-----END PGP SIGNATURE-----

--OMC7w3ub4Px9anag--
