Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2528188D2F0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 00:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DD510F50B;
	Tue, 26 Mar 2024 23:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EMo2bHsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A1810F509;
 Tue, 26 Mar 2024 23:49:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QNEQu4014511; Tue, 26 Mar 2024 23:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=9ygNSKWigxxSiG8vm/03wcV88OhZVnBOj2l0E/mzzSY=; b=EM
 o2bHsWxrXdGbU0K/i1epz0yw6oSHTgW4La/GfvmXKlHvKcczgyh7MhhhEYKW1dPP
 vTsOroaNrsaLFZddw95YPL6TdgFreVzUmMcreBmSq5cf4XFSLq38VpGtwTeurOk4
 abT0GcnsNIpY1xT0cP6maqNRdoythzQD7j+dA/yHtP2D283nk+PDYkRONUsS20ZH
 xDbiYQUJyQAQeS8vC+3SzZTVR9/pJak2g55d67iwVhNsw0HsQj3IR/RkWP7lhxNq
 WsWx4uNwj4orKFtYryPS+G8sSs7q/4yP1ANxw0KTNJp4+/KH/omcaxkDbU0/2hFV
 NykuyvqN4C3mgsHIbKHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4780g4d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 23:49:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QNn16i024061
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 23:49:01 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 16:48:58 -0700
Message-ID: <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
Date: Tue, 26 Mar 2024 16:48:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ytpkpPOFBnJBAyBJEVzUO_pikIHPgZ3r
X-Proofpoint-ORIG-GUID: ytpkpPOFBnJBAyBJEVzUO_pikIHPgZ3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_10,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403260170
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



On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> Generate DRM/MSM headers on the fly during kernel build. This removes a
> need to push register changes to Mesa with the following manual
> synchronization step. Existing headers will be removed in the following
> commits (split away to ease reviews).
> 

This change does two things:

1) move adreno folder compilation under "adreno-y", move display related 
files compilation undere "msm-display-y", move common files under "msm-y"

2) changes to generate the header using gen_header.py

Why not split it into two changes?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/.gitignore |  1 +
>   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
>   drivers/gpu/drm/msm/msm_drv.c  |  3 +-
>   drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
>   4 files changed, 80 insertions(+), 23 deletions(-)
> 

<snip>

Are below two changes related to this patch?

> +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 97790faffd23..9c33f4e3f822 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -17,8 +17,9 @@
>   
>   #include "msm_drv.h"
>   #include "msm_debugfs.h"
> +#include "msm_gem.h"
> +#include "msm_gpu.h"
>   #include "msm_kms.h"
> -#include "adreno/adreno_gpu.h"
>   
>   /*
>    * MSM driver version:
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 655002b21b0d..cd185b9636d2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -11,7 +11,7 @@
>   #include "msm_mmu.h"
>   #include "msm_fence.h"
>   #include "msm_gpu_trace.h"
> -#include "adreno/adreno_gpu.h"
> +//#include "adreno/adreno_gpu.h" 

you can just drop this line

>   
>   #include <generated/utsrelease.h>
>   #include <linux/string_helpers.h>
> 
