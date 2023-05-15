Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF75704195
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D74C10E2C3;
	Mon, 15 May 2023 23:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3845E10E2C3;
 Mon, 15 May 2023 23:58:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FNk8UF024568; Mon, 15 May 2023 23:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nAMCF1gYuyIfX1PgjiNKxjS5tTdu7TEIr8ePFUwCunQ=;
 b=BaJ/cg8jnSnaug6ZWN2KUlzPvYcpnBvhT4mYEWT4qryVOpcEOmreX3k71tnVHds5tZ4d
 4d4n7rLgfgfltV9kNZET+6fXX+3+rpjaj3bYdy4fexjwdh09b5YEWA/oG/Ctu2i8hQir
 vVWTqUfHmtHZbxZpOec6/sktOEfe3WO4bXb6f6QnKhPhdSVMvqWuP9R4PaEUtrlEpZmF
 qK9o/Ct5ksd1gQIBkZ0yhv4h4YFP9canRaCuddawl5Dx7qDZ7KSpSPwNgEBAse/1DE3C
 CbCBAMmlM0730IkRE93ocRjSORkI9clHifiYRAHoXpLiPSFYUJ4mOdVl2UbNxLzn4R3X rQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjscsw4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 23:58:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FNwI78012820
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 23:58:18 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 16:58:17 -0700
Message-ID: <1ad576b0-196b-bfe1-1bc4-a41d51b27300@quicinc.com>
Date: Mon, 15 May 2023 16:58:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-8-git-send-email-quic_khsieh@quicinc.com>
 <cmoqfe5nunreajdvu2vk3ztwkbjesivgejjoi2wmsxske5gq3q@lr25iuwmuevb>
 <ccef1e88-5c38-0759-523a-c957854697ef@quicinc.com>
 <y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mxk5HrCiMys8Zz7WuKlinz9kT9ShAEnQ
X-Proofpoint-ORIG-GUID: mxk5HrCiMys8Zz7WuKlinz9kT9ShAEnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_20,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150197
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/2023 3:23 PM, Marijn Suijten wrote:
> On 2023-05-15 15:03:46, Abhinav Kumar wrote:
>> On 5/15/2023 2:21 PM, Marijn Suijten wrote:
>>> On 2023-05-12 11:00:22, Kuogee Hsieh wrote:
>>>>
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
>>>> feature flag information.  Each display compression engine (DCE) contains
>>>> dual hard slice DSC encoders so both share same base address but with
>>>> its own different sub block address.
>>>
>>> Can we have an explanation of hard vs soft slices in some commit message
>>> and/or code documentation?
>>>
>>
>> Not in this one. It wont look appropriate. I would rather remove "hard"
>> to avoid confusion.
> 
> That is totally fine, let's remove it instead.
> 
> <snip>
>>>> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
>>>
>>> Downstream says that the size is 0x10 (and 0x100 for the enc sblk, 0x10
>>> for the ctl sblk).  This simply fills it up to the start of the enc sblk
>>> so that we can see all registers in the dump?  After all only
>>> DSC_CMN_MAIN_CNF is defined in the main register space, so 0x10 is
>>> adequate.
>>>
>>
>> .len today is always only for the dump. and yes even here we have only
>> 0x100 for the enc and 0x10 for the ctl.
>>
>> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
>> +	.enc = {.base = 0x100, .len = 0x100},
>> +	.ctl = {.base = 0xF00, .len = 0x10},
>> +};
>>
>> The issue here is that, the dpu snapshot does not handle sub_blk parsing
>> today. Its a to-do item. So for that reason, 0x100 was used here to
>> atleast get the full encoder dumps.
> 
> But then you don't see the ENC block?  It starts at 0x100 (or 0x200) so
> then the length should be longer... it should in fact depend on even/odd
> DCE then?
> 

You are right that the length should be longer. It should be 0x29c then 
and ctl blocks will not be included anyway.

The fundamental issue which remains despite increasing the length will 
be that the two blocks will print duplicate information. So dce_0_0 and 
dce_0_1 will print the same information twice as the base address is the 
same.

Odd/even DCE intelligence is not there in these macros and will be an 
overkill to just support the dump.

