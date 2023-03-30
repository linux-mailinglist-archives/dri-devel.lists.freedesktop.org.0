Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D36D12D2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87F110F092;
	Thu, 30 Mar 2023 23:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B700410F084;
 Thu, 30 Mar 2023 23:06:31 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32UMmvmE002366; Thu, 30 Mar 2023 23:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KA5QS3Uas5RwJJmqsHyH05GRhmeGft4J5luuRhbk1yA=;
 b=fSSjxbqX2QD1nxZ2TrvI+535MaphVIMM1DsT8PJ3WIYjHYr0H343Fcoa6vtR1p6Qpdf9
 WErnjYhEciKPJTB6c7BXUCgRqhjW7C1M7wGiHjYooO0n7HU8gtJ2dUNL1bEMK6LhZVQb
 0lHKJw1Qx+Z+EFjcmESFoj96TJEGD1FHNKSRgV645v0LDOtsgs27liwe+SAVkFp0+/st
 Bsus05dLNNkMcSC3ozH23VedQtV6EbXAaMxB5xSfk/zbvYEFOvQm8pAPoTMeF2Bbwy9r
 9N6XyJmpABy0uyYW9Z6vqrGzQv0uqznDNeUybJoDtbVm+A+RDJ6ku7ap2IJMF6OkoNsk 9A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pn7m3hxpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Mar 2023 23:06:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32UN6StQ011366
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Mar 2023 23:06:28 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 30 Mar
 2023 16:06:27 -0700
Message-ID: <c8de2c5b-94e7-1f68-90f9-f817689a779f@quicinc.com>
Date: Thu, 30 Mar 2023 16:06:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Freedreno] [PATCH RFC 2/5] drm/msm: Add MSM-specific DSC helper
 methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
 <02a1e227-3aff-1b05-8171-2aa2f3872596@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <02a1e227-3aff-1b05-8171-2aa2f3872596@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WycoloqI2HQCPlBsToKl-iW0mtTe-fCl
X-Proofpoint-GUID: WycoloqI2HQCPlBsToKl-iW0mtTe-fCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_13,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=901
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300181
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



