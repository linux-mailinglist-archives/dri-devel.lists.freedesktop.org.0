Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96C951C83
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879EE10E49D;
	Wed, 14 Aug 2024 14:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oixb9P7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B010E4A4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:05:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0953561A56;
 Wed, 14 Aug 2024 14:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941C6C32786;
 Wed, 14 Aug 2024 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723644314;
 bh=rsrPj3HibZ4DCsL9Ic4OQt4Rsa7JTdGV+7CZoZd1B/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oixb9P7IKMS3/QO3M+v6BsLenBwFo04WV3M2FM4b+PnTBnM+H8LGThWzI2ZaiPrE7
 KnT4LaSTN8Kbn7uJ49JPGpPqAKL0lh631pNmnutXfEGcuXmdOA4rpjWCkuWPEMokQi
 RdVWgigeciXAaPBIGcO8bVETqszsvXDHmm8iXRlMMpdMixIuPRF2C9V/sIagWgkXJg
 fXvbuxQwilJ+8zcimVOxsdl2OCfVzZGJqL0Op6IpfoN2iSy/Tn2aWkun7cfUo3g4bF
 iLdGMW7At7uBIBcF1QgTtSnnoddaLSLLq40P7swf55ctf26w506ePlPRSDM1XCw9Wb
 4isDAlOl8VI0w==
Date: Wed, 14 Aug 2024 15:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, khilman@baylibre.com,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <ae9a5147-95a9-4da3-a56a-ecc22f4e8f04@sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8B/Fc53TUe95dwQa"
Content-Disposition: inline
In-Reply-To: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
X-Cookie: The second best policy is dishonesty.
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


--8B/Fc53TUe95dwQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 10:23:12AM +0200, Alexandre Mergnat wrote:

> Simple gentle ping, the serie seems ready to be applied.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--8B/Fc53TUe95dwQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8uZIACgkQJNaLcl1U
h9C15Qf/aWN3somXkLeCmkhFfrV7QHTBExyjsMeiPhzPWZtkgtCnWe3qurwNFxJW
hZepPzW5OTzlmzxUY13O4q1omXjfbfIM5wpYSui2CeaJo15WV+/BxfMEjLwhB942
fDai25vauENBytYGG0rmb5lW0+92gWHVXdFYjB/Zew6sMd3uNCQNZGsfEVXJD3pU
U9rb2939laF2Lqbjvr502BhhHEPgiBCx0vsPCVtasNrArpTFfinGw2wYA4ZNRGM3
IB78TudnvuQHQtt9ytOfos5mN+fv5LxoYO16MMmuhTP753QbXipEJ4wYBKWSSPs1
JLIAGwiAAXiCyPEMjizKQ3fph09SVg==
=LwLG
-----END PGP SIGNATURE-----

--8B/Fc53TUe95dwQa--
