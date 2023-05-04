Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C76F71ED
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 20:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F310E1B0;
	Thu,  4 May 2023 18:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1A910E17D;
 Thu,  4 May 2023 18:26:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344EHjwT026987; Thu, 4 May 2023 18:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VvECvwED7W/HA1z7gnpxPn76AS8vUwvrR+GOyUzxrds=;
 b=OSvl5AZNh2znUPFyEQpGChwfB/uzb2788mZlu47KP49jg3XYQlvJJZpzQnPkrqMfrSmk
 04Fgn72kxhG/LHSBoB7HIbkmbEmgx21GGxq/ePlQ3tNmJm8mkBK2sd/xw7Fphvn4WBm0
 WkFNbRQ/HuXPR6oAWn4W5juBaw/hQ5kRx6nG5x7pCUn1BtsOeDH9vP7b9nGi4ZOzwzG8
 jYZNUZvZWPu7pwI/Qg0R5+MS+SV0tg5Ojh5aVYF03A+iZuKcVcsAc+u+lUc/xzcxHqSP
 MRYZ8NlWNTX49QeNLAOyT06TwMEw1VMfuZInofK438SfFEOTCQpv0iF/PSry9fcAaA27 cw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc2aj2912-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:26:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 344IPqQx022797
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 May 2023 18:25:52 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 4 May 2023
 11:25:52 -0700
Message-ID: <11ef769a-5089-57d4-db87-4c5766d98206@quicinc.com>
Date: Thu, 4 May 2023 11:25:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-4-git-send-email-quic_khsieh@quicinc.com>
 <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
 <CAA8EJpreM9i3DUp+93K7p14f_tNMy-m+C-WdyN5_drmmkGV66g@mail.gmail.com>
 <u7hlzltevx675gfg4w6emmeceo6nj76taqeecsor6iqsi3hmki@lg43y65m6chz>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <u7hlzltevx675gfg4w6emmeceo6nj76taqeecsor6iqsi3hmki@lg43y65m6chz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Otc9LpKqzjwth8JGXUokyTmq_w0iysbX
X-Proofpoint-GUID: Otc9LpKqzjwth8JGXUokyTmq_w0iysbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_12,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305040149
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2023 11:23 AM, Marijn Suijten wrote:
> On 2023-05-04 20:53:33, Dmitry Baryshkov wrote:
>> On Thu, 4 May 2023 at 20:49, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> PP_BLK_TE is no longer there.
>>>
>>> marcos -> macros.
>>>
>>> On 2023-05-04 09:46:41, Kuogee Hsieh wrote:
>>>> At legacy chipsets, it required DPU_PINGPONG_DSC bit be set to indicate
>>>
>>> I may have not made this clear, but the comments on patch 2/7
>>> (introducing the DPU_PINGPONG_DSC bit) also apply to this patch: clarify
>>> DPU 7.0.0 exactly in favour of "legacy", which has no definition at all
>>> and changes over time.
>>>
>>>> pingpong ops functions are required to complete DSC data path setup if
>>>> this chipset has DSC hardware block presented. This patch add
>>>> DPU_PINGPONG_DSC bit to both PP_BLK and PP_BLK_TE marcos if it has DSC
>>>> hardware block presented.
>>>
>>> Strictly speaking this patch together with 2/7 is not bisectable, as 2/7
>>> first disables the callbacks for _all_ hardware and then this patch adds
>>> it back by adding the flag to all DPU < 7.0.0 catalog descriptions.
>>
>> I asked to split these into two patches, but I see your point and
>> partially agree with it. However if we mix the catalog changes with
>> functional changes, it is too easy to overlook or misjudge the
>> functional changes.
> 
> I did the same in the INTF TE series for patches that have very little
> and/or very obvious functional changes: exactly this combination of
> guarding a few callbacks behind a feature bit, and setting that feature
> bit on a few specific catalog entries.
> 
>> As you are correct about bisectability, I'd probably suggest either
>> having three patches (define flag, update catalog, handle flag in the
>> driver) or squashing first two patches to have two patches (add flag +
>> catalog, separate functional changes).
> 
> Sure, if you really prefer a split I'd go for two patches:
> 1. Add the flag to the enum and catalog;
> 2. Add the ops guard (functional change).
> 
> Then don't forget to reword the commit message, following the guidelines
> below and the suggestion for 2/7.
> 
> - Marijn

Plan sounds good to me.

Marijn, we will wait for a couple of days to post the next rev but would 
be hard more than that as we need to pick up other things which are 
pending on top of this. Hence would appreciate if you can finish reviews 
by then.

> 
>>> To solve that, as we do in other DPU patch-series, just squash this
>>> patch into 2/7.  That way you also don't have to spend extra time
>>> rewording this commit message either to match the improvements we made
>>> in 2/7 (for example, you mention that "ops functions are required to
>>> complete DSC data path setup", but those were already available before
>>> 2/7, despite sounding as if this is a new thing that was previously
>>> missing entirely).
>>>
>>> But please wait at least a couple days before sending v6.  I only have a
>>> few hours every day/week but would appreciate to review and test all the
>>> other patches.
>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++--------
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 16 +++++++--------
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 24 +++++++++++-----------
>>>>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 +++++++++++-----------
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 24 +++++++++++-----------
>>>>   5 files changed, 52 insertions(+), 52 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> index 521cfd5..ef92545 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> @@ -112,17 +112,17 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>>>>   };
>>>>
>>>>   static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>>> -     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>>>> -                     DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>> +     PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK|BIT(DPU_PINGPONG_DSC),
>>>
>>> This should be added to the MASK (add new #define's where necessary).
>>>
>>> - Marijn
> 
> <snip>
