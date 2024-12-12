Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB09EF1F5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA94E10E28D;
	Thu, 12 Dec 2024 16:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="eq7CyMIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3D410E28D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1734021817; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Eg1TAiHA9XbZsme+uZY5ml6iDY9ReqL+1uG2J3hjRWhX+nkkhXjncuR/TlGO2ZAjglexPbMovNDDtwyUkcMMKvDSIyevuUNnT6Cr3AM6B+EceD+/dv4x38136Js4o2ukImxQ+4FL8kgcGOkj9PKlGTLRAz4PeCeAkRUIhvP9OnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1734021817;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OqGAa1pJnfeBRX6NwK1b4xo98HmIlAac7hOYyRw8teg=; 
 b=nwbsX5pK5OMEjoyV86vSukne/sAuaLNeLzFNzsE0zErRL1C5xBvdLdFVuwgta2gV7o+6+LoyFxFzqlnEe8Eer0VCTQSy84fiaw6mHxov2mg6RTBSspWb/2iv4vhgGyBB+TyiGVXjJ1GkzbTqYcVl9mNp7H4u1kuHkADqQ2BrBdg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734021817; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=OqGAa1pJnfeBRX6NwK1b4xo98HmIlAac7hOYyRw8teg=;
 b=eq7CyMIHalewnCBMVrDeFoewU93SM6J61l/JXFGtc42e2wn54KqYodBw3C2eSlz5
 L9UQxRXoY3pzdU47HkEyRFb8ku94N3oqorlZITwAjqAFONscOhaEkObxk7EgPTuOg4w
 2iE8EokQrrOsZQf+wg/pR7oE2fVHYCubzKgJUyVo=
Received: by mx.zohomail.com with SMTPS id 1734021814471104.20975911253777;
 Thu, 12 Dec 2024 08:43:34 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
 id 71F6210604B1; Thu, 12 Dec 2024 17:43:30 +0100 (CET)
Date: Thu, 12 Dec 2024 17:43:30 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: Fix Copyright description
Message-ID: <6btdoubtb7y6xrfjkry7axad5khphnwcwtbpar7cu4p4dcp6e2@3rha7k6q2xuc>
References: <20241212124344.3121514-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dw6ruy5jdxx73vxw"
Content-Disposition: inline
In-Reply-To: <20241212124344.3121514-1-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/233.870.20
X-ZohoMailClient: External
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


--dw6ruy5jdxx73vxw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/rockchip: Fix Copyright description
MIME-Version: 1.0

Hi,

