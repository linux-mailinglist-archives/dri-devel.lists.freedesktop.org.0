Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC38818AD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6FA10F62B;
	Wed, 20 Mar 2024 20:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PMkqrwzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86410E039
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:38:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42KJoP2P027154; Wed, 20 Mar 2024 20:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OnNPBOJG99sLl6xnj4rFf8mUA0PEh3eDPw9A7LF1ZT8=; b=PM
 kqrwzk062/TPCWIzs/zUpJ9fZCivQm+62RslNWMmsdMyOKgXZmZYpdRtzL6pgO+Z
 w6moGu6da86qw6SDvkVWCmWdTLgC/4TOOs8u1AnplxFIiCQieLAkYhMa4Ziwg+/N
 ARz7LULG/cYJIhQmFLOyu5EqrMA/eei2K1MnxGDFL+AaxbQ+vifay9JCxgR2+KTE
 pmOmcQQrLTe9/Q0qah1cVMaxOVRWtP/b2S9k2FteWRk4UWfgnHNy/aFpeWk2CwD/
 qqOEgRkMd0aRMs5pAY+Hx+7cWp6Ar/O5/LoA8MO7ettxDkj5FGu+5l2YGt+sGfiB
 kLrS1UdZhI4n+zwoIPQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyrp7a2ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Mar 2024 20:38:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KKcK46021230
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Mar 2024 20:38:20 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 13:38:19 -0700
Message-ID: <43149aa6-e6b9-487b-9d98-e2281d65e2bb@quicinc.com>
Date: Wed, 20 Mar 2024 13:38:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to
 LTK050H3148W flags
To: Heiko Stuebner <heiko@sntech.de>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <quentin.schulz@theobroma-systems.com>,
 <klaus.goger@theobroma-systems.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240320131232.327196-1-heiko@sntech.de>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240320131232.327196-1-heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1t2UMwHijK8EBCOLBgnA6x-Naz_MlNTe
X-Proofpoint-GUID: 1t2UMwHijK8EBCOLBgnA6x-Naz_MlNTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_11,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403200164
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



On 3/20/2024 6:12 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Similar to other variants, the LTK050H3148W wants to run in video mode
> when displaying data. So far only the Synopsis DSI driver was using this
> panel and it is always switching to video mode, independent of this flag
> being set.
> 
> Other DSI drivers might handle this differently, so add the flag.
> 
> Fixes: e5f9d543419c ("drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Hi Heiko,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 30919c872ac8..a50f5330a661 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -326,7 +326,8 @@ static const struct drm_display_mode ltk050h3148w_mode = {
>   static const struct ltk050h3146w_desc ltk050h3148w_data = {
>   	.mode = &ltk050h3148w_mode,
>   	.init = ltk050h3148w_init_sequence,
> -	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO_BURST,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_VIDEO_BURST,
>   };
>   
>   static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
> -- 
> 2.39.2
> 