On 3/29/2023 5:40 PM, Dmitry Baryshkov wrote:
> On 30/03/2023 02:18, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile              |  1 +
>>   drivers/gpu/drm/msm/disp/msm_dsc_helper.c | 74 
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/msm_dsc_helper.h | 28 ++++++++++++
>>   3 files changed, 103 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 7274c41228ed..897a5b1c88f6 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -90,6 +90,7 @@ msm-y += \
>>       disp/mdp_kms.o \
>>       disp/msm_disp_snapshot.o \
>>       disp/msm_disp_snapshot_util.o \
>> +    disp/msm_dsc_helper.o \
>>       msm_atomic.o \
>>       msm_atomic_tracepoints.o \
>>       msm_debugfs.o \
>> diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.c 
>> b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
>> new file mode 100644
>> index 000000000000..ec15c0d829e8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/errno.h>
>> +#include <drm/drm_fixed.h>
>> +
>> +#include "msm_drv.h"
>> +#include "msm_dsc_helper.h"
>> +
>> +static int get_comp_ratio(struct drm_dsc_config *dsc, u32 src_bpp)
>> +{
>> +    return mult_frac(100, src_bpp, DSC_BPP(*dsc));
>> +}
>> +
>> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int 
>> intf_width, int comp_ratio)
>> +{
>> +    s64 comp_ratio_fp, num_bits_fp;
>> +    s64 numerator_fp, denominator_fp;
>> +
>> +    comp_ratio_fp = drm_fixp_from_fraction(comp_ratio, 100);
> 
> Please inline comp_ration calculation here. Don't use mult_frac().
> 
>> +    num_bits_fp = drm_fixp_from_fraction(8, 1);
> 
> drm_int2fixp
> 
>> +
>> +    numerator_fp = drm_fixp_from_fraction(dsc->slice_width * 
>> dsc->bits_per_component * 3, 1);
> 
> And here too.
> 
>> +    denominator_fp = drm_fixp_mul(comp_ratio_fp, num_bits_fp);
> 
> And num_bits_fp can be inlined too.
> denominator_fp = drm_fixp_from_fraction(src_bpp * 8, DSC_BPP)
> 
>> +
>> +    return drm_fixp_div(numerator_fp, denominator_fp);
> 
> dsc->slice_width * bpc * 3 / (8 * src_bpp / DSC_BPP), thus:
> 
> drm_fixp_from_fraction(dsc->slice_width * bpc * 3 * DSC_BPP, 8 * src_bpp)
> 
> but I will not insist on this one.
> 
>> +}
>> +
>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>> intf_width, u32 src_bpp)
>> +{
>> +    u32 bytes_per_ss, extra_eol_bytes, bytes_per_intf;
>> +    s64 bytes_per_ss_fp;
>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>> +    int comp_ratio = get_comp_ratio(dsc, src_bpp);
>> +
>> +    bytes_per_ss_fp = get_bytes_per_soft_slice(dsc, intf_width, 
>> comp_ratio);
>> +    bytes_per_ss = drm_fixp2int_ceil(bytes_per_ss_fp);
> 
> s/_ss/_soft_slice/g
> 
>> +
>> +    bytes_per_intf = bytes_per_ss * slice_per_intf;
>> +    extra_eol_bytes = bytes_per_intf % 3;
>> +    if (extra_eol_bytes != 0)
>> +        extra_eol_bytes = 3 - extra_eol_bytes;
>> +
>> +    return extra_eol_bytes;
>> +}
>> +
>> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int 
>> intf_width)
>> +{
>> +    u32 bpp;
>> +    u32 dce_bytes_per_line;
>> +
>> +    bpp = DSC_BPP(*dsc);
> 
> Didn't this cause a warning on the unused-but-set variable?
> 
>> +    dce_bytes_per_line = DIV_ROUND_UP(dsc->bits_per_pixel * 
>> intf_width, 8);
>> +
>> +    return dce_bytes_per_line;
>> +}
> 
> If you have msm_dsc_get_slice_per_intf() as a static inline, this 
> function can be a static inline too. Nothing more than a single 
> DIV_ROUND_UP.
> 
>> +
>> +int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int 
>> intf_width, u32 src_bpp)
>> +{
>> +    s64 data_width;
>> +    int comp_ratio = get_comp_ratio(dsc, src_bpp);
>> +
>> +    if (!dsc->slice_width || (intf_width < dsc->slice_width))
>> +        return -EINVAL;
>> +
>> +    data_width = get_bytes_per_soft_slice(dsc, intf_width, comp_ratio);
>> +    data_width = drm_fixp_mul(dsc->slice_count, data_width);
>> +    data_width = drm_fixp_from_fraction(data_width, 3);
> 
> Reusing a variable is a nice trick, but it can be confusing. Not to 
> mention that the last call should probably be drm_fixp_div()
> 

Hi Dmitry,

Acked (for all the comments here).

Planning to move the last divide by 3 out of this method (as the value 
that uncompressed pclk is divided by depends on DSI/DP and if widebus is 
enabled), so I'll merge the get_bytes_per_soft_slice call with the 2nd line.

Thanks,

Jessica Zhang

>> +
>> +    return drm_fixp2int_ceil(data_width);
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.h 
>> b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..308069b2b5a4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <drm/display/drm_dsc_helper.h>
>> +#include <drm/drm_modes.h>
>> +
>> +/*
>> + * Helper methods for MSM specific DSC calculations that are common 
>> between timing engine,
>> + * DSI, and DP.
>> + */
>> +
>> +#define MSM_DSC_SLICE_PER_PKT 1
>> +#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
> 
> Oh. Please. If you have used (config)->bits_per_pixel here, you wouldn't 
> have to use clumsy DSC_BPP(*dsc). It might make sense to add:
> 
> static inline drm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
> {
>      // most probably WARN_ON_ONCE is enough.
>      WARN_ON(dsc->bits_per_fixel & 0xf);
> 
>      return dsc->bits_per_pixel >> 4;
> }
> 
>> +
>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>> *dsc, int intf_width)
>> +{
>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>> intf_width, u32 src_bpp);
>> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int 
>> intf_width);
>> +int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int 
>> intf_width, u32 src_bpp);
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
> 
> -- 
> With best wishes
> Dmitry
> 
