Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E8711094
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DF110E6B9;
	Thu, 25 May 2023 16:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8F10E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:12:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 253DF64758;
 Thu, 25 May 2023 16:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66545C433EF;
 Thu, 25 May 2023 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685031123;
 bh=eGwbDp7GXLadDVneGLrHlJAsKXAAFdJ2QiGxjfTabbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IxidsszBRPguHI81Nrqgyg+PAPcJOt3TiumrloR5YDGscvCz+VunNxEx/Wv6qIgSp
 rUDCv1bUuOyqUkrFJWBRdjWpSPDaKK0YuAfwFOqDXtspsCTRoznmTrNq2EoHFriG8T
 TezQJsczQzq9lMXz7t5ulUCJWNCTgOSElTN2RAA4CBfgUuyZ+5KH/sFWMtH+ucPJBB
 xZ616Zp/Wh0N7ggA0H3+h4fG9C8ZGOBZggavFJVEDVFbiwRWjiaM5fGM2Ge7JAFLr2
 V9OQSP46Krk/xEqqnri/SCHRmjfJAem2SRcfgu4X5zw1MTGtkQWoBGRIwIHOjceFgs
 B0//walKKKRiA==
Date: Thu, 25 May 2023 17:11:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230525-extent-osmosis-8d99bf7a780b@spud>
References: <1684969313-35503-1-git-send-email-justin.chen@broadcom.com>
 <1684969313-35503-3-git-send-email-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gQWeSQ/Xh494+0MG"
Content-Disposition: inline
In-Reply-To: <1684969313-35503-3-git-send-email-justin.chen@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com, kuba@kernel.org,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gQWeSQ/Xh494+0MG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 04:01:49PM -0700, Justin Chen wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
>=20
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
>=20
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
> v5
> 	- Fix compatible string yaml format to properly capture what we want
>=20
> v4
>         - Adjust compatible string example to reference SoC and HW ver
>=20
> v3
>         - Minor formatting issues
>         - Change channel prop to brcm,channel for vendor specific format
>         - Removed redundant v2.0 from compat string
>         - Fix ranges field
>=20
> v2
>         - Minor formatting issues
>=20
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 149 +++++++++++++++=
++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/D=
ocumentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> new file mode 100644
> index 000000000000..c4cd24492bfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom ASP 2.0 Ethernet controller
> +
> +maintainers:
> +  - Justin Chen <justin.chen@broadcom.com>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +
> +description: Broadcom Ethernet controller first introduced with 72165
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 1
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - brcm,bcm74165-asp
> +          - const: brcm,asp-v2.1
> +      - items:
> +          - enum:
> +              - brcm,bcm72165-asp
> +          - const: brcm,asp-v2.0

Sorry if I did not notice this before, conventionally compatible goes
first here. IFF there is another version, could you shuffle things
around? Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--gQWeSQ/Xh494+0MG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG+IzAAKCRB4tDGHoIJi
0t8LAP0XPuVe8Xv0rC6URYPWMiOetvVlRcErsx5TLDNGuD0U8AEA8RUP6BvGw9Pv
QWlVEE3X8asJ36V2w/7bvKuygsBc2wQ=
=IMJt
-----END PGP SIGNATURE-----

--gQWeSQ/Xh494+0MG--
