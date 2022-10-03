Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DB5F2B3C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 09:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910B110E232;
	Mon,  3 Oct 2022 07:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E210E23F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 07:53:19 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221003075318euoutp023526ccf5b12511da465305d568bbff89~af9yyhpCy2713727137euoutp02V
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 07:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221003075318euoutp023526ccf5b12511da465305d568bbff89~af9yyhpCy2713727137euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1664783598;
 bh=I/he9TmsAKMs+6KcXTY2tzeyBeXnKW9nIUFsNc5f4X0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=K/pIdqEyEQQf0AhhhrNMvwita9oXJwVZltB2JvH/gafymffmBotdwBd82MVCJMWyo
 MZeou4P6U0CTrKsEVKc+EBVIfnjJDpvGPpl90t0r2PjV7lUbpqvcUQFUg3uD2fDTZq
 5zN+7avcSs4E1yqRKqLjEyIMZ6EqzjfdPfy1uE3E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221003075317eucas1p262b3f662139f35a34244e5b462bf152e~af9yI6joZ1623616236eucas1p2H;
 Mon,  3 Oct 2022 07:53:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 98.9C.29727.DE49A336; Mon,  3
 Oct 2022 08:53:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221003075316eucas1p16e76fab0c0b48f4e717e10f53c996c29~af9xkq3JB2315323153eucas1p1r;
 Mon,  3 Oct 2022 07:53:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221003075316eusmtrp124fef559090e6ab334c752a69128399e~af9xjlcDW1927519275eusmtrp1Y;
 Mon,  3 Oct 2022 07:53:16 +0000 (GMT)
X-AuditID: cbfec7f2-205ff7000001741f-36-633a94ed49a7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C4.75.10862.CE49A336; Mon,  3
 Oct 2022 08:53:16 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221003075315eusmtip27de4f93995bf64fe67f3f8561f29ca91~af9wd7Pt21067510675eusmtip27;
 Mon,  3 Oct 2022 07:53:15 +0000 (GMT)
Message-ID: <8ace62ee-14fa-2536-7750-47d102269c17@samsung.com>
Date: Mon, 3 Oct 2022 09:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 06/11] drm: bridge: samsung-dsim: Add atomic_check
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220916181731.89764-7-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxz19n20dCt5lK+bjgE2zjmXoWzM3I3ZadDwtmToEpdt/jHWlCeg
 fKUFhzrH16bQFSwUIz75SkCBEgQLs8wxooilWgVLFJdS6YDKRgUnH46VLjraNzf+O+f8zrnn
 d2+uABOfIiWC1IxsRpkhT5OSQvyiyT34xmzlu4rNy9YQZB+1YMjRsICjh6PNJLrz5A8SlZ4d
 JFCFQ4ujRYOWRL+PWXF0q3CGj0rKG/moSdtLIsPkCIHUyy0Yqhrq5aGZYwUAWSbaMXSj4Dsc
 DVdeJdE8O74y1U2TyGqex9CS5xa2LYRum3MQdC1rxulKcz9BD2ruk/SP7H0+fab4NEE39Ezz
 6P67DQRtH+khacf3Azy6szGPvvCom0eXdekBvWAI3+2/V/heEpOWepBRbpJ9KUwxDlv4WZPh
 ubZ7D4h88DdUAz8BpGKgbrIDVwOhQEw1A/iYrSA4sghg23gL6XWJqQUAT8z4PU80qk/8a2oC
 cMn2LY8jcwCap574EiJKBsfrS4EX49Q6OOkw4ZweAK+fdvpwMKWAbvVlnz+Q+gC2OO2EF2NU
 KLQ563yHBlFtBCw7pyG9BPM2aP4ax7wukoqG6lm1L+1HbYOu9psYl46AxtlqzBuAVJkQ6koL
 MW7xHXDIbsU5HAhdA118DodBi06Dc4HjANZ7HDyOaAHM/80GOFcstA8ur9QJVipeg+2XNnHy
 dnjzfBfulSHlD3+ZDeCW8IcVF09hnCyCxcfEnHs9ZAfO/1d75fYwpgVSdtXDsKsegF11Hfb/
 3nqA60Eok6NKT2ZU0RnMV1EqeboqJyM5SpGZbgArf9fydGC+G9S45qL6AE8A+gAUYNIgUeXa
 dxRiUZL80GFGmZmozEljVH3gJQEuDRWRVRsVYipZns0cYJgsRvl8yhP4SfJ5WabW6S+a6jQ/
 3S7Z9Wfn6/w1l48eWpJgi0FAVhgcse6R3lV9svwSm+tI2BDz0dYh3QPFnq9VEvf7HcUhrREj
 6odVpvgjNY8bRIbANc9uJL9aEhtg3H9wZ7CqLnCXQttd7o440GtM0P9KJo6W127e0RpWdLTo
 RUli/zf8Japn4pN924l43dXjYpP1ZCRIjHOnTTyTnhu7+3O4fio+6k3bXmeNecqMeUpq4voj
 5T+4a9mwF/JbP9/3dmb608WP97Nxd7QXpM7DRvJDT1zep6lHUrZsyL53zRWZfV0jkhm3bskM
 uZIEcjuzYi3NBUWmsT0xO8+81bPek8CTXavOI17ueOWzOimuSpFHb8SUKvk/xeIGhioEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xe7pvplglG3zaqGNx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehnbL51mL3gsV3Hr+lPWBsY/El2MnBwSAiYSS7r6WbsYuTiEBJYy
 Svyee5YdIiEjcXJaAyuELSzx51oXG0TRe0aJbRM2MIMkeAXsJB4u6GUEsVkEVCQe3z/GAhEX
 lDg58wmYLSqQLPHyz0SwocICnhIrn9wBG8osIC5x68l8JpChIgKbWSX2vpsA5jALfGSUuDR5
 CzvEupOMEufurAJrZxMwlOh6C3IHJwengIPEq/VnmCFGmUl0be1ihLDlJba/ncM8gVFoFpJL
 ZiHZOAtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEJpptx35u2cG48tVHvUOM
 TByMhxglOJiVRHinKFomC/GmJFZWpRblxxeV5qQWH2I0BQbHRGYp0eR8YKrLK4k3NDMwNTQx
 szQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgynTbrybboNOyS/K8pvAXFfW5f29L
 rlUPUHt1erp/TROH1+p7WQURZjG+E1vKxZXOh09P9+Q/O7FrR4Ky9P/5hV7Fy/tYn+Wc7Jiz
 u1D8stsXgT1Tgq6rmzBfnKMy54T1n/WH3ayrq0+FFUq/9T8tOevchhj2d8l98irFjy7eXj4x
 f7t117ne7A8LllatEn3Ycj55+ZqYjztXH15nvGfWz4NTnsS0qHY+P/tf1feNXVDTJR72aROt
 nqwssUpYsvD+9lpZrZhm1y36y5P+y8mtdYw8k/z5kct2uT0rPb9u9gh4fvL2i39rxHcbMmRw
 hHQsz1npUiHR3B//e0my4+kpk4+52K3aVz3JNyhbnLXaQ4mlOCPRUIu5qDgRAEczlAq9AwAA
