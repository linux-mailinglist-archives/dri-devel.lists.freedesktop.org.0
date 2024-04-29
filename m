Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC298B660A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 01:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903A810E3AF;
	Mon, 29 Apr 2024 23:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PJHZ93X5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5912610E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 23:10:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TMDXn6012500;
 Mon, 29 Apr 2024 23:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/iGrcEbU4mTTV/EfBj25+RbJHkCM05W+8/SkVzibSAk=; b=PJ
 HZ93X5HM+lfsu0N18u3oW0M0ouK5FxdpATo2xSgaA/CYIXlIPft/XbdUVJKiwNGc
 ike0M0SUE1aUQ0XmWUp2OeyT1bUTDXKYRSY6zeFKpzHU9bVloLnJ1KYROjLvQG0q
 ze2lqaPN7dsQ9lfOtAlFfftjEPGZ02FrOYU6V5K/Sg1owTMBDpKLQGS/qfbIqGIm
 2j/VJgDr+kTK78wRC7Iiz7/tY3xT2H9Q/tzc7ib2WeLLc0k4NIOSjfLtnHc2fg1B
 WdXZAeviK0apQS4zL19701i5GGw7Nwdzcgu5yrGiby91C6VZ9i+vgzPJ7/gcGhkv
 EEvaSmjAPm494a029WjQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt8jm3qke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2024 23:10:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TNAoih021278
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2024 23:10:50 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 16:10:50 -0700
Message-ID: <86b768d8-19e8-4f87-a250-b428bf78f756@quicinc.com>
Date: Mon, 29 Apr 2024 16:10:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: ili9341: Remove a superfluous else after return
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240429171218.708910-1-sui.jingfeng@linux.dev>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240429171218.708910-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wctaOuyARbRbTh91aLH7BFf4Xl0MWpJ4
X-Proofpoint-ORIG-GUID: wctaOuyARbRbTh91aLH7BFf4Xl0MWpJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_20,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404290153
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



On 4/29/2024 10:12 AM, Sui Jingfeng wrote:
> The else clause after the ruturn clause is not useful.

Hi Sui,

Spelling nit: ruturn --> return

Besides that,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 3574681891e8..433572c4caf9 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -722,7 +722,8 @@ static int ili9341_probe(struct spi_device *spi)
>   
>   	if (!strcmp(id->name, "sf-tc240t-9370-t"))
>   		return ili9341_dpi_probe(spi, dc, reset);
> -	else if (!strcmp(id->name, "yx240qv29"))
> +
> +	if (!strcmp(id->name, "yx240qv29"))
>   		return ili9341_dbi_probe(spi, dc, reset);
>   
>   	return -1;
> -- 
> 2.34.1
> 
