Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D578073C1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E006310E0C7;
	Wed,  6 Dec 2023 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9CB10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:34:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22A6561D2B;
 Wed,  6 Dec 2023 15:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E670BC433C7;
 Wed,  6 Dec 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701876852;
 bh=hPHCkdX1ET5Jtv730lF03I1kmrpFGMe1NR1cfWm/WBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OXJ21r8woFaoM8DgT2zJOsPJEXAUdc+g4aXZ1BLaqa+oyR8uLgGmyk8FG8nRv17K8
 UAPKKegcfWTrWENL4pEPjZA3+j442Qtzcyu4V2hGLIqN01tFG8JByvfNUJDXitUu6r
 azyhNeG2H59E0MVhUJnm5k+UnLqKBgsSBFaSy7u1CeTdnTyrBEfxi4Xf1owJ7OO58Z
 s9I1Q/xUOcTTKuYYkU1U/DtsU1kM/BSFlBqjClviKDYsNz7lGQ9ZluKIgbNGRBSVNT
 QYmaio5Din3nuebZBzRg3Ambc75SwYpgJP7UyIM5kG20Vs/taIgh6clLSk4gagEBa1
 Y76BhOsHjTcoA==
Date: Wed, 6 Dec 2023 15:34:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: lcdif: Properly describe the i.MX23
 interrupts
Message-ID: <20231206-anemia-struggle-d1acb20e7892@spud>
References: <20231206112337.2234849-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="02enDpb16aWiP5pC"
Content-Disposition: inline
In-Reply-To: <20231206112337.2234849-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--02enDpb16aWiP5pC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 08:23:37AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> i.MX23 has two LCDIF interrupts instead of a single one like other
> i.MX devices.
>=20
> Take this into account for properly describing the i.MX23 LCDIF
> interrupts.
>=20
> This fixes the following dt-schema warning:
>=20
> imx23-olinuxino.dtb: lcdif@80030000: interrupts: [[46], [45]] is too long
>         from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.=
yaml#
>        =20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--02enDpb16aWiP5pC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCUcAAKCRB4tDGHoIJi
0nscAP9xdf5mmsGIlSMHPRUil8FWsAa06XmjjQY6LDTdtZaIpQEA62YyxIv+K5EA
ZvBZBmhTY1+NdOVODYCezQBVkvbHVgk=
=VO9Z
-----END PGP SIGNATURE-----

--02enDpb16aWiP5pC--
