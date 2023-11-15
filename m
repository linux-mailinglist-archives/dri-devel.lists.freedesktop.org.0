Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240827ED686
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF9610E273;
	Wed, 15 Nov 2023 22:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62E110E273
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 22:00:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFLulrR007904; Wed, 15 Nov 2023 22:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E0An5yrd9bGdn4IfRSFwbYQsP+0QhwagbB5o7ru+fgk=;
 b=m62N3RKtvNhXczGriCvSMZaQQRRu7qrNQ9IiXmUy1gc6u/X+a/Hlptg745gmCgg5rkP/
 Cy4wA34Uv+8ED1G7MO192nfjdUYDoy8pF2+C9bUIp2YpIusX/1O1yU2jBuLtnchOS2l1
 el3u0o1NLFRYqGOjFCSJeAdcYKsvLw7b+Hlu/qZRstSk0gLL+52EoYryXVjFy1SCsbjZ
 5FDXNFz86klQVDf1dKVDl6G1LpCehMbgiXJ3qKPSHRratuNNA0ZmEgHt/um6Xfm6z+hs
 sRiJQSSsvqXXpLNJAuAM5CiCj/wtk8MvpXSE2ItuASaqU70ac6+1q2MvR0nNQMKZaJrQ 9w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ud5fhg3m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:00:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFM0iAi011908
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 22:00:44 GMT
Received: from [10.110.75.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 14:00:43 -0800
Message-ID: <adc6542a-41e6-4447-a2ce-9e49ff9fb318@quicinc.com>
Date: Wed, 15 Nov 2023 14:00:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panel-elida-kd35t133: drop
 drm_connector_set_orientation_from_panel
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
 <20231115152647.2303283-4-macroalpha82@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231115152647.2303283-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MYRbVukk9mkHAlnEXNegyRoDF3YCCdqC
X-Proofpoint-ORIG-GUID: MYRbVukk9mkHAlnEXNegyRoDF3YCCdqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=922
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150173
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/2023 7:26 AM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Stop calling drm_connector_set_orientation_from_panel() as its now
> called by the panel bridge directly when it is initialized.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index f1fc4a26f447..29b4ee63d83b 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -211,11 +211,6 @@ static int kd35t133_get_modes(struct drm_panel *panel,
>   	connector->display_info.width_mm = mode->width_mm;
>   	connector->display_info.height_mm = mode->height_mm;
>   	drm_mode_probed_add(connector, mode);
> -	/*
> -	 * TODO: Remove once all drm drivers call
> -	 * drm_connector_set_orientation_from_panel()
> -	 */
> -	drm_connector_set_panel_orientation(connector, ctx->orientation);
>   
>   	return 1;
>   }
> -- 
> 2.34.1
> 
