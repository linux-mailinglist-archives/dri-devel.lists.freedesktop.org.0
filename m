Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611A88A904
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 17:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1575410E35F;
	Mon, 25 Mar 2024 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N/G9g9cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176AE10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:23:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42PFDioK005414; Mon, 25 Mar 2024 16:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=KI62ssUoQ/v/3MXeH8rC+jRnVUy4X9gSCJweqEojCU4=; b=N/
 G9g9cbjNBd40mg1l3IX56YCQiwoBBn9rWufMB0n+kM1yCHkLR/4qoJKI++rEHcl/
 xbvYmj+KRt4/tY8SkjBbsbzsJKhPn1n3UZQoIC3JqpcCYzLRu9hmEqdMCQaTkeXs
 rPNMwQuzuh/6QsezsMw46Hu+8f+OaVC1aWg17u6B5Grxb8Be4fss1oyFNpwhraC1
 1j456IJGpADw/Uq5jjnjNjWs+KQYymkRbgmWEIh5wCAskiopJeJZibve9VIT59N1
 fuB9Y6x3shsp3DeEfIjkSoxCekmR3MR/ryecQ5hCChltTiBiYmVMTF1AsvF2jznn
 2Dd19IzRfy3c442VzEFg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x392mrhd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 16:23:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PGNo20019745
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Mar 2024 16:23:50 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 09:23:50 -0700
Message-ID: <01926de1-c914-46c5-8b38-0295bd3d9577@quicinc.com>
Date: Mon, 25 Mar 2024 09:23:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/panel: replace utf multiply with an ascii x
Content-Language: en-US
To: Prasad Pandit <ppandit@redhat.com>
CC: <diogo.ivo@tecnico.ulisboa.pt>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Prasad Pandit
 <pjp@fedoraproject.org>
References: <20240323073923.1824802-1-ppandit@redhat.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240323073923.1824802-1-ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RQVnQRhqF1GFvHAoC_6Tx9tkTg_9nt11
X-Proofpoint-GUID: RQVnQRhqF1GFvHAoC_6Tx9tkTg_9nt11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_13,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 mlxlogscore=778 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250092
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



On 3/23/2024 12:39 AM, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Replace unicode multiplication character with an ascii x.
> It helps Kconfig parsers to read file without error.

Hi Prasad,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Fixes: 25205087df1f ("drm/panel: Add driver for JDI LPM102A188A")
> Fixes: c96f566273bf ("drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel")
> Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
> ---
>   drivers/gpu/drm/panel/Kconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> v1:
>   - Fix other similar occurrences of utf multiply
> v0:
>   - https://lore.kernel.org/dri-devel/1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com/T/#t
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8f3783742208..40a021ee91c3 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -259,7 +259,7 @@ config DRM_PANEL_JDI_LT070ME05000
>   	help
>   	  Say Y here if you want to enable support for JDI DSI video mode
>   	  panel as found in Google Nexus 7 (2013) devices.
> -	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
> +	  The panel has a 1200(RGB)x1920 (WUXGA) resolution and uses
>   	  24 bit per pixel.
>   
>   config DRM_PANEL_JDI_LPM102A188A
> @@ -270,7 +270,7 @@ config DRM_PANEL_JDI_LPM102A188A
>   	help
>   	  Say Y here if you want to enable support for JDI LPM102A188A DSI
>   	  command mode panel as found in Google Pixel C devices.
> -	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
> +	  The panel has a 2560x1800 resolution. It provides a MIPI DSI interface
>   	  to the host.
>   
>   config DRM_PANEL_JDI_R63452
> @@ -801,7 +801,7 @@ config DRM_PANEL_TDO_TL070WSH30
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for TDO TL070WSH30 TFT-LCD
> -	  panel module. The panel has a 1024×600 resolution and uses
> +	  panel module. The panel has a 1024x600 resolution and uses
>   	  24 bit RGB per pixel. It provides a MIPI DSI interface to
>   	  the host, a built-in LED backlight and touch controller.
>   
> -- 
> 2.44.0
> 
