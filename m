Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A26649A89
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4DA10E16F;
	Mon, 12 Dec 2022 08:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581E410E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:58:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221212085837euoutp02574283a8487e85b02ac01655c91da104~wAAz7Q56m2249322493euoutp02k
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:58:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221212085837euoutp02574283a8487e85b02ac01655c91da104~wAAz7Q56m2249322493euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670835517;
 bh=HgJvGMNh7QV9FB8LU5++cQQ8c17pa62lXWkNLrgivZo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lR8/hOFccPApgsOaR/p6y9l4J+PrTQZe8TxpIW2/CxNXL3xyD/KvCKI+x2I517FzS
 i3WS3FZxETUDClusooM/0NMx6SaObYczL9Llvwelj7vbLb+MwzorRBcK3FdSf3fiQU
 NUCDqhYaQ973zCiLyqf4m4RwxuOYy7l79VRSPtlo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221212085836eucas1p1cf5249dc29d52142f9feb4c33c9a1afb~wAAzOIfGJ3100331003eucas1p1j;
 Mon, 12 Dec 2022 08:58:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BD.C3.10112.C3DE6936; Mon, 12
 Dec 2022 08:58:36 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221212085836eucas1p170e16da821b4db75e86100d91f07c52e~wAAypfRdr0652606526eucas1p1K;
 Mon, 12 Dec 2022 08:58:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221212085836eusmtrp17e3b5de71842118db1cef8b7f1b098c4~wAAyoPYv82360323603eusmtrp1D;
 Mon, 12 Dec 2022 08:58:36 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-a9-6396ed3c2c5a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F0.39.09026.B3DE6936; Mon, 12
 Dec 2022 08:58:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221212085834eusmtip129c5299c7e66ecc90d20dbc2c3d502d6~wAAxe1MFt1189311893eusmtip1b;
 Mon, 12 Dec 2022 08:58:34 +0000 (GMT)
