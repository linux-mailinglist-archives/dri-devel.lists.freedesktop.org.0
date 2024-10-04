Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49E991119
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 23:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C310B10EAB2;
	Fri,  4 Oct 2024 21:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YgYuA8qx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4F10EAB2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 21:04:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AWxPd025555;
 Fri, 4 Oct 2024 21:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o1hG0uigKPKLd7MZiP0E36zG2soH19zWr9IJPPcvcOc=; b=YgYuA8qxMO5ztFAf
 Q/gp4rv3aIDuzMUBme0oLQTo/qgAbVY6Q4QXBrOqxH1sG5KV+7savlqIFPC+Jbmb
 3ikhBqi8vejapSD3zf0oISzL96CodbHaXZjNm7RUOiUsk6uLY7zZmzrQEYkiokcg
 ynjYjV6ZRX04WeWmTR4jkq52W55VIflZIVei0ApyjFyET1gsmxO443/9jYZ4sUPz
 0CeP0whTHISm8hKcRjGuqymC+3BK+z4/fEl4qmS002XjzwNb6V188yE54wmn2i5P
 N/t9rnKKy2trk7wcYdQ3CfzdUTQzPqjAkDfbiYgquhyR0feSiMn25mxvC4jYrya5
 cUabvA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kk8sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 21:04:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494L4TIe014511
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 21:04:29 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 14:04:28 -0700
Message-ID: <2a4f79f6-fd67-48c4-a06f-b1c1c85363c4@quicinc.com>
Date: Fri, 4 Oct 2024 14:04:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: panel: jd9365da-h3: Remove unused num_init_cmds
 structure member
To: Hugo Villeneuve <hugo@hugovil.com>, Jagan Teki <jagan@edgeble.ai>, Neil
 Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240930170503.1324560-1-hugo@hugovil.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240930170503.1324560-1-hugo@hugovil.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CEEzi8FV4nSMDuy67RWw_i0698R69Qv6
X-Proofpoint-GUID: CEEzi8FV4nSMDuy67RWw_i0698R69Qv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040145
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



On 9/30/2024 10:05 AM, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Now that the driver has been converted to use wrapped MIPI DCS functions,
> the num_init_cmds structure member is no longer needed, so remove it.
> 
> Fixes: 35583e129995 ("drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hi Hugo,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 44897e5218a6..45d09e6fa667 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -26,7 +26,6 @@ struct jadard_panel_desc {
>   	unsigned int lanes;
>   	enum mipi_dsi_pixel_format format;
>   	int (*init)(struct jadard *jadard);
> -	u32 num_init_cmds;
>   	bool lp11_before_reset;
>   	bool reset_before_power_off_vcioo;
>   	unsigned int vcioo_to_lp11_delay_ms;
> 
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> -- 
> 2.39.5
> 

