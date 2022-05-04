Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB651990F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2917110F1F9;
	Wed,  4 May 2022 08:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DF510F27D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:00:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446C4c3001608;
 Wed, 4 May 2022 10:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qXDvZcOqGOSUYZiRZIysQ2SsdNcKMYsgx3WYQp+VwlA=;
 b=HvHn9WIssINXQUNE71bzatxgi1iQ1PeIzgePBs6MsZtaRj7YX6xmPXg2hdIB/N/719yD
 MsNKCp83Ie5Rm3oT85gqUru5HeplwFuprinUnuufbSPyEDqFRwZzH7Ciun/+7w7FPHxH
 alf8kz3GJLcN0fB4atkQT4cGxtR19SO8Xp7GZ1jbyqIn9e0AWZbnWtLOJ0mKhfq/RF1Z
 nfp4ic172MTAbqjp5IiSyzFGE+rtJmZgEwqE2eIPb1OY7v6wUinVsWhUKpJYEXDzJcUH
 qT2xylLwIb/ehnybIVONhvo8G/OTDIRVKdK7KRgjQDfrSfbIbJ0o4ZjO1Q8GmTXCh7fq xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gbjda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 10:00:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6379410002A;
 Wed,  4 May 2022 10:00:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50AE12132E2;
 Wed,  4 May 2022 10:00:01 +0200 (CEST)
Received: from [10.201.21.216] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May
 2022 10:00:00 +0200
Message-ID: <56f6fc01-4f33-b240-5539-492b2c115476@foss.st.com>
Date: Wed, 4 May 2022 09:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/stm: dsi: Enable wrapper glue regulator early
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220429204519.241549-1-marex@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220429204519.241549-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_02,2022-05-02_03,2022-02-23_01
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robert.foss@linaro.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,


Thanks for your patch

On 4/29/22 22:45, Marek Vasut wrote:
> Certain DSI bridge chips like TC358767/TC358867/TC9595 expect the DSI D0
> data lane to be in LP-11 state when released from reset. Currently the
> STM32MP157 DSI host wrapper glue logic keeps D0 data lane in LP-00 state
> until DSI init happens, which confuses the TC358767 into entering some
> sort of test mode and the chip cannot be brought out of this test mode
> in any way.
>
> Enable the wrapper glue logic regulator in probe callback already and
> disable it in remove callback to satisfy this requirement. The D0 data
> lane is in LP-11 mode when the TC358767 bridge chip is brought up and
> the chip is not confused anymore.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 30 +++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 89897d5f5c72..c403633ffeae 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -194,16 +194,29 @@ static int dsi_pll_get_params(struct dw_mipi_dsi_stm *dsi,
>  	return 0;
>  }
>  
> +static int dw_mipi_dsi_phy_regulator_on(struct dw_mipi_dsi_stm *dsi)
> +{
> +	u32 val;
> +
> +	/* Enable the regulator */
> +	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
> +	return readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
> +				  SLEEP_US, TIMEOUT_US);
> +}
> +
> +static void dw_mipi_dsi_phy_regulator_off(struct dw_mipi_dsi_stm *dsi)
> +{
> +	/* Disable the regulator */
> +	dsi_clear(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
> +}
> +
>  static int dw_mipi_dsi_phy_init(void *priv_data)
>  {
>  	struct dw_mipi_dsi_stm *dsi = priv_data;
>  	u32 val;
>  	int ret;
>  
> -	/* Enable the regulator */
> -	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
> -	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
> -				 SLEEP_US, TIMEOUT_US);
> +	ret = dw_mipi_dsi_phy_regulator_on(dsi);
>  	if (ret)
>  		DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's continue\n");
>  
> @@ -499,8 +512,16 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>  	}
>  
>  	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
> +
> +	ret = dw_mipi_dsi_phy_regulator_on(dsi);
>  	clk_disable_unprepare(pclk);
>  
> +	if (ret) {
> +		DRM_ERROR("%s: Failed to enable wrapper regulator, ret=%d\n",
> +			  __func__, ret);
> +		goto err_dsi_probe;
> +	}
> +

I have no problem until here. If I understand this correctly, it enables the regulator during all the life of the driver.

If you feel an urge to merge this patch into the Linux kernel, the st display team could gladly do it because it enables more hardware bridges. However another solution could be to rework a bit the regulator part of the driver so that you would have only device tree to change, introducing a 'reg-always-on' property.

This driver needs in fact a bit of a rework with the power management. A solution could be to move the regulator-related part in dw_mipi_dsi_stm_power_on/off() so that it is only activated when needed. Those functions would integrate the enabling of the regulator, the switch for the internal regulator, and eventually handle the PLL if it cannot lock when the regulator is off.

With the DT property, the power management would be only in the probe()/remove(). In that way the DSI bridges would have the logic they need to work.

Ultimately there is two possibilities :
 * You really need this patch to be merged asap
 * You are ok to wait until we send the solution described above

If you want to write those patches (each for DT and regulator), feel free to do it.

What do you think about it ?


Regards,

Raphaël G-P

>  	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>  		ret = -ENODEV;
>  		DRM_ERROR("bad dsi hardware version\n");
> @@ -542,6 +563,7 @@ static int dw_mipi_dsi_stm_remove(struct platform_device *pdev)
>  	struct dw_mipi_dsi_stm *dsi = platform_get_drvdata(pdev);
>  
>  	dw_mipi_dsi_remove(dsi->dsi);
> +	dw_mipi_dsi_phy_regulator_off(dsi);
>  	clk_disable_unprepare(dsi->pllref_clk);
>  	regulator_disable(dsi->vdd_supply);
>  
