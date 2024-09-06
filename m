Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928E96FB41
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 20:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379810EAD6;
	Fri,  6 Sep 2024 18:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q4Oqns1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DE510EAD6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 18:34:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 805FCA45210;
 Fri,  6 Sep 2024 18:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FA9C4CEC4;
 Fri,  6 Sep 2024 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725647689;
 bh=DfKGjEXx5hSeUXB8vrUl2jj650dPsUbikh6TxwpLm8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4Oqns1ZT+8BaXLlOHhPFVIqEyFqit8FSM7w0q2NuoPjesvljHet03opQbah0Fwxd
 li+VWGIxfeiBscR7cdhr1Sy4mt+y+hYdDRA+rN4uLd1xeodMLwkuDVrEuYECMXCZTK
 CZ+7Os7xhiAZZQ+VWkLUzv4LxRv0iM9Lo8i6uGsU+ps91zOS1cpLAb+HwrfoYCDFdL
 2CEVjrZo14qSo8Xfi4+KQC2byM9ofWla+hmuHH03vmYga0Sq+49XxD3/Yjkn0OT6Yv
 KC5BgEJOCmV7E3+xU78KHnbNuQhBVtcMmwemLDcDNlVDaXuqiZYD34GbP0fxuK7F81
 LKrJw9XYcGO0g==
Date: Fri, 6 Sep 2024 19:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <ZttLRhOn9uIuk0Kl@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
 <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ROeGXY+oUkHH2KgO"
Content-Disposition: inline
In-Reply-To: <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
X-Cookie: Your love life will be... interesting.
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


--ROeGXY+oUkHH2KgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2024 at 07:27:04PM +0100, Mark Brown wrote:

> These commits passed an x86 allmodconfig with GCC 12 at each step (I did
> catch one warning there with another patch in the series that didn't get
> applied) and 0day didn't say anything at any point.

Oh, actually right as I was writing that message 0day decided to report
that (and some other things that look rather preexisting), though only
with clang 20.

--ROeGXY+oUkHH2KgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbS0UACgkQJNaLcl1U
h9A4PAf9EXvt7UgwANg6DLruDFhtYHs50i0gB5suWbYdBIV1oNQ+ZsrdL38D1SfO
s4IvxwibYw+GjhYu6rWRC1S3yF1kpB5/Y6bnyZC3y7T9anqLD0wC56ZraWJB4vON
Uqm04cTI/g/MNzFxJn0l9dU+5r3y9hX890cCtRBZYVagmM/u9eG8IULqbCOHhPVG
kHrJv7MTxpQ1emjKM/ZKCbZ6Z056BkaBgAk3mht5pjv9D3VvvlRIhgZ/0tVrwTdd
/OaQPpR8z/dLk0LJ2sgPCx2/0MjGrmEveCCTH7/uvJEJ/DQV2bAqgL693OJ0uUc1
hrVwYOMO6wBL9SUj5BU/2dFxPFLmxg==
=5wcC
-----END PGP SIGNATURE-----

--ROeGXY+oUkHH2KgO--
