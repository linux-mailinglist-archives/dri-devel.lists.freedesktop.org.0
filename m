Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4A94548D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 00:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB7110E0DC;
	Thu,  1 Aug 2024 22:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UmC9BcGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41BA10E0DC;
 Thu,  1 Aug 2024 22:38:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Lao6d031920;
 Thu, 1 Aug 2024 22:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tfVWpSmPQi6UTpTFIn1gv05QunuW4Xf80ucdY6qUjis=; b=UmC9BcGQQ3WcZFbj
 TyMTytvaaI27qdqYg6rDdfSpiLSaUOYRl7STaXMF9weitZ9eWnxRuNnc8DsZAvbG
 tgheepC6qlRahMO8mrNQ/DPmFwh1opllqIOdr2uM2HmtGbgpdjf3Sd0OxG1flYEf
 ylaovclssoCSevhcgFSPtbwy8bFraqkmx6Z+b0qbi9d4qgALW/F114kp5rAubeNH
 prjcNRP9EPwAMI79bRdOqxQIBhUo8yOak5vGojmeO3thzccdmP3EM3IhUdcSWDqV
 0EVE6/Ld2PUy2DE38lcJFQFixYf+8oGycl0XAuThOogszIKekBYqVh34L57+dpTO
 EdPTaA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rjec0383-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2024 22:37:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471MbZj2024266
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2024 22:37:35 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:37:35 -0700
Message-ID: <e0548e46-ffe0-4961-8ac1-94d6ab5e7772@quicinc.com>
Date: Thu, 1 Aug 2024 15:37:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/panel: panel-novatak-nt35510: Use backlight power
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Linus
 Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-4-tzimmermann@suse.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240731122311.1143153-4-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Vp_e8c8I0w8ME_948mKFU2vclgX4gcM3
X-Proofpoint-GUID: Vp_e8c8I0w8ME_948mKFU2vclgX4gcM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_20,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>

Hi Thomas,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35510.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index d3bfdfc9cff6..57686340de49 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -1166,7 +1166,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>   			bl->props.brightness = nt->conf->wrdisbv;
>   		else
>   			bl->props.brightness = 255;
> -		bl->props.power = FB_BLANK_POWERDOWN;
> +		bl->props.power = BACKLIGHT_POWER_OFF;
>   		nt->panel.backlight = bl;
>   	}
>   
> -- 
> 2.45.2
> 
