Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E762B53A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05110E437;
	Wed, 16 Nov 2022 08:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0E10E435;
 Wed, 16 Nov 2022 08:30:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AG6ADwN018283; Wed, 16 Nov 2022 08:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tOxaG25yh/89EQX6yJEvXStzKioKLgBIzLt7zDEL/js=;
 b=O9fcLuDerY+b6jmhcjcCEg2UF4RiaTXVJjT9ZntZUrQQz4QuEMPopWXTBUIUKMchX07N
 77pPk9N9wt+dFninSUy9H5Rc+JyFmlNoK8iSN7upWYL4JJy/EEM80AIuz48j8QsEenm2
 BHOZMWUbvFBVeefllxRchIYJDtT6COPCPdPQRxja8fc9ofTWsSTaipLSCD63ie7mWUCm
 CDI5HmgUtnGy28M+qae2IZVD3KinpAEg8JYHqt3ZCZuZiIIDDGfzkdm0x02CNu7MVOGY
 eQ7SWb5Xv4145nmkKnNRd5uLFTNAoY1Ytz3Usi4f7hcPnVKvbU9krmnkTghYeKpSBfa9 BA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvsq6rfuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 08:30:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AG8UJ1F012731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 08:30:19 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 00:30:13 -0800
Message-ID: <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
Date: Wed, 16 Nov 2022 00:30:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
 <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AbsETHNNkdnssB73R800gQnYc3lsTjBP
X-Proofpoint-GUID: AbsETHNNkdnssB73R800gQnYc3lsTjBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160059
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2022 12:19 AM, Dmitry Baryshkov wrote:
> On 16/11/2022 10:50, Abhinav Kumar wrote:
>>
>>
>> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>> these registers during snapshot.
>>>
>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> I am confused with both the ordering and the split of this patch.
>>
>> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header file 
>> in this patch but used it in the next.
>>
>> But you also have code in this patch which relies on setting of this bit.
>>
>> So if this patch is taken without the next, it will still crash.
> 
> It will not crash if this patch is taken without the next one. Without 
> the next patch the DPU driver will not match and bind against the 
> qcom,sm8450-dpu device.

Ah okay, I just now saw that you have the compatible change also in the 
next patch.

> 
> So, the ordering is quite logical from my point of view:
> - add support for all the features required for the device
> - add the device compat string & catalog entry
> 
>>
>> Rather, you should combine the define part of this patch to the next 
>> patch in the series 
>> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 , 
>> then move that one in front of this patch.
> 
> No. This way we'll have a state (after adding the next patch) when the 
> sm8450 support is enabled, but the top-hole is not handled, leading to a 
> crash.
> 

What if you split the compatible to a separate patch like what SM8350 did.

https://patchwork.freedesktop.org/patch/511659/?series=110924&rev=1

So, we have hw catalog changes ---> snapshot fix ---> add the compatible.

That will make both of us happy?

>>
>> So that its much more coherent that you defined 
>> DPU_MDP_PERIPH_0_REMOVED both in the catalog header and used it in the 
>> catalog.c file and the in the next change you used the caps to avoid 
>> touching that register.
> 
> I'd say it's rather strange way. When I see a define/feature addition, 
> I'd prefer to seethe implementation too.
> 
>> Regarding the TOP hole itself, I need one day to investigate this. I 
>> am waiting for permissions to the documentation.
>>
>> If i cannot get access by the time you have re-ordered this, I will 
>> ack this once the reorder is done within a day.
> 
> 
> For the reference: [1]
> 
> [1] 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1 
> 
> 
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 38aa38ab1568..4730f8268f2a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -92,6 +92,7 @@ enum {
>>>       DPU_MDP_UBWC_1_0,
>>>       DPU_MDP_UBWC_1_5,
>>>       DPU_MDP_AUDIO_SELECT,
>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>       DPU_MDP_MAX
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index f3660cd14f4f..95d8765c1c53 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm_k
>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>> 0x3a8,
>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>> +    } else {
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    }
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
> 
