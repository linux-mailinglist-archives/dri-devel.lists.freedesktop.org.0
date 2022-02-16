Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6E4B8145
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 08:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6292F10E6E7;
	Wed, 16 Feb 2022 07:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E3510E6E7;
 Wed, 16 Feb 2022 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644996005; x=1676532005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E8zZRmeJ9OwBsBpP0tYM0smOGLQGbiEJVRVolFrNMWE=;
 b=gGrjpYHgw82r9+kRGRPsyW5M+ERJ8JK67OvjEkpaLCW+eIJd9lJBoIV1
 zyeeUkWPuBcTHqLSc5GpZ00PyXyqYxPbAyAEmK9wk/dGxd5xPQj2Zwdba
 Bek1z/we37vkBNEC4inlQxjAkAVT0rSf1J6GMSnnNluBZYo54Syjy8dpM Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Feb 2022 23:20:04 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 23:20:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 23:20:00 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 23:19:58 -0800
Message-ID: <fcf676d0-1e25-aeda-ce6f-f051d34e0bbe@quicinc.com>
Date: Tue, 15 Feb 2022 23:19:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <YgxeCHi5AsYPTmeZ@builder.lan>
 <51675806-641d-c57e-ada7-a044e37ad808@quicinc.com> <YgyIPnc/sZLE0ABn@yoga>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YgyIPnc/sZLE0ABn@yoga>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/15/2022 9:14 PM, Bjorn Andersson wrote:
