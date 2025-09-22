Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D711B8F48F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE710E3C3;
	Mon, 22 Sep 2025 07:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SdgKRW2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845310E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:25:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F65344D2E;
 Mon, 22 Sep 2025 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C390C4CEF0;
 Mon, 22 Sep 2025 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758525920;
 bh=bNTfL5I1HrJwgg3RyucnAg9Ny8UlD82CDsINuJPuY4A=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=SdgKRW2IVYV/lYDUogSBPykH4MHszba5CItDyw9gRgpyMnwwTCxXa3jZ3HtZvXwXe
 /vKehzFEdN7eV6vYCwpmA6iWDc4YEZEsdMiW3k2xZ3UVNHVbjnH5OHUWa44z0DWpuW
 pZ9iqV3JNI6BYDfrk6it6Wo8b8QkJDziYWCXCvS/OcqgUgAxaXqY4ugZ5ofQ2YrJil
 ItSxi9QAZtemn4QyX/RdQVo+rZ76fvXBCkLsTeq9ZwwyR0jSOAfvPKZf5UHQI9ZFLt
 7nAHrZbq1yZyaISv/tndXRg24jCZp1jeWaNy7nUrTMEl5SW4blj/8QTb4mk2y8Rzh9
 FoVqGJH6uOovQ==
Content-Type: multipart/signed;
 boundary=c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 09:25:16 +0200
Message-Id: <DCZ5ETIF2Z99.39M5HLYLNMX44@kernel.org>
Cc: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <detheridge@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <rs@ti.com>, <afd@ti.com>, <conor+dt@kernel.org>,
 <frank.binns@imgtec.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
 <matt.coster@imgtec.com>, <nm@ti.com>, <robh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
X-Mailer: aerc 0.16.0
References: <20250919193341.707660-2-rs@ti.com>
In-Reply-To: <20250919193341.707660-2-rs@ti.com>
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

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Update the memory region listed in the k3-am62p.dtsi for the BXS-4-64
> GPU to match the Main Memory Map described in the TRM [1].
>
> [1] https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf
>
> Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> Requirement for the following series:
> https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

On a am62p. am67a/j722s works fine.

>  arch/arm64/boot/dts/ti/k3-am62p.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/t=
i/k3-am62p.dtsi
> index 75a15c368c11..dd24c40c7965 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> @@ -59,7 +59,7 @@ cbass_main: bus@f0000 {
>  			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripher=
al window */
>  			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* Main CPSW */
>  			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x01d20000>, /* Second periphe=
ral window */
> -			 <0x00 0x0fd00000 0x00 0x0fd00000 0x00 0x00020000>, /* GPU */
> +			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
>  			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripher=
al window */
>  			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
>  			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00010100>, /* CSI window */

Given the fact that the GPU node is in the shared
k3-am62p-j722s-common-main.dtsi:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaND53RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jFAgF+PRlVCLYRS7Z0WBq8MkC/8ZmN0RukErWq
OLIEtPIP2HDzCjlfuNJy65XicaYdlNNRAYCLD6F0UYmahHelXHb5Ogh9DeW75zXx
CKsxLOTz+GKkE4PClxcfbsUQWqVCAqtqs04=
=4KGH
-----END PGP SIGNATURE-----

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8--
