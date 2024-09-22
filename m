Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CB597E0E7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 12:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0710E209;
	Sun, 22 Sep 2024 10:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="KhKdHH4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CF10E209
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 10:33:17 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1727001195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rh5mxOysEWdlr7zB3dIq9Xe2btAHsCpup+ruaFZk4EM=;
 b=KhKdHH4ObK+KAa3ylcl/wZq36CKLW9XGQbMTs3L/PVLTKtzN6mah6aJfCG38zpVnZ9+WWU
 FN9Yu0Uj7sgJ7XXprTjbI6UVwNg5ynCR49Xon30JpoX3Pxd/H16jLNAZjzSA9ERIyqS5Qr
 CledCoNU9+F591nNaaPK/hIx5LBdCDNLDxO/HLUEkmD4RTm6EOdcNuxs9Y2atEyUD1lIWx
 BsooqPkyy/7oHJbcCdkfIJ4YWK+wlfinkjt7sOSXt22w1uRBqecWy0Mt9YeQHONeYEtB95
 OGSa+w1znwU/9ks2KwjbP9CZgwfMUwuASQshHjGt3NgnA2w1dMNLr63HdNHLDQ==
Content-Type: multipart/signed;
 boundary=cf4d01d20a3b9d5a9a49968868fe9e6d1f0f8308e15edb5bdb79c6fb1446;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sun, 22 Sep 2024 12:33:05 +0200
Message-Id: <D4CQTRYUPQHL.1Y42CT0P8ZOWQ@cknow.org>
To: "Andy Yan" <andyshrk@163.com>, <heiko@sntech.de>
Cc: <hjc@rock-chips.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <derek.foreman@collabora.com>,
 <minhuadotchen@gmail.com>, <detlev.casanova@collabora.com>, "Andy Yan"
 <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 06/15] drm/rockchip: vop2: include rockchip_drm_drv.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20240920081626.6433-1-andyshrk@163.com>
 <20240920082122.6742-1-andyshrk@163.com>
In-Reply-To: <20240920082122.6742-1-andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
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

--cf4d01d20a3b9d5a9a49968868fe9e6d1f0f8308e15edb5bdb79c6fb1446
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 20, 2024 at 10:21 AM CEST, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>

Maybe ``From: Min-Hua Chen <minhuadotchen@gmail.com>``?

It's very minor and Min-Hua gave their 'Reviewed-by' tag to your patch,
but they found the problem and I thought it was just for practical
reasons you made it part of this patch set.

> Move rockchip_drm_drv.h in rockchip_drm_vop2.h to fix the follow
> sparse warning:
>
> ARCH=3Darm64 LLVM=3D1 make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDI=
AN__'
> mrproper defconfig all  -j12
>
> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
> warning: symbol 'vop2_platform_driver' was not declared. Should it
> be static?
>
> It is also beneficial for the upcoming support for rk3576.
>
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
>
> ---
>
> Changes in v3:
> - Split it from 10/15, as it fix a exiting compile warning.
>
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 4776a227e62c..a7f9f88869a6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -35,7 +35,6 @@
>  #include <uapi/linux/videodev2.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> =20
> -#include "rockchip_drm_drv.h"
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_vop2.h"
>  #include "rockchip_rgb.h"
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.h
> index 59cd6b933bfb..bc001f715847 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -9,6 +9,7 @@
> =20
>  #include <linux/regmap.h>
>  #include <drm/drm_modes.h>
> +#include "rockchip_drm_drv.h"
>  #include "rockchip_drm_vop.h"
> =20
>  #define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)


--cf4d01d20a3b9d5a9a49968868fe9e6d1f0f8308e15edb5bdb79c6fb1446
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZu/yZAAKCRDXblvOeH7b
bhyOAQCgfugbYkLTEQoVYnYjY2LIP0tmj3SFSFrsw3hSRtqOHwD/cMGxEu1QU1Nj
DLQj4kuQxg314p3e5CtjLIAFUNlzLQI=
=a3i5
-----END PGP SIGNATURE-----

--cf4d01d20a3b9d5a9a49968868fe9e6d1f0f8308e15edb5bdb79c6fb1446--
