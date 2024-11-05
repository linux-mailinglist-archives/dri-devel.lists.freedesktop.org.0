Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BD9BD408
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1C1882D0;
	Tue,  5 Nov 2024 18:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L8G1C9oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20DA10E42A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:03:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CFA65C53C2;
 Tue,  5 Nov 2024 18:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6341C4CECF;
 Tue,  5 Nov 2024 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730829838;
 bh=8+cIHaDK/PkRLZQNzEkaeipacB3Q8GDm8j9Yz0buIQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8G1C9oo+hPHLWRYPvwmxqqVWfHAG4XeiZuNblLd111x+Q1yzSS+pJOqgM8/6hOP2
 O6thypMRrVz2WVEA24bcBHBMuR9V1vAzyt0HK6k8y+1ektuHJ9JSNhqxgTE9U5PZWX
 Rh0lHZ1hOHE+03rczdO2u4fjZGRbJcAa1Tq/pUWbtbNWyqkQ3n4RlUO+hQOtnYFJxS
 eVBZNlk8JwRT59FtFGMvz5eObS/DEFzf1JAMQd0jAXIZnCYN6zwNjZAqlxfVa+I+yP
 YBKoHvubYo0TbL/ynmb06QAsnQbzrqFKBJOeHXxUsdMR1UnPIrVs0u4tybuS9zIUZ1
 UxJlWTmX1IUSg==
Date: Tue, 5 Nov 2024 18:03:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20241105-sulfite-justness-d7b7fb98905c@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xQXEB5mU2yf0jpDO"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
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


--xQXEB5mU2yf0jpDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:14PM +0000, Matt Coster wrote:
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <3>;
> +
> +        gpu@4e20000000 {
> +            compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img=
-rogue";
> +            reg =3D /bits/ 64 <0x4e20000000 0x80000>;

Can you format this normally please? Drop the #address/size-cells down
to 1 if you're against having 0x0s.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> +            clocks =3D <&k3_clks 130 1>;
> +            clock-names =3D "core";
> +            interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +            power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> +                            <&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> +            power-domain-names =3D "a", "b";
> +            dma-coherent;
> +        };
> +    };
>=20
> --=20
> 2.47.0
>=20

--xQXEB5mU2yf0jpDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypeCAAKCRB4tDGHoIJi
0rKRAQCPc+IctwmoZoddo4GAQ3JphX1ttBvWgJigLa3DJ8BDkgEA3T1r9hN1I0La
vZrB0DbYFGc/m61hAVWkIrElbvEhwwo=
=3MKw
-----END PGP SIGNATURE-----

--xQXEB5mU2yf0jpDO--
