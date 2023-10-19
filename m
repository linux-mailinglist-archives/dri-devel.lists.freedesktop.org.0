Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339B7D0063
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 19:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1610E527;
	Thu, 19 Oct 2023 17:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466C510E527
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 17:22:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JGOGSH021821; Thu, 19 Oct 2023 17:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IJr8fuPvD0+QxFvkh5JG+nAzSYmbclC8d3lKeP0zjjw=;
 b=N4oiVpmC+0KfZaDbEA+sXv9N2tD5wjrIbdp9tsZgx8p5rNL5ZZGzgbmdTjt+CzBeMtd0
 +aCalMR4YsHIdhLFjY402KzDO/JHYqifwrZEfIoSbrpe2yKO3h+aR1sTXn70sHAeEd9s
 qwWrGzZT7HMin406QqGYQt99asC4JAn4lM93Bvh2qee4SvohjrICxt463RTlunB9BXd0
 V3bJQeBbN4smuvYHtA0EW8LKDNKGUPGrwMR1J2P5T4rq7I6WNQcFGdbthNyXa1WeD4VP
 p+Rd7MQauEGECKUWWPjWqKRbD3eKRTAq3V67cKdfccA+NP/gkP9+Evc5otboxcjw75DL JA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu1t6s30d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 17:22:26 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JHMPBW025162
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 17:22:25 GMT
Received: from [10.110.13.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 10:22:25 -0700
Message-ID: <c5e2929c-ef05-4e74-947e-579706f2b4aa@quicinc.com>
Date: Thu, 19 Oct 2023 10:22:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-3-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231018161848.346947-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LQd-PePtMDL8B_p0WDQtge_mdZTOIkXn
X-Proofpoint-ORIG-GUID: LQd-PePtMDL8B_p0WDQtge_mdZTOIkXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310190147
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
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org,
 sboyd@kernel.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/18/2023 9:18 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Refactor the driver to add support for the powkiddy,rk2023-panel
> panel. This panel is extremely similar to the rg353p-panel but
> requires a smaller vertical back porch and isn't as tolerant of
> higher speeds.
> 
> Tested on my RG351V, RG353P, RG353V, and RK2023.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

Thanks for the patch. Just have a minor question below.

> ---
>   .../gpu/drm/panel/panel-newvision-nv3051d.c   | 56 +++++++++++++++----
>   1 file changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index 79de6c886292..d24c51503d68 100644
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
> @@ -385,15 +386,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
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
> @@ -481,18 +474,59 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
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

Will all the panels for this driver be 70x57? If so, would it be better 
to set display_info.[width_mm|height_mm] directly?

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
> +

I think you can drop this stray newline.

Thanks,

Jessica Zhang

>   MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
>   
>   static struct mipi_dsi_driver newvision_nv3051d_driver = {
> -- 
> 2.34.1
> 
