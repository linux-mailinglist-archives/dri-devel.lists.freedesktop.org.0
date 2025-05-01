Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7DAA5CA7
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B34310E81A;
	Thu,  1 May 2025 09:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="am8cMkEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23F10E221;
 Thu,  1 May 2025 09:30:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5418ETh6013717;
 Thu, 1 May 2025 09:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O1Yvn+lb+vHDCgyXybiOa4uhoN/0L23iOUqIx7+v4RY=; b=am8cMkEX09b26Wg+
 sRbegF1BsRtsooMy4iKog7gd8h5U47E+yqyTlts/WgWsoRSyPXNiulr2D72o3ZKu
 I2NsnrAqE604X6bGIoucuvu86scqY06U1eehycFuT1lL/KgCw+DdGRG78qe5jn7H
 QB0K8CMV9uyk2jx3BtO/2m8lpfQC4gB2fIt6kkg9H0Guztlqkmi/q98+9rMgUbYW
 U8TxL/NWIAd8SbRYiu8XnuDNKHUVqxkbijtT6zrSJP5C2n/7+S/Zzt+fCh8TN1Mj
 zPRYYddimk5k8TuPjRCJyYyBkzN314hUsKsBSbB2PWlPNWi0r9RpStwk+y7P8EQx
 axUYkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubmxkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 09:30:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5419U69V017858
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 09:30:06 GMT
Received: from [10.216.32.231] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 02:30:00 -0700
Message-ID: <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
Date: Thu, 1 May 2025 14:59:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <neil.armstrong@linaro.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QmQgx0QKw4N_AUeIp4AiKYfhaSQgKFSG
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68133f1f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=xjiPyf2SZMVwIgDpRVcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3MSBTYWx0ZWRfX5TOjlfODYpbK
 IruKOoM8nqbFttpvjYJNfapBa4Rs+GPIKBiOWUZ7eIBYAHG1GL4Vpthvoxasf7zUrsh29Q0eZvV
 PnMGaOYAcbX9uQBZH4WyJuL069cc+I5h3tPkw6e3g+6EK4JHKFpLHPmQo7FN5Rcj5crbvg5cbUR
 ghd4I972B0uiRCDLWZwG2zS83LR4BzJ9reUK/1ypoWqoMjin0MrWovADY6gCY3n4L/215Lt9rWz
 d2ucH5CFL1uUupu1BiEcVEVHh5FdX2SRXJD+Bd+3W5Wpf2f/J8pD+WVsyX4tPhAlAWbOTNs6ovc
 SP6I0AYPqnkFQJK9J6S1qWGrhOzknsKIht49Nh8qmotx11UAWTtjLEOBpF1bNwd4LRmJxDQNuS2
 XHnO12iU3xx48a6tTXVwusIkmV+5XhwLHZS5QIuENuSykUyaNBQ0aYVhqsDXSbgjOkjeWrU9
X-Proofpoint-ORIG-GUID: QmQgx0QKw4N_AUeIp4AiKYfhaSQgKFSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010071
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

