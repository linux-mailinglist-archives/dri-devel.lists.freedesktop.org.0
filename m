Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C069B5184
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 19:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0AF10E6B4;
	Tue, 29 Oct 2024 18:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dy/eED5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6BD10E3AF;
 Tue, 29 Oct 2024 18:05:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAJ7Mk024727;
 Tue, 29 Oct 2024 18:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ElqSJb9a3b/RBSxunk3T5aAUndX26mkUaPtkTWA4g7E=; b=dy/eED5ykt8efLRE
 9M69M77k9tI2PJqKM9eKfW0Kei5RUWlCqoko0Yv6L2eGzJHZw8BFYCW6nqWQtweK
 uiUkTLycLTpCR9yJBIH/5aHA7hFd+HbtsggbyxPxZChAYd9uCZ5mqGDaOaQ4NWa+
 jGu1UylhF0HexzjUK1PpxHJaEickeJqp/3NY2bCP4AcvxCMTocPyC3yCJ/TgvjWp
 9qDxRm4CHxkpCNLa2qGIV6h9E+gECd9gmc4nykj3UPITZ9lkyBTyziB5IC+p9kjX
 ewTadFZqbOvIlwfZKqLgQ/sUqv1GjVH+TdpSmg/APe7AFOTyhq3Z1+1KSmMdbrpd
 PJRknw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgs717-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 18:05:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TI5ocH001486
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 18:05:50 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 11:05:48 -0700
Message-ID: <584639e8-bad8-4083-8c84-c1edcd8fa14e@quicinc.com>
Date: Tue, 29 Oct 2024 11:05:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm/dp: prefix all symbols with msm_dp_
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, kernel
 test robot <lkp@intel.com>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-1-a2564e9457b0@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241028-msm-dp-rename-v1-1-a2564e9457b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aLEk-rOU-c0NnxMW1J2d7rIxblRerLm7
X-Proofpoint-GUID: aLEk-rOU-c0NnxMW1J2d7rIxblRerLm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=780 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290136
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



On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> For historical reasons a lot of symbols in the MSM DisplayPort driver
> used the generic dp_ prefix. Perform a mass-rename of those symbols to
> use msm_dp prefix.
> 
> Basically this is a result of the following script:
> 
> sed drivers/gpu/drm/msm/dp/* -i -e 's/\<dp_/msm_dp_/g'
> sed drivers/gpu/drm/msm/dp/* -i -e 's/"msm_dp_/"dp_/g'
> sed drivers/gpu/drm/msm/dp/* -i -e 's/msm_\(dp_sdp_header\|dp_sdp\)\>/\1/g'
> 
> Yes, this also results in renaming of several struct fields in addition
> to renaming the structs and functions, but I think the simple solution
> is better than the more complex one.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 294 ++++++------
>   drivers/gpu/drm/msm/dp/dp_audio.h   |  38 +-
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 148 +++---
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  18 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 734 +++++++++++++++---------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h | 118 ++---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 482 ++++++++++----------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  40 +-
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  68 +--
>   drivers/gpu/drm/msm/dp/dp_debug.h   |  10 +-
>   drivers/gpu/drm/msm/dp/dp_display.c | 866 ++++++++++++++++++------------------
>   drivers/gpu/drm/msm/dp/dp_display.h |  18 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 108 ++---
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +-
>   drivers/gpu/drm/msm/dp/dp_link.c    | 432 +++++++++---------
>   drivers/gpu/drm/msm/dp/dp_link.h    |  44 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 254 +++++------
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  42 +-
>   drivers/gpu/drm/msm/dp/dp_utils.c   |  20 +-
>   drivers/gpu/drm/msm/dp/dp_utils.h   |   8 +-
>   20 files changed, 1882 insertions(+), 1882 deletions(-)
> 

There is some WIP going on related to DP features, so we will need to 
rebase all of it but I think its better to get this in now rather than 
later, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
