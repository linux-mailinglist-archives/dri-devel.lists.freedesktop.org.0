Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C779317A3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22B410E330;
	Mon, 15 Jul 2024 15:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V6T85qz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBEB10E330
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:31:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B918F60BA2;
 Mon, 15 Jul 2024 15:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C4CC32782;
 Mon, 15 Jul 2024 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721057516;
 bh=siv179GxtAnDGBBlaJJzeBtfyYpYJ/nI4Rg+Brcy6wM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6T85qz4XFtXHUN4p1FTpcjzvJu+RdeIVt89kxB+SQbX9w9TGCmjSsI+RK/RJa5N/
 ZRVvElOVnzk4co2EGVmbetO6JbU7T0lEM15kKhHJMTaHalOiYFo5vBbxOaDPOXtqiH
 GNWeJTGHST++3Y2qTVVnuzhn3eLV17Dcmfyw3zmFileVaCg+bV0O6MCqeiCsF/P+Cp
 UEzuVUWlRg1e6ok6UB86Ec7xyl+qm5f7Q0HGRgMaYu1zEEeYZWEwUEC0rzXY2Ob5vF
 8tk5ch6NNVeuKwxXphTrs6ZT93FWlTMUdCdO3BphfXfhuQKEZaumetON/Mdt184Vvp
 ZgCPc6YA7nTeg==
Date: Mon, 15 Jul 2024 16:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <20240715-scorn-canning-a7f23b9e2039@spud>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PGPY0L/uV9VV1R85"
Content-Disposition: inline
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
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


--PGPY0L/uV9VV1R85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>=20
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
> Use the existing "samsung,atna33xc20" as fallback compatible since existi=
ng
> drivers should work as-is, given that resolution and size are discoverable
> through the eDP link.
>=20
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PGPY0L/uV9VV1R85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVA5wAKCRB4tDGHoIJi
0g1+AQC1TYeQhL78aVmae/bbIeS87fROp/400N/NvEFiEGltuwD+LfPcF+qGTN+D
tZeky3VyyMG7F0Xqx5tCLLcl7Dm2tgQ=
=dlyh
-----END PGP SIGNATURE-----

--PGPY0L/uV9VV1R85--
