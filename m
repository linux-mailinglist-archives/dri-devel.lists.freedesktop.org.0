Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCF83DF7B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF8710FC54;
	Fri, 26 Jan 2024 17:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1E10FC54
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:05:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QGGqPO017891; Fri, 26 Jan 2024 17:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=O1e+jgVZ/t8ly8NXReqDcVcs0H8zASfTS7uafcpB1Jk=; b=WM
 6J5lX/34n6vU5Y3pYZdsDuj8vs7iUk7Rhphy3U8v4LEzBuT+QdJjtGK7mawQMKG9
 7J+B8OkPWqVHhDel1AqYQd2ftmFce/iErdU03K+hJ981QiQip9CD9PUEiPMzp5JA
 gOaNIiSICUEQ7kHfTew0dePy3vivMY+HVZkbyDamVTf2T/talXWTVquQqVxK9em2
 Zo5JkledQRrqxHM4uBayKyDF/ByQcoATyNXJQVfGNFF3REAATXVicXj4wXapoglm
 PHTbRAWIVYtReGIWJy+gT/dk51VbuZITRJ2U3VBxwzWxAQ7TxRIin4xw+gublT/o
 i8jgcMaTulbVR0jh1QLA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv1q59ygc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:05:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QH5Olb026125
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:05:24 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 09:05:23 -0800
Message-ID: <18dd9a6a-4026-4859-9f4f-9c90e1b06260@quicinc.com>
Date: Fri, 26 Jan 2024 09:05:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC for upstream 2/4] drm/panel: simple: Add EDT
 ETML1010G3DRA panel
Content-Language: en-US
To: Yannic Moog <y.moog@phytec.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
 <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-2-8ec5b48eec05@phytec.de>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-2-8ec5b48eec05@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TqWmzOUZGQyryz-BqpvyPKgeB5_1R9Vl
X-Proofpoint-GUID: TqWmzOUZGQyryz-BqpvyPKgeB5_1R9Vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260126
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
Cc: devicetree@vger.kernel.org, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Primoz Fiser <primoz.fiser@norik.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2024 12:57 AM, Yannic Moog wrote:
> From: Primoz Fiser <primoz.fiser@norik.com>
> 
> Add support for the EDT ETML1010G3DRA 10.1" 1280x800 LVDS panel.
> Datasheet can be found at [1].
> 
> [1] https://www.glynshop.com/erp/owweb/Daten/DSS/EDT/Products/Specifications/Active%20Displays/ETML1010G3DRA%20Ver.3-RoHS.pdf
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>

Hi Yannic,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9367a4572dcf..662cf8d10a8a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1920,6 +1920,33 @@ static const struct panel_desc edt_etml0700y5dha = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing edt_etml1010g3dra_timing = {
> +	.pixelclock = { 66300000, 72400000, 78900000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 12, 72, 132 },
> +	.hback_porch = { 86, 86, 86 },
> +	.hsync_len = { 2, 2, 2 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 1, 15, 49 },
> +	.vback_porch = { 21, 21, 21 },
> +	.vsync_len = { 2, 2, 2 },
> +	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc edt_etml1010g3dra = {
> +	.timings = &edt_etml1010g3dra_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 216,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode edt_etmv570g2dhu_mode = {
>   	.clock = 25175,
>   	.hdisplay = 640,
> @@ -4328,6 +4355,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "edt,etml0700y5dha",
>   		.data = &edt_etml0700y5dha,
> +	}, {
> +		.compatible = "edt,etml1010g3dra",
> +		.data = &edt_etml1010g3dra,
>   	}, {
>   		.compatible = "edt,etmv570g2dhu",
>   		.data = &edt_etmv570g2dhu,
> 
> -- 
> 2.34.1
> 
