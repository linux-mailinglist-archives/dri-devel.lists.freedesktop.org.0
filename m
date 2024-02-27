Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC308699D4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14A810E159;
	Tue, 27 Feb 2024 15:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UgLCqJl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8220510E834
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:07:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 784D861228;
 Tue, 27 Feb 2024 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE7EC433C7;
 Tue, 27 Feb 2024 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709046421;
 bh=me+PaR02OqhyQDVfheZnctQBFyoYjMvRYEUCFZryMNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UgLCqJl5Tjup29jLQDrfmHzJGcqm6Vn0A8QXbh+nlYBzo2ztnaVO69jw/ROGGmueY
 Q9CPhg0EF4DmsduPBINCvhKNEiGUEtH2sTIg7deV+MJ6/U8qYhCiUAdMgk8XbPVToj
 9wtNHmraZWYT1fxgj94MCWn8gj21ORbqXgMnPCijB49ft1u4dQcyICfaz2g+vmNMMs
 rZZsVNAfiQZ0jA3ObE7SKMxvTqvsNl4f5z1q0W1ZwJwQ5UCk+f8WCRJyArGfEyJdrh
 OINmmHKU5aIdMSwoD6cUeaIBcBAd4w8YASgdaCcJMogfF+vg1YgDVX3fDIbOTvokyG
 yiquWurwJIAEA==
Date: Tue, 27 Feb 2024 15:06:53 +0000
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
Message-ID: <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z6rJHLYKeV1xaopM"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
X-Cookie: Please go away.
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


--Z6rJHLYKeV1xaopM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 03:01:38PM +0100, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx
> - Capture
>   - 1ch DMIC (On-board Digital Microphone)
>   - 1ch AMIC (On-board Analogic Microphone)
>   - 1ch Headset Jack (External Analogic Microphone)=20
>=20
> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
> change documented in "mediatek,mt8365-mt6357.yaml".

Given the number of custom controls here could you please post the
output of mixer-test and pcm-test from a system with this driver running
next time you post, this will help with review since it checks a bunch
of things around the new controls.

--Z6rJHLYKeV1xaopM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXd+o0ACgkQJNaLcl1U
h9D7bgf9HvLTv1/D7ibf9xpiO/7Y8mdR7blZxSERHC0VJyzegzQI6g+LO1qHYqc3
w9Kt0UwtxRgeVFwzBejVVYpZ72d9DoqN3nS4osApKoOChjapCsvasw+uqAodEk5j
he8RYvVZ5UJWO6P1D5+DkvesptWMDXHFbcoASdlGpEURjMBSLgIOZPnhsZumU0tf
AzDfDa1BwQwuIS/hg7ebHpzFlevB7SEUANSppMJ3Jp7/SbgTPt9w+/+lERnOiAh1
G86yCidp9TlgUpb92TVwFyOcdnXT13VmhCwZ/7xwye2IVNnv4CXmFgPk8C4TyNdW
s1HkIR6EuDYgEsxPOSQt7+eWhweHYg==
=/HK9
-----END PGP SIGNATURE-----

--Z6rJHLYKeV1xaopM--
