Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80ED759DFA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5165710E4F2;
	Wed, 19 Jul 2023 18:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6021510E4F2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:57:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JINV9D014385; Wed, 19 Jul 2023 18:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=u4Plk7blDTBNkVxxDGeUQXZ1eEoN8gNVZrwTkuX5Uh0=;
 b=h16axxjQkZq0QAGyxN64nOvNR1Txhp3qeHYSP/4FnZe1nZv6srUjsc4xH/3mnDW+aHVx
 icenmjz9R5sj+owP7e+qMcDhB79LP1cxVZJkqU+2eb6rRDyPi2qVnUMzHL5fIuq7CXQo
 5/YpRpZd5VEVLlaxCFiMSIOOyYJ2CkRLSOtXbLdWDIgki59OTPtlMKoCSVP6Y1envp6i
 B6ofrblT/PhXmxC7HTVwmH9L4OH6QcHGEjnTurWf55Ky5KZCM8spGkAS4e4dZkzGmvas
 Yumu/9EtOWfmRuOn6vHTF1KD/+uu2I7JaNUIxoOEZ5WboHvV3snqrFcw2j7nznZBALuk 1A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxg3v8ufs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jul 2023 18:56:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36JIuuKR003670
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jul 2023 18:56:56 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 19 Jul
 2023 11:56:55 -0700
Message-ID: <36775bbf-78aa-6d00-9dd3-ecdc4619e819@quicinc.com>
Date: Wed, 19 Jul 2023 11:56:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230719130940.659837-1-arnd@kernel.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230719130940.659837-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: T21iE2JSnpaUeIUB3cSDeBMNNQqdRBdB
X-Proofpoint-ORIG-GUID: T21iE2JSnpaUeIUB3cSDeBMNNQqdRBdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_13,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307190171
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/19/2023 6:09 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver only builds when DRM_DISPLAY_DP_HELPER is enabled:
> 
> x86_64-linux-ld: drivers/gpu/drm/panel/panel-visionox-r66451.o: in function `visionox_r66451_enable':
> panel-visionox-r66451.c:(.text+0x105): undefined reference to `drm_dsc_pps_payload_pack'
> 
> Select both CONFIG_DRM_DISPLAY_DP_HELPER and CONFIG_DRM_DISPLAY_HELPER to
> ensure the helper function is always available.

Hi Arnd,

Thanks for catching this -- hadn't seen this issue due to DRM_MSM 
selecting both configs already.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Fixes: a6dfab2738fc2 ("drm/panel: Add driver for Visionox r66451 panel")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 1a0fd0754692e..e8c9f4613a4b4 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -798,6 +798,8 @@ config DRM_PANEL_VISIONOX_R66451
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Visionox
>   	  R66451 1080x2340 AMOLED DSI panel.
> -- 
> 2.39.2
> 
