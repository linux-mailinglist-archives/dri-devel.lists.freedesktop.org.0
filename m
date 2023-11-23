Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8447F6522
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F110E08B;
	Thu, 23 Nov 2023 17:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972A10E08B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:19:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5428A6238B;
 Thu, 23 Nov 2023 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CF7C433C7;
 Thu, 23 Nov 2023 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700759942;
 bh=o2B91gSRao1cm4mdpvvnT+cSLBigCNcp+xOQKNDn4A4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iahmJvGwt/0+ze9HXyRn6fXTXrsOTmscoofcYH5cE64Jn+7Zl8OLC1CsQeuehJrOY
 6Nj1HThnyqA4d+fAqJBUcrJxXD+QW0B5pIjUwP3GoYDMk0i2jNOWHXxCObeyDUEJPg
 BK87uBg791nuLw0vqhA5LNrgFRDeXfzXCV28zeFMgyTI03tZoEtN5phBiD3/o1MaYP
 bHJIRWj06VnuJSLrOEyQsSZGuoaf3eWlidsEtc1uc0u8MOPZOAt8EUGrYiwRaSEXjU
 moXac9FzCSAkQ9lEp26WhADWaZJd124nbIfpyxM6Qqeo2RGdvvjSDZSG+dPnE3Kkhh
 As2xxVshd2euA==
Date: Thu, 23 Nov 2023 17:18:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: phy: add compatible for Mediatek MT8195
Message-ID: <20231123-atypical-gradation-d98b95e9c416@spud>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-3-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ji3UuPhd3xxexBJ5"
Content-Disposition: inline
In-Reply-To: <20231123133749.2030661-3-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ji3UuPhd3xxexBJ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:37:47PM +0100, Michael Walle wrote:
> Add the compatible string for MediaTek MT8195 SoC, using the same MIPI
> D-PHY block as the MT8183.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ji3UuPhd3xxexBJ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JfwAKCRB4tDGHoIJi
0vWUAQCIxBJSBYQxfxnK0ADmbM0UaJC+Lie7AsTjs/2zhG8mjgEAjeZIyAzwtVtq
+xaFexacDMYRWoecls9a4vRISuN+1wE=
=mQTP
-----END PGP SIGNATURE-----

--ji3UuPhd3xxexBJ5--
