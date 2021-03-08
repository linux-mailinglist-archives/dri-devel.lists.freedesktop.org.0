Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550B3309F9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35D589F27;
	Mon,  8 Mar 2021 09:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3B89F27
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:10:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128931SI006449; Mon, 8 Mar 2021 10:10:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8WboHxKMLlrdZDES8RgffUYZPXTsH+o3lKjSMUlYi2g=;
 b=yXfmZByMLKkbYZwHVgzbNyhWpFNIgZGT4j40RCx69PLGX3OyeRSUOdes1Px2py+/eAax
 Wv95lLB1vyJhnVmczG9XS81xqo3B3kWEedx0xAaDWEMix6aO5Vy6F4hlkoMpdgKA4X1n
 LmvNYm7zbn1xl2ePTgit4DIP7O7hPFgw5OiPxIINwqqfR6t45uj1dZ5twk+uFCIae0LS
 X78ht5zFH6s43tBJBLCzgmK4g5XdMtqmAZhYc2mYkUXYzcKNl0t2rGPmfdguYjEO0zRq
 oOdOnnTjsZ27jwo2Suv/qDgBrLZVAakOotKVTQ9m6d3OSZtl0sIkUex0pDqXwP/CeL0L UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gp9agm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:10:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F083310002A;
 Mon,  8 Mar 2021 10:10:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C99E023D70F;
 Mon,  8 Mar 2021 10:10:08 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 10:10:07 +0100
Subject: Re: [PATCH 1/2] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Yannick
 FERTRE" <yannick.fertre@st.com>, Philippe CORNU <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent ABRIOU
 <vincent.abriou@st.com>, Sam Ravnborg <sam@ravnborg.org>, Joe Perches
 <joe@perches.com>
References: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
 <20210222092205.32086-2-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <7db3bebd-2cfa-d8d8-40e5-81702295e151@foss.st.com>
Date: Mon, 8 Mar 2021 10:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222092205.32086-2-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_04:2021-03-08,
 2021-03-08 signatures=0
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
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 2/22/21 10:22 AM, Raphael GALLAIS-POU - foss wrote:
> From: Yannick Fertre <yannick.fertre@st.com>
> 
> Don't print error when probe deferred error is returned.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 2e1f2664495d..8399d337589d 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -363,8 +363,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	dsi->vdd_supply = devm_regulator_get(dev, "phy-dsi");
>   	if (IS_ERR(dsi->vdd_supply)) {
>   		ret = PTR_ERR(dsi->vdd_supply);
> -		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to request regulator: %d\n", ret);
> +		dev_err_probe(dev, ret, "Failed to request regulator\n");
>   		return ret;
>   	}
>   
> @@ -377,9 +376,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	dsi->pllref_clk = devm_clk_get(dev, "ref");
>   	if (IS_ERR(dsi->pllref_clk)) {
>   		ret = PTR_ERR(dsi->pllref_clk);
> -		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Unable to get pll reference clock: %d\n",
> -				  ret);
> +		dev_err_probe(dev, ret, "Unable to get pll reference clock\n");
>   		goto err_clk_get;
>   	}
>   
> @@ -419,7 +416,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
>   	if (IS_ERR(dsi->dsi)) {
>   		ret = PTR_ERR(dsi->dsi);
> -		DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
> +		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
>   		goto err_dsi_probe;
>   	}
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
