Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0ED6D5116
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB48810E03A;
	Mon,  3 Apr 2023 19:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61A410E03A;
 Mon,  3 Apr 2023 19:07:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333ETqPv026979; Mon, 3 Apr 2023 19:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dOed60UN+eh1dm1tAIE9fiexuRCZM9wl9JIJoqB4vu0=;
 b=M3gs8FeKE9ML+yMR42qAICMUQoR0MvrvrrLJ+6zScGye1w6I+dR3RSKMvu41yDtO2yaW
 eqOAooaxAlUGxYGgVylIs8xcRjsRVmY2LBxih5NPbAmzH/7wK/+qD+oZdl95q2IcwfmB
 JxCbHznuTLGiWDLuPCUCM0ebiSSqRinJ+B3mdRjH3s45InjYoQRlxczlXIxmDF6/7irD
 hYKPxDP3ccYuc6YbYY+T+VyEIRb1RagFICGEaUJXFTd7uhYfO4ATSYHmrcTHYc59n1MN
 PpqoE/UZKOi6N0gHT9wIJoS9TAltqDJmC2+9RZzDXmywpYnqURt+KySja0eBqLJFNzNA iQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pr0kx0pe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 19:07:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333J73Z0032262
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Apr 2023 19:07:03 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 12:07:03 -0700
Message-ID: <9d1529c0-779c-7f1f-6e6e-1972bb0d39f4@quicinc.com>
Date: Mon, 3 Apr 2023 12:07:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/38] drm/msm/dpu: rework HW catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
 <b4972790-d990-063a-7ef4-2f05407357e8@quicinc.com>
 <f198ac6a-df12-9c08-55e8-f677acea8e2c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <f198ac6a-df12-9c08-55e8-f677acea8e2c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2L806kuGRLjXowJJOhX-pv06-4pmuD90
X-Proofpoint-ORIG-GUID: 2L806kuGRLjXowJJOhX-pv06-4pmuD90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030146
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/3/2023 11:48 AM, Dmitry Baryshkov wrote:
> On 03/04/2023 21:06, Abhinav Kumar wrote:
>>
>>
>> On 3/30/2023 2:52 PM, Dmitry Baryshkov wrote:
>>> This huge series attempts to restructure the DPU HW catalog into a
>>> manageable and reviewable data set. In order to ease review and testing
>>> I merged all the necessary fixes into this series. Also I cherry-picked
>>> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
>>>
>>
>> I had to first dig up some history about why dpu catalog grew so much 
>> in the first place before starting this review. When the DPU driver 
>> first landed (which pre-dates my work in upstream), it looks like it 
>> followed mdp5 model from mdp5_cfg.c. But looks like as the number of 
>> chipsets which use DPU kept growing, this is becoming a burden.
>>
>> As everyone knows, downstream follows a devicetree model for the dpu 
>> hardware and that should have always been the case. Perhaps in the 
>> last 2-3 years more time could have been spent on standardizing the 
>> bindings used for hw blocks in order to maintain a less hard-coded 
>> catalog file and more in the device tree.
> 
> Unfortunately, this is not how the upstream DT works. If something is a 
> constant hardware property, it should not go into the DT. So pushing 
> catalog to dt would have been immediately frowned upon by Rob Herring or 
> Krzysztof.
> 

Yes certainly we cannot put hardware specific properties. But in 
general, modelling the hardware like the number of sspps, number of 
interfaces and number of dspps etc can be a bit abstracted? like 
blk-type and blk-offset? blk-type can be a custom string because each 
block is named differently for different vendors?

The number of blk_offsets decides number of blocks. Its not constant 
right. We are seeing it varying with chipsets.

