Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F531B5D0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857876E102;
	Mon, 15 Feb 2021 08:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C746E102
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:09:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11F7vobR007207; Mon, 15 Feb 2021 09:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HOKWY9ja0XIA6P079lELOlmBVjhPUFu51o8zyaRJWOI=;
 b=FP3e2OQFOY6I5ccWP3JEkKPfznJxyTW3ozVr8iAAo/+q14uiiRG7EVQZzC+gRrypU5ad
 u/oDIBLyNLiwNCwSPAuFj1cHWQzogQA06miU50Qi227Q3lM0nuBFw7htfMBErgCj5mO8
 6oLF/wZ7LXOiRIs8EXz5nAoLmhYzM2LXQJoYWBFXkescRjk769fT381TkXig3KTGB5R1
 VLGqt0JELRUhqkJf3ZE1GX9FWm6FOTFZzyo9QY2e0P0w5P/pnPB8C64Fwa2EqDGcEpIA
 GVrnY9drLRMZeH8o5GM7d7HEubXcTfKjOFlaTBAq4hbllCla5JEsHmB9np7criiU/7Sx aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p54792v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 09:09:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB50B10002A;
 Mon, 15 Feb 2021 09:09:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE482211F0E;
 Mon, 15 Feb 2021 09:09:18 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Feb
 2021 09:09:17 +0100
From: yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko Stubner <heiko@sntech.de>, Yannick Fertre
 <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
Message-ID: <f9cfa159-ac88-325b-d971-7c860fa722ff@foss.st.com>
Date: Mon, 15 Feb 2021 09:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203091306.140518-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-15_02:2021-02-12,
 2021-02-15 signatures=0
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Vincent Abriou <vincent.abriou@st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jagan, I tested your patch on the stm32mp1 board.
Unfortunately, the dsi panel does not probe well with this patch. The 
problem is due to the panel which is placed in the node of the dsi 
bridge (no problem with i2c devices).

Regarding component bindings for stm drivers, I am currently working on 
a new version.

Best regards

Yannick



On 2/3/21 10:13 AM, Jagan Teki wrote:
> Usual I2C configured DSI bridge drivers have drm_bridge_add
> in probe and mipi_dsi_attach in bridge attach functions.
> 
> With, this approach the drm pipeline is unable to find the
> dsi bridge in stm drm drivers since the dw-mipi-dsi bridge is
> adding drm bridge during bridge attach operations instead of
> the probe.
> 
> This specific issue may not encounter for rockchip drm dsi
> drivers, since rockchip drm uses component binding operations,
> unlike stm drm drivers.
> 
> So, possible solutions are
> 1. Move drm_bridge_add into the dw-mipi-dsi probe.
> 2. Add mipi_dsi_attach in the bridge drivers probe.
> 3. Add component binding operations for stm drm drivers.
> 
> Option 1 is a relatively possible solution as most of the
> mainline drm dsi with bridge drivers have a similar approach
> to their dsi host vs bridge registration.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 35 +++++++++----------
>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..8a535041f071 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -314,8 +314,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>   {
>   	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>   	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>   	int ret;
>   
>   	if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,22 +327,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
>   
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ret;
> -
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> -	}
> -
> -	dsi->panel_bridge = bridge;
> -
> -	drm_bridge_add(&dsi->bridge);
> -
>   	if (pdata->host_ops && pdata->host_ops->attach) {
>   		ret = pdata->host_ops->attach(pdata->priv_data, device);
>   		if (ret < 0)
> @@ -1105,6 +1087,8 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   	struct device *dev = &pdev->dev;
>   	struct reset_control *apb_rst;
>   	struct dw_mipi_dsi *dsi;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>   	int ret;
>   
>   	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   	dw_mipi_dsi_debugfs_init(dsi);
>   	pm_runtime_enable(dev);
>   
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> +					  &panel, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return ERR_PTR(-ENODEV);
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
>   	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
>   	dsi->dsi_host.dev = dev;
>   	ret = mipi_dsi_host_register(&dsi->dsi_host);
> @@ -1181,6 +1179,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   #ifdef CONFIG_OF
>   	dsi->bridge.of_node = pdev->dev.of_node;
>   #endif
> +	drm_bridge_add(&dsi->bridge);
>   
>   	return dsi;
>   }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
