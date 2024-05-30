Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860A8D4F40
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAEA10E1CD;
	Thu, 30 May 2024 15:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bTA3S5kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7310E1CD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 15:38:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E4D66CE1AC3;
 Thu, 30 May 2024 15:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDDCC2BBFC;
 Thu, 30 May 2024 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717083529;
 bh=euUKL3giV/ho/PPa2wLumzm+nzQsUuxb34Rbrl9xhq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTA3S5kn8ZlDjfTHAJ2im+bwNbQ1fjIQ6OiYCMdv8ybz9xvAoNcDz5vXlakFzfcZs
 zHC/+M8zb/rCdvbDJh5gjPenw0N90iz3U3UxXH0BCllvkroQC9wY5Gs8KTgQwx0Ap2
 JGwR4/e00D0nYeHNcyuSCmLP3rn43yFocmV308q+/RBjIWASDzyZLOMjbzcsVDeIkr
 JMAgaPyGXD9tAOejZl8wwWRyXzD8qSV/qrqMxzr5rhOHaTTCTgsgwF07SKuJ6H+l79
 6KTxARwkFXBaOSsDu3vQcpPBJv6LMWuqdMqNdjS4+UYmGvSOd9j+XascoQ4e7q6AcY
 NHvo6eobGTuDA==
Date: Thu, 30 May 2024 16:38:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
Message-ID: <20240530-reptilian-revolver-a8cb1f2af8ba@spud>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u4tlLkr2QYvGk/ip"
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-4-wenst@chromium.org>
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


--u4tlLkr2QYvGk/ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 04:35:02PM +0800, Chen-Yu Tsai wrote:
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
>=20
> This was part of the very first few versions of the PowerVR submission,
> but was later dropped. The compatible string has been updated to follow
> the new naming scheme adopted for the AXE series.
>=20
> In a previous iteration of the PowerVR binding submission [1], the
> number of clocks required for the 6XT family was mentioned to be
> always 3. This is also reflected here.
>=20
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c=
79c2a.camel@imgtec.com/
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--u4tlLkr2QYvGk/ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlidgwAKCRB4tDGHoIJi
0jEUAP9dytPUMftkwmUYeOy5IxYQ34BgC+UeoK8voSx1buveXgEA3if/Ue6idDKS
pCr8yS7NaLjlC7pujPpYExaUI9Mb/gk=
=y4xH
-----END PGP SIGNATURE-----

--u4tlLkr2QYvGk/ip--
