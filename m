Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C069571A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 04:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19B10E7D0;
	Tue, 14 Feb 2023 03:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520210E7D0;
 Tue, 14 Feb 2023 03:09:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31E39aDE026434; Tue, 14 Feb 2023 03:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KsYecN1rsYL0dVA2x6yNTZhSQBborHeLN4RmARTaE0s=;
 b=G5ShA7RksAIBRrLQKkqbEGG5NxmVz9MjUDwACQ7KBpEShMSiCvMgOa5Eidj6k7ds/vvg
 hZFn43XvUawMzsMR26DpWmCeJ5AVbD1TKhyWZs9ABgxluD96SdHc06nMXZ6+hL7TzQEj
 9zyivLZ3fv26YfiyvdyTwDWQLNLsTTPRPifDEeQxIRO/QlWiwYyaBkTs6NntUBh17hQI
 jyq95779CNM/DSVBydXS9ykpN8Zj8Vz6EaeoC+Vpracckx9jGGgxB6J7ASaR0Zr03NSx
 GDs1D9/+HtsK/8c+ZQxHkQEB7/dXUSShq4duhwEjMlD8RJ41PlEL6h6yxI42E9NVkMgW iQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np389wmuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 03:09:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31E39Z4J020348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 03:09:35 GMT
Received: from [10.110.55.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 19:09:33 -0800
Message-ID: <df059f88-6ff6-5906-58f1-4f6c752c4214@quicinc.com>
Date: Mon, 13 Feb 2023 19:09:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
 <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HK1u26ls4glfAknYbKlwlv7S_jxg8PuD
X-Proofpoint-GUID: HK1u26ls4glfAknYbKlwlv7S_jxg8PuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_01,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140024
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Jami
 Kettunen <jami.kettunen@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Adam Skladowski <a39.skl@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/13/2023 1:46 PM, Dmitry Baryshkov wrote:
> On 13/02/2023 21:37, Jessica Zhang wrote:
>>
>>
>> On 12/31/2022 1:50 PM, Marijn Suijten wrote:
>>> All SoCs since DPU 5.0.0 (and seemingly up until and including 6.0.0,
>>> but excluding 7.x.x) have the tear interrupt and control registers moved
>>> out of the PINGPONG block and into the INTF block.  Wire up the
>>> necessary interrupts and IRQ masks on all supported hardware.
>>
>> Hi Marijn,
>>
>> Thanks for the patch.
>>
>> I saw that in your commit msg, you mentioned that 7.x doesn't have 
>> tearcheck in the INTF block -- can you double check that this is correct?
>>
>> I'm working on SM8350 (DPU v7) and I'm seeing that it does have 
>> tearcheck in INTF block.
> 
> I confirm, according to the vendor drivers INTF TE should be used for 
> all DPU >= 5.0, including 7.x and 8.x
> 
> However I think I know what Marijn meant here. For 5.x and 6.x these 
> IRQs are handled at the address MDSS + 0x6e800 / + 0x6e900 (which means 
> offset here should 0x6d800 and 0x6d900) for INTF_1 and INTF_2. Since DPU 
> 7.x these IRQ registers were moved close to the main INTF block (0x36800 
> and 0x37800 = INTF + 0x800).
> 

Got it, then the commit text should remove "control" and just say tear 
interrupt registers. It got a bit confusing.

We will add the 7xxx intf tear check support on top of this series.

>>
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 78 +++++++++++--------
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +-
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 +++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  3 +
>>>   5 files changed, 68 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 1cfe94494135..b9b9b5b0b615 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -86,6 +86,15 @@
>>>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>>> +#define IRQ_MSM8998_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +             BIT(MDP_INTF0_INTR) | \
>>> +             BIT(MDP_INTF1_INTR) | \
>>> +             BIT(MDP_INTF2_INTR) | \
>>> +             BIT(MDP_INTF3_INTR) | \
>>> +             BIT(MDP_INTF4_INTR))
>>> +
>>>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> @@ -100,13 +109,15 @@
>>>   #define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> -             BIT(MDP_INTF1_INTR))
>>> +             BIT(MDP_INTF1_INTR) | \
>>> +             BIT(MDP_INTF1_TEAR_INTR))
>>>   #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>                BIT(MDP_INTF0_INTR) | \
>>> -             BIT(MDP_INTF1_INTR))
>>> +             BIT(MDP_INTF1_INTR) | \
>>> +             BIT(MDP_INTF1_TEAR_INTR))
>>>   #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>> @@ -120,7 +131,9 @@
>>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>                BIT(MDP_INTF0_INTR) | \
>>>                BIT(MDP_INTF1_INTR) | \
>>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>>                BIT(MDP_INTF2_INTR) | \
>>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>>                BIT(MDP_INTF3_INTR) | \
>>>                BIT(MDP_INTF4_INTR))
>>> @@ -129,7 +142,9 @@
>>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>                 BIT(MDP_INTF0_INTR) | \
>>>                 BIT(MDP_INTF1_INTR) | \
>>> +              BIT(MDP_INTF1_TEAR_INTR) | \
>>>                 BIT(MDP_INTF2_INTR) | \
>>> +              BIT(MDP_INTF2_TEAR_INTR) | \
>>>                 BIT(MDP_INTF3_INTR) | \
>>>                 BIT(MDP_INTF4_INTR) | \
>>>                 BIT(MDP_INTF5_INTR) | \
>>> @@ -1300,63 +1315,64 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>>>   /*************************************************************
>>>    * INTF sub blocks config
>>>    *************************************************************/
>>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, 
>>> _features, _reg, _underrun_bit, _vsync_bit) \
>>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, 
>>> _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg, 
>>> _tear_rd_ptr_bit) \
>>>       {\
>>>       .name = _name, .id = _id, \
>>> -    .base = _base, .len = 0x280, \
>>> +    .base = _base, .len = _len, \
>>>       .features = _features, \
>>>       .type = _type, \
>>>       .controller_id = _ctrl_id, \
>>>       .prog_fetch_lines_worst_case = _progfetch, \
>>>       .intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
>>>       .intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>>> +    .intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \
>>>       }
>>>   static const struct dpu_intf_cfg msm8998_intf[] = {
>>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, 
>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, 
>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, 
>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, 
>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25, 
>>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
>>
>> Just wondering, how were the lengths calculated for the INTF blocks? 
>> The values in general seem a little off to me.
>>
>> For example, I'm looking downstream and it seems to me that the length 
>> for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm 
>> seeing that length for INTF + tearcheck should be 0x2c4.
> 
> We have discussed INTF lengths in [1]. The current understanding of the 
> block lengths can be found at [2]. Please comment there if any of the 
> fixed lengths sounds incorrect to you.
> 
> [1] https://patchwork.freedesktop.org/patch/522187/
> [2] https://patchwork.freedesktop.org/patch/522227/
> 
> [skipped the rest]
> 

Please correct my understanding here, it was agreed to fix intf blocks 
to 0x2c4 here https://patchwork.freedesktop.org/patch/522227/ but I dont 
see this was merged?

It was agreed to first land INTF_TE and then add the higher addresses 
but I dont see such a change, am i missing something?
