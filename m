Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33C7B5216
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEDD10E293;
	Mon,  2 Oct 2023 12:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34210E293
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 12:04:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1FA5BB80E9B;
 Mon,  2 Oct 2023 12:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98808C433C7;
 Mon,  2 Oct 2023 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696248265;
 bh=t/JoZKBtiCmunUvWnl+umF9d9R9RF5wZ0yG+OcRgIzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LikAXwdfSRngVjW00SxTTaGA9D2gis2qmIOVDdqSX1cn7TgcY7VpLVxPKeAY3Uh9S
 1GIE16alLVrBDc47cLiNQRn9HAEXZhfMjhU11VQhEgB03NwZxmrhPejpDZAzVF1kAB
 j9jOHDMWssc0CafOoS2Ih+fhh42U/0GOFi54FGFDsg7t1OQA9AnHJ8aBoQpFe7gSk6
 kGQA5qRQ7ohIbyUeoObiUCJ3WxW35TraoevXAPCLih1YJh/VnzD9PdIZscUHCgTp58
 HL1k9ykCmUWwnsaJGqN6jbxWvfYYTE9nx9oP9QPtLwnIXporllzBlpDtaEuDIE+t6X
 mJkgWLLgpoGdw==
Date: Mon, 2 Oct 2023 13:04:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: fsl,imx6-hdmi: Change to
 'unevaluatedProperties: false'
Message-ID: <20231002-reversing-huntsman-55f9ab2d8108@spud>
References: <20230930130102.798822-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LraE7CjsrwJNOYcR"
Content-Disposition: inline
In-Reply-To: <20230930130102.798822-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LraE7CjsrwJNOYcR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 10:01:02AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> fsl,imx6-hdmi.yaml makes a reference to synopsys,dw-hdmi.yaml.
>=20
> The 'interrupts'and 'reg' properties are described in synopsys,dw-hdmi.ya=
ml,
> so use 'unevaluatedProperties: false' so that these two properties can
> be accepted.=20
>=20
> This fixes the following schema warnings:
>=20
> hdmi@120000: 'interrupts', 'reg' do not match any of the regexes: 'pinctr=
l-[0-9]+'
> from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.=
yaml#

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.=
yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> index af7fe9c4d196..7979cf07f119 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -87,7 +87,7 @@ required:
>    - interrupts
>    - ports
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> --=20
> 2.34.1
>=20

--LraE7CjsrwJNOYcR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqxxQAKCRB4tDGHoIJi
0kpqAQCvouSSJ598ztgMpCb10c5uqqsUXnRT+B9zedetLA4AMgEAu/7rRAVCillx
Z7HyaEMVJQ29wAWDRITfQY71IUij+w4=
=GK57
-----END PGP SIGNATURE-----

--LraE7CjsrwJNOYcR--
