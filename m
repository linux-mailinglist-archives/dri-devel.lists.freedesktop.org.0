Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F77AB51A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB44910E69B;
	Fri, 22 Sep 2023 15:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121710E69B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:49:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DCC83B822B5;
 Fri, 22 Sep 2023 15:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD083C433C8;
 Fri, 22 Sep 2023 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695397760;
 bh=jMjHcug31WE0Bf+Ku26R9S8JCXFscQZH4Akv3KWK0Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/SOWMfNE20zbjcBK/8c3F6O6Fc1na8/hodzZZ6DGFRpmsfAkqnWg/2PfBkUGQDfN
 t7R+uTAEmxHPA2Ja2+bmUkE0GCtFWPpzaUb/QFDmD2Hde2nKeh/m/QBgzg8B3iYy+Q
 rYaChEdl1p3tKO3m/aLHWbQ3ifkqxXV2GTIaCy9R9okYWTGdqIsTS6VQYnNPe+fG7D
 ja508rv2ZxCUTLw7YSs6jk5zGXCPfQxbpE0+CEhxu5i14SfbWDQ/R08ZlVn/MEVmzm
 4hR1WIFYYlXXRO6OIMq2snh4Nwv9dmlipjE/Ef3qTFtjCkjidtgtihq8ytBApJvYuM
 Tn1S6OnoXQAJA==
Date: Fri, 22 Sep 2023 16:49:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230922-zebra-modify-87ff23c70bb3@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4AbnyxYTFcvfDnp5"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-13-moudy.ho@mediatek.com>
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


--4AbnyxYTFcvfDnp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> Add a compatible string for the COLOR block in MediaTek MT8195 that
> is controlled by MDP3.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index f21e44092043..b886ca0d89ea 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2701-disp-color
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
> +          - mediatek,mt8195-mdp3-color

How come this one is a "mdp3" not a "disp"?

>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> --=20
> 2.18.0
>=20

--4AbnyxYTFcvfDnp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ23egAKCRB4tDGHoIJi
0jeNAQDbS49YRGx3evrS4YI09M9KqM0J+UXzPHF9KB+js6e3qQD+Ivrgl0SwBLae
2UKQyhQwRkwkANvuDlc0Y+I85WBfego=
=zbsi
-----END PGP SIGNATURE-----

--4AbnyxYTFcvfDnp5--
