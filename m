Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166D387CF1C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 15:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4433F10FA35;
	Fri, 15 Mar 2024 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pfLF0Y3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BCA10EEFB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:38:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8307BCE20A8;
 Fri, 15 Mar 2024 14:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37258C433C7;
 Fri, 15 Mar 2024 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710513524;
 bh=LWOPGxaWjPP8E3hvpb0v/9QUSjPMu3aHfXD/4e34bMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pfLF0Y3Aw17VSoUcFU9nXUe7DJBTJnsvXRSp5JM2LcK8rgXc6Uqcotv7Rmcu/5y0r
 /k6jI4bvcl7jt+qndKxRPxKCuZU89MT7ts52FJGGSvHCZWLkGEMpmCxiaerdnhxlP4
 eca3MDnsqT6qnrh/36IIbVKpEABMWOLcMD840rxSlrl3WJKTxBSuQiGU2islj0xuUz
 VXPkRyigmU8/GmAk0LgZFCWSwIVB7rmY+yJiXtDISqyjOeYDHvGXasd3yu4D+lLUKl
 bbYt5HZZ/xwVfB+zMv4jDhP1WyyDmY5pb+X7Fmh9+K/LpfAq+PwR3Wf4s4A1UU0UjJ
 J5HVGG/SCVpew==
Date: Fri, 15 Mar 2024 14:38:37 +0000
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
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Message-ID: <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
 <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y91BRilVEGdxtZCJ"
Content-Disposition: inline
In-Reply-To: <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
X-Cookie: If rash develops, discontinue use.
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


--Y91BRilVEGdxtZCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 12, 2024 at 09:58:05AM +0100, Alexandre Mergnat wrote:

> I'm a bit lost for mixer-test and pcm-test.
> Currently, I cross-compile the alsa lib project to be able to build the
> tests and put it on my board.

> I can execute it, but I still have 2 issues:

> 1) I've a lot of missing module in my environment (Encode.so, Encode.pm,
> Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing perl
> modules and install them in the rootfs

These tests are both simple C programs...

> 2) I don't know how to configure pcm-test.conf &
> Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).

The configuration is optional.

> My test cmd:
> ./run_kselftest.sh -c alsa

Just run the programs directly.  I'm only asking for the output from two
of them anyway.

--Y91BRilVEGdxtZCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0XWwACgkQJNaLcl1U
h9BnLAf/e1vJ3Zr2d9fJBV1LV7sal34lcNVLD3JRrMKuk6bdnA2S2RYAgOf0UJwl
cRuGTcq2lBneNaYnb9jgaf1C7i5kuXvnMG0IJuqVBrTZwiN5SbGhpmdvZj6HLwPu
a8Q5MEwz/DrIXqjghxcXr5bjKi6XJ/9RRB1QpfxQFIwAOYQPNAG2F0j4SrD8zcbA
O2dO4KRIjYUBBnpP5maQh3R3yr+TEEdolkib2FyoHL2jo2Vv1zOiTK2382kuTnKA
y+GgUm8tQ4HiGZdAJqZAPh+Of86A9Rwl2133Tp1dxkFWlOamtyhfYbPESyNchUrV
qduBr5NQ0tnTuAoEKttdYckFHYq6Bg==
=FScF
-----END PGP SIGNATURE-----

--Y91BRilVEGdxtZCJ--
