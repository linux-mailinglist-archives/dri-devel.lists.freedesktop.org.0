Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAB6FA233
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC9C10E16E;
	Mon,  8 May 2023 08:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869810E16E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:26:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so42474685e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683534391; x=1686126391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tohrB2Y7al5F8tn8nVTt7scOOUIHQ0QXSm233n2s7j8=;
 b=Bfmg+cqyUuvKMuizIfJkhnr5tCHjpn1bziD8E58PNKm+Vkfywnp2PIPTLbS+s5hS4t
 Dy2m74YW72Wy29k0EVaIIlI3UWUneVZC2OUQInpUCDy3SW3RDJP6bwV2zvEci11ZuP9O
 XLMTGBfYdsNwhXa3ufoxSHK/p/Qjsht3pnPfV5Z1I2otizMS5f4vhPR3oe4X9No5Eml2
 Tp2VJpEto8AYlC3SNTablVdYdMv1EzIducnnq500dMrxgzcldEu4gUlRn/rwNsQOVd8T
 FFKhGVo+heggb/5QbfVZOPLwsWl6O8iUTz2Ht/mFIg5HBZm9FO9J+iqfVZUKIMzzbMHb
 BpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534391; x=1686126391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tohrB2Y7al5F8tn8nVTt7scOOUIHQ0QXSm233n2s7j8=;
 b=ZkNDmZIklBU8wmgCzAOMfuZauqBoDzJc8YbNFhmoJ6JLW7tyg+eiqUpcDho83xNjOq
 YgVgY5EP8wInm9uW4ja9NHWerKhXtNUgEgfX6+q/bUbYBTq+tKAl6I4XeOsqoSLw7lIV
 hf3saseCf2j8wUcdc08lpNq6BMkw/S/iudC3p6eG32XAKYyQL9h2yy2QKZkQGxD6UR9k
 HwQUBSVzZNJuOYVvJKo9/gyQUVpTiToC+8V77UJ6VesicUIM4NfOsn7cfXHXpJ69h8qg
 rMavHARACe7Phu8+4ndgMAZLEjvrn51nYdRACqj65LbUKg/X7+IMvOQ+QlCbUPvlwg4y
 d/lw==
X-Gm-Message-State: AC+VfDzBcakw82ipIIyJ+kpjhTWNkEx5uwI1KMR0FPv90YYslk3aS3Pf
 b9+CuoFtAp+gYi0ACAZpHY8=
X-Google-Smtp-Source: ACHHUZ78m7U66nWTsi+LZgCFMAcFkosmhFra1f0yMEd6UMwthKG/lpDHGyzDIvdEm9lGMxMNh/QdHQ==
X-Received: by 2002:a1c:ed03:0:b0:3f1:9526:22da with SMTP id
 l3-20020a1ced03000000b003f1952622damr6578891wmh.22.1683534390843; 
 Mon, 08 May 2023 01:26:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c1c8100b003f4283f5c1bsm922144wms.2.2023.05.08.01.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:26:29 -0700 (PDT)
