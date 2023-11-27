Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A047FA7F5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 18:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC710E3B7;
	Mon, 27 Nov 2023 17:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53410E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:31:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6C507CE10C8;
 Mon, 27 Nov 2023 17:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F713C433C7;
 Mon, 27 Nov 2023 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701106271;
 bh=1f6++Sut+qyUgzlRDFrOoLD82uHFLjkr49VW132tP6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U077nLMrvZvoNfq8uUMQhgonYGE3ddOcfxi7Oz/sLdbF18qsYWLQLFjftP6jN8Btv
 NprKf48THKk98Xs46KXuWhcfEw7Lp8xc4YBB7RwIgU82YueDzfLQQRJs1/hH4oZX+n
 vKbqvlaA+wa2wFQ7Ns6gjRwqD53NR2vnbUotSr8VensCvo/k7X45B6C3zBMu9xLHKQ
 qtzGPFlTDEFiy6icdg/JYxCMoI2k4Lp4DjM8Wu1EPcFPcjQCLUNOjqLkq0Hw9h4NjE
 UfeNo05hPz19oU7krzwKDN4ww8/QWEwBoECOHZ20OcNJvIViKljUN+IACnDwWx0X7c
 yqP87R/FNUUDg==
Date: Mon, 27 Nov 2023 17:31:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Roland Hieber <rhi@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: mxsfb: Remove power-domains requirements
 for i.MX7D
Message-ID: <20231127-education-skilled-9814c6fe4998@spud>
References: <20231127-b4-dt-bindings-mxsfb-v1-1-922e4e71c838@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eRsFMvFDjL10ksWa"
Content-Disposition: inline
In-Reply-To: <20231127-b4-dt-bindings-mxsfb-v1-1-922e4e71c838@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eRsFMvFDjL10ksWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 04:35:56PM +0100, Roland Hieber wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> i.MX7D is documented as compatible with i.MX6SX, but it doesn't have the
> power-domain requirement. Limit the i.MX6SX power-domains requirement to
> i.MX6SX only.

I dont like this commit message tbh, I shouldn't have to go and dig out the
file to be able to understand what you are doing here - it should really be
explained that the imx7d falls back to the imx6sx, as otherwise this looks
like nothing at all to do with with imx7d.

Thanks,
Conor.

>=20
> Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document i.MX8M/i.MX6SX/i.MX6SL=
 power-domains property")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index fc11ab5fc465..83532959e51c 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -117,13 +117,19 @@ allOf:
>            maxItems: 1
>          clock-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,imx6sx-lcdif
> +    then:
> +      required:
> +        - power-domains
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,imx6sl-lcdif
> -              - fsl,imx6sx-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mp-lcdif
>=20
> ---
> base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
> change-id: 20231127-b4-dt-bindings-mxsfb-9a0676d08b4c
>=20
> Best regards,
> --=20
> Roland Hieber, Pengutronix e.K.          | rhi@pengutronix.de          |
> Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |
>=20
>=20

--eRsFMvFDjL10ksWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWTSWQAKCRB4tDGHoIJi
0h6OAQCM77zuKX5T/URD5xbri5KHdxypFWxTlRPjFWgoKcyH+AEAntIf1h5TsGP7
2ZsAPySWu/fjFf5kS+R8djJIA1Vppg0=
=Dmgj
-----END PGP SIGNATURE-----

--eRsFMvFDjL10ksWa--
