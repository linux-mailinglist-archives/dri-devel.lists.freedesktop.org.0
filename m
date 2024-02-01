Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EF846457
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 00:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635C10ECAE;
	Thu,  1 Feb 2024 23:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AAEX2585";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E34110ECB9
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 23:16:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 411Mx0Nc031358; Thu, 1 Feb 2024 23:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=m4tXmsGkjhrdAbPMvzX2Vc5kgLbLhYTsco4rss/rGiw=; b=AA
 EX2585kmzo0StrPs3AoKPiYjCFeg10wVuTvCJbNQjV3cUczOteieH56DHPn3br5J
 hGWj189P4wpi+QQ60C80PrEyS1YcYNpvQiH9EylNjCPu8R3zPC+qRrYNPgyD2yJP
 4LB0SWIzDd/9M7/AltqUvzdoJy2d1TEC8AOvIGT1VEeT3SYaTsS3FTJ83n8x/VIZ
 ebUZBwJNW7SAqkjjc/9T/5qfu00K4KN5oXqJ5F3kTTtxgSNDWZ/SGVS+AyaByduc
 HfGWZhO49sZe7nA2IrzrLTw6YXMVVLFNpVVk2m1Du+4aM/blK6RX1wsL2jL1KbOd
 9D+o8Xti8OzkFU/KRIaw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyvb5kn03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Feb 2024 23:15:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 411NFvid013179
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Feb 2024 23:15:57 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 15:15:57 -0800
Message-ID: <d7027516-dc30-4a94-9bb0-0a8f38b638be@quicinc.com>
Date: Thu, 1 Feb 2024 15:15:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: novatek-nt36523: Set prepare_prev_first
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Jianhua Lu
 <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240201-topic-3623_fix-v1-1-86ee6f20876e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240201-topic-3623_fix-v1-1-86ee6f20876e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: We3RrldAbfDccZnd-oJsH14sne14AE_u
X-Proofpoint-ORIG-GUID: We3RrldAbfDccZnd-oJsH14sne14AE_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_08,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010179
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



On 2/1/2024 2:17 PM, Konrad Dybcio wrote:
> The .prepare callback contains the init sequence, so the DSI host *must*
> be enabled at that point. Set the prepare_prev_first flag to ensure that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Hi Konrad,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index a189ce236328..32cae1bc9162 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -1270,6 +1270,8 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>   		return ret;
>   	}
>   
> +	pinfo->panel.prepare_prev_first = true;
> +
>   	if (pinfo->desc->has_dcs_backlight) {
>   		pinfo->panel.backlight = nt36523_create_backlight(dsi);
>   		if (IS_ERR(pinfo->panel.backlight))
> 
> ---
> base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
> change-id: 20240201-topic-3623_fix-9198419e5e47
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
