Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4972E602
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 16:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46C10E080;
	Tue, 13 Jun 2023 14:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437BA10E080
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:41:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DDY6Ul009653; Tue, 13 Jun 2023 16:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QBzgnvZYhvVECTlLRUjYVkLIxxSdPPzsz4m+WBIMtA0=;
 b=ALffOYbR7QhU+P2lgcTH5EB6/GVdjZuhII0dOcWGqr3VPnjrwevl+MoxPuomk1Amqqva
 vBNz7QXDeDupwh9e4nW07kdU0eYjLkX9P+KUMH2PtLJyTFfivV7To+JKp4ZrV2qxB8d0
 Wxm0+v6K70ew01w1NqsYa2rvj7Hw1Xuduh08Btv0Tbpyt6tvnvwbwv5jqggNHFim33uk
 k1lvaDwCaVTbZFqqNcR2upxolZD/KXoUpiHSuFOhor/XLTm0Hfgb7cR0DE1CaUT0RpT/
 YQmn7/2zEKy8ADtBlCY5tHHqa5ZL+/3fxqvOxZYyW9o6pdFB/jT9uriliSnu8Kvb9mOm RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6sf30dn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 16:41:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3FFD100045;
 Tue, 13 Jun 2023 16:41:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4C882309E8;
 Tue, 13 Jun 2023 16:41:45 +0200 (CEST)
Received: from [10.48.1.204] (10.48.1.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 16:41:45 +0200
Message-ID: <376dc16d-8896-0a47-b8dd-3f919c1e50bf@foss.st.com>
Date: Tue, 13 Jun 2023 16:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/4] drm/stm: add an option to change FB bpp
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
 <20230609062050.2107143-5-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230609062050.2107143-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.1.204]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_16,2023-06-12_02,2023-05-22_02
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
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 michael@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/9/23 08:20, Dario Binacchi wrote:
> Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> added parameter allows users to size, within certain limits, the memory
> footprint required by the framebuffer.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v3:
> - drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
>    Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
>    https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
> - drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
>    Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
>    https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc
> 
>   drivers/gpu/drm/stm/drv.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 422220df7d8c..65be2b442a6a 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -30,6 +30,11 @@
>   #define STM_MAX_FB_WIDTH	2048
>   #define STM_MAX_FB_HEIGHT	2048 /* same as width to handle orientation */
>   
> +static uint stm_bpp = 16;
> +
> +MODULE_PARM_DESC(bpp, "bits-per-pixel (default: 16)");
> +module_param_named(bpp, stm_bpp, uint, 0644);
> +
>   static const struct drm_mode_config_funcs drv_mode_config_funcs = {
>   	.fb_create = drm_gem_fb_create,
>   	.atomic_check = drm_atomic_helper_check,
> @@ -93,6 +98,7 @@ static int drv_load(struct drm_device *ddev)
>   	ddev->mode_config.min_height = 0;
>   	ddev->mode_config.max_width = STM_MAX_FB_WIDTH;
>   	ddev->mode_config.max_height = STM_MAX_FB_HEIGHT;
> +	ddev->mode_config.preferred_depth = stm_bpp;
>   	ddev->mode_config.funcs = &drv_mode_config_funcs;
>   	ddev->mode_config.normalize_zpos = true;
>   
> @@ -203,7 +209,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_put;
>   
> -	drm_fbdev_dma_setup(ddev, 16);
> +	drm_fbdev_dma_setup(ddev, stm_bpp);
>   
>   	return 0;
>   

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Many thanks,
Philippe :-)

