Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306F945493
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 00:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D71110E0F7;
	Thu,  1 Aug 2024 22:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lifs8wPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84510E0F1;
 Thu,  1 Aug 2024 22:41:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Lc3fI017513;
 Thu, 1 Aug 2024 22:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TyUly+lEUnaDKv8dhqyybTCDCtTpDuin4UisKCc/Mjw=; b=lifs8wPF7LMZKem1
 2VgvFR1TO0Dr0ksva19aKknn1f9Au/Ff4678rCuxC5tdjsUD9xgviPx1UfiW5oaq
 4iYKmk6tInRsNo1O6ZerFlG5eVOS9PeoJ99+S1JwoJHgSu4KV3RlXnBNNzRdLj2F
 WQCoGmJdSwFcNSaY1E97ff6YmI9hS1QzWmA6n/USgKhP8Jlw3+2tHxxbcSP2787z
 ogIifblDMMTbQJJuEEPEcsTmuvP4BHWVXtzEh2ChaRl9LuV1zBZgMjKwzhkJJp2Y
 aqMNgRpfZ8qT8iQcwA7EOGcngTg8wsfdFLvSWbOICWpCrx1MFYf9ZD8VyHRa1yOg
 qXMj/Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rjeb83ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2024 22:41:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471Mf1VX005912
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2024 22:41:01 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:41:00 -0700
Message-ID: <732467b0-9983-427a-b64d-b8af88f1fcca@quicinc.com>
Date: Thu, 1 Aug 2024 15:41:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/panel: panel-orisetech-otm8009a: Use backlight
 power constants
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Neil
 Armstrong <neil.armstrong@linaro.org>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-5-tzimmermann@suse.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240731122311.1143153-5-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m2x_kyNFD8dj6wn5lbT_FIME7DUnXmKW
X-Proofpoint-ORIG-GUID: m2x_kyNFD8dj6wn5lbT_FIME7DUnXmKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_20,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010151
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
>   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index 93183f30d7d6..a9b5dad70bc1 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -389,7 +389,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
>   		return -ENXIO;
>   	}
>   
> -	if (bd->props.power <= FB_BLANK_NORMAL) {
> +	if (bd->props.power <= BACKLIGHT_POWER_REDUCED) {
>   		/* Power on the backlight with the requested brightness
>   		 * Note We can not use mipi_dsi_dcs_set_display_brightness()
>   		 * as otm8009a driver support only 8-bit brightness (1 param).
> @@ -465,7 +465,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>   
>   	ctx->bl_dev->props.max_brightness = OTM8009A_BACKLIGHT_MAX;
>   	ctx->bl_dev->props.brightness = OTM8009A_BACKLIGHT_DEFAULT;
> -	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
> +	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
>   	ctx->bl_dev->props.type = BACKLIGHT_RAW;
>   
>   	drm_panel_add(&ctx->panel);
> -- 
> 2.45.2
> 
