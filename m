Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D292A523
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 16:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D1310E1B8;
	Mon,  8 Jul 2024 14:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dF6QKyWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510610E1B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 14:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A70060E15;
 Mon,  8 Jul 2024 14:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B657EC116B1;
 Mon,  8 Jul 2024 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720450325;
 bh=YERbyHj9XHJH1vnRDd/SgiY4nsJmsp/2GcWPpPbtfJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dF6QKyWybB4iV14aqAs6X/0kRJirLWH9Dhl/v5hDAlCJAOSythcdcW/1hnjlqE9sr
 R2BLQl75V9Jpad23dD0XD4vkDSO00IY0Lq4IPOJefvrygD1LD9H3ektcAkDLALaAfF
 wSWrhHLtj+xCOV5v3gyEmlfVkJklXM20RQomfWafNtYu959NdnZ9ex/38H+tuuIqf+
 WQsQeuzTFVYpK1tCgL1Cv5XK4YW61N5jcZnmDrHVmGFSD7yPGV6uyDsgnTIjzBlrqN
 H92ZBcigzizLyhOLAYBV/iyy3yKmGD4JBFF+1Do02uip0FG3mOuTeWkm7RCYv1DCSH
 NGBPJ616rRy0A==
Date: Mon, 8 Jul 2024 16:52:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de
Subject: Re: [PATCH 02/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Message-ID: <20240708-mega-nautilus-of-champagne-cd4be6@houat>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-3-victor.liu@nxp.com>
 <cd558335-6e72-46d1-911b-68ccbb211136@kernel.org>
 <b9583c86-b5ed-4642-9baf-2ac850656ee3@nxp.com>
 <eda90514-e40c-4edd-8c15-18717a5e9784@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hwztwzscqtxaisoz"
Content-Disposition: inline
In-Reply-To: <eda90514-e40c-4edd-8c15-18717a5e9784@kernel.org>
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


--hwztwzscqtxaisoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2024 at 04:04:21PM GMT, Krzysztof Kozlowski wrote:
> On 08/07/2024 08:40, Liu Ying wrote:
> >>> +
> >>> +  "^framegen@[0-9a-f]+$":
> >>> +    type: object
> >>> +    additionalProperties: true
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: fsl,imx8qxp-dc-framegen
> >>> +
> >>> +  "^gammacor@[0-9a-f]+$":
> >>
> >> This looks like you are organizing bindings per your driver architectu=
re.
> >=20
> > As I mentioned in cover letter, this series addresses Maxime's
> > comment for the previous series - split the display controller
> > into multiple internal devices.  Maxime insisted on doing this.
>=20
> But these are not separate devices. Look:
> 1. parent DC:
> reg =3D <0x56180000 0x40000>;
>=20
> 2. child interrupt controller:
> reg =3D <0x56180040 0x60>;
>=20
> That address is within parent.
>=20
> 3. Then we go to things like:
> reg =3D <0x5618b400 0x14>, <0x5618b800 0x1c00>;
>=20
> Still within parent's range and just few words in address range. That's
> a clear indication that you choose few registers and call it a "device".

That's never really been a metric though?

If not, one could just create a "soc" device node covering the entire
register map, and since it would overlap despite clearly defined
features, you would claim it's a single device?

Maxime

--hwztwzscqtxaisoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZov9DgAKCRAnX84Zoj2+
dkUHAYDd6QPLRCe/rIwamlM0RQXWTfISioM+Bfl577L8uSU4MMjj3TeJBgCqmeVK
LJ0ey5QBf2qzE6bXOEcjZgciImlWol3ZdG7vHmEWfdiqGRQY4lQA+t9T11YMNhVe
hA01YtfCWQ==
=lXFJ
-----END PGP SIGNATURE-----

--hwztwzscqtxaisoz--
