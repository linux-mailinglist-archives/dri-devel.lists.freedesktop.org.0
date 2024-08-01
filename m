Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37F9454A0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 00:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AF510E10F;
	Thu,  1 Aug 2024 22:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TysPed4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794C10E10F;
 Thu,  1 Aug 2024 22:46:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaVEr008051;
 Thu, 1 Aug 2024 22:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /TmLnlyPl+0sLaIjlUg/6EP9PUuevAR47Hi/O2+kkRU=; b=TysPed4sdUQS8T+y
 96tc0lAjSibitG5YbUPE32UtBoQPUH8RNSwk0N2uZjn1MWnLJJGMs3TH9bu1l/Pb
 EYuk6OiS75QO3kLTAWOm6IXTF40/ssb+PSli6otvr6UeQ4zvSpoYuaSmse94SiGU
 Qwwtt06JMs3slT3kiaWsiYpfrc7eYt22mozj7k6p+IsTbucdB2miXCYO8pl68UKt
 sxrmFkTjlDxG36PYYi0MlPq1fiFx6t/1r9H+Wj8C0Qz4yGEOEKKkb/3pZNWNWAog
 G6q4upMFK5xgod11N20AVHwVCNZVhBmRQdF9n+4fJf7IAkQ4dNdqEUSCSn8AW2Mp
 M9WqDQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje6r3sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2024 22:46:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471MkfOG016459
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2024 22:46:41 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:46:41 -0700
Message-ID: <2d17e426-29b4-4215-af02-bde40451d3b3@quicinc.com>
Date: Thu, 1 Aug 2024 15:46:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panel: panel-samsung-s6e3ha2: Use backlight power
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Neil
 Armstrong <neil.armstrong@linaro.org>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-7-tzimmermann@suse.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240731122311.1143153-7-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 35q7Cj30D5AMTb7QXy2R-dYDZY03ce5Q
X-Proofpoint-GUID: 35q7Cj30D5AMTb7QXy2R-dYDZY03ce5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010152
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
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 639a4fdf57bb..ab8b58545284 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -458,7 +458,7 @@ static int s6e3ha2_set_brightness(struct backlight_device *bl_dev)
>   		return -EINVAL;
>   	}
>   
> -	if (bl_dev->props.power > FB_BLANK_NORMAL)
> +	if (bl_dev->props.power > BACKLIGHT_POWER_REDUCED)
>   		return -EPERM;
>   
>   	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_on_f0(ctx));
> @@ -508,7 +508,7 @@ static int s6e3ha2_disable(struct drm_panel *panel)
>   	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_off(dsi));
>   
>   	msleep(40);
> -	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
>   
>   	return 0;
>   }
> @@ -554,7 +554,7 @@ static int s6e3ha2_prepare(struct drm_panel *panel)
>   	if (ret < 0)
>   		goto err;
>   
> -	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
>   
>   	return 0;
>   
> @@ -601,7 +601,7 @@ static int s6e3ha2_enable(struct drm_panel *panel)
>   	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_off_f0(ctx));
>   
>   	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_on(dsi));
> -	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_ON;
>   
>   	return 0;
>   }
> @@ -729,7 +729,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
>   
>   	ctx->bl_dev->props.max_brightness = S6E3HA2_MAX_BRIGHTNESS;
>   	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
> -	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
>   
>   	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> -- 
> 2.45.2
> 
