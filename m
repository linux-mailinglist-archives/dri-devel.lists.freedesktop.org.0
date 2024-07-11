Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBD92EE3D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 20:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172B10EB4E;
	Thu, 11 Jul 2024 18:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZPxjZNUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D6B10EB4E;
 Thu, 11 Jul 2024 18:04:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BE01tH017618;
 Thu, 11 Jul 2024 18:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nONQeuYbHLvRucyD7QhZjwXI2y6eI9gKzj/PG28Mnsk=; b=ZPxjZNUGsmcBi+5G
 ffrG48WhB5Ds2J8F+jwTYQAu5L/qXaZxoOOxr5rnjGEMfj6tl6q0shuyZ5jAMRMc
 uU4pzGMliYR0ukjzaZsfzJHkAIzdYX/2VSi8Ja3YKhUpfdE61Y/HjQ90ddyLEI0i
 Cs1b0LTi9ycSqyCgVnPtPcOkZEedqPvEpx8cU+eohQz3BMq4K8/VqcHYdw9pxW/1
 6CwLwCHzp6hjMPukcS9P42otWV9XZp7cavX+mBAfpgj1OQUKX+Eig6mx2T1OlDBj
 B26qq41YNVGTqIhmQsdlJd5OFkBuJyLpdYPc+Rjvb09oEKMbFLA+JfP2WRGxpZvm
 MDFdaA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40a8uhsxh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 18:03:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46BI3Nbb015261
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 18:03:23 GMT
Received: from [10.110.44.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 11:03:22 -0700
Message-ID: <fb285034-ed4c-4f20-ab80-cf91d36fc67c@quicinc.com>
Date: Thu, 11 Jul 2024 11:03:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Rajesh Yadav
 <ryadav@codeaurora.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
 <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
 <46487222-6818-b0bf-e5cc-2310d62b5fe6@quicinc.com>
 <CAA8EJpq7Lp-3V_AsLxO9ZOt8ZW1ZZ=FjhXV6R9jvH=sQ8XQE9w@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq7Lp-3V_AsLxO9ZOt8ZW1ZZ=FjhXV6R9jvH=sQ8XQE9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FknxQBwkKNIhvDX2H5RiooBpUZc2PoF1
X-Proofpoint-ORIG-GUID: FknxQBwkKNIhvDX2H5RiooBpUZc2PoF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110125
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



On 7/10/2024 12:40 AM, Dmitry Baryshkov wrote:
> On Tue, 9 Jul 2024 at 22:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/9/2024 6:48 AM, Dmitry Baryshkov wrote:
>>> DPU debugging macros need to be converted to a proper drm_debug_*
>>> macros, however this is a going an intrusive patch, not suitable for a
>>> fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
>>> to make sure that DPU debugging messages always end up in the drm debug
>>> messages and are controlled via the usual drm.debug mask.
>>>
>>
>> These macros have been deprecated, is this waht you meant by the
>> conversion to proper drm_debug_*?
> 
> Yes. Drop the driver-specific wrappers where they don't make sense.
> Use sensible format strings in the cases where it actually does (like
> VIDENC or _PLANE)
> 

Ack but we need to not just drop the wrappers but drop the usage of 
these macros as well because it is documented that they are deprecated.

So I assume you want to get this in and do that as a follow up change?

>>
>> /* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
>> #define DRM_DEBUG_DRIVER(fmt, ...)                                      \
>>           __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>>
>> I think all that this macro was doing was to have appropriate DRM_UT_*
>> macros enabled before calling the corresponding DRM_DEBUG_* macros. But
>> I think what was incorrect here is for DPU_DEBUG, we could have used
>> DRM_UT_CORE instead of DRM_UT_KMS.
> 
> It pretty much tries to overplay the existing drm debugging mechanism
> by either sending the messages to the DRM channel or just using
> pr_debug. With DYNAMIC_DEBUG being disabled pr_debug is just an empty
> macro, so all the messages can end up in /dev/null. We should not be
> trying to be too smart, using standard DRM_DEBUG_DRIVER should be
> enough. This way all driver-related messages are controlled by
> drm.debug including or excluding the 0x02 bit.
> 
> 
>>
>> And DRM_DEBUG_DRIVER should have been used instead of DRM_ERROR.
>>
>> Was this causing the issue of the prints not getting enabled?
> 
> I pretty much think so.
> 

Alright, I am okay with the approach, just one minor suggestion, to keep 
the behavior intact, previously the code wanted DPU_DEBUG to be 
controlled by DRM_UT_KMS and DPU_DEBUG_DRIVER controlled by DRM_UT_DRIVER.

Keeping that intact, we need to use DRM_DEBUG_KMS for DPU_DEBUG?

>>
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
>>>    1 file changed, 2 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> index e2adc937ea63..935ff6fd172c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> @@ -31,24 +31,14 @@
>>>     * @fmt: Pointer to format string
>>>     */
>>>    #define DPU_DEBUG(fmt, ...)                                                \
>>> -     do {                                                               \
>>> -             if (drm_debug_enabled(DRM_UT_KMS))                         \
>>> -                     DRM_DEBUG(fmt, ##__VA_ARGS__); \
>>> -             else                                                       \
>>> -                     pr_debug(fmt, ##__VA_ARGS__);                      \
>>> -     } while (0)
>>> +     DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
>>>
>>>    /**
>>>     * DPU_DEBUG_DRIVER - macro for hardware driver logging
>>>     * @fmt: Pointer to format string
>>>     */
>>>    #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
>>> -     do {                                                               \
>>> -             if (drm_debug_enabled(DRM_UT_DRIVER))                      \
>>> -                     DRM_ERROR(fmt, ##__VA_ARGS__); \
>>> -             else                                                       \
>>> -                     pr_debug(fmt, ##__VA_ARGS__);                      \
>>> -     } while (0)
>>> +     DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
>>>
>>>    #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
>>>    #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
>>>
> 
> 
> 