So overall, I dont think any of it is a good solution yet.

I think the best way to do this will be to add sub-block parsing support 
to the DPU devcoredump.

So what will happen is similar to downstream design in sde_dbg, when a 
block has sub-blocks we will respect the sub-block's len and not the 
parent block's as that will be more accurate.

If 0x29c is going to help the cause till then we can change it.

>>
>>>> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
>>>
>>> Should we add an extra suffix to the name to indicate which hard-slice
>>> DSC encoder it is?  i.e. "dce_0_0" and "dce_0_1" etc?
>>
>> Ok, that should be fine. We can add it.
> 
> Great, thanks!
> 
>>>> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
>>>> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
>>>
>>
>>> See comment below about loose BIT() in features.
>>
>> Responded below.
>>>
>>>> +};
>>>> +
>>>>    static const struct dpu_intf_cfg sm8350_intf[] = {
>>>>    	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>>> @@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>>>>    	.dspp = sm8350_dspp,
>>>>    	.pingpong_count = ARRAY_SIZE(sm8350_pp),
>>>>    	.pingpong = sm8350_pp,
>>>> +	.dsc = sm8350_dsc,
>>>> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
>>>
>>> Count goes first **everywhere else**, let's not break consistency here.
>>>
>>
>> the order of DSC entries is swapped for all chipsets. Please refer to
>> dpu_sc8180x_cfg, dpu_sm8250_cfg etc.
> 
> Thanks for confirming that this is not the case in a followup mail :)
> 
>> So if you are talking about consistency, this is actually consistent
>> with whats present in other chipsets.
>>
>> If you are very particular about this, then once this lands, you can
>> change the order for all of them in another change.
>>
>> Same answer for all swap comments.
> <snip>
>>>> +/*
>>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>>> + * slice DSC encoders so both share same base address but with
>>>> + * its own different sub block address.
>>>> + */
>>>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>>>
>>> There are no address values here so this comment doesn't seem very
>>> useful, and it is already duplicated on every DSC block array, where the
>>> duplication is more visible.  Drop the comment here?
>>>
>>
>> _base is the address. So base address. Does that clarify things?
> 
> This is referring to the NOTE: comment above.  There's _base as address
> here, yes, but there's no context here that it'll be used in duplicate
> fashion, unlike the SoC catalog files.  The request is to just drop it
> here as it adds no value.
>

The duplication is there. the base is same for both the entries with dce_0.

+static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
+	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),

Both the blks use 0x80000 as base address and the note is just telling that.

>>>> +	{\
>>>> +	.name = _name, .id = _id, \
>>>> +	.base = _base, .len = _len, \
>>>
>>> The len is always 0x100 (downstream says 0x10), should we hardcode it
>>> here and drop _len?  We can always add it back if a future revision
>>> starts changing it, but that's not the case currently.
>>>
>>>> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>>>
>>> We don't willy-nilly append bits like that: should there be global
>>> feature flags?
>>
>> So this approach is actually better. This macro is a DSC_1_2 macro so it
>> will have the 1.2 feature flag and other features like native_422
>> support of that encoder are ORed on top of it. Nothing wrong with this.
> 
> I agree it is better, but we seem to be very selective in whether to
> stick to the "old" principles in DPU versus applying a new pattern that
> isn't used elsewhere yet (i.e. your request to _not_ shuffle the order
> of .dsc and .dsc_count assignment to match other .x and .x_count, and do
> that in a future patch instead).  If we want to be consistent
> everywhere, these should be #defines that we'll flatten out in a
> followup if at all.
> 

Yes, if it the order was already swapped, then we could have maintained 
it for this patch and cleaned all of them up together. Nothing wrong in 
that approach.

But I already clarified that was a mistake. The order of dsc and 
dsc_count is not swapped so I agreed to do that here. So where is the 
inconsistency?

>>> Or is this the start of a new era where we expand those defines in-line
>>> and drop them altogether?  I'd much prefer that but we should first
>>> align on this direction (and then also make the switch globally in a
>>> followup).
>>>
>>
>> Its case by case. No need to generalize.
>>
>> In this the feature flag ORed with the base feature flag of DSC_1_2
>> makes it more clear.
> 
> - Marijn