On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 18:39, Konrad Dybcio wrote:
>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>>>>
>>>>>>>>>> Add speebin data for A740, as found on SM8550 and derivative
>>>>>>>>>> SoCs.
>>>>>>>>>>
>>>>>>>>>> For non-development SoCs it seems that "everything except
>>>>>>>>>> FC_AC, FC_AF
>>>>>>>>>> should be speedbin 1", but what the values are for said
>>>>>>>>>> "everything" are
>>>>>>>>>> not known, so that's an exercise left to the user..
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>>>>>       1 file changed, 8 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/
>>>>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> index
>>>>>>>>>> 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> @@ -11,6 +11,9 @@
>>>>>>>>>>       #include "a6xx.xml.h"
>>>>>>>>>>       #include "a6xx_gmu.xml.h"
>>>>>>>>>>       +#include <linux/soc/qcom/smem.h>
>>>>>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>>>>>> +
>>>>>>>>>>       static const struct adreno_reglist a612_hwcg[] = {
>>>>>>>>>>           {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>>>>>           {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info
>>>>>>>>>> a7xx_gpus[] = {
>>>>>>>>>>               },
>>>>>>>>>>               .address_space_size = SZ_16G,
>>>>>>>>>>               .preempt_record_size = 4192 * SZ_1K,
>>>>>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>>>>>> +            /* Other feature codes (on prod SoCs) should
>>>>>>>>>> match to speedbin 1 */
>>>>>>>>>
>>>>>>>>> I'm trying to understand this sentence. because reading patch
>>>>>>>>> 4, when there's no match
>>>>>>>>> devm_pm_opp_set_supported_hw() is simply never called so how
>>>>>>>>> can it match speedbin 1 ?
>>>>>>>>
>>>>>>>> What I'm saying is that all other entries that happen to be
>>>>>>>> possibly
>>>>>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>>>>>
>>>>>>>>> Before this change the fallback was speedbin = BIT(0), but this
>>>>>>>>> disappeared.
>>>>>>>>
>>>>>>>> No, the default was to allow speedbin mask ~(0U)
>>>>>>>
>>>>>>> Hmm no:
>>>>>>>
>>>>>>>        supp_hw = fuse_to_supp_hw(info, speedbin);
>>>>>>>
>>>>>>>        if (supp_hw == UINT_MAX) {
>>>>>>>            DRM_DEV_ERROR(dev,
>>>>>>>                "missing support for speed-bin: %u. Some OPPs may
>>>>>>> not be supported by hardware\n",
>>>>>>>                speedbin);
>>>>>>>            supp_hw = BIT(0); /* Default */
>>>>>>>        }
>>>>>>>
>>>>>>>        ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>>>>>        if (ret)
>>>>>>>            return ret;
>>>>>>
>>>>>> Right, that's my own code even..
>>>>>>
>>>>>> in any case, the kernel can't know about the speed bins that aren't
>>>>>> defined and here we only define bin0, which doesn't break things
>>>>>>
>>>>>> the kernel isn't aware about hw with bin1 with or without this change
>>>>>> so it effectively doesn't matter
>>>>>
>>>>> But it's regression for the other platforms, where before an
>>>>> unknown SKU
>>>>> mapped to supp_hw=BIT(0)
>>>>>
>>>>> Not calling devm_pm_opp_set_supported_hw() is a major regression,
>>>>> if the opp-supported-hw is present, the OPP will be rejected:
>>>>
>>>> A comment in patch 4 explains that. We can either be forwards or
>>>> backwards
>>>> compatible (i.e. accept a limited amount of
>>>> speedbin_in_driver x speedbin_in_dt combinations)
>>>
>>> I have a hard time understanding the change, please be much more verbose
>>> in the cover letter and commit messages.
>>>
>>> The fact that you do such a large change in the speedbin policy in
>>> patch 4
>>> makes it hard to understand why it's needed in the first place.
>>>
>>> Finally I'm very concerned that "old" SM8550 DT won't work on new
>>> kernels,
>>> this is frankly unacceptable, and this should be addressed in the first
>>> place.
>>>
>>> The nvmem situation was much simple, where we considered we added the
>>> nvmem
>>> property at the same time as opp-supported-hw in OPPs, but it's no
>>> more the
>>> case.
>>>
>>> So I think the OPP API should probably be extended to address this
>>> situation
>>> first, since if we do not have the opp-supported-hw in OPPs, all OPPs
>>> are safe.
>>>
>>> So this code:
>>>      count = of_property_count_u32_elems(np, "opp-supported-hw");
>>>      if (count <= 0 || count % levels) {
>>>          dev_err(dev, "%s: Invalid opp-supported-hw property (%d)\n",
>>>              __func__, count);
>>>          return false;
>>>      }
>>> should return true in this specific case, like a
>>> supported_hw_failsafe mode.
>>
>> Not really. opp-supported-hws = <BIT(0)> usually translates to the
>> *fastest*
>> bin in our case, so perhaps that change I made previously to default
>> to it
>> wasn't the wisest. In other words, all slower SKUs that weren't added
>> to the
>> kernel catalog & dt are potentially getting overclocked, which is no
>> bueno.
>> That is not always the case, but it most certainly has been for a
>> number of
>> years.
>>
>> Old DTs in this case would be DTs lacking opp-supported-hw with the
>> kernel
>> having speedbin tables. The inverse ("too new DTs") case translates into
>> "someone put some unexpected stuff in dt and the kernel has no idea what
>> to do with it".
>> In this context, old DTs would continue to work after patch 4, as the
>> first
>> early return in adreno_set_speedbin() takes care of that.
> 
> No.
> 
> With only patches 1-4 applied (keep "old" DT) on today's -next:
> 
> SM8550-QRD:
> [    7.574569] msm_dpu ae01000.display-controller: bound ae94000.dsi
> (ops dsi_ops [msm])
> [    7.586578] msm_dpu ae01000.display-controller: bound
> ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
> [    7.597886] adreno 3d00000.gpu: error -EINVAL: Unknown speed bin fuse
> value: 0x2
> [    7.605518] msm_dpu ae01000.display-controller: failed to load adreno
> gpu
> [    7.612599] msm_dpu ae01000.display-controller: failed to bind
> 3d00000.gpu (ops a3xx_ops [msm]): -22
> 
> SM8550-HDK:
> [   10.137558] msm_dpu ae01000.display-controller: bound ae94000.dsi
> (ops dsi_ops [msm])
> [   10.151796] msm_dpu ae01000.display-controller: bound
> ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
> [   10.163358] adreno 3d00000.gpu: error -EINVAL: Unknown speed bin fuse
> value: 0x2
> [   10.171066] msm_dpu ae01000.display-controller: failed to load adreno
> gpu
> [   10.178118] msm_dpu ae01000.display-controller: failed to bind
> 3d00000.gpu (ops a3xx_ops [msm]): -22
> 
> With:
> =================><==================
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
> drm/msm/adreno/a6xx_catalog.c
> index 61daa3315679..7cac14a585a9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1435,6 +1435,7 @@ static const struct adreno_info a7xx_gpus[] = {
>                 .address_space_size = SZ_16G,
>                 .preempt_record_size = 4192 * SZ_1K,
>                 .speedbins = ADRENO_SPEEDBINS(
> +                       { ADRENO_SKU_ID(SOCINFO_FC_AB), 1 },
>                         { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>                         { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>                         /* Other feature codes (on prod SoCs) should
> match to speedbin 1 */
> =================><==================
> 
> SM8550-QRD:
> [    7.681816] msm_dpu ae01000.display-controller: bound ae94000.dsi
> (ops dsi_ops [msm])
> [    7.694479] msm_dpu ae01000.display-controller: bound
> ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
> [    7.705784] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.714322] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722851] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722853] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722855] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722856] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722858] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722860] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [    7.722861] adreno 3d00000.gpu: _of_add_opp_table_v2: no supported OPPs
> [    7.722863] adreno 3d00000.gpu: [drm:adreno_gpu_init [msm]] *ERROR*
> Unable to set the OPP table
> 
> SM8550-HDK:
> [   10.119986] msm_dpu ae01000.display-controller: bound ae94000.dsi
> (ops dsi_ops [msm])
> [   10.133872] msm_dpu ae01000.display-controller: bound
> ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
> [   10.147377] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.161640] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.171198] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.179756] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.188313] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.196868] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.205424] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.226025] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-
> supported-hw property (-22)
> [   10.234589] adreno 3d00000.gpu: _of_add_opp_table_v2: no supported OPPs
> [   10.247165] adreno 3d00000.gpu: [drm:adreno_gpu_init [msm]] *ERROR*
> Unable to set the OPP table
> 
> This behaves exactly as I said, so please fix it.

Konrad,

iirc, we discussed this in one of the earlier revision. There is a
circular dependency between the driver change for SKU support and the dt
change that adds supported_hw bitmask in opp-table. Only scenario it
works is when you add these to the initial patches series of a new GPU.

It will be very useful if we can break this circular dependency.

-Akhil.

> 
> Neil
> 
>>
>> Konrad
> 
> 

