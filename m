Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3BAD7630
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E77610E88A;
	Thu, 12 Jun 2025 15:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z76ZSExR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBE710E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:32:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 921694A06B;
 Thu, 12 Jun 2025 15:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08E2C4CEEA;
 Thu, 12 Jun 2025 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749742367;
 bh=ph6Qm/Zu8qima9WKxdl5cyVv5qHWsu81Bj3LUOBhyKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z76ZSExR2NJPvxfNLitwVNJ5/gkyfINE0FpXuI7C7oGqvl8Zn1ZyMS/9uVC2IpR3X
 09bfN1i2mar7nJEWgySKEKpoTa/nTnNwSkqxfk70ftJo5X8GIHAU5VswfQVQIOz1+l
 8NtZ2bjR6isp5W7bsPpmVofipF2S4kMB/mgB8W814UthCVjfFGusQE032+AC6ap4QG
 vk0U/oSHFQMh+cJlifm4SNJAn4BclvKe0pCgcPapGFPk5ATt3WZTA20wZD+p+FM6v0
 gwalPJTCRN8jwH0Ji6T1iAlMgO/zBMWQ4cL7Azo29AIBQHj2KqHbKJbi1Zm4psxM9k
 mTPuIUKuwqlog==
Date: Thu, 12 Jun 2025 16:32:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
Message-ID: <20250612-agency-mothball-3830177fd43b@spud>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
 <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VDw7BB0FAKwf3bbg"
Content-Disposition: inline
In-Reply-To: <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
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


--VDw7BB0FAKwf3bbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:09:40PM +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/panel/synaptics,tddi.yaml     | 92 ++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td=
di.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d3b5=
4f74cdf634f7fa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.yaml

File called synaptics,tddi

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#

id of samsung,tddi

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TDDI Display Panel Controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - syna,td4101-panel
> +      - syna,td4300-panel

compatibles are syna,td####-panel

These should be consistent and tooling should have complained about the
mismatch between id and filename at the least.


--VDw7BB0FAKwf3bbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzGgAKCRB4tDGHoIJi
0h3oAP9CB4FuHC6Rw0Tmtlumy5MJLtCuVVJfVPJHDzHi2EHfSwEAj7OX7AU+mI7c
+Vxcu5Bly5SfP5x+z5e0plVKW4Jh6Qk=
=2rxw
-----END PGP SIGNATURE-----

--VDw7BB0FAKwf3bbg--
