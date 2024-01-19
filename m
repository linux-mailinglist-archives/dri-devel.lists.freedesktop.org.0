Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BD832D7C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161610EA0F;
	Fri, 19 Jan 2024 16:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3032510EA0F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:46:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49A7BCE22D2;
 Fri, 19 Jan 2024 16:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A6C43390;
 Fri, 19 Jan 2024 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705682728;
 bh=4xiZyQ+P1Xz0x+4FTwkxMPkSXfVCdC8v1T9pR7kkqfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uDqtfRJANZKxjE6iTqUTIFLbR/GJhoBYF58gPKgdTKvz+AYQ3CcZrUml5a5yERwg8
 w59B9f6CKwtP6q6KMv18GT6DYLzOAmUJ/YXLDSEaa7w7g800H4zQjBFXMXbi3j37le
 bI73E3mVPdGWQOIkYQLM6aZbrazixI+1rUSIWHtx2+Csz33O8Iyz9uWWe3NuTM0ak4
 lG+At1EnPMfj6qtiZY1Ye5JxxS5nsBphTDgul2FNO7rnhersaTkgX4txc1EBu+aeKc
 ExyX+rVSAOy6GxGBG7/0x0as+CNRGz6VZamNCtt00HON59y45/XxnZeQ+jLS3S//dC
 fzkWPZY2B6baQ==
Date: Fri, 19 Jan 2024 16:45:22 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: soc: mediatek: Change
 mediatek,gce-events to refernece
Message-ID: <20240119-amaretto-gauging-5f745a1b1335@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-4-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1LR1bW8RJGTFo223"
Content-Disposition: inline
In-Reply-To: <20240119063224.29671-4-jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1LR1bW8RJGTFo223
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 02:32:24PM +0800, Jason-JH.Lin wrote:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1LR1bW8RJGTFo223
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqnIgAKCRB4tDGHoIJi
0lW2AQCNJ+Q40bd9LrGWCRk8PNKTOTd7knertR3kHCdXzQusnQD+I6A52S2rMCYj
tJEIlcYZgCfxGjoaD1PG+JlJwlzFbwY=
=94Oq
-----END PGP SIGNATURE-----

--1LR1bW8RJGTFo223--