Message-ID: <1bc92b6c-a74a-82f6-6f96-1b6429856127@samsung.com>
Date: Mon, 12 Dec 2022 09:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
In-Reply-To: <20221209152343.180139-5-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjed87paSEpOVYm39SMrBuL2yriVpdvG2PovJz9WDQuZIlblJNy
 BDMopgVhmsUiTqFcUi6z0BY14dKuroIdY0Aa2ADXMqRy0zlEu0En0hXkakOZdZQjG/+e93mf
 533e98snwEVmcqPgmDyDVciZVDEZSjT9sujcGjt5QRaj9b+CRu724MhVPUegv++aSDS08IhE
 V4ZMBCqqdfJQqUtDoHmrhkQP7/cTqPeMl4/yS2r4yKhpI5F17DYPqf3f4qjiZhuGvOdyAOoZ
 rcfRrzlfE2igvJNEs7o/cdQZeLAsKZsgUb9jFke+pV48HtKWGRePrmltx2m9qp+gL+ocBF3u
 6OLRzsJ7JN2iu8en9XmVPLraNoHRXbeqefTIbRtJuwrsGP19zWn62lQzRhc3mgE9Z33xAHUo
 NDaJTT12glVsi0sMTTE2GYnjs+HZbRUNuAo8odQgRAApKTT/ZifUIFQgokwA+gJVz4p5ABsX
 SgBXzAFY/UcDf9XiWmjmBbGIMgLYdjObE80AWOyrJYINIRUHLzpNIIgJKgo+bSnBOX4d7K50
 r2iep5LgTy29WBCvp/bDesfIiganIuCw+xIWHBpOWXiwuK6Q5BrjGNQ+CAtiktoO1ZPqFT6E
 2glHb1zjc5pImPuDHg+aIWUJhfmWUpJbezdcbB0GHF4PPfbGZ+dshj1lhQRnOA/g5SUXxhUa
 AFXjq4734IjTvzxJsBzxGqxv3cbRO6GzyssL0pAKg3cm13FLhMHSJi3O0UKYd07EqV+FOvvV
 /2J/7hvANUCsW/MuujX369aco/s/9zIgzCCCzVSmJbPKN+VsVrSSSVNmypOjZelpVrD8nXsC
 9vlmYPTMRHcATAA6ABTg4nBh1JYLMpEwifnyJKtIP6LITGWVHWCTgBBHCE3leTIRlcxksF+w
 7HFWsdrFBCEbVVjs3GTdO7bzY1NFV97aUMW087OkI/pPjsT0H/q9+6Ohq3WHd33uLkqODTud
 G2m7Hv+4/kPhxJD6RyLTVyXZZ/A+WSjYkHKqr707ZspdvokvuWTeI417v6xz/tGBQY/t3V0l
 XqXU43h789gH/L+ychMM2X17D47eCHQVfeN4el071ylR5wx6BrrPio7e32sajE8feONoVKXB
 4y7w8x7fCrxgsiRlyNz/aB5+x0yNnfV9vLjbdcrJ7FBV1CZaPjtj6Fv0dUQapJIdWG/Z1ny/
 fGDaMPwpkzitibxjlvVljGufa2gsTJh+Ke+wz7qU+tWJipfr9PszEzx6Cc1EdJ7cM6SZThQT
 yhRm++u4Qsn8CzqE99Q9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsVy+t/xu7rWb6clG2y+aWNx5/ZpZov7iz+z
 WLy+vYLN4srX92wWq6+sYLHoXXqO1WLS/QksFl82TWCzeHHvIovF2aY37BadE5ewWyyfsI/N
 YtPja6wWXb9WMlvMOL+PyeJNWyOjxelH65ktTjW2slhcmnKYzeLTrIfMFof/PQMqmfySzeLi
 iU/MFt9/n2V2kPBY+/E+q8eSXfuZPWY3XGTxmDfrBIvHlBNHWD3O9dxl89g56y67x+yOmawe
 i/e8ZPI4cnUxq8eda3vYPO53H2fy2Lyk3mPjux1MHn1bVjF6fN4kFyAQpWdTlF9akqqQkV9c
 YqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexfNtyloJPIhX7ZmxgbmD8
 K9DFyMkhIWAicf/rDtYuRi4OIYGljBIvpt5jhkjISJyc1sAKYQtL/LnWxQZR9J5RYm9LJxNI
 glfATmLeuRWMIDaLgKrE/50TmSHighInZz5hAbFFBVIk2nv+gdULC/hKvGj5yg5iMwuIS9x6
 Mp8JZKiIwGZWib3vJoA5zALPmSTarr2GWneaUWJaRz9YO5uAoUTXW5A7ODk4BRwlHp3ZCDXK
 TKJraxcjhC0v0bx1NvMERqFZSC6ZhWTjLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66X
 nJ+7iRGYkLYd+7llB+PKVx/1DjEycTAeYpTgYFYS4VXVmJYsxJuSWFmVWpQfX1Sak1p8iNEU
 GBwTmaVEk/OBKTGvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoFJ
 iif4U/n60LObD66xDXdSbyw7nug0fe4rbUlTrZn2saf2Z5z0q/F3bj3+K+LUabUPuZM2m+ac
 XrIsRMnx+hH5J/tPaxfZ+gnHPM4V8PU8tJb1l3uIeYHdnOKm8wkKTw4nyQRkTHd7+vvDCrc5
 vUsOCB3jjFv9/tXdqTuygy66Bt6vCN5u/Hcx5z7d8572B13O65U/Wf2hoj5hzdWmaqXq/EiT
 zfc6FRf8P2+nvf82N4es3fRLCf1zovO7bM6KM52ckej20+nj7Y/KlxY+cDy0Oe+3vxWD0R1d
 v3KePyt3rVkzc+uDye37T9ifV1Ruc84OPmxlL1Gs7sDS/0jKs6e5nP1HoWP75SuZUZcVTbSU
 WIozEg21mIuKEwFO5iBr0QMAAA==
X-CMS-MailID: 20221212085836eucas1p170e16da821b4db75e86100d91f07c52e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152542eucas1p2ec6751dcbc05eab4596f3ad238e24475@eucas1p2.samsung.com>
 <20221209152343.180139-5-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, Nicolas Boichat <drinkcat@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 09.12.2022 16:23, Jagan Teki wrote:
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 = Enable and 1 = Disable.
>
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
>
> Fix the MIPI_DSI*_NO_* mode flags handling.
>
> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v9:
> - none
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e5b1540c4ae4..50a2a9ca88a9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>   			reg |= DSIM_AUTO_MODE;
>   		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
>   			reg |= DSIM_HSE_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> +		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
>   			reg |= DSIM_HFP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> +		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
>   			reg |= DSIM_HBP_MODE;
> -		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> +		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
>   			reg |= DSIM_HSA_MODE;
>   	}
>   
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>   		reg |= DSIM_EOT_DISABLE;
>   
>   	switch (dsi->format) {


Huh, this changes the logic in the driver! I've spent another half of 
the night trying to figure out why v8 and v9 doesn't work on all my 
Exynos boards with DSI panels again...

Please drop this patch from this series. If you want to get the Exynos 
DSI -> Samsung DSIM conversion merged, please focus on the core patches 
and don't add more random 'fixes' to each new version.

This change has to be discussed separately. The values written by the 
Exynos DSI driver to the registers ARE CORRECT and DSI panels work fine 
with such configuration. So either everything is correct, or these flags 
are reversed both in the Exynos DSI driver AND at least tested DSI 
panels (s6e8aa0, s6e3ha2, s6e63j0x03). I would need to check this in 
panel datasheets if I manage to get them.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

