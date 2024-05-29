Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C78D3F8C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 22:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70451128EF;
	Wed, 29 May 2024 20:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="m5QQ9EY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DEB10FAAF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 20:24:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TKAS29019859;
 Wed, 29 May 2024 20:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 15Q/WFvKJeSeWdTC0wHFvU6ZrvIrtGaXBSccicqqmJY=; b=m5QQ9EY+neU4Q2Qo
 URE1T/mHgFSFYfHJIao3A9njHgZzZahI+iZsypk80WE7K1vaxMPbFt2CAlWIRCZ6
 9rL5WanVsMnK4d0mB5c5NlWTdMzIlSGYBsjKoyl6VFtAx3grF8P2PCeyANMb+qxX
 f+9I0FQ56dvyAdqBlwFChY5ovwpxtyZZnVfZ0+kkkzgi4mCG5wRrZ7+YxWeiCJ6U
 s6rdHxJCvXxGYNY6Kw5k7mpbuKVwhot/2bzMdx/UvGLAhXac3L9/8Gn/D10NN4fN
 aI7QTDKMOMdNm16FebCGtWQkzZkY6XBKaekYRf9kN37cfwc4YqSA+RX866Rjg3hG
 ERHymQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qj9vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 20:24:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TKO4GT031058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 20:24:04 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 13:24:04 -0700
Message-ID: <da0bb4ea-cc74-458d-8869-22bd127d9654@quicinc.com>
Date: Wed, 29 May 2024 13:24:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panel: sitronix-st7789v: fix display size for
 jt240mhqs_hwt_ek_e3 panel
Content-Language: en-US
To: Gerald Loacker <gerald.loacker@wolfvision.net>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
 <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-3-e4821802443d@wolfvision.net>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-3-e4821802443d@wolfvision.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ryeOim6n8OyN9GzHpy5DBoJDYKXqgxLw
X-Proofpoint-ORIG-GUID: ryeOim6n8OyN9GzHpy5DBoJDYKXqgxLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290143
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



On 5/29/2024 7:42 AM, Gerald Loacker wrote:
> This is a portrait mode display. Change the dimensions accordingly.
> 
> Fixes: 0fbbe96bfa08 ("drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support")
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index c7e3f1280404..e8f385b9c618 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -289,8 +289,8 @@ static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
>   	.vsync_start = 280 + 48,
>   	.vsync_end = 280 + 48 + 4,
>   	.vtotal = 280 + 48 + 4 + 4,
> -	.width_mm = 43,
> -	.height_mm = 37,
> +	.width_mm = 37,
> +	.height_mm = 43,
>   	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
>   };
>   
> 
> -- 
> 2.37.2
> 
