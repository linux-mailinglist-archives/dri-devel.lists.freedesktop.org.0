Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139D90D5BC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BFB10E6B2;
	Tue, 18 Jun 2024 14:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EPSVDKFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865610E6B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:43:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C705619A2;
 Tue, 18 Jun 2024 14:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE3EC4AF1C;
 Tue, 18 Jun 2024 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718721818;
 bh=1UwzhECrbNMlnaKtuZTayxxlZhsNfsmTEwViXahAyMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EPSVDKFMc59K2ZxfIuoVRM4RvajTUeLlZ4COcsXV6z7pVsma53UwTsSN/gJwlcwRu
 nMSHr6cg+MDveM2Mu1PZF4Ti7e/9u4fmmnlmHOcT0FvU2tJjzbTaqUKLKZiJot622/
 SDkfn7T+6I4M35iv/e3GABSI6TTcFDcl9a6tSzRvSCXQA2XhfHrwmDO5JvPLEDcFLH
 nzvpZRx06V6yfLpFrV9ysM7hJ/cf6gGJCCiddSbK7OgM/LBj95sq9buorN65dhNnKp
 AXTfO1Q3tyZb2+IstKrqXQywERkXXj3bxwXKKIBBGmp6/5YTO3duwawy3VzzB4iTPh
 LreCkpEx/VT1g==
Date: Tue, 18 Jun 2024 15:43:30 +0100
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
Message-ID: <77872070-6d0d-408f-80c8-c4a996b9d260@sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
 <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VWS3IQXFjAKUwyY9"
Content-Disposition: inline
In-Reply-To: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
X-Cookie: If you can read this, you're too close.
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


--VWS3IQXFjAKUwyY9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 10:05:37AM +0200, Alexandre Mergnat wrote:
> On 14/06/2024 11:31, Mark Brown wrote:

> > I seem to remember you had review comments that needed addressing from
> > AngeloGioacchino, why resend without addressing those?

> I don't see any comment:
> https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

Possibly it was racing with comments on the previous version?  In any
case I see it's still waiting for some review from AngeloGioacchino.

--VWS3IQXFjAKUwyY9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxnRIACgkQJNaLcl1U
h9AftQf7B2zRtt6hSQ1Xu+5FarxKtCBDR6nBW7WYRVgndY5irQ8rB15/1pKg5ik1
j0ms8fH3Q91pk4BjDrtj8z7/s2yL3YMJYPhEgKyeoUPs3lM1C3BDxTCiMvafx96y
5tQ5ad+c9UQgS8pq7lTa/xtHXfKFxdA2ABym8/DYpfn8eJ/UyM13wo1OJmW+uLnO
K/o8AJqCzj4+U0PnMPImGUQmX87qmN2XuWrHAFuwRPFsru1+w+Ii5A3pOdMwWSa+
3z9SIUmF3NriAeP7ntviKHjg9Pe8x6fqG/R6WsPkYvp6ydg8si62JAluH8e49NkQ
APIdSQGffLVEELyK6/xmm4XXm6CTQg==
=u7CT
-----END PGP SIGNATURE-----

--VWS3IQXFjAKUwyY9--