Message-ID: <b43f965b-006a-fc16-c2e9-367be8993ee0@gmail.com>
Date: Mon, 8 May 2023 10:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 29/53] drm/mediatek: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-30-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230507162616.1368908-30-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/05/2023 18:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the mediatek drm drivers from always returning zero in
> the remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_dp.c         | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_dpi.c        | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_dsi.c        | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_hdmi.c       | 5 ++---
>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 6 ++----
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 5 ++---
>   14 files changed, 28 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 434e8a9ce8ab..cbd9b4becc43 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -140,11 +140,9 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_aal_remove(struct platform_device *pdev)
> +static void mtk_disp_aal_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_aal_component_ops);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
> @@ -161,7 +159,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
>   
>   struct platform_driver mtk_disp_aal_driver = {
>   	.probe		= mtk_disp_aal_probe,
> -	.remove		= mtk_disp_aal_remove,
> +	.remove_new	= mtk_disp_aal_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-aal",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b2439..fa6dbc4e9c35 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -195,11 +195,9 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_ccorr_remove(struct platform_device *pdev)
> +static void mtk_disp_ccorr_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_ccorr_component_ops);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> @@ -221,7 +219,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
>   
>   struct platform_driver mtk_disp_ccorr_driver = {
>   	.probe		= mtk_disp_ccorr_probe,
> -	.remove		= mtk_disp_ccorr_remove,
> +	.remove_new	= mtk_disp_ccorr_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-ccorr",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index cac9206079e7..78e44e6befd6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -132,11 +132,9 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_color_remove(struct platform_device *pdev)
> +static void mtk_disp_color_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_color_component_ops);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_color_data mt2701_color_driver_data = {
> @@ -164,7 +162,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
>   
>   struct platform_driver mtk_disp_color_driver = {
>   	.probe		= mtk_disp_color_probe,
> -	.remove		= mtk_disp_color_remove,
> +	.remove_new	= mtk_disp_color_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-color",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index c844942603f7..c5237f4eb7fe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -183,11 +183,9 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_gamma_remove(struct platform_device *pdev)
> +static void mtk_disp_gamma_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_gamma_component_ops);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
> @@ -209,7 +207,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
>   
>   struct platform_driver mtk_disp_gamma_driver = {
>   	.probe		= mtk_disp_gamma_probe,
> -	.remove		= mtk_disp_gamma_remove,
> +	.remove_new	= mtk_disp_gamma_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-gamma",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 6428b6203ffe..fd14a59bc951 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -295,11 +295,9 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_merge_remove(struct platform_device *pdev)
> +static void mtk_disp_merge_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_merge_component_ops);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_disp_merge_driver_dt_match[] = {
> @@ -311,7 +309,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
>   
>   struct platform_driver mtk_disp_merge_driver = {
>   	.probe = mtk_disp_merge_probe,
> -	.remove = mtk_disp_merge_remove,
> +	.remove_new = mtk_disp_merge_remove,
>   	.driver = {
>   		.name = "mediatek-disp-merge",
>   		.owner = THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 9d8c986700ee..f90ad9bce028 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -483,12 +483,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_ovl_remove(struct platform_device *pdev)
> +static void mtk_disp_ovl_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
>   	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
> @@ -565,7 +563,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
>   
>   struct platform_driver mtk_disp_ovl_driver = {
>   	.probe		= mtk_disp_ovl_probe,
> -	.remove		= mtk_disp_ovl_remove,
> +	.remove_new	= mtk_disp_ovl_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-ovl",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index a5a0c3bac35d..49149d67bb0e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -350,13 +350,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_disp_rdma_remove(struct platform_device *pdev)
> +static void mtk_disp_rdma_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
>   
>   	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_disp_rdma_data mt2701_rdma_driver_data = {
> @@ -390,7 +388,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
>   
>   struct platform_driver mtk_disp_rdma_driver = {
>   	.probe		= mtk_disp_rdma_probe,
> -	.remove		= mtk_disp_rdma_remove,
> +	.remove_new	= mtk_disp_rdma_remove,
>   	.driver		= {
>   		.name	= "mediatek-disp-rdma",
>   		.owner	= THIS_MODULE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 1f94fcc144d3..6352ee412045 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2575,7 +2575,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_dp_remove(struct platform_device *pdev)
> +static void mtk_dp_remove(struct platform_device *pdev)
>   {
>   	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
>   
> @@ -2586,8 +2586,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
>   	platform_device_unregister(mtk_dp->phy_dev);
>   	if (mtk_dp->audio_pdev)
>   		platform_device_unregister(mtk_dp->audio_pdev);
> -
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -2646,7 +2644,7 @@ MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
>   
>   static struct platform_driver mtk_dp_driver = {
>   	.probe = mtk_dp_probe,
> -	.remove = mtk_dp_remove,
> +	.remove_new = mtk_dp_remove,
>   	.driver = {
>   		.name = "mediatek-drm-dp",
>   		.of_match_table = mtk_dp_of_match,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 948a53f1f4b3..ed3cbb202b7a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1102,14 +1102,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_dpi_remove(struct platform_device *pdev)
> +static void mtk_dpi_remove(struct platform_device *pdev)
>   {
>   	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
>   
>   	component_del(&pdev->dev, &mtk_dpi_component_ops);
>   	drm_bridge_remove(&dpi->bridge);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_dpi_of_ids[] = {
> @@ -1140,7 +1138,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
>   
>   struct platform_driver mtk_dpi_driver = {
>   	.probe = mtk_dpi_probe,
> -	.remove = mtk_dpi_remove,
> +	.remove_new = mtk_dpi_remove,
>   	.driver = {
>   		.name = "mediatek-dpi",
>   		.of_match_table = mtk_dpi_of_ids,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a13b36ac03a1..b951ad494f7d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -826,7 +826,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_drm_remove(struct platform_device *pdev)
> +static void mtk_drm_remove(struct platform_device *pdev)
>   {
>   	struct mtk_drm_private *private = platform_get_drvdata(pdev);
>   	int i;
> @@ -836,8 +836,6 @@ static int mtk_drm_remove(struct platform_device *pdev)
>   	of_node_put(private->mutex_node);
>   	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
>   		of_node_put(private->comp_node[i]);
> -
> -	return 0;
>   }
>   
>   static int mtk_drm_sys_prepare(struct device *dev)
> @@ -866,7 +864,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
>   
>   static struct platform_driver mtk_drm_platform_driver = {
>   	.probe	= mtk_drm_probe,
> -	.remove	= mtk_drm_remove,
> +	.remove_new = mtk_drm_remove,
>   	.driver	= {
>   		.name	= "mediatek-drm",
>   		.pm     = &mtk_drm_pm_ops,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..d8bfc2cce54d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1178,14 +1178,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_dsi_remove(struct platform_device *pdev)
> +static void mtk_dsi_remove(struct platform_device *pdev)
>   {
>   	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>   
>   	mtk_output_dsi_disable(dsi);
>   	mipi_dsi_host_unregister(&dsi->host);
> -
> -	return 0;
>   }
>   
>   static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
> @@ -1223,7 +1221,7 @@ MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
>   
>   struct platform_driver mtk_dsi_driver = {
>   	.probe = mtk_dsi_probe,
> -	.remove = mtk_dsi_remove,
> +	.remove_new = mtk_dsi_remove,
>   	.driver = {
>   		.name = "mtk-dsi",
>   		.of_match_table = mtk_dsi_of_match,
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 0a8e0a13f516..86133bf16326 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1746,13 +1746,12 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_drm_hdmi_remove(struct platform_device *pdev)
> +static void mtk_drm_hdmi_remove(struct platform_device *pdev)
>   {
>   	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
>   
>   	drm_bridge_remove(&hdmi->bridge);
>   	mtk_hdmi_clk_disable_audio(hdmi);
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -1806,7 +1805,7 @@ MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
>   
>   static struct platform_driver mtk_hdmi_driver = {
>   	.probe = mtk_drm_hdmi_probe,
> -	.remove = mtk_drm_hdmi_remove,
> +	.remove_new = mtk_drm_hdmi_remove,
>   	.driver = {
>   		.name = "mediatek-drm-hdmi",
>   		.of_match_table = mtk_drm_hdmi_of_ids,
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> index 2fc9214ffa82..63d3d5ba31f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> @@ -324,14 +324,12 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_hdmi_ddc_remove(struct platform_device *pdev)
> +static void mtk_hdmi_ddc_remove(struct platform_device *pdev)
>   {
>   	struct mtk_hdmi_ddc *ddc = platform_get_drvdata(pdev);
>   
>   	i2c_del_adapter(&ddc->adap);
>   	clk_disable_unprepare(ddc->clk);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_hdmi_ddc_match[] = {
> @@ -342,7 +340,7 @@ MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
>   
>   struct platform_driver mtk_hdmi_ddc_driver = {
>   	.probe = mtk_hdmi_ddc_probe,
> -	.remove = mtk_hdmi_ddc_remove,
> +	.remove_new = mtk_hdmi_ddc_remove,
>   	.driver = {
>   		.name = "mediatek-hdmi-ddc",
>   		.of_match_table = mtk_hdmi_ddc_match,
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> index eecfa98ff52e..11bb6ca8cc8f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -291,11 +291,10 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_mdp_rdma_remove(struct platform_device *pdev)
> +static void mtk_mdp_rdma_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_mdp_rdma_component_ops);
>   	pm_runtime_disable(&pdev->dev);
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_mdp_rdma_driver_dt_match[] = {
> @@ -306,7 +305,7 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
>   
>   struct platform_driver mtk_mdp_rdma_driver = {
>   	.probe = mtk_mdp_rdma_probe,
> -	.remove = mtk_mdp_rdma_remove,
> +	.remove_new = mtk_mdp_rdma_remove,
>   	.driver = {
>   		.name = "mediatek-mdp-rdma",
>   		.owner = THIS_MODULE,