> On Tue 15 Feb 20:38 CST 2022, Abhinav Kumar wrote:
> 
>>
>>
>> On 2/15/2022 6:14 PM, Bjorn Andersson wrote:
>>> On Tue 15 Feb 11:42 CST 2022, Abhinav Kumar wrote:
>>>
>>>>
>>>>
>>>> On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
>>>>> On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>
>>>>>>> Add SC8180x to the hardware catalog, for initial support for the
>>>>>>> platform. Due to limitations in the DP driver only one of the four DP
>>>>>>> interfaces is left enabled.
>>>>>>>
>>>>>>> The SC8180x platform supports the newly added DPU_INTF_WIDEBUS flag and
>>>>>>> the Windows-on-Snapdragon bootloader leaves the widebus bit set, so this
>>>>>>> is flagged appropriately to ensure widebus is disabled - for now.
>>>>>>>
>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>> [bjorn: Reworked intf and irq definitions]
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes since v1:
>>>>>>> - Dropped widebus flag
>>>>>>>
>>>>>>>      .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 129 ++++++++++++++++++
>>>>>>>      .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>>>>>>      drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>>>>>>>      4 files changed, 132 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> index aa75991903a6..7ac0fe32df49 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> @@ -90,6 +90,17 @@
>>>>>>>      			 BIT(MDP_INTF3_INTR) | \
>>>>>>>      			 BIT(MDP_INTF4_INTR))
>>>>>>> +#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>>>>>> +			  BIT(MDP_SSPP_TOP0_INTR2) | \
>>>>>>> +			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>>>>>> +			  BIT(MDP_INTF0_INTR) | \
>>>>>>> +			  BIT(MDP_INTF1_INTR) | \
>>>>>>> +			  BIT(MDP_INTF2_INTR) | \
>>>>>>> +			  BIT(MDP_INTF3_INTR) | \
>>>>>>> +			  BIT(MDP_INTF4_INTR) | \
>>>>>>> +			  BIT(MDP_INTF5_INTR) | \
>>>>>>> +			  BIT(MDP_AD4_0_INTR) | \
>>>>>>> +			  BIT(MDP_AD4_1_INTR))
>>>>>>>      #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>>>>>>>      #define DEFAULT_DPU_LINE_WIDTH		2048
>>>>>>> @@ -225,6 +236,22 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>>>>>      	.max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>>      };
>>>>>>> +static const struct dpu_caps sc8180x_dpu_caps = {
>>>>>>> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>> +	.max_mixer_blendstages = 0xb,
>>>>>>> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
>>>>>>> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>>>>>> +	.ubwc_version = DPU_HW_UBWC_VER_30,
>>>>>>> +	.has_src_split = true,
>>>>>>> +	.has_dim_layer = true,
>>>>>>> +	.has_idle_pc = true,
>>>>>>> +	.has_3d_merge = true,
>>>>>>> +	.max_linewidth = 4096,
>>>>>>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>> +};
>>>>>>> +
>>>>>>>      static const struct dpu_caps sm8250_dpu_caps = {
>>>>>>>      	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>>      	.max_mixer_blendstages = 0xb,
>>>>>>> @@ -293,6 +320,31 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>>>>>>>      	},
>>>>>>>      };
>>>>>>> +static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>>>>>>> +	{
>>>>>>> +	.name = "top_0", .id = MDP_TOP,
>>>>>>> +	.base = 0x0, .len = 0x45C,
>>>>>>> +	.features = 0,
>>>>>>> +	.highest_bank_bit = 0x3,
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>>>>>>> +			.reg_off = 0x2AC, .bit_off = 0},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
>>>>>>> +			.reg_off = 0x2B4, .bit_off = 0},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
>>>>>>> +			.reg_off = 0x2BC, .bit_off = 0},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
>>>>>>> +			.reg_off = 0x2C4, .bit_off = 0},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>>>>>>> +			.reg_off = 0x2AC, .bit_off = 8},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>>>>>>> +			.reg_off = 0x2B4, .bit_off = 8},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>>>>>>> +			.reg_off = 0x2BC, .bit_off = 8},
>>>>>>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>>>>>>> +			.reg_off = 0x2C4, .bit_off = 8},
>>>>>>> +	},
>>>>>>> +};
>>>>>>> +
>>>>>>>      static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>>>>>>      	{
>>>>>>>      	.name = "top_0", .id = MDP_TOP,
>>>>>>> @@ -861,6 +913,16 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>>>>>>>      	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>>>>>>      };
>>>>>>> +static const struct dpu_intf_cfg sc8180x_intf[] = {
>>>>>>> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>>>>> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>>>>>> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>>>>>> +	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
>>>>>>> +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>>>>>> +	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>>>>>>> +	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>>>>>
>>>>>> This is a continued discussion from
>>>>>> https://patchwork.freedesktop.org/patch/474179/.
>>>>>>
>>>>>> Shouldnt INTF_5 be marked as INTF_eDP?
>>>>>>
>>>>>
>>>>> Might be, I didn't even know we had an INTF_EDP define...
>>>>>
>>>>> Is there any reason to distinguish DP and EDP in the DPU?  I see sc7280
>>>>> doesn't distinguish the DP and EDP interfaces.
>>>>>
>>>>> Regards,
>>>>> Bjorn
>>>>>
>>>>
>>>> Like I have mentioned in the other patch, I think we have enough confusion
>>>> between eDP and DP with the common driver. Since DPU does have separate
>>>> interfaces I think we should fix that.
>>>>
>>>> Regarding sc7280 using INTF_DP, I synced up with Sankeerth. He referred to
>>>> your change
>>>> https://patchwork.freedesktop.org/patch/457776/?series=92992&rev=5 as it was
>>>> posted earlier and ended up using the same INTF_DP macro. So its turning out
>>>> to be a cyclical error.
>>>>
>>>
>>> That made me take a second look at the HPG, and sure enough INTF_5 on
>>> SC7280 is connected to a eDP/DP Combo PHY. We have the same setup in
>>> SC8280XP.
>>>
>>> In SC8180X, INTF_5 is documented as being connected to a eDP (only) PHY,
>>> so perhaps it makes sense to do it there, but for the others its wrong.
>>>
>>
>> Here you are specifying the controller in the catalog.
> 
> No, I'm specifying the type of the INTF. We then use the type of the
> intf and the index to match that to a particular DP TX block.
> 
>> So independent of the PHY thats being used, shouldnt this remain
>> INTF_eDP?
>>
> 
> I don't think it's going to help anyone to say that an interface
> connected to a PHY that can be either DP or EDP, should be INTF_EDP.
> 
> People are going to make assumptions in the code such as INTF_EDP does
> not have audio and then someone designs a board based on SC7280 with DP
> output where they expect audio. Or assumptions about HPD, panel etc...
> 
> I'm not saying that we have all the details figured out on how that's
> going to be controlled, but until there's a reason to distinguish
> INTF_DP from INTF_EDP I think we should not make one up. And I don't see
> that those differences should be hard coded in the DPU driver.
> 
> 
> If it's confusing to people that DP might be driving an EDP output, then
> perhaps we can just name it TMDS again? ;)

If you prefer to have TMDS, then like I commented earlier we dont really 
need this change https://patchwork.freedesktop.org/patch/474271/ :)

Whats the benefit of making that change? DRM_ENCODER_TMDS_* can be eDP 
and DP . Then there is no confusion or guess work in the encoder.

DRM_ENCODER_DSI - INTF_DSI
DRM_ENCODER_VIRTUAL - INTF_WB
DRM_ENCODER_TMDS - INTF_DP OR INTF_eDP ( doesnt matter )

> 
> Regards,
> Bjorn
