Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF387CEDC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 15:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9041122AA;
	Fri, 15 Mar 2024 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BGoVIVh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E91122AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:30:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DD42ACE1B7D;
 Fri, 15 Mar 2024 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094F5C433F1;
 Fri, 15 Mar 2024 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710513012;
 bh=y9UTrQR60pzrt4WbzQGYuGVl4ayHy9bpcn+b1iICLzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BGoVIVh0xKRjHYfUEkZgVdUX4aDhwpU4ARn/sMVBEI1COT2p7VK3grcrtYC4rTTjJ
 ufBJJQYQ6fgBenIL7SI5Vtyg+3H6cblDWDmW/KjsYbU92qjg0vuLKDdgHEqabV3fqZ
 QubJ4yaoz7eJ1YEnlTsz6HB7evsn2U31Qv5q3FLzFNJyCd8UDg9nclG+ZRnBnmQ5iV
 XypU7z9D2SLN6njnByNBVNOgwth6Korsr2Zz/bfQuEL8b9G6O6d1Gf7hOFk61HFFH1
 wY37D4Gq8RO5xPn/7OMApVE+XjQSIigrDkQZbIrErOAO1yhsQUS16ir+kCudsiDvZC
 fcwNBMRsCKuCw==
Date: Fri, 15 Mar 2024 14:30:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
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
 Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Message-ID: <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
 <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
 <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K7ZVz5OiwuIdg9jd"
Content-Disposition: inline
In-Reply-To: <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
X-Cookie: A well-known friend is a treasure.
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


--K7ZVz5OiwuIdg9jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 12:01:12PM +0100, Alexandre Mergnat wrote:
> On 13/03/2024 18:23, Mark Brown wrote:
> > On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:

> > > Actually you must save the values because the gain selected by the user will
> > > be override to do a ramp => volume_ramp(.....):
> > > - When you switch on the HP, you start from gain=-40db to final_gain
> > > (selected by user).
> > > - When you switch off the HP, you start from final_gain (selected by user)
> > > to gain=-40db.

> > You can just read the value back when you need to do a ramp?

> You can't. Because you will read -40db when HP isn't playing sound. That is
> why the gain is saved into the struct.

> Let me know, when you change de gain to do a ramp down (start from user gain
> to gain=-40db), next time for the ramp up, how/where do you find the user
> gain ?

In the register.  You only need to reset the gain to -40dB at the start
of the ramp.

> > > Also, the microphone's gain change when it's enabled/disabled.

> > I don't understand what this means?

> When microphone isn't capturing, the gain read back from the register is
> 0dB. I've put some logs in my code and do capture to show how it works:

Is this a property of the hardware or a property of your driver?

> > > > > +	/* ul channel swap */
> > > > > +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),

> > > > On/off controls should end in Switch.

> > > Sorry, I don't understand your comment. Can you reword it please ?

> > See control-names.rst.  Run mixer-test on a card with this driver and
> > fix all the issues it reports.

> Ok the name is the issue for you AFAII.
> This control isn't for on/off but swap Left and Right.
> From the codec documentation:
> "Swaps audio UL L/R channel before UL SRC"
> This control is overkill, I will remove it

This is turning the swapping on and off.

--K7ZVz5OiwuIdg9jd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0W2oACgkQJNaLcl1U
h9Crogf9HxYF3MaL/A3dUDm+Alxsez+w+9hdE05vA2xnAX7B+y66KyZ57bCm9SK1
IfemHS3DsYz5DdY34Hgti1XBNCkxr4eo+QuYp5LlAht11IR9r2kxbjI9GOgW9KQt
9b79rtSUodUf75NWoUdTJdR3XUeZaPfpNyY2JAYAKtb/NYF7wZ+2qY4H0Ghh9qQL
zNno8ER/qk2DHIlyp8Io/7INq46g9k/XLKciK1nNFvwDhilREphfN6W7q/WD+9Dq
b91sqdSD7ssMFD0b/KEMDBV7AoIiQv+2OaVSUB1SrD1N2E1GZiEFdpASy0ehuSOc
/RK5R2ZA3NuKgt42DmLEW1b+Gn9Zlw==
=TlBs
-----END PGP SIGNATURE-----

--K7ZVz5OiwuIdg9jd--
