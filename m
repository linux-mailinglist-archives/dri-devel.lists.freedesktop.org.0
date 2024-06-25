Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B9916D41
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 17:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D5610E0DA;
	Tue, 25 Jun 2024 15:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ViykpSLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081B510E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 15:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39E0ACE0C70;
 Tue, 25 Jun 2024 15:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D80C32781;
 Tue, 25 Jun 2024 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719329940;
 bh=dUBsdZ1Ffp2FMc8opFAfAMlgqjXCdPeVDof+n2Ao34Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ViykpSLUv2GTcqmbjuZsojeUGxHop0KOWrf2OnFQ7ZrbICC81/11nMvpCVoBUFF+0
 xDXqOywcAxC1tVMBaTdM3SbVBtnM8jvOiLPshqrDViDb+MQmu+m35T/bGV9TFw0ZTC
 uulPfbaM5nHYmBP3/wIGcOk8UcuAuAa2d7SFAx4HWaa/wCw3BCBU5CdqHGlhqYvyb7
 RwAva+6x0pmvRgnXvTdBZKy8E6jIbpK43TjncXo2JIGCZ06CADlWT8i40n4JtXKmsa
 nzn5K0CyjIvePAa1YBlpaDkZpRzffkzNVObIdC3Jan+uLT9+c3t4M0o/rmuLzxiKRA
 jSEHQfJc1UYfw==
Date: Tue, 25 Jun 2024 16:38:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: megi@xff.cz, javierm@redhat.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Message-ID: <20240625-handbook-shifting-33a4e2afafed@spud>
References: <20240625090853.343176-1-manikandan.m@microchip.com>
 <20240625090853.343176-4-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oc/mUvdTE/WRO0dB"
Content-Disposition: inline
In-Reply-To: <20240625090853.343176-4-manikandan.m@microchip.com>
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


--Oc/mUvdTE/WRO0dB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 02:38:52PM +0530, Manikandan Muralidharan wrote:
> Add compatible string for the Microchip's AC40T08A MIPI Display
> panel.This panel uses a Himax HX8394 display controller.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 017cb19ed64f..d547df794b3b 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - hannstar,hsd060bhw4
>            - powkiddy,x55-panel
> +          - microchip,ac40t08a-mipi-panel

Please add this in alphabetical order.

>        - const: himax,hx8394
> =20
>    reg:
> --=20
> 2.25.1
>=20

--Oc/mUvdTE/WRO0dB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrkjwAKCRB4tDGHoIJi
0lHLAP4jPvghkIWyNWvSSHInLh0BBhPbvHViDgxeqPURF0crywEArnZvEXID4+LU
fgUf9SVoX5nVOaaAAh4C17iUASQfBgw=
=WeoJ
-----END PGP SIGNATURE-----

--Oc/mUvdTE/WRO0dB--
