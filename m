Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BD96E012D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855E10E9A2;
	Wed, 12 Apr 2023 21:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9E10E9A2;
 Wed, 12 Apr 2023 21:49:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CLmmq7027196; Wed, 12 Apr 2023 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jZLruuJe6Oqv8QZjb+ZKDIppCDpOSYxb7qvs00aNIco=;
 b=o0nBHwhm2faq187NRIbBbrlq7xzeUmqvmkMScogRAjFaqlAdD3PeD7sNUAzH678t+Tad
 NyDsBQahjDy2JH2GlgkwcL63+HLFROnBTQAfJYT/VMm8LG6dnAp9eMgTMo+sszWdFzlE
 pCDMj+tGFMryTowdWy/W1tyyQZsS5EHFm/kOJ3JuO1yWOYF+aGedtrW2wVW4yvxqioEJ
 frUIrvJ5BLcCYwnm5fRB7z2rTNRLRFbfgwXou3h3pZAeYKfDY18r5D4Gl1XkrbgwcLCf
 nDKn11rfVctSElAeGYfiNv/LwejrASECm3GeOsOaDVicGdFWGvsJ0tJCmllANwZlyHID jw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwj7wjfx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 21:49:39 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CLncPN027796
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 21:49:39 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 14:49:38 -0700
Message-ID: <be12f528-c9e1-311a-2b2e-d7774ff9b266@quicinc.com>
Date: Wed, 12 Apr 2023 14:49:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 2/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-2-0108401d7886@quicinc.com>
 <24f68708-dc1a-59eb-ffdc-288c72b91da6@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <24f68708-dc1a-59eb-ffdc-288c72b91da6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K8rJT2ENzZDuoZXxuVUfRsp84P4Yv8zb
X-Proofpoint-ORIG-GUID: K8rJT2ENzZDuoZXxuVUfRsp84P4Yv8zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_12,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=985 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120185
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/12/2023 12:16 PM, Dmitry Baryshkov wrote:
> On 12/04/2023 22:09, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Changes in v2:
>> - Moved files up to msm/ directory
>> - Dropped get_comp_ratio() helper
>> - Used drm_int2fixp() to convert to integers to fp
>> - Style changes to improve readability
>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>>    method name accordingly
>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>> - Fixed some math issues caused by passing in incorrect types to
>>    drm_fixed methods in get_bytes_per_soft_slice()
>>
>> Changes in v3:
>> - Dropped src_bpp parameter from all methods -- src_bpp can be
>>    calculated as dsc->bits_per_component * 3
>> - Dropped intf_width parameter from get_bytes_per_soft_slice()
>> - Moved dsc->bits_per_component to numerator calculation in
>>    get_bytes_per_soft_slice()
>> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>>    *_get_uncompressed_pclk_per_intf()
>> - Removed dsc->slice_width check from
>>    msm_dsc_get_uncompressed_pclk_per_intf()
>> - Made get_bytes_per_soft_slice() a public method (this will be called
>>    later to help calculate DP pclk params)
>> - Added documentation in comments
>> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
>>
>> Changes in v4:
>> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>>    msm_dsc_get_pclk_per_intf
>>
>> Changes in v5:
>> - Added extra line at end of msm_dsc_helper.h
>> - Simplified msm_dsc_get_bytes_per_soft_slice() math
>> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
>> - Removed unused headers
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 25 ++++++++++++
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 75 
>> ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 101 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 7274c41228ed..b814fc80e2d5 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -94,6 +94,7 @@ msm-y += \
>>       msm_atomic_tracepoints.o \
>>       msm_debugfs.o \
>>       msm_drv.o \
>> +    msm_dsc_helper.o \
>>       msm_fb.o \
>>       msm_fence.o \
>>       msm_gem.o \
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> new file mode 100644
>> index 000000000000..a34614b8e131
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#include <drm/drm_fixed.h>
>> +
>> +#include "msm_dsc_helper.h"
>> +
>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>> +{
>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>> msm_dsc_get_bpp_int(dsc), 8);
>> +}
>> +
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>> intf_width)
>> +{
>> +    u32 bytes_per_soft_slice;
>> +    s64 bytes_per_soft_slice_fp;
>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>> +
>> +    bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>> +
>> +    return bytes_per_soft_slice * slice_per_intf;
>> +}
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..34238153ffdf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,75 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/bug.h>
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>> +/*
>> + * Helper methods for MSM specific DSC calculations that are common 
>> between timing engine,
>> + * DSI, and DP.
>> + */
>> +
>> +/**
>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
>> + * @dsc: Pointer to drm dsc config struct
>> + */
>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>> +{
>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>> +    return dsc->bits_per_pixel >> 4;
>> +}
>> +
>> +/**
>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>> *dsc, int intf_width)
>> +{
>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_dce_bytes_per_line - get bytes per line to help 
>> calculate data width
>> + *    when configuring the timing engine
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>> drm_dsc_config *dsc, int intf_width)
>> +{
>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_pclk_per_intf - Calculate pclk per interface.
>> + * @dsc: Pointer to drm dsc config struct
>> + *
>> + * Note: This value will then be passed along to DSI and DP for some 
>> more
>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>> value
>> + * by different values depending on if widebus is enabled.
>> + */
>> +static inline int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
>> +{
>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>> msm_dsc_get_bpp_int(dsc), 8);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for 
>> dsc
>> + * @dsc: Pointer to drm dsc config struct
> 
> Nit:
> Returns value in fixed point s31.32 format.

Hi Dmitry,

Acked, I'll add docs on the return value for all the helpers.

> 
> Even better would be to make this an internal-only static function. When 
> DSI or DP driver requires it, we can make it public again.

I'd prefer to keep the method public since we're planning to submit DP 
driver DSC v1.2 patches (after this series has been finalized) that will 
make use of this method. Keeping this function public would mean that 
the DP changes won't have to touch the msm_dsc_helper files at all.

Thanks,

Jessica Zhang

> 
>> + */
>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>> intf_width);
>> +
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
> 
> -- 
> With best wishes
> Dmitry
> 
