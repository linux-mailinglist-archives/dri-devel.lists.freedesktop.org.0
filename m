Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17FD696C18
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B6410E943;
	Tue, 14 Feb 2023 17:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E578B10E943;
 Tue, 14 Feb 2023 17:55:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EEhWbA015420; Tue, 14 Feb 2023 17:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bIxLz53hdks8PSzH4Z/mhWkOgtHjw/e8sEJInHbVjBo=;
 b=Jv4NpBbnKB7lr/20r5OOf5F79y9t6zv+g19YrWwG5UmzdWDkEcV/9VBkO6BNQ6KFM+tF
 LLdTxd4czU+tYTVNTBDfw02UsW9ubttGSGnXnYfDsMSb+PpEv7Ie3cTyOqkQyv7zUhi0
 yd/IXVLPRtPaZn3cAuwP+nD+RS8SCcxyAhUIm2CKDF2UHK7iwV8u58rwlsy+fVeOYlVw
 4Z3T59IqHlTHn7PCtVQO6JYJPO1Mp00GGASErYCasR0PTu4RrhDL+30J0pjoFFp1nI14
 ycRNcfqYZa6DMaKm4HAwVboDbx1xpCQ80hO3c4Ygxe6RNcDVV1Z9rQpRWlkTatMu7SQ5 eA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np0qpyvd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 17:55:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31EHsxo9009728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 17:54:59 GMT
