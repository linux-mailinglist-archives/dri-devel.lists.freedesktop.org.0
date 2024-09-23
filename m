Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B2983917
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 23:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7125710E4A0;
	Mon, 23 Sep 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Xyi40PuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2EE10E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 21:14:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NKnLg5024394;
 Mon, 23 Sep 2024 21:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZXgl4PCb3TvAFDKPDjYDViIP5fOG7TPMmJVSLbpG1Ro=; b=Xyi40PuDVA1oiLP2
 edWhn1GwJKrfBxo1g5w/yRsTOnNcSlc6WIkK/RAWzzwIUgW5RW93xKC0GJ5MV0wO
 LNSEzCX2e9Zx6d+XXQ9utfn/XeVE4utvLF8Lhwt5JrilRaFlVd8ydZbrcy/QGNMc
 v7F4pETM/hcxN0XLb2vK4z1qWgoEw/ZzPuBkpJBUiA+Fjs8TKBF8PAdSpp+RaK/A
 3nEMA9Nl66nR7a2y/ksjRciloMzuXahWaIHomaFIvPQBMD3htES2a9wTu1KUFld1
 e6YoIPaG2TIMK7Do912/VE4TZ54pLEcgD+5rpy/bKzDXKdoiNDkbvbtbU7V+1EgY
 qA17Iw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3s64hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 21:14:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NLEOsT020994
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 21:14:24 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 14:14:23 -0700
Message-ID: <42f0b4b1-87c7-4ebe-94a1-e2ad1a759dd7@quicinc.com>
Date: Mon, 23 Sep 2024 14:14:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 <neil.armstrong@linaro.org>, <sam@ravnborg.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dianders@chromium.org>, <hsinyi@google.com>,
 <awarnecke002@hotmail.com>, <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IV3rl3zIZofrCVveXX6jGA2Vl3uEKWiE
X-Proofpoint-ORIG-GUID: IV3rl3zIZofrCVveXX6jGA2Vl3uEKWiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230152
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



On 9/23/2024 6:42 AM, Zhaoxiong Lv wrote:
> In MTK chips, if the system starts suspending before the DRM runtime
> resume has not completed, there is a possibility of a black screen
> after waking the machine. Reduce the disable delay resolves this issue,

Hi Zhaoxiong,

Do you mean "if the system starts suspending before the DRM runtime 
resume *has* completed" here?

> 
> The "backlight_off_to_display_off_delay_ms" was added between
> "backlight off" and "display off"  to prevent "display off" from being
> executed when the backlight is not fully powered off, which may cause
> a white screen. However, we removed this
> "backlight_off_to_display_off_delay_ms" and found that this situation
> did not occur. Therefore, in order to solve the problem mentioned
> above, we We reduced it from 100ms to 3ms (tCMD_OFF >= 1ms).

So from my understanding of this paragraph, 
`backlight_off_to_display_off_delay_ms` was added to prevent the display 
powering off before backlight is fully powered off. You recently tested 
dropping this completely and saw no issue with this.

If that's the case, why not drop this delay completely?

Thanks,

Jessica Zhang

> 
> This is the timing specification for the two panels:
> 1. Kingdisplay panel timing spec:
> https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
> 2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB
> 
> 
> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
> Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel")
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V2 and V1:
> -  1. Modify the commit message
> -  2. Modify the value of backlight_off_to_display_off_delay_ms.
> v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 44897e5218a6..486aa20e5518 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
>   	.reset_before_power_off_vcioo = true,
>   	.vcioo_to_lp11_delay_ms = 5,
>   	.lp11_to_reset_delay_ms = 10,
> -	.backlight_off_to_display_off_delay_ms = 100,
> +	.backlight_off_to_display_off_delay_ms = 3,
>   	.display_off_to_enter_sleep_delay_ms = 50,
>   	.enter_sleep_to_reset_down_delay_ms = 100,
>   };
> @@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
>   	.reset_before_power_off_vcioo = true,
>   	.vcioo_to_lp11_delay_ms = 5,
>   	.lp11_to_reset_delay_ms = 10,
> -	.backlight_off_to_display_off_delay_ms = 100,
> +	.backlight_off_to_display_off_delay_ms = 3,
>   	.display_off_to_enter_sleep_delay_ms = 50,
>   	.enter_sleep_to_reset_down_delay_ms = 100,
>   };
> -- 
> 2.17.1
> 

