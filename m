Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E025A7ED880
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886710E5A6;
	Thu, 16 Nov 2023 00:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A732110E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:30:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFNubAr021172; Thu, 16 Nov 2023 00:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GsYuea2EL0llTPwfLFUM5Sk0P7m1dxSmNQB3ro0iyNM=;
 b=GGqXzz1mtrqDWHI9971CPqyaxmLBNWfdXI8Nj02QTMJ/d9B5ViuW3zTaQN7ORIWQfKhV
 Ee/IDIPzebR8Un8fDYKL/1ixsE3ElB4+2SrDw+ohAJtekl8d3NbXeNm082W+9h0XphC4
 dqme/Lny69WmxVLCFSzvRVRlQyu8zuMkZ9dmpbaGHoSS8yQ58sRpBs0DuBJ5OY0Lxl+B
 WyyG7CnrVV7IPLvtNuZGfAynpVjLuY3xzwowd+cWU8p4tmJRCgPHGg0TL4bCHsRc/PuV
 nwItjR98U9L7WdDi3SVxWXXSvU7/Ucx4jGpGGDbLnVeXsSpwJHlEfuaBvaXUGccwZQPH Yw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucu27sxf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 00:30:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AG0TwHf023864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 00:29:58 GMT
Received: from [10.110.75.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 16:29:58 -0800
Message-ID: <f3911935-b658-4a4c-9874-c05d7faf71a0@quicinc.com>
Date: Wed, 15 Nov 2023 16:29:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/6] nv3051d: Add Powkiddy RK2023 Panel Support
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, <linux-rockchip@lists.infradead.org>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
 <20231116001742.2340646-4-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231116001742.2340646-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X8A64Px7wxYMgeEEHc5YPpD22YCwHUMx
X-Proofpoint-ORIG-GUID: X8A64Px7wxYMgeEEHc5YPpD22YCwHUMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160002
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



On 11/15/2023 4:17 PM, Chris Morgan wrote:
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

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   .../gpu/drm/panel/panel-newvision-nv3051d.c   | 55 +++++++++++++++----
>   1 file changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index c44c6945662f..94d89ffd596b 100644
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
> @@ -387,15 +388,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
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
> @@ -483,16 +476,56 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
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
