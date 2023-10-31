Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07C7DD393
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4514210E499;
	Tue, 31 Oct 2023 16:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1622010E499
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:59:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1ABC6CE0B2D;
 Tue, 31 Oct 2023 16:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3984BC433C8;
 Tue, 31 Oct 2023 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698771561;
 bh=mKGcn7R4nOzJ/7bvetTvuYzWfcgcPLJRUybDiFHL370=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpFt7Pbl/emgwe30wMPCOP0nayL4uUkpaxty+FGoSU6Oy3UyNFtDughKPMyw47VZm
 v9dQ1vGg7XMFgwN2lMBFAc9SjWLBQMabMX+gOm30AkRFOpfmXz8C5opwQNk3I1Frwn
 ijxRfF+/8RTY0pHCGVi3BXv94yzBQwbAG32mZo2vysbXyrGpZ8ZjZx9xUx+zSoaqHh
 i1zlb6msZDBg8luJy7L6nsZFrYJuL+9fP3GZV4udCZ5v59GjpMqo1gWgswVvwvYFya
 fwGDtOaNcvIiprfvrkokVVnthRL62s1Ub8m0tdpoDBBBMSUp+YLDnxHxHXK82tDyV8
 MCLmDAbmpFG9Q==
Date: Tue, 31 Oct 2023 16:59:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Iago Toral Quiroga <itoral@igalia.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Message-ID: <20231031-replace-quit-ecac72d24414@spud>
References: <20231031073859.25298-1-itoral@igalia.com>
 <20231031073859.25298-4-itoral@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MQiHgOyvs+Jhp68k"
Content-Disposition: inline
In-Reply-To: <20231031073859.25298-4-itoral@igalia.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maira Canal <mcanal@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 kernel-dev@igalia.com, Rob Herring <robh+dt@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--MQiHgOyvs+Jhp68k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 08:38:58AM +0100, Iago Toral Quiroga wrote:
> BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
>=20
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Reviewed-by: Ma=EDra Canal <mcanal@igalia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Do=
cumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index dae55b8a267b..dc078ceeca9a 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - brcm,2711-v3d
> +      - brcm,2712-v3d
>        - brcm,7268-v3d
>        - brcm,7278-v3d
> =20
> --=20
> 2.39.2
>=20

--MQiHgOyvs+Jhp68k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUEyYQAKCRB4tDGHoIJi
0nE7AQCw52kEthThrebujTTdNRQoLFnQMoyxvp6Kqz+KGrkVPgEA76dMVeuKHaHR
yNPSGG+N5t5tbpksMET+arL/A/vbegI=
=6UGw
-----END PGP SIGNATURE-----

--MQiHgOyvs+Jhp68k--
