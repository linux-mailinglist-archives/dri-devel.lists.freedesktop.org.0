Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8AA56C2E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9910EBC6;
	Fri,  7 Mar 2025 15:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ReTwye1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183F010EBC6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 15:33:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5E89A44D18;
 Fri,  7 Mar 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B70C4CED1;
 Fri,  7 Mar 2025 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741361626;
 bh=/8G731r/9zVK2cgbL3Wu2RrfDupfpYfNtUS7AyBXLFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ReTwye1mXmyF6GpfQCIWUOALaK0prXPUj/2+2PgnHcmYtGY7IkdpTO2AhskQZb3Ki
 wNbSeFPuyS55PYZ4/eAdERkgeC/mF/rnlkqKYDfBOgT3t6cPgmF3dOGUIVjdQ80Vci
 vnO+V8Xc3C8gwMQ4QNLk6AiB1s1WGTutwdLvVtmMjvnQ5PkV6vU3pD6ryQ3OPVJNiI
 FLOSMj2e8mPTIV5VbmtfrYzYvdq8tI/l1hrFx3h/rTVB88EQ/oZ6c5p8PSlmye9Pk1
 vWcvcqIYRHNTTO45qTfOArVQouYceu3ZBu9XsGTXIylZ7LaEe6cBuFdUw6bgaCObw0
 hy0R+pwKJih9g==
Date: Fri, 7 Mar 2025 15:33:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Pu, Hui" <Hui.Pu@gehealthcare.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: simple: Add Tianma
 P0700WXF1MBAA panel
Message-ID: <20250307-tile-parasitic-604a675fe8e2@spud>
References: <20250307-tianma-p0700wxf1mbaa-v1-0-1c31039a3790@bootlin.com>
 <20250307-tianma-p0700wxf1mbaa-v1-1-1c31039a3790@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qerg8HnSeY8a+FU/"
Content-Disposition: inline
In-Reply-To: <20250307-tianma-p0700wxf1mbaa-v1-1-1c31039a3790@bootlin.com>
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


--qerg8HnSeY8a+FU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 03:54:47PM +0100, Luca Ceresoli wrote:
> Add the Tianma Micro-electronics P0700WXF1MBAA 7.0" LVDS LCD TFT panel.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index e3ee3a332bb7e1736a8d44773b0aef4873153be1..56b636560cbeb2277d65fce83=
916650de7ec4cbf 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -282,6 +282,8 @@ properties:
>        - startek,kd070wvfpa
>          # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LC=
D panel
>        - team-source-display,tst043015cmhx
> +        # Tianma Micro-electronics P0700WXF1MBAA 7.0" WXGA (1280x800) LV=
DS TFT LCD panel
> +      - tianma,p0700wxf1mbaa
>          # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
>        - tianma,tm070jdhg30
>          # Tianma Micro-electronics TM070JDHG34-00 7.0" WXGA (1280x800) L=
VDS TFT LCD panel
>=20
> --=20
> 2.48.1
>=20

--qerg8HnSeY8a+FU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sR1AAKCRB4tDGHoIJi
0gCLAP90Ydu+twouujWugpnx76CgrBd+/h0KxzXaRt0fjMaqJgEA8a2mFDWymeDP
WkSo/6vd5vc4LiYGVTmeZB2T8Whb8gE=
=NRmH
-----END PGP SIGNATURE-----

--qerg8HnSeY8a+FU/--