>> Then the catalog would have just been a place to parse the device 
>> tree, set the feature capability based on chipset (refer 
>> _sde_hardware_pre_caps). That way offsets , number of blocks and the 
>> blocks themselves still come from the device tree but perhaps some 
>> specific features are at SOC level for which the catalog still stays.
>>
>> That being said, I thought of different strategies even before the 
>> review but two issues prevented me from suggesting those ideas (one of 
>> which I am seeing even here , which I am going to suggest below and 
>> also suggest why it wont work).
>>
>> 1) For the same DPU major/minor version, some features might get 
>> dropped or even get added with different SOCs as overall the system 
>> capabilities might differ like number of SSPPs or memory footprint of 
>> the SOC etc.
>>
>> So there is no good way right now to generalize any dpu catalog or to 
>> tie it with a DPU major/minor version. We will have to stick with a 
>> per-SOC model.
> 
> Up to now, the SoC was equal to major+minor. Could you please be more 
> specific here, if there are any actual differences within major+minor 
> families?
> 

So lets say, the same DPU major/minor version is used but we have only 
one DSI on one chipset Vs two DSIs on the other, some of the features 
which come into play only for dual DSI cannot be used. Like broadcasting 
a DCS command across two DSIs etc. This is a very basic example, but 
there are many examples.

>>
>> This is what led me to not pursue that route.
>>
>> 2) For the same DPU major/minor version, even if core-DPU is same (in 
>> terms of SSPP, DSPP etc), the number of interfaces can change. So 
>> again no room to generalize same DPU hw version.
> 
> Again, I might be just scratching the surface, but I have not observed 
> this.
> 

This typically happens based on what products that chipset is catered 
towards. Thats pretty much what I can share. But more number of 
interfaces for more number of displays / use-cases.

>>
>> 3) For the same reason as (1) and (2), I think the de-duplication 
>> strategy used in this series is not correct. The idea of 
>> dpu_hw_version_num_layer_mixer is just not scalable as I dont know how 
>> many variants that will lead to. So it seems like just an attempt to 
>> de-duplicate which perhaps works today for existing dpu chipsets in 
>> upstream but by no means scalable. Lets go ahead with per-SOC catalog 
>> file but lets live with some amount of duplication between them if we 
>> really have to split it across header files.
> 
> Indeed, this leads to minor differences on top of major+lm. However, I 
> think, the overall complexity is lowered.
> 
> Nevertheless, let's land the major set of patches and leave 
> generalization for the later time. I think, with the addition of the 
> next several platforms we will see the drill.
> 

Yes, I would say lets handle generalization/de-duplication later when we 
see more patterns.

Lets land the main pieces first.

Going with dpu version and number of lms is not the way to generalize it 
from what we think.

>> I also thought of similar strategies to generalize like based on 
>> sub-blocks similar to what you have done but all of these were NAKed 
>> internally by folks who work on more chipsets / have more visibility 
>> into the spread of features across chipsets.
>>
>>> First 4 patches clean up the catalog a bit in order to make it more
>>> suitable for refactoring.
>>>
>>
>> These are okay. I will address your follow-up questions about patch 
>> (1) and lets land these.
>>
>>> Then the next batch of 13 + 5 patches split the hw catalog entries into
>>> per-SoC files.
>>>
>>
>> This part is also fine. But perhaps dont have dpu hw version in the 
>> file. So just dpu_hw_sm8250.h or dpu_hw_sm8350.h etc.
> 
> Having a version makes it easier to compare chipsets (and also to verify 
> that feature masks are correct), so I'd like to retain it.
> 

This is again trying to generalize it. So for example, yes perhaps today 
the chipsets we have belong to a particular DPU major/minor version and 
it might look like because they are in the same family things look 
similar but that can also go against this. If we find some differences 
among them, then some upstream developers might think "Oh, these belong 
to the same family, but how come it doesnt have the same features?". 
Thats why I am hesitant to go with DPU major/minor version in the name.

