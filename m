Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65166FE5EF
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 23:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502D10E52B;
	Wed, 10 May 2023 21:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93310E52B;
 Wed, 10 May 2023 21:03:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKIR4k021947; Wed, 10 May 2023 21:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6fzpUMWli1lP0CKQe0nSYQYENur5LPpPsWI4flPvpRE=;
 b=GvGq/Ejb1PIfVvD9LMdfRAj8JWatxcZ17/WHbWfxDy237Q/qV5t67Hh7AjB+3w3xrdau
 GQq4176RDFp5MB+Vettfa8xAeaLdO1E9o6hQIjr2+UM7hNEi+zD2p0cTvqEokLrBgqua
 aFStouft74QHI7cNxjojGW416cZCJwMDtHgdjKI64FZQn7sYaYfSIiuakFWyg2+ZqGPL
 NzZ2ydhCOXl9e0G08xt7TD5Z2zMy29OS2aipg2ylR+pYKsKI+cV1N8U4KnIdL1ML09/8
 fVUM5qA71Q4Si2t8oDT495RgO90cQrFPAgfL/+oSp8jHZ1I0Cv6wWsQLvfPPduhnPZFJ yg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgdd9rr07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 21:03:16 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AL3FwN020001
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 21:03:15 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 14:03:14 -0700
Message-ID: <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
Date: Wed, 10 May 2023 14:03:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P9EyKBbBY3Nj-VU69nFhvHGlO1KbsXgq
X-Proofpoint-ORIG-GUID: P9EyKBbBY3Nj-VU69nFhvHGlO1KbsXgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100171
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/2023 11:33 PM, Marijn Suijten wrote:
> On 2023-05-09 15:06:50, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 69 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 96 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 7274c41228ed..b814fc80e2d5 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -94,6 +94,7 @@ msm-y += \
>>   	msm_atomic_tracepoints.o \
>>   	msm_debugfs.o \
>>   	msm_drv.o \
>> +	msm_dsc_helper.o \
>>   	msm_fb.o \
>>   	msm_fence.o \
>>   	msm_gem.o \
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> new file mode 100644
>> index 000000000000..29feb3e3b5a4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <drm/drm_fixed.h>
>> +
>> +#include "msm_dsc_helper.h"
>> +
>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>> +{
>> +	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);
> 
> How about using dsc->slice_chunk_size?

Hi Marijn,

Thanks for pointing this out. However, I would prefer to keep this fixed 
point version of the slice_chunk_size math as the downstream DP math 
also uses fixed point [1].

If we are able to confirm that integer math also works for DP, we will 
make the change to use slice_chunk_size within the DP DSC series.

I also want to note that this math has stayed the same throughout all 7 
revisions. In the interest of making review more efficient, I think it 
would be helpful to point out important details like this early on in 
the process. That way we can address major concerns early on and keep 
the number of revisions per series low.

[1] 
https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335

> 
>> +}
>> +
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
>> +{
>> +	u32 bytes_per_soft_slice;
>> +	s64 bytes_per_soft_slice_fp;
>> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>> +
>> +	bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>> +	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>> +
>> +	return bytes_per_soft_slice * slice_per_intf;
>> +}
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..38f3651d0b79
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,69 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <linux/bug.h>
>> +#include <linux/math.h>
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>> +/*
>> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
>> + * DSI, and DP.
>> + */
>> +
>> +/**
>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
> 
> For all function docs, don't forget the trailing parenthesis after the
> function name: msm_dsc_get_bpp_int()
> 
> https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation

Acked.

> 
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: BPP integer value
>> + */
>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>> +{
>> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>> +	return dsc->bits_per_pixel >> 4;
>> +}
>> +
>> +/**
>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + * Returns: Integer representing the slice per interface
>> + */
>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
>> +{
>> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> 
> Looks good.
> 
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: Integer value representing pclk per interface
>> + *
>> + * Note: This value will then be passed along to DSI and DP for some more
>> + * calculations. This is because DSI and DP divide the pclk_per_intf value
>> + * by different values depending on if widebus is enabled.
>> + */
>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
>> +{
>> +	return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * msm_dsc_get_bpp_int(dsc), 8);
> 
> dsc->slice_chunk_size * dsc->slice_count?

Acked.

> 
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for dsc
> 
> Explain to the reader what a "soft" slice is?

A soft slice is a slice defined in software as opposed to "hard slices" 
that are defined by hardware.

Since the slice-related variables in drm_dsc_config hold information 
related to soft slices and there is no separate variable for hard 
slices, I'll change this name to *_get_bytes_per_slice instead.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: s31.32 fixed point value representing bytes per soft slice
>> + */
>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + * Returns: u32 value representing bytes per interface
>> + */
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
>> +
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
>> -- 
>> 2.40.1
>>
