Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595447ED75C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3F110E049;
	Wed, 15 Nov 2023 22:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28F10E049
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 22:38:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFMQQY1001223; Wed, 15 Nov 2023 22:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8yJ3jUtvfZRMkPvd6/c+IJsp1DWolkFYgDCcy0ZvmYY=;
 b=ahCSVlMCvAuDXm+81w6iLy31Q3B56t1zFciELyWCdDqqoiXzKBLjG2YzN6N93oYreX1L
 zZbuyCKcbrubMg50OFct7xUL3qoJPSDRNp1Ezd5bnZJV/7A9Ow3xhaWrdl9FE+ZOUA1g
 5HBxTZyyF161s7gm//0QwF38qUMFCNsd0f9AYUcVRZMngqxNsnevxuG+94ls9pyUc3JI
 /tW3JSf1QmNh2fxlJXQqVLXytfpux8dioM3hciwZLM13YzhTeeEFy6IJZjf/chxgxhsl
 EMaMCmQyKqETefljtrSib8eak3rtFulaExl8Y7TA6c4EPQJxlypnXHbYf8oCEIbYWOQV PQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucuac1r3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:37:49 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFMbmR8031514
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:37:48 GMT
Received: from [10.110.75.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 14:37:48 -0800
Message-ID: <c74f5da7-fb88-42a9-9c91-0786d298a130@quicinc.com>
Date: Wed, 15 Nov 2023 14:37:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] nv3051d: Add Powkiddy RK2023 Panel Support
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, <linux-rockchip@lists.infradead.org>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
 <20231109215007.66826-3-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231109215007.66826-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0ybCaKpqDI73nrVdVvnoZwLjBI3ILpZx
X-Proofpoint-GUID: 0ybCaKpqDI73nrVdVvnoZwLjBI3ILpZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150178
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2023 1:50 PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Refactor the driver to add support for the powkiddy,rk2023-panel
> panel. This panel is extremely similar to the rg353p-panel but
> requires a smaller vertical back porch and isn't as tolerant of
> higher speeds. Note that while all of these panels are identical in
> size (70x57) it is possible future panels may not be.
> 
> Tested on my RG351V, RG353P, RG353V, and RK2023.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   .../gpu/drm/panel/panel-newvision-nv3051d.c   | 57 +++++++++++++++----
>   1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index 79de6c886292..94d89ffd596b 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -28,6 +28,7 @@ struct nv3051d_panel_info {
>   	unsigned int num_modes;
>   	u16 width_mm, height_mm;
>   	u32 bus_flags;
> +	u32 mode_flags;
>   };
>   
>   struct panel_nv3051d {
> @@ -261,6 +262,8 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
>   
>   	usleep_range(10000, 15000);
>   
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +

Hi Chris,

Is this to address a suspend/resume issue similar to what was done here [1]?

If so, I think maybe this can go as a separate Fixes patch.

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/patch/567670/?series=126479&rev=1

>   	regulator_disable(ctx->vdd);
>   
>   	return 0;
> @@ -385,15 +388,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> -
> -	/*
> -	 * The panel in the RG351V is identical to the 353P, except it
> -	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
> -	 */
> -	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
> -		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->mode_flags = ctx->panel_info->mode_flags;
>   
>   	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> @@ -481,16 +476,56 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
>   	},
>   };
>   
> -static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
> +static const struct drm_display_mode nv3051d_rk2023_modes[] = {
> +	{
> +		.hdisplay       = 640,
> +		.hsync_start    = 640 + 40,
> +		.hsync_end      = 640 + 40 + 2,
> +		.htotal         = 640 + 40 + 2 + 80,
> +		.vdisplay       = 480,
> +		.vsync_start    = 480 + 18,
> +		.vsync_end      = 480 + 18 + 2,
> +		.vtotal         = 480 + 18 + 2 + 4,
> +		.clock          = 24150,
> +		.flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +};
> +
> +static const struct nv3051d_panel_info nv3051d_rg351v_info = {
>   	.display_modes = nv3051d_rgxx3_modes,
>   	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
>   	.width_mm = 70,
>   	.height_mm = 57,
>   	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +};
> +
> +static const struct nv3051d_panel_info nv3051d_rg353p_info = {
> +	.display_modes = nv3051d_rgxx3_modes,
> +	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
> +	.width_mm = 70,
> +	.height_mm = 57,
> +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +};
> +
> +static const struct nv3051d_panel_info nv3051d_rk2023_info = {
> +	.display_modes = nv3051d_rk2023_modes,
> +	.num_modes = ARRAY_SIZE(nv3051d_rk2023_modes),
> +	.width_mm = 70,
> +	.height_mm = 57,
> +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>   };
>   
>   static const struct of_device_id newvision_nv3051d_of_match[] = {
> -	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
> +	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
> +	{ .compatible = "anbernic,rg353p-panel", .data = &nv3051d_rg353p_info },
> +	{ .compatible = "powkiddy,rk2023-panel", .data = &nv3051d_rk2023_info },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
> -- 
> 2.34.1
> 
