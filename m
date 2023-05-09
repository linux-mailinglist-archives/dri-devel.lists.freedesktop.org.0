Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790256FBBFA
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 02:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414D10E16B;
	Tue,  9 May 2023 00:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656710E06A;
 Tue,  9 May 2023 00:28:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348NswtK023495; Tue, 9 May 2023 00:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=haDEAzScw5Q4ifeArnQZ0cit0TqKFjC9SaEKAqwZB8I=;
 b=aV67UFldXXJJicIj6NILY0Zz44URayedZO6XsfBtLtbnRnpKFjsVd67o37hHT75PgbSS
 bnhTRP7qvUOcMWhp3y9cuOQCdgNPvuOxYvlWjmCI3+doKPF0UVNqw3r/fCHYHs35VDjl
 mzk1qH43YQqsRWcYtGIZO7xSHjr6ttpR/j7XR6L+BBoOcaixMYT/YA83Efh/7zAezYSh
 aa2zbjQ9p3HhGxcDYtpIMwY6CntmghuDorLovBZOkGBnhk8vRKJmb5Ji/N0USL9N6+uS
 hPfFAW4z6lomW0s8jxp1DpV1XvcUYUuw7g4SHL2KvxEJs9Z3smAyZAxfZADnCOkimB6F 3Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf781gds0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 00:28:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3490SfCL011433
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 00:28:41 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 17:28:40 -0700
Message-ID: <9aad0f0a-f168-5162-68a0-9e9cde21c1f6@quicinc.com>
Date: Mon, 8 May 2023 17:28:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
 <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IY3IKbLjwgT9ZKefPMrIKlptq8-QtoDd
X-Proofpoint-ORIG-GUID: IY3IKbLjwgT9ZKefPMrIKlptq8-QtoDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_17,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090002
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/2023 4:08 PM, Dmitry Baryshkov wrote:
> On 09/05/2023 00:46, Jessica Zhang wrote:
>>
>>
>> On 5/7/2023 9:00 AM, Marijn Suijten wrote:
>>> On 2023-05-05 14:23:50, Jessica Zhang wrote:
>>>> Add DATA_COMPRESS feature flag to DPU INTF block.
>>>>
>>>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
>>>> PINGPONG to INTF.
>>>>
>>>> As core_rev (and related macros) was removed from the dpu_kms 
>>>> struct, the
>>>> most straightforward way to indicate the presence of this register 
>>>> would be
>>>> to have a feature flag.
>>>
>>> Irrelevant.  Even though core_rev was still in mainline until recently,
>>> we always hardcoded the features in the catalog and only used core_rev
>>> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
>>> then enable feature Y" logic, this manually-enabled feature flag is the
>>> only, correct way to do it.
>>
>> Hi Marijn,
>>
>> Understood. FWIW, if we do find more register bit-level differences 
>> between HW versions in the future, it might make more sense to keep 
>> the HW catalog small and bring core_rev back, rather than keep adding 
>> these kinds of small differences to caps.
> 
> Let's see how it goes. Abhinav suggested that there might be feature 
> differences inside the DPU generations (and even inside the single DPU 
> major/minor combo). So I'm not sure what core_rev will bring us.
> 

It allows us to have if MDSS_REV() checks which are convenient for some 
calculations / bit programming which we dont want to expose in the 
catalog as they cannot be classified as a hw cap as such or atleast we 
dont want them to be classified as such.

> Let's land the platforms which are ready (or if there is anything close 
> to be submitted). I'll post the next proposal for the catalog cleanups 
> close to -rc4, when the dust settles then we can have one or two weaks 
> for the discussion and polishing.
> 
> I'd like to consider:
> - inlining foo_BLK macros, if that makes adding new features easier
> - reformat of clk_ctrls
> - maybe reintroduction of per-generation feature masks instead of 
> keeping them named after the random SoC
> - maybe a rework of mdss_irqs / INTFn_INTR. We already have this info in 
> hw catalog.
> 
> Comments are appreciated.
> 

I would say, lets wait for DSC to settle. Atleast the parts already on 
the list. Continuous rebase of features already on the list is becoming 
time consuming because of overlapping catalog reworks.

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> Changes in v2:
>>>> - Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature 
>>>> flag
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 7944481d0a33..c74051906d05 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -104,7 +104,7 @@
>>>>   #define INTF_SC7180_MASK \
>>>>       (BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | 
>>>> BIT(DPU_INTF_STATUS_SUPPORTED))
>>>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>>>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | 
>>>> BIT(DPU_INTF_DATA_COMPRESS)
>>>
>>> Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
>>> to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
>>> erroneously also receive this feature flag and write the new
>>> DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).
>>>
>>> [1]: 
>>> https://lore.kernel.org/linux-arm-msm/80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org/T/#u 
>>>
>>>
>>> Depending on who lands first, this flag should be split.
>>>
>>> I still see value in inlining and removing these defines, though that
>>> brings a host of other complexity.
>>>
>>> - Marijn
>>>
>>>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>>>                BIT(DPU_WB_UBWC) | \
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index 4eda2cc847ef..01c65f940f2a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -185,6 +185,7 @@ enum {
>>>>    * @DPU_DATA_HCTL_EN                Allows data to be transferred 
>>>> at different rate
>>>>    *                                  than video timing
>>>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS 
>>>> register
>>>> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS 
>>>> register
>>>>    * @DPU_INTF_MAX
>>>>    */
>>>>   enum {
>>>> @@ -192,6 +193,7 @@ enum {
>>>>       DPU_INTF_TE,
>>>>       DPU_DATA_HCTL_EN,
>>>>       DPU_INTF_STATUS_SUPPORTED,
>>>> +    DPU_INTF_DATA_COMPRESS,
>>>>       DPU_INTF_MAX
>>>>   };
>>>>
>>>> -- 
>>>> 2.40.1
>>>>
> 