Received: from [10.110.55.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 14 Feb
 2023 09:54:57 -0800
Message-ID: <d514591a-2891-8c2d-2cd4-5af8283748f5@quicinc.com>
Date: Tue, 14 Feb 2023 09:54:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 <phone-devel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>,
 "Jami Kettunen" <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Loic Poulain" <loic.poulain@linaro.org>, Vinod Polimera
 <quic_vpolimer@quicinc.com>,
 Adam Skladowski <a39.skl@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
 <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
 <df059f88-6ff6-5906-58f1-4f6c752c4214@quicinc.com>
 <20230214130636.ldckqgcq6ajph372@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230214130636.ldckqgcq6ajph372@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -RvlEdomxGUwtI54SWJiR1Z4rcJMBVIe
X-Proofpoint-ORIG-GUID: -RvlEdomxGUwtI54SWJiR1Z4rcJMBVIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_13,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140154
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



On 2/14/2023 5:06 AM, Marijn Suijten wrote:
> On 2023-02-13 19:09:32, Abhinav Kumar wrote:
>>
>>
>> On 2/13/2023 1:46 PM, Dmitry Baryshkov wrote:
>>> On 13/02/2023 21:37, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 12/31/2022 1:50 PM, Marijn Suijten wrote:
>>>>> All SoCs since DPU 5.0.0 (and seemingly up until and including 6.0.0,
>>>>> but excluding 7.x.x) have the tear interrupt and control registers moved
>>>>> out of the PINGPONG block and into the INTF block.  Wire up the
>>>>> necessary interrupts and IRQ masks on all supported hardware.
>>>>
>>>> Hi Marijn,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> I saw that in your commit msg, you mentioned that 7.x doesn't have
>>>> tearcheck in the INTF block -- can you double check that this is correct?
> 
> It wasn't correct and has already been removed for v2 [1] after rebasing
> on top of SM8[345]50 support, where the registers reside at a different
> (named 7xxxx downstream) offset.
> 
> [1] https://github.com/SoMainline/linux/commit/886d3fb9eed925e7e9c8d6ca63d2439eaec1c702
> 
>>>> I'm working on SM8350 (DPU v7) and I'm seeing that it does have
>>>> tearcheck in INTF block.
>>>
>>> I confirm, according to the vendor drivers INTF TE should be used for
>>> all DPU >= 5.0, including 7.x and 8.x
>>>
>>> However I think I know what Marijn meant here. For 5.x and 6.x these
>>> IRQs are handled at the address MDSS + 0x6e800 / + 0x6e900 (which means
>>> offset here should 0x6d800 and 0x6d900) for INTF_1 and INTF_2. Since DPU
>>> 7.x these IRQ registers were moved close to the main INTF block (0x36800
>>> and 0x37800 = INTF + 0x800).
> 
> That might have been the case.
> 
>> Got it, then the commit text should remove "control" and just say tear
>> interrupt registers. It got a bit confusing.
> 
> The wording here points to both the interrupt (MDP_INTFx_TEAR_INTR)
> registers and control (INTF_TEAR_xxx) registers separately.  Feel free
> to bikeshed the wording in preliminary v2 [1]; should I drop the mention
> of the control registers being "moved" from PP to INTF entirely, leaving
> just the wording about the interrupt registers moving from
> MDP_SSPP_TOP0_INTR to a dedicated MDP_INTFx_TEAR_INTR region?

Yes, that makes more sense to me. Drop the mention on control registers.
> 
>> We will add the 7xxx intf tear check support on top of this series.
> 
> No need, that is already taken care of in an impending v2 [1] (unless
> additional changes are required beyond the moved register offset).
> 

Ok, we will wait till you post v2 and see if that works for us without 
any of our local changes.

>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>> ---
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 78 +++++++++++--------
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +-
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 +++
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  3 +
>>>>>    5 files changed, 68 insertions(+), 33 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> index 1cfe94494135..b9b9b5b0b615 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> @@ -86,6 +86,15 @@
>>>>>    #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>>>>> +#define IRQ_MSM8998_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>> +             BIT(MDP_INTF0_INTR) | \
>>>>> +             BIT(MDP_INTF1_INTR) | \
>>>>> +             BIT(MDP_INTF2_INTR) | \
>>>>> +             BIT(MDP_INTF3_INTR) | \
>>>>> +             BIT(MDP_INTF4_INTR))
>>>>> +
>>>>>    #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>                 BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>> @@ -100,13 +109,15 @@
>>>>>    #define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>                 BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>> -             BIT(MDP_INTF1_INTR))
>>>>> +             BIT(MDP_INTF1_INTR) | \
>>>>> +             BIT(MDP_INTF1_TEAR_INTR))
>>>>>    #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>                 BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>>                 BIT(MDP_INTF0_INTR) | \
>>>>> -             BIT(MDP_INTF1_INTR))
>>>>> +             BIT(MDP_INTF1_INTR) | \
>>>>> +             BIT(MDP_INTF1_TEAR_INTR))
>>>>>    #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>                 BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>> @@ -120,7 +131,9 @@
>>>>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>>                 BIT(MDP_INTF0_INTR) | \
>>>>>                 BIT(MDP_INTF1_INTR) | \
>>>>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>>>>                 BIT(MDP_INTF2_INTR) | \
>>>>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>>>>                 BIT(MDP_INTF3_INTR) | \
>>>>>                 BIT(MDP_INTF4_INTR))
>>>>> @@ -129,7 +142,9 @@
>>>>>                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>>                  BIT(MDP_INTF0_INTR) | \
>>>>>                  BIT(MDP_INTF1_INTR) | \
>>>>> +              BIT(MDP_INTF1_TEAR_INTR) | \
>>>>>                  BIT(MDP_INTF2_INTR) | \
>>>>> +              BIT(MDP_INTF2_TEAR_INTR) | \
>>>>>                  BIT(MDP_INTF3_INTR) | \
>>>>>                  BIT(MDP_INTF4_INTR) | \
>>>>>                  BIT(MDP_INTF5_INTR) | \
>>>>> @@ -1300,63 +1315,64 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>>>>>    /*************************************************************
>>>>>     * INTF sub blocks config
>>>>>     *************************************************************/
>>>>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch,
>>>>> _features, _reg, _underrun_bit, _vsync_bit) \
>>>>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id,
>>>>> _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg,
>>>>> _tear_rd_ptr_bit) \
>>>>>        {\
>>>>>        .name = _name, .id = _id, \
>>>>> -    .base = _base, .len = 0x280, \
>>>>> +    .base = _base, .len = _len, \
>>>>>        .features = _features, \
>>>>>        .type = _type, \
>>>>>        .controller_id = _ctrl_id, \
>>>>>        .prog_fetch_lines_worst_case = _progfetch, \
>>>>>        .intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
>>>>>        .intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>>>>> +    .intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \
>>>>>        }
>>>>>    static const struct dpu_intf_cfg msm8998_intf[] = {
>>>>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25,
>>>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25,
>>>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>>>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25,
>>>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>>>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25,
>>>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>>>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25,
>>>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
>>>>
>>>> Just wondering, how were the lengths calculated for the INTF blocks?
>>>> The values in general seem a little off to me.
> 
> These (for MSM8998) have been taken from downstream specifically; my
> series starts using INTF_STATUS at 0x26C which conveniently is the
> register right after 0x268, matching the fact that INTF TE and these
> registers weren't supported/available yet on MSM8998.
> 
>>>> For example, I'm looking downstream and it seems to me that the length
>>>> for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm
>>>> seeing that length for INTF + tearcheck should be 0x2c4.
> 
> There are many different downstream sources and tags with seemingly
> conflicting/confusing information.  For v2 [2] I've picked the highest
> register used by the driver which is INTF_TEAR_AUTOREFRESH_CONFIG at
> 0x2B4 (but there might always be more registers that don't need to be
> poked at by the driver, but contain magic debug information and the
> like... those would be useful to capture in the dump going forward).
> 
> [2]: https://github.com/SoMainline/linux/commit/2bbc609dd28aa0bd0a2dede20163e521912d0072
> 

Not entirely correct.TEAR_AUTOREFRESH_STATUS is at 0x2c0 for sm8350 and 
sm8450 as well so 0x2b4 is a bit short. DPU code uses autorefresh status 
today.Esp after your changes it will use the autorefresh status from 
intf te which is at offset 0x2c0

>>> We have discussed INTF lengths in [1]. The current understanding of the
>>> block lengths can be found at [2]. Please comment there if any of the
>>> fixed lengths sounds incorrect to you.
>>>
>>> [1] https://patchwork.freedesktop.org/patch/522187/
>>> [2] https://patchwork.freedesktop.org/patch/522227/
>>>
>>> [skipped the rest]
>>>
>>
>> Please correct my understanding here, it was agreed to fix intf blocks
>> to 0x2c4 here https://patchwork.freedesktop.org/patch/522227/ but I dont
>> see this was merged?
>>
>> It was agreed to first land INTF_TE and then add the higher addresses
> 
> Seems like it, at least if I interpret [3] correctly.  My series adds a
> new define that will hardcode _len to 0x2B8 for now, and Dmitry/Konrad
> can later extend it to whatever is stated by the correct downstream
> source.
> 

Like mentioned above it should be 0x2c0 for intf block.

If you face any conflicting information in downstream code, you can 
always check with me on IRC.

> [3]: https://lore.kernel.org/linux-arm-msm/6ad96cff-b91b-a4c7-4573-7bb8de7194f8@linaro.org/
> 
>> but I dont see such a change, am i missing something?
> 
> This was discussed just yesterday.  And it wouldn't make much sense to
> make such a change now, knowing that my v2 for this series - which isn't
> even on the lists yet - will already change the INTF_BLK macro resulting
> in unneeded conflicts.  As requested by Dmitry, let's get INTF TE
> processed first before rebasing the block length change?
> 

Please see above comment on why it should be 0x2c4.

> - Marijn
