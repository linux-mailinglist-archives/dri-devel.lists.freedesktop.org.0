Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0C87AD0C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3904910F3A8;
	Wed, 13 Mar 2024 17:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u4QWTDLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1B310F44D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:24:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B98A361477;
 Wed, 13 Mar 2024 17:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68B9C433C7;
 Wed, 13 Mar 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710350670;
 bh=0G6tQ6qb1wy4fRsOONK7qWXg2LzQwXihYTJ0PSj1DRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u4QWTDLStOQw4Goek0IKIpEdeUGflrD6+Ri9QAQ2sG2QdJWl50JmaF48yg2y4GUU8
 a5hlJmNEKLjSQ8eISp9Pt7Qe71uB/WBHh/mz8rlP8NbTdA0BExiLykWkzPriuBuHC5
 N6welpQ79LSTFw+yy/99QS8iG2tIfT5FVkkfVEYSaAH9rw16kknZeW3PXfdvMcCXY3
 WcLxnJaleA2GDiUycERB+HA/spu9dw3DryEPtizlnV+GqhxGET6yz7r/EFUmTrYRV+
 yzfJLVs1jAornCo+Rn9Bf4BfgUuvCtqArlWCgADoAPQCIruW8/8XwuYZUOmKb+nJAH
 qW9NuL0kb39eQ==
Date: Wed, 13 Mar 2024 17:24:22 +0000
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
Message-ID: <594cff80-9cd8-45cc-939b-532f9402940c@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n0CJkGczErMrH2GD"
Content-Disposition: inline
In-Reply-To: <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
X-Cookie: It's later than you think.
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


--n0CJkGczErMrH2GD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 06:11:50PM +0100, Alexandre Mergnat wrote:
> On 26/02/2024 17:09, Mark Brown wrote:
> > > index 000000000000..13e95c227114
> > > --- /dev/null
> > > +++ b/sound/soc/codecs/mt6357.c
> > > @@ -0,0 +1,1805 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * MT6357 ALSA SoC audio codec driver

> > Please use a C++ comment for the whole comment to make it clearer that
> > this is intentional.

> If I do that, the checkpatch raise a warning:

> WARNING: Improper SPDX comment style for
> 'sound/soc/mediatek/mt8365/mt8365-afe-clk.c', please use '//' instead
> #22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
> +/* SPDX-License-Identifier: GPL-2.0

That's not a C++ comment so checkpatch is correctly warning?

--n0CJkGczErMrH2GD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXx4UYACgkQJNaLcl1U
h9CP8Af+KlLX2plI/F5rZJ9p1uJukH33qkBAEGAHtzF9F3uGHLiua+/rxebEzeC1
ZzIbUyRn+EDtKLerG/GM9tMrlGZgdnENt4T7jnE3Hw0hU+aQJ0IUtB6WnRpyjsON
MFroY93dAi8Yyn1mt0uFzgYEIbBje/+TBiUxqyVzrzIWq1OH/OBN4NmNqPVv3H2p
QttacOYxX77On2LGDbnqRcfv30n8mvJgrYBwy9OsvutAJ8nllaYgzQDrME0N9JpY
0lWOXhg99Mcmx0/SGmfuaNISBhwlwWvcKQ0Iq20Q+AiguyJmPt+kpNTm4Eh7kh+7
9KdkRUEMFfJezI6fB13+outzifLipg==
=yFuP
-----END PGP SIGNATURE-----

--n0CJkGczErMrH2GD--
