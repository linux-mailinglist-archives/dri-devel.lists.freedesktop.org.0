Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C696EF31
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4196D10E043;
	Fri,  6 Sep 2024 09:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="Po95yllG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AFB10E043
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:28:41 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1725614919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=be7bi10a61hIs7OOh5j48QgrRwW9Uv9WavYfuDp8rzM=;
 b=Po95yllGLdAdag4YSuvzKSp6Qem9ZD9GNtMMojIPdfCiuv87PmBVVwQBQuoVlrs+z4AGAY
 xALn1S5D47Ni2L+F1dJ6QgXHx0eW3bOIzamOz57i0Dj0JxE0u3iHPpGaxME/JLpKpKOpjA
 AXPM6Xgy5HLcFUDP19Zs8FJlHYufM5wlfZPWgqp7fV93VjyrXUTvV1fFm2qhUsFMofx737
 +quHYGiji2cyFFIwoHxlARLUT65HVkMI1Nwv7aGI8MUMlqNTeUUUB/ExJHnFgfQJUaQz3v
 c0ovAdTDTDplpeMh9Deumn9Jmv+/0Dqs4W/NVrZeota3CSriNMutiN7vt2aoDA==
Content-Type: multipart/signed;
 boundary=90251523fbbd216b6fd8d265a28b65ea30f3d99c5d6460b75d286064d840;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 11:28:33 +0200
Message-Id: <D3Z3FN6GARPI.197HD3V38X81T@cknow.org>
Cc: "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Andy Yan" <andyshrk@163.com>, "Min-Hua Chen" <minhuadotchen@gmail.com>
References: <20240905223852.188355-1-minhuadotchen@gmail.com>
 <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
In-Reply-To: <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
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

--90251523fbbd216b6fd8d265a28b65ea30f3d99c5d6460b75d286064d840
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 6, 2024 at 2:42 AM CEST, Andy Yan wrote:
> At 2024-09-06 06:38:50, "Min-Hua Chen" <minhuadotchen@gmail.com> wrote:
> >Include rockchip_drm_drv.h to fix the follow sparse warning:
> >
> >drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
> >warning: symbol 'vop2_platform_driver' was not declared.
> >Should it be static?
> >
> >No functional change intended.
> >
> >Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> >---
> > drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/=
drm/rockchip/rockchip_vop2_reg.c
> >index 18efb3fe1c00..c678d1b0fd7c 100644
> >--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> >+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> >@@ -14,6 +14,7 @@
> > #include <drm/drm_print.h>
> >=20
> > #include "rockchip_drm_vop2.h"
> >+#include "rockchip_drm_drv.h"
> >=20
>
> We already have a patch[0] include rockchip_drm_drv.h in rockchip_drm_vop=
2.h
>
> [0]https://patchwork.kernel.org/project/linux-rockchip/patch/202409041202=
38.3856782-3-andyshrk@163.com/=20

Maybe I'm missing something, but this patch seems to fix an already
existing bug (which should have a Fixes tag?), which Andy also fixed
while implementing a different (and unrelated) feature?

Cheers,
  Diederik

--90251523fbbd216b6fd8d265a28b65ea30f3d99c5d6460b75d286064d840
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZtrLRwAKCRDXblvOeH7b
bk/qAQDPHdbej4aC0ukgU/dbB+KKBekdjOZZD5I3sUS8I7Bd4wEAuK0ILSqPfD+n
L9LK3ogtrQ6CGzdsFsQ4YBi2P4hwUwA=
=eQVK
-----END PGP SIGNATURE-----

--90251523fbbd216b6fd8d265a28b65ea30f3d99c5d6460b75d286064d840--
