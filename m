Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D17AB4FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1BC10E6A7;
	Fri, 22 Sep 2023 15:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0086510E699
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:43:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6813FB823B8;
 Fri, 22 Sep 2023 15:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D32C433CA;
 Fri, 22 Sep 2023 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695397400;
 bh=2D8Z7v2qzLl47ly62ZoxkjJCQb0vImD7WRAPF4T+c1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJJda26xUSaI7AbpBmjodCtUgBE+/4MgwsXQGUfMN2zwte4LsM3H3WOt0ofldycqn
 22w2jIpnSjNrhdajZ/k0aaWR2KJJN5z6KUgIk7Gvk/sBk7IFa9gBlzBa8QB1jEO6+R
 okohs077D4CbpubChXzv3XARmcP0H64paQszEWXI1q0ZjTDi2n93rRp41vkJyE4o9c
 xJdAlhHzcFKWk+ypfN41s3bix/bqpED58IRSQOWdTvLr1ApfN/VMyiw3RcnQ7TE+sL
 BhkoScCWTBCPa7MNyR/oIOWWlt39hUjG5s8oX8P5kgZZ1VbjleQm/WhdmXsg8vlEZN
 Que3U44C/ryaA==
Date: Fri, 22 Sep 2023 16:43:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 04/16] dt-bindings: media: mediatek: mdp3: rename to
 MT8183 RDMA
Message-ID: <20230922-dividing-trousers-58395562a80e@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-5-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Y4vtjwYzjnHR6mE"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-5-moudy.ho@mediatek.com>
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4Y4vtjwYzjnHR6mE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:04PM +0800, Moudy Ho wrote:
> The file was renamed to support future scalability in response to
> the changes in general properties separation.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Same with this, not all too sure why this is a commit of its own.

> ---
>  .../{mediatek,mdp3-rdma.yaml =3D> mediatek,mdp3-rdma-8183.yaml}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/media/{mediatek,mdp3-rdma.yaml =
=3D> mediatek,mdp3-rdma-8183.yaml} (96%)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.ya=
ml
> rename to Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183=
=2Eyaml
> index 0539badc9821..74a1eebf668d 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma-8183.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: MediaTek MT8183 Read Direct Memory Access
> --=20
> 2.18.0
>=20

--4Y4vtjwYzjnHR6mE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ22EgAKCRB4tDGHoIJi
0hezAP9q+TcUrIoWLs39/7VTOK8gnCa34WnmBN2JLB3/wXifJwD9FRCsU+pP21m0
v50WOhjJOqVPaEeX/UEApSfWeT7RSAY=
=LIPX
-----END PGP SIGNATURE-----

--4Y4vtjwYzjnHR6mE--
