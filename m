Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E08B5BAA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 16:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6A10F108;
	Mon, 29 Apr 2024 14:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Un7qa4q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF810EC9C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 14:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10D3060DDA;
 Mon, 29 Apr 2024 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331BFC113CD;
 Mon, 29 Apr 2024 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714401853;
 bh=OJZ8QasGzmijXQVkG9V9fKJa/f1XqrNRU4PDTZrp2Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Un7qa4q1crb9OyUCdLgWWFuWgrAJiyu10NlOIPbgqHlSAu5OabyJzuympIYoUdPs6
 ZOpE/xD0zuKphaxaryHG5bX1bslKr9WWvdK7Qpo3CePYkL5edQ6vIMaDCCeuKMaJdG
 Unr+BrxRThdxZ9xwq3c70enLrL+2Z6xLcLI/4VOVQ39KBlwa/j7No45GvCubpp0ET3
 0JFK/No4MqUSECJUFjAqu4Ok8TM2rPhxD3StLSH56Ij34VDbWB68a5+JgJWsQcdk6l
 tP21IlUe9bKrXVI6yJuibFAAzun3HDtIbtNAN9RGOUgLXlMeq2k7kEvKuOPQI3i4QZ
 T5cyBQycWYnnQ==
Date: Mon, 29 Apr 2024 23:44:11 +0900
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
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 05/16] SoC: mediatek: mt8365: support audio clock
 control
Message-ID: <Zi-yOzFhgKQXx9tk@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LT6g6VETYU3X2f5e"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
X-Cookie: TANSTAAFL
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


--LT6g6VETYU3X2f5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2024 at 07:22:34PM +0200, Alexandre Mergnat wrote:
> Add audio clock wrapper and audio tuner control.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LT6g6VETYU3X2f5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYvsjoACgkQJNaLcl1U
h9CAlAf7BkKtB98FNb4ZDCugUcYlYByugcjzPafZiPbUVpmYfmvJYoiOrSDEXePb
NRZWBGpWUDpa1l+TOGWwcOQegbbwV48nDMyJnQn+CXRUvUg0dePpRmUSLsXCwB0+
X6Z+EJ9hoQ3OrqBmt1mTld6Uk5GoZWkhoJ+OcEKXoLtQJcfUUL8uCqjciW9ySs+g
ibgnMTOqccfOfUoZNYTGIKKYypfUnQHFcKV5Lk03UtWeatQXk5SUe131QsK2w5xB
8uFXF4PuB9RiX0OQEtKgENtVVwajA3M6z3euJ2RkXwqtR+klGzgUJFFnJKjJQmye
wr8Eom+wgxxY7GyPGD3aRCnBuFDyHg==
=ccn2
-----END PGP SIGNATURE-----

--LT6g6VETYU3X2f5e--
