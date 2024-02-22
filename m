Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241985F5B0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900310E8FA;
	Thu, 22 Feb 2024 10:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qWwbxASk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2910E8EA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:28:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C01D9CE217C;
 Thu, 22 Feb 2024 10:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B22C433F1;
 Thu, 22 Feb 2024 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708597685;
 bh=b4FUqCJ0EFJCW1Eb2H2P7CKrb72vkMjtY68vabwTKH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWwbxASk1MbAVTuyZfGCOFBhHJn0KpL0yeXX4HC+Fz2c/rwa0T+PGhF4Vk2pE4SHP
 QHEy3WJOaieXRi4kEplUJuaoAPVrmU6E4KBZO8i+8KreL1vrFDmA1Uh3yO/8Ie0Gdq
 Nurfasgeew1ljzYRCNxFqcf/WAFG11U67kfbrXeIRpkzcYuDcpbMl0fmm7jqnvOlYU
 SNrLZbjUC8hz4FSfzG8C97126If854WAjMA86c/UC6RI/Ij2A8AohL6BiD1TtGLf58
 JTJJ/bKq+xoo7ZtM78azfGmPVRuabtrnSlGjCRD3UBaIh6UztK6Hz8mwNY02e7Mfax
 f9Ws2/duLb0KA==
Date: Thu, 22 Feb 2024 11:28:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Diego Roversi <diegor@tiscali.it>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: nkm: Support minimum and maximum
 rate
Message-ID: <ng2xdo7icjshbwlwy4sgaofibkg3e7qaotd2dnaq5zfizgub7s@b7egn5kd3ejf>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
 <8734tmhzkg.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q4pk3zqf4xnyu77u"
Content-Disposition: inline
In-Reply-To: <8734tmhzkg.fsf@oltmanns.dev>
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


--q4pk3zqf4xnyu77u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 11:38:39AM +0100, Frank Oltmanns wrote:
> Hi Jernej,
> hi Maxime,
>=20
> On 2024-02-05 at 16:22:26 +0100, Frank Oltmanns <frank@oltmanns.dev> wrot=
e:
> > According to the Allwinner User Manual, the Allwinner A64 requires
> > PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
>=20
> I should point out that limiting PLL-MIPI also fixes a regression
> that was introduced in 6.5, specifically
> ca1170b69968233b34d26432245eddf7d265186b "clk: sunxi-ng: a64: force
> select PLL_MIPI in TCON0 mux". This has been bisected and reported by
> Diego [1].
>=20
> I don't know the procedure (yet), but probably the fix (if and when
> accepted) should be backported at least to 6.6 (first broken LTS), 6.7
> (stable), and 6.8 (next stable).

https://www.kernel.org/doc/html/next/process/stable-kernel-rules.html#proce=
dure-for-submitting-patches-to-the-stable-tree

> My suggestion:
>  - In V3 of this series, I will reorder the patches, so that what is now
>    PATCH 3 and 4 becomes 1 and 2 respectively, so that they can be
>    applied to 6.6 more easily.
>  - Maxime, IIUC you requested some refactoring for handling the rate
>    limits [2]. I propose, we use my current proposal as-is, and I will
>    do a follow-up series for the refactoring.

I'd really like to not introduce a new ad-hoc implementation of range
handling. It's fine for older users to not be converted yet, but we
shouldn't introduce more users.

Maxime

--q4pk3zqf4xnyu77u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdchsQAKCRDj7w1vZxhR
xazKAQCsOgi9EGPB1NvcUX+zJHujzzu0Eni6yLd7IVdDRMkbQwD9FgYrQZze53po
fwfG9jJrp7PSo+5yd2QAWoj53xExtQw=
=1YY2
-----END PGP SIGNATURE-----

--q4pk3zqf4xnyu77u--
