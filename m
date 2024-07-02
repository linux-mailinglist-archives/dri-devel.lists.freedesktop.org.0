Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9560924113
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F3E10E5FE;
	Tue,  2 Jul 2024 14:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P7uH0Kax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB610E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:42:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B08C561B9D;
 Tue,  2 Jul 2024 14:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F544C116B1;
 Tue,  2 Jul 2024 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719931371;
 bh=V0uekJLLnO8HH1U4kVAv/bV1cAEF38ni3DMFNyDOaPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7uH0KaxSF/k9vKRkI88LOipINDeNnpeDsRw2riJqFWEdjsJlqjPdmhj7OTigUjyt
 XF5cIQPDeaPw+JiwmRzIdhIsLE21xNfbfn/x/gzM5CYGlpJMo921XfbHkaqAH77sti
 yQiS1QgDRvj1a+vfhxSIPyuHd0axFp9xEMpAFOLdkc0IjpwvkFXN0g7dodkOQ1NJGI
 3pqQvD4ybnm31VrW9Msm9tEHliqwBng5lt4qzT/KM7hsa8ma2KH31gBoAUYfyEhVTn
 +qkaWprfYELD0BwYBM3ON5zVG6VFw8Cqfg9SnF7DEeagPTIAXQnOda3j5dB+OTv5H5
 FlF2Z+7/KR5lw==
Date: Tue, 2 Jul 2024 15:42:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add compatible for
 melfas lmfbx101117480
Message-ID: <20240702-unplanned-oat-b4757f618539@spud>
References: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
 <20240702130138.2543711-2-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oHUFRZu9Gcv6C1ca"
Content-Disposition: inline
In-Reply-To: <20240702130138.2543711-2-yangcong5@huaqin.corp-partner.google.com>
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


--oHUFRZu9Gcv6C1ca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 09:01:37PM +0800, Cong Yang wrote:
> The Melfas lmfbx101117480 is a 10.1" WXGA TFT LCD panel with jadard-jd936=
5da
> controller. Hence, we add a new compatible with panel specific config.
>=20
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oHUFRZu9Gcv6C1ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQR5gAKCRB4tDGHoIJi
0lP/AP9hjJ3cSdPG0aEpu2VcKOIuGrQ1XIWAreUik6m9rgLemwEApSrqFpUqtJ23
JH+naFm1JeFIQn25OcRek7vQecXFLwg=
=MFC5
-----END PGP SIGNATURE-----

--oHUFRZu9Gcv6C1ca--
