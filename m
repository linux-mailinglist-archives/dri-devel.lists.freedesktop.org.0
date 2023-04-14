Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9496E2A75
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 21:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0610EE69;
	Fri, 14 Apr 2023 19:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B060D10EE63;
 Fri, 14 Apr 2023 19:09:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EIp1Fa025687; Fri, 14 Apr 2023 19:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0xo8Q85DhaZ6cn2f24vuxxrNvX84J8bkmq4G06xCL+U=;
 b=aMlM1JEDKLA96zQ1EQcg6lsJ7y5YlJiZG9RitpXJjtQFKgrx5y4qBdsaRW4bpXKjFAiv
 3lqnmh7gEfsVOMqJnb9kkjpkHhlm8AAR6DA8sBtxmmSM8EGrdTk/ShlezGn8GWWk+fVq
 mYm2hnphatILAo0o9Z+wvw0vIvTg7yvPvXpz+66vhstneB2mcXGkzFsuU0KWJvQRp7yl
 6wSi//uMI4QqmNdCxYDJEhptVsiIYmMU3bQhFMPF9Lg6ZDsHiDA07Em+B2k17bR5i1VZ
 JinB/LlrxYrCTNj1PdnVeoL2cV9YidXSjbV9ykSLrc61+euJGa26K2/ENr+E7zs78Rlc Xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3py1wphhcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 19:09:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EJ9L6C030385
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 19:09:21 GMT
Received: from [10.110.73.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 14 Apr
 2023 12:09:19 -0700
Message-ID: <2183185d-1f95-ab76-d84f-2d9d1c083146@quicinc.com>
Date: Fri, 14 Apr 2023 12:09:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
 <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
 <aac210da-dec1-aab8-3f48-c33d9e7687d6@quicinc.com>
 <3oaangxh7gmie3cdd6rmujm7dd3hagsrnwiq3bascdtamvfn3a@bn6ou5hbsgxv>
 <c09725ff-771c-35d1-adc9-4bb1b7c1c334@quicinc.com>
In-Reply-To: <c09725ff-771c-35d1-adc9-4bb1b7c1c334@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PhQ-gN2yCIXE03sxt7ICxR5mAPRtySkQ
X-Proofpoint-ORIG-GUID: PhQ-gN2yCIXE03sxt7ICxR5mAPRtySkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_11,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 mlxlogscore=853 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140169
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 dianders@chromium.org, andersson@kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2023 11:55 AM, Abhinav Kumar wrote:
> 
> 
> On 4/14/2023 10:28 AM, Marijn Suijten wrote:
>> On 2023-04-14 08:41:37, Abhinav Kumar wrote:
>>>
>>> On 4/14/2023 12:48 AM, Marijn Suijten wrote:
>>>> Capitalize DSC in the title, as discussed in v1.
>>>>
>>>> On 2023-04-13 08:56:41, Kuogee Hsieh wrote:
>>>>> In current code, the DSC active bits are written only if cfg->dsc 
>>>>> is set.
>>>>> However, for displays which are hot-pluggable, there can be a use-case
>>>>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>>>>
>>>>> For those cases we need to clear DSC active bits during tear down.
>>>>>
>>>>> Changes in V2:
>>>>> 1) correct commit text as suggested
>>>>> 2) correct Fixes commit id
>>>>> 3) add FIXME comment
>>>>>
>>>>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>
>>>> By default git send-email should pick this up in the CC line...  but I
>>>> had to download this patch from lore once again.
>>>>
>>>
>>> Yes, I think what happened here is, he didnt git am the prev rev and
>>> make changes on top of that so git send-email didnt pick up. We should
>>> fix that process.
>>
>> The mail was sent so it must have gone through git send-email, unless a
>> different mail client was used to send the .patch file.  I think you are
>> confusing this with git am (which doesn't need to be used if editing a
>> commit on a local branch) and subsequently git format-patch, which takes
>> a commit from a git repository and turns it into a .patch file: neither
>> of these "converts" r-b's (and other tags) to cc, that's happening in
>> git send-email (see `--suppress-cc` documentation in `man
>> git-send-email`).
>>
> 
> Yes, ofcourse git send-email was used to send the patch, not any other 
> mail client.
> 
> Yes i am also aware that send-email converts rb to CC.
> 
> But if you keep working on the local branch, then you would have to 
> manually add the r-bs. If you use am of the prev version and develop on 
> that, it will automatically add the r-bs.
> 

just a minor point, in case you didnt notice, my r-b was dropped too :)
due to manual propagation.

> 
>> I can recommend b4: it has lots of useful features including
>> automatically picking up reviews and processing revisions.  It even
>> requires a changelog to be edited ;).  However, finding the right flags
>> and trusting it'll "do as ordered" is a bit daunting at first.
>>

Ack.

>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++----
>>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>> index bbdc95c..1651cd7 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>>> @@ -541,10 +541,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>>>> dpu_hw_ctl *ctx,
>>>>>        if (cfg->merge_3d)
>>>>>            DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>>>                      BIT(cfg->merge_3d - MERGE_3D_0));
>>>>> -    if (cfg->dsc) {
>>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>>>> -        DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>>>> -    }
>>>>> +
>>>>> +    /* FIXME: fix reset_intf_cfg to handle teardown of dsc */
>>>>
>>>> There's more wrong than just moving (not "fix"ing) this bit of code 
>>>> into
>>>> reset_intf_cfg.  And this will have to be re-wrapped in `if (cfg->dsc)`
>>>> again by reverting this patch.  Perhaps that can be explained, or link
>>>> to Abhinav's explanation to make it clear to readers what this FIXME
>>>> actually means?  Let's wait for Abhinav and Dmitry to confirm the
>>>> desired communication here.
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/ 
>>>>
>>>>
>>>
>>> Yes, I am fine with linking this explanation in the commit text and
>>> mentioning that till thats fixed, we need to go with this solution. The
>>> FIXME itself is fine, I will work on it and I remember this context 
>>> well.
>>
>> Looks like it was removed entirely in v3, in favour of only describing
>> it in the patch body.  The wording seems a bit off but that's fine by me
>> if you're picking this up soon anyway.
>>
>> - Marijn