>>
>>> Next 9 patches rework catalog entries, mostly targeting deduplication of
>>> data used by several platforms. At this moment only three pairs (out of
>>> 13 devices supported by DPU) are merged. However this part lays out the
>>> ground to ease adding support for new platforms, some of which use the
>>> same configuration as the existing platforms
>>>
>>
>> This is the part I suggest we drop.
>>
>>> Last batch of 7 patches renames existing macros to ease using them while
>>> adding support for new devices.
>>>
>>
>> I have to check this part but perhaps after re-basing based on my 
>> earlier comment.
> 
> Ack, I'll see what I can drop and what is going to be there.
> 
> Up to now there were some natural shares, like sm8150 vs sc8180x and 
> qcm2290 vs sm6115. Do you think we should populate the missing parts by 
> duplicate the data?
> 

Yes, lets go ahead with the duplicate data for now. Once a more 
reasonable strategy evolves for generalizing it, we can update it.

>>
>>> This pile of patches is submitted in a single batch to allow one to
>>> observe the final goal of the cleanup which otherwise might be hard to
>>> assess.
>>>
>>>
>>> Changes since v2:
>>> - Fixed sc8280xp SSPP size to 0x2ac
>>> - Rebased on top of msm-next-lumag, dropped merged patches
>>>
>>> Changes since v1:
>>> - Picked up Konrad's patch
>>> - Picked up dependencies into the main series
>>> - Moved qseed3lite vs qseed4 patches into the fixes part
>>> - Fixed sm6115 in a similar manner.
>>>
>>> Dmitry Baryshkov (37):
>>>    drm/msm/dpu: constify DSC data structures
>>>    drm/msm/dpu: mark remaining pp data as const
>>>    drm/msm/dpu: move UBWC/memory configuration to separate struct
>>>    drm/msm/dpu: split SM8550 catalog entry to the separate file
>>>    drm/msm/dpu: split SM8450 catalog entry to the separate file
>>>    drm/msm/dpu: split SC8280XP catalog entry to the separate file
>>>    drm/msm/dpu: split SC7280 catalog entry to the separate file
>>>    drm/msm/dpu: split SM8350 catalog entry to the separate file
>>>    drm/msm/dpu: split SM6115 catalog entry to the separate file
>>>    drm/msm/dpu: split QCM2290 catalog entry to the separate file
>>>    drm/msm/dpu: split SC7180 catalog entry to the separate file
>>>    drm/msm/dpu: split SM8250 catalog entry to the separate file
>>>    drm/msm/dpu: split SC8180X catalog entry to the separate file
>>>    drm/msm/dpu: split SM8150 catalog entry to the separate file
>>>    drm/msm/dpu: split MSM8998 catalog entry to the separate file
>>>    drm/msm/dpu: split SDM845 catalog entry to the separate file
>>>    drm/msm/dpu: duplicate sdm845 catalog entries
>>>    drm/msm/dpu: duplicate sc7180 catalog entries
>>>    drm/msm/dpu: duplicate sm8150 catalog entries
>>>    drm/msm/dpu: duplicate sm8250 catalog entries
>>>    drm/msm/dpu: duplicate sm8350 catalog entries
>>>    drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>>>    drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
>>>    drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
>>>    drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
>>>    drm/msm/dpu: drop duplicate vig_sblk instances
>>>    drm/msm/dpu: enable DSPP on sc8180x
>>>    drm/msm/dpu: deduplicate sc8180x with sm8150
>>>    drm/msm/dpu: deduplicate sm6115 with qcm2290
>>>    drm/msm/dpu: deduplicate sc8280xp with sm8450
>>>    drm/msm/dpu: drop unused macros from hw catalog
>>>    drm/msm/dpu: inline IRQ_n_MASK defines
>>>    drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
>>>    drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
>>>    drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
>>>    drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
>>>    drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
>>>
>>> Konrad Dybcio (1):
>>>    drm/msm/dpu: Allow variable SSPP/INTF_BLK size
>>>
>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  210 ++
>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  210 ++
>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  151 ++
>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   91 +
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   83 +
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   53 +
>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  158 ++
>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  136 ++
>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  142 ++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |   99 +
>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2175 +----------------
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
>>>   21 files changed, 2443 insertions(+), 2147 deletions(-)
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>>   create mode 100644 
>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>
> 