On Thu, Dec 12, 2024 at 08:43:44PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The company name has update to Rockchip Electronics Co., Ltd.
> since 2021.
> And change Co.Ltd to Co., Ltd. to fix mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>=20
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c          | 2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c           | 2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-reg.h           | 2 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     | 2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c            | 2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.h            | 2 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 2 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.h          | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c      | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.h      | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h    | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c        | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.h        | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_rgb.c         | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_rgb.h         | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c    | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c     | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.h     | 2 +-
>  26 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 546d13f19f9b..02876eb66e94 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -2,7 +2,7 @@
>  /*
>   * Rockchip SoC DP (Display Port) interface driver.
>   *
> - * Copyright (C) Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author: Andy Yan <andy.yan@rock-chips.com>
>   *         Yakir Yang <ykk@rock-chips.com>
>   *         Jeff Chen <jeff.chen@rock-chips.com>
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index ff9d95e2c4d4..4b28121ffa42 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author: Chris Zhong <zyw@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rock=
chip/cdn-dp-reg.c
> index 33fb4d05c506..924fb1d3ece2 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author: Chris Zhong <zyw@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.h b/drivers/gpu/drm/rock=
chip/cdn-dp-reg.h
> index c7780ae3272a..13ed8cbdbafa 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.h
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author: Chris Zhong <zyw@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 1b64b6e39cc8..3398160ad75e 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:
>   *      Chris Zhong <zyw@rock-chips.com>
>   *      Nickey Yang <nickey.yang@rock-chips.com>
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/dr=
m/rockchip/dw_hdmi-rockchip.c
> index 42bda4ffbbbd..e7a6669c46b0 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
> + * Copyright (c) 2014, Rockchip Electronics Co., Ltd.
>   */
> =20
>  #include <linux/clk.h>
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockc=
hip/inno_hdmi.c
> index b58e2a29294b..898d90155057 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   *    Zheng Yang <zhengyang@rock-chips.com>
>   *    Yakir Yang <ykk@rock-chips.com>
>   */
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.h b/drivers/gpu/drm/rockc=
hip/inno_hdmi.h
> index a7edf3559e60..8b7ef3fac485 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.h
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   *    Zheng Yang <zhengyang@rock-chips.com>
>   *    Yakir Yang <ykk@rock-chips.com>
>   */
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index b0fc8ace2e41..403336397214 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   *    Zheng Yang <zhengyang@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.h b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.h
> index 39a31c62a428..c3598ba7428c 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.h
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   *    Zheng Yang <zhengyang@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index 3e9f590c734e..bf1d4c5599fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   *
>   * based on exynos_drm_drv.c
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.h
> index 24b4ce5ceaf1..8bcce08a34d9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   *
>   * based on exynos_drm_drv.h
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_fb.c
> index cfe8b793d344..dcc1f07632c3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h b/drivers/gpu/drm=
/rockchip/rockchip_drm_fb.h
> index bae4e079dfb1..5179026b12d6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.c
> index 93ed841f5dce..6330b883efc3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.h
> index 72f59ac6d258..cdeae36b91a1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 69900138295b..57747f1cff26 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.h
> index 0cf512cc1614..f04c9731ae7b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.h
> index 2995988ef559..ca3f1613d51c 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index aba733736ff7..385cf6881504 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:
>   *      Mark Yao <mark.yao@rock-chips.com>
>   *      Sandy Huang <hjc@rock-chips.com>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.h
> index 4ce967d23813..ca83d7b6bea7 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:
>   *      Sandy Huang <hjc@rock-chips.com>
>   *      Mark Yao <mark.yao@rock-chips.com>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/ro=
ckchip/rockchip_rgb.c
> index dbfbde24698e..811020665120 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:
>   *      Sandy Huang <hjc@rock-chips.com>
>   */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.h b/drivers/gpu/drm/ro=
ckchip/rockchip_rgb.h
> index 1bd4e20e91eb..116f958b894d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_rgb.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:
>   *      Sandy Huang <hjc@rock-chips.com>
>   */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/d=
rm/rockchip/rockchip_vop2_reg.c
> index 4ee56ad7b811..cbabec73685b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author: Andy Yan <andy.yan@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/dr=
m/rockchip/rockchip_vop_reg.c
> index 8998967f0c00..4e2099d86517 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/dr=
m/rockchip/rockchip_vop_reg.h
> index fbf1bcc68625..addf8ca085f6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (C) Rockchip Electronics Co., Ltd.
>   * Author:Mark Yao <mark.yao@rock-chips.com>
>   */
> =20
> --=20
> 2.34.1
>=20

--dw6ruy5jdxx73vxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdbEqcACgkQ2O7X88g7
+ppMPQ/9G7xzXPLqAASevfZS5iTaIb1ist82+qkRrwkMdQWcrfl2wl3q0mW3g6fs
QUeAbCZHg2tSFw7qpXLGK84qcTE8kxCF5Wu26CrVzhYf0TPi+EKzS4W7XGAroMce
J4ztxf7idCVTNfsPQX2bOTS0h6J3e3zc7M4PnWvVxtwvNH20SO7M3zgV42h01jRJ
LSoznilT1z/jTRcSCQS1HWZGc3ZMpHhnnhHT1LjeM2evK7DgY7hgmvPtgDaldvb4
slnVT5NxlBbE6Y+7mbx9skqCNkyH3AUMZTqGVRMmuNHAKq7fFdQVw4w1Xb5i9Pk1
HpqQHL+G58PUdp2NOnwG7cFbmmAW+R3gibXQdnruZVWtcsGG2Te7RQT423Nm2pXy
rhUEOfEkicvnn0CQPPJXWZwZNFC07u6IbcJmBFiJQepWQD/qvUVe3EtUJxRRPWsP
GaAsTxulDbfUK04TY8gS2hQ0jOBbmf0oCahzVu9m0lQxgUCGQfyWnagnn+0fiErd
2/OhJWq5W1/eCs2MHcm4/7JZE/Jf6WHfy+fP+z41hmARdRuRI4/eEtNoexIWj3EG
HOx2R8Y2pvHrPeRh3Kdzhkdt7tfrFrjVSbtiVaiRqitGNWA4fDKtu0np4cpqkFeI
SWn3TZ7aGIssANZ9wJGgLnbBfnwE6ikhNL3k5/glIDKaMMsIqU4=
=T+ps
-----END PGP SIGNATURE-----

--dw6ruy5jdxx73vxw--
