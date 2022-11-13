Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803EC626CF2
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 01:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572D810E1E9;
	Sun, 13 Nov 2022 00:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250B10E1E9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 00:25:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ADAD885150;
 Sun, 13 Nov 2022 01:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668299117;
 bh=6W5Iw3FDDALHhAxkN8R/j9Y3oTSkSC1MVWnybXewZTA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aV4OfFRNnW9e8cz66tduDOtq4/bTS00vAT+8GIZVe2Gw2i3NdaseLKWnj1rjR6NyT
 qr67tKYOGrgB0r9MAIBgZLdj0U7hGS4wif0F5B6+4KD1NozaNNwW0RK88ARuKMvtdW
 ISsjgvEdyad0PUuwQftFaajKjz9QoJHxVz40gcz9mmlaKKHlR1oo9udvCbF1kyQkO5
 1R64RKVv3ApazQ78gBIOMAtgKoAwmXR8vEDWx8kZe1Hrm/GKWJlUdvzAgWS6xR3Sl/
 ULWIHa07mym5wsjkAvxxuAFTi4G4DdvfILVIC0Hl0T8Sy4Nts0udHDOfoHzKIQv+Ts
 vu9BWzi24vNLA==
Message-ID: <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
Date: Sun, 13 Nov 2022 01:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221110183853.3678209-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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

On 11/10/22 19:38, Jagan Teki wrote:
> HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> conversion as 'disable mode bit' due to its bit definition,
> 0 = Enable and 1 = Disable.
> 
> Fix the naming convention of the mode bits.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index b5305b145ddb..fce7f0a7e4ee 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -75,10 +75,10 @@
>   #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
>   #define DSIM_SUB_VC			(((x) & 0x3) << 16)
>   #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
> -#define DSIM_HSA_MODE			(1 << 20)
> -#define DSIM_HBP_MODE			(1 << 21)
> -#define DSIM_HFP_MODE			(1 << 22)
> -#define DSIM_HSE_MODE			(1 << 23)
> +#define DSIM_HSA_DISABLE		(1 << 20)
> +#define DSIM_HBP_DISABLE		(1 << 21)
> +#define DSIM_HFP_DISABLE		(1 << 22)
> +#define DSIM_HSE_DISABLE		(1 << 23)

Those four bits are called Hxx_DISABLE_MODE in the MX8M{M,N,P}RM at 
least, so keep both suffixes .

A separate patch which turns those bits to BIT() macro would be nice.
