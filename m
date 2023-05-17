Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5113707440
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A4C10E499;
	Wed, 17 May 2023 21:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2933D10E499;
 Wed, 17 May 2023 21:29:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HLRjxR004734; Wed, 17 May 2023 21:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F6LI/fBKg9UF0fCwkF+wy/+dD+sz6j7Gjrl+y1eeJPo=;
 b=a7oAbgZOBkaagra1fuf/hTJji0F73QHYgSLY6m6brtciX/jSode2w8/12bmtESRGQA05
 O04pwZBczC82KBZs4LSGdlga0/aSg1w8PY9Iwkd6dM2ESayQJUvsPhsmS8OVWR/mAZ7I
 Z1Q1rJG41oFNCq/IlOEatYViAPiTwFJK42OBX3/dq6F1f0Au8778T4KrkYlDa2Z3Q1HH
 buQVvDndSLhelwP+Ie8SJTrUYNd/x3+QWPcnxH4Tu7cHcf7xrDZzXkmOVbvoA/itDo7M
 e0S5K8Ay01ZvE2/HnmLRD4lNcdFWvJMaC8T9bWSMRarrqtjUHz2YG6BvYlnscacKEXfe cg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmwnr9e5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 21:29:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HLT7XG008296
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 21:29:07 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 14:29:06 -0700
Message-ID: <d9cb961f-7f22-0db5-c83c-52d371c9a15b@quicinc.com>
Date: Wed, 17 May 2023 14:29:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v11 5/9] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-5-30270e1eeac3@quicinc.com>
 <hyqb6upm3zzruyneamujc3hw4vtwjtjxnomdilk6xyxdm2n6bk@4h3eeah6dlhx>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <hyqb6upm3zzruyneamujc3hw4vtwjtjxnomdilk6xyxdm2n6bk@4h3eeah6dlhx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zOgTpS6LxgA_VH2YkdDiqbbZxqk9hSAs
X-Proofpoint-ORIG-GUID: zOgTpS6LxgA_VH2YkdDiqbbZxqk9hSAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=926
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170177
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2023 2:26 PM, Marijn Suijten wrote:
> On 2023-05-17 11:51:14, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..2d366ec7d92d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>> + *
>> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> 
> Nit following the commit body: MSM-specific with a hyphen.

Hi Marijn,

Acked.

> 
>> + * DSI, and DP.
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <linux/math.h>
>> +#include <drm/display/drm_dsc_helper.h>
>> +
>> +/**
>> + * msm_dsc_get_slices_per_intf() - get number of slices per interface
> 
> get -> calculate?

Acked.

> 
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width in pixels
>> + * Returns: Integer representing the number of slices for the given interface
>> + */
>> +static inline int msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, int intf_width)
> 
> u32 per v10 review and acks?

Ah, must have missed this one.

Thanks,

Jessica Zhang

> 
> The rest looks good, thanks!
> 
> - Marijn
> 
>> +{
>> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_line() - calculate bytes per line
>> + * @dsc: Pointer to drm dsc config struct
>> + * Returns: Integer value representing bytes per line. DSI and DP need
>> + *          to perform further calculations to turn this into pclk_per_intf,
>> + *          such as dividing by different values depending on if widebus is enabled.
>> + */
>> +static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
>> +{
>> +	return dsc->slice_count * dsc->slice_chunk_size;
>> +}
>> +
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
>> -- 
>> 2.40.1
>>
