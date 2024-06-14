Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8CC90877C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E15610ECB5;
	Fri, 14 Jun 2024 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dowkx4Wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848DC10ECB5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BC9061EE5;
 Fri, 14 Jun 2024 09:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75168C2BD10;
 Fri, 14 Jun 2024 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718357522;
 bh=vq/hKXj8k3TXQ6CBXyolStxtljiu0fDBYD/cq4bFmRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dowkx4Wli/K0fxQuXPa9Ov4p8jq4KCLXebXQhTLM5C+aiOubAYAqt6VKGvEfTd+is
 u1H5cT2n6PNIyOSwsRfQdqH8u3Ft3fyV9zHmquoyyb8BUFk+PERVN+tIV4ajqw8vsW
 7RY/uftugQcGLKrN6adOWRZRq7HYsGiNvsG/NHATdB9mbrBWreXhWtLEtiVV/8DM6O
 /vkRXKIZ9h/aVv+Tf83y0fRDuc/X49dFn9IxjzSMYU720OV2uuxRpCpBG/1DNhh+th
 z0C+Kh+7fItagFuiZgbzOIl7R01Bac1D8IAu15pqxJKVOASbc5i9MjozYRBusaqX82
 AGLEieEUdavxA==
Date: Fri, 14 Jun 2024 10:31:58 +0100
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
Message-ID: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SeMD/ZPP93d62FnM"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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


--SeMD/ZPP93d62FnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx

I seem to remember you had review comments that needed addressing from
AngeloGioacchino, why resend without addressing those?

--SeMD/ZPP93d62FnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsDg4ACgkQJNaLcl1U
h9AoDwf9Gw5El3fz0zRFzNFxxe/7UfRa8HACWErrPscsXGk4tslBOE3UwCx3bw4Q
6VnbJ45siXspBD7/Zjhjhi9lvAZlz6ucKm2glWijqZHLg9xmSBrRyEDb2G98FWlI
SMczNAxg5QXwBUnID0bua6y5ZOldZEAGl53t5KuXWRe0/Znwns2+gUpSt3MAoDp8
rPfYqUv2whvlBzGYmg6XlbTskN/c/+qpODFdThrx57aGRjxRoVc82kAmN814Gbc/
nqKrNhIYzQDYBwKB1cuDXatDavgYFA5FugzeuZ80Va5/ZiuMX7JLgMHeVGQJZrQq
Jbv+xbpMJ+ow5S6rLO0D2CcOA91DsA==
=TqJQ
-----END PGP SIGNATURE-----

--SeMD/ZPP93d62FnM--
