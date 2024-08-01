Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7B945496
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 00:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15CA10E10E;
	Thu,  1 Aug 2024 22:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="F4qo/ekD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987DA10E101;
 Thu,  1 Aug 2024 22:42:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Lah5V020239;
 Thu, 1 Aug 2024 22:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aq5nd7zHR2ID74oXc/G9myH251MrBkqGMXVzZ4wZsic=; b=F4qo/ekDjXzQBWBb
 faonhQRPD3cqot+xGu3HKiQbDK+v92gTEb0TdnvQroPQ+lRvs+sfswrdMSjW9rvb
 FPIDQg2UyshYr9TZggzNeRQ0YmLz3jplFOudRgKe1hxqcFBDCBq81PaRkw1qyUge
 fE5vyqN62QctrbThRIHgR6KKacKAL6Ozifi0fdu6z0S5xvLL5UITBkDidWqtTGzu
 PCxpKWh8AYpUkBsynYj2g0jaTo9BHhlBM7/lXh37oeNIXPRsGQp/gCqnS1Wu2JuX
 EMZQuuAWXcR9HaXgBTTw1O5yOLlbg3FDl91E1ZWVg/g8wGj8/xqhzy920ENHIVbY
 yqW72g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje9g3kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2024 22:42:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471Mg5SX009848
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2024 22:42:05 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:42:00 -0700
Message-ID: <caf9cdfa-f01d-417d-b915-028551cfb233@quicinc.com>
Date: Thu, 1 Aug 2024 15:41:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/panel: panel-samsung-s6e63j0x03: Use backlight
 power constants
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Neil
 Armstrong <neil.armstrong@linaro.org>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-6-tzimmermann@suse.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240731122311.1143153-6-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CvSc8oFOwLto37IC1ik2TW9GRV7nQ7dK
X-Proofpoint-ORIG-GUID: CvSc8oFOwLto37IC1ik2TW9GRV7nQ7dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408010152
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/31/2024 5:17 AM, Thomas Zimmermann wrote:
> Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality or semantics.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index 46d6f4a87bf7..ed53787d1dea 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -225,7 +225,7 @@ static int s6e63j0x03_disable(struct drm_panel *panel)
>   	if (ret < 0)
>   		return ret;
>   
> -	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
>   
>   	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>   	if (ret < 0)
> @@ -245,7 +245,7 @@ static int s6e63j0x03_unprepare(struct drm_panel *panel)
>   	if (ret < 0)
>   		return ret;
>   
> -	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
>   
>   	return 0;
>   }
> @@ -332,7 +332,7 @@ static int s6e63j0x03_prepare(struct drm_panel *panel)
>   	if (ret < 0)
>   		goto err;
>   
> -	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
>   
>   	return 0;
>   
> @@ -393,7 +393,7 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
>   	if (ret < 0)
>   		return ret;
>   
> -	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_ON;
>   
>   	return 0;
>   }
> @@ -473,7 +473,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
>   
>   	ctx->bl_dev->props.max_brightness = MAX_BRIGHTNESS;
>   	ctx->bl_dev->props.brightness = DEFAULT_BRIGHTNESS;
> -	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
>   
>   	drm_panel_add(&ctx->panel);
>   
> -- 
> 2.45.2
> 