X-CMS-MailID: 20221003075316eucas1p16e76fab0c0b48f4e717e10f53c996c29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220916181908eucas1p1651aa83d7dc30d68c9e24dda0ef4157b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220916181908eucas1p1651aa83d7dc30d68c9e24dda0ef4157b
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
 <CGME20220916181908eucas1p1651aa83d7dc30d68c9e24dda0ef4157b@eucas1p1.samsung.com>
 <20220916181731.89764-7-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 16.09.2022 20:17, Jagan Teki wrote:
> Look like an explicit fixing up of mode_flags is required for DSIM IP
> present in i.MX8M Mini/Nano SoCs.
>
> At least the LCDIF + DSIM needs active low sync polarities in order
> to correlate the correct sync flags of the surrounding components in
> the chain to make sure the whole pipeline can work properly.
>
> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> Rev. 3, 11/2020 says.
> "13.6.3.5.2 RGB interface
>   Vsync, Hsync, and VDEN are active high signals."
>
> No clear evidence about whether it can be documentation issues or
> something, so added a comment FIXME for this and updated the active low
> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.
>
> v5:
> * rebase based new bridge changes [mszyprow]
> * remove DSIM_QUIRK_FIXUP_SYNC_POL
> * add hw_type check for sync polarities change.
>
> v4:
> * none
>
> v3:
> * add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup
>
> v2:
> * none
>
> v1:
> * fix mode flags in atomic_check instead of mode_fixup
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++++++++++++++++
>   include/drm/bridge/samsung-dsim.h     |  1 +
>   2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 6d524338d4ff..8abf89326424 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1315,6 +1315,31 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +
> +	if (dsi->plat_data->hw_type & SAMSUNG_DSIM_TYPE_IMX8MM) {

Again the above should be 'if (dsi->plat_data->hw_type == 
SAMSUNG_DSIM_TYPE_IMX8MM)', hw_type is not a bitmask.


> +		/**
> +		 * FIXME:
> +		 * At least LCDIF + DSIM needs active low sync,
> +		 * but i.MX 8M Mini Applications Processor Reference Manual,
> +		 * Rev. 3, 11/2020 says
> +		 *
> +		 * 13.6.3.5.2 RGB interface
> +		 * Vsync, Hsync, and VDEN are active high signals.
> +		 */
> +		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	}
> +
> +	return 0;
> +}
> +
>   static void samsung_dsim_mode_set(struct drm_bridge *bridge,
>   				  const struct drm_display_mode *mode,
>   				  const struct drm_display_mode *adjusted_mode)
> @@ -1337,6 +1362,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>   	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_check			= samsung_dsim_atomic_check,
>   	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
>   	.atomic_enable			= samsung_dsim_atomic_enable,
>   	.atomic_disable			= samsung_dsim_atomic_disable,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index 57b27d75369e..0c5a905f3de7 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -27,6 +27,7 @@ enum samsung_dsim_type {
>   	SAMSUNG_DSIM_TYPE_EXYNOS5410,
>   	SAMSUNG_DSIM_TYPE_EXYNOS5422,
>   	SAMSUNG_DSIM_TYPE_EXYNOS5433,
> +	SAMSUNG_DSIM_TYPE_IMX8MM,
>   	SAMSUNG_DSIM_TYPE_COUNT,
>   };
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

