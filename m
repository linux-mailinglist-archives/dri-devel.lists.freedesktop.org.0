Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834E2B5B4B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01946E154;
	Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44216E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 19:54:20 +0000 (UTC)
Date: Mon, 16 Nov 2020 19:54:03 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile tests
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
In-Reply-To: <20201116175301.402787-2-krzk@kernel.org>
References: <20201116175301.402787-1-krzk@kernel.org>
 <20201116175301.402787-2-krzk@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Le lun. 16 nov. 2020 =E0 18:53, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> The Ingenic DRM uses Common Clock Framework thus it cannot be built on
> platforms without it (e.g. compile test on MIPS with RALINK and
> SOC_RT305X):
> =

>     /usr/bin/mips-linux-gnu-ld: =

> drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function =

> `ingenic_drm_bind.isra.0':
>     ingenic-drm-drv.c:(.text+0x1600): undefined reference to =

> `clk_get_parent'
>     /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0): =

> undefined reference to `clk_get_parent'
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/gpu/drm/ingenic/Kconfig =

> b/drivers/gpu/drm/ingenic/Kconfig
> index 477d5387e43e..3b57f8be007c 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -4,6 +4,7 @@ config DRM_INGENIC
>  	depends on DRM
>  	depends on CMA
>  	depends on OF
> +	depends on COMMON_CLK
>  	select DRM_BRIDGE
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
> --
> 2.25.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
