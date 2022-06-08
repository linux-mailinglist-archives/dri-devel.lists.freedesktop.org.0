Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72345543CDE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 21:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EDB10FA63;
	Wed,  8 Jun 2022 19:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164210FA63;
 Wed,  8 Jun 2022 19:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654716553; x=1686252553;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BZdpUZIWhAaLzKQoiW64mA5GcDePFfVEhO4psuS1qss=;
 b=C/g4x1tvlXCp7C8jyi1LYKQgLiVFwStl+jezb87njem44UV/jsTDCvYW
 yAjCBtaUXESeeTYyJEzuiH2CRYJsz6VSJUTx+U/BqwHF9aRT00x+gKCji
 akmsSieP34Tu4ru75s3GZRRx6BDc+tnfc94ISL6tC8A0oUTDfwZ4fM4PI A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2022 12:29:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 12:29:13 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 8 Jun 2022 12:29:12 -0700
Received: from [10.111.166.162] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 8 Jun 2022
 12:29:10 -0700
Message-ID: <e56780cb-44c1-b26b-90b8-ceb40b8f218b@quicinc.com>
Date: Wed, 8 Jun 2022 12:29:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com>
 <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
 <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
 <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com>
 <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen
 Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 1:13 PM, Dmitry Baryshkov wrote:
> On Thu, 2 Jun 2022 at 21:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/1/2022 1:04 PM, Dmitry Baryshkov wrote:
>>> On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
>>>>>>> Replace magic register writes in msm_mdss_enable() with version that
>>>>>>> contains less magic and more variable names that can be traced back to
>>>>>>> the dpu_hw_catalog or the downstream dtsi files.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
>>>>>>>      1 file changed, 71 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>> index 0454a571adf7..2a48263cd1b5 100644
>>>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>> @@ -21,6 +21,7 @@
>>>>>>>      #define HW_REV                              0x0
>>>>>>>      #define HW_INTR_STATUS                      0x0010
>>>>>>>
>>>>>>> +#define UBWC_DEC_HW_VERSION          0x58
>>>>>>>      #define UBWC_STATIC                 0x144
>>>>>>>      #define UBWC_CTRL_2                 0x150
>>>>>>>      #define UBWC_PREDICTION_MODE                0x154
>>>>>>> @@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>>>>>>>          return 0;
>>>>>>>      }
>>>>>>>
>>>>>>> +#define UBWC_1_0 0x10000000
>>>>>>> +#define UBWC_2_0 0x20000000
>>>>>>> +#define UBWC_3_0 0x30000000
>>>>>>> +#define UBWC_4_0 0x40000000
>>>>>>> +
>>>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>>>>>>> +                                    u32 ubwc_static)
>>>>>>> +{
>>>>>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>>>>>>> +                                    unsigned int ubwc_version,
>>>>>>> +                                    u32 ubwc_swizzle,
>>>>>>> +                                    u32 highest_bank_bit,
>>>>>>> +                                    u32 macrotile_mode)
>>>>>>> +{
>>>>>>> +     u32 value = (ubwc_swizzle & 0x1) |
>>>>>>> +                 (highest_bank_bit & 0x3) << 4 |
>>>>>>> +                 (macrotile_mode & 0x1) << 12;
>>>>>>> +
>>>>>>> +     if (ubwc_version == UBWC_3_0)
>>>>>>> +             value |= BIT(10);
>>>>>>> +
>>>>>>> +     if (ubwc_version == UBWC_1_0)
>>>>>>> +             value |= BIT(8);
>>>>>>> +
>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>>>>>>> +                                    unsigned int ubwc_version,
>>>>>>> +                                    u32 ubwc_swizzle,
>>>>>>> +                                    u32 ubwc_static,
>>>>>>> +                                    u32 highest_bank_bit,
>>>>>>> +                                    u32 macrotile_mode)
>>>>>>> +{
>>>>>>> +     u32 value = (ubwc_swizzle & 0x7) |
>>>>>>> +                 (ubwc_static & 0x1) << 3 |
>>>>>>> +                 (highest_bank_bit & 0x7) << 4 |
>>>>>>> +                 (macrotile_mode & 0x1) << 12;
>>>>>>> +
>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>> +
>>>>>>> +     if (ubwc_version == UBWC_3_0) {
>>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>>> +             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>>>>>> +     } else {
>>>>>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>>>>>> +     }
>>>>>>> +}
>>>>>>> +
>>>>>>
>>>>>> Is it possible to unify the above functions by having the internal
>>>>>> ubwc_version checks?
>>>>>
>>>>> Note, it's not the ubwc_version, it is the ubwc_dec_hw_version. And
>>>>> also different functions take different sets of arguments.
>>>>>
>>>>>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
>>>>>>
>>>>>> I have not looked into each bit programming but from the top level so
>>>>>> feel free to correct if wrong but it seems both do write UBWC_STATIC
>>>>>> (different values based on different UBWC versions) and write some extra
>>>>>> registers based on version
>>>>>
>>>>> This is what both the current code and the downstream do. See
>>>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
>>>>>
>>>>
>>>> Thanks for pointing to the downstream method for this,
>>>>
>>>> This is exactly what i was also suggesting to do when I mentioned
>>>> unifying the above functions.
>>>>
>>>> So instead of having a separate function for each version why not handle
>>>> all the versions in the same function like what the link you have shown
>>>> does.
>>>
>>> I wouldn't like that. The downstream uses hw_catalog to pass all
>>> possible parameters. We do not, so we'd have a whole set of artificial
>>> values.
>>>
>>
>> Now that you brought that up, why cannot even upstream dpu start using
>> catalog for ubwc settings?
> 
> Because msm_mdss lives out of disp/dpu1. And using the disp/dpu1 for
> it would be an inversion of dependencies.
> I like the fact that msm_mdss is independent of mdp/dpu drivers and I
> do not want to add such dependency.
> 

Ok, so I think this function itself is placed incorrectly. It should not 
be in msm_mdss.c and should in the DPU folder.

This check tells me that this will not be executed for mdp5 devices.

    /*
      * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
      * mdp5 hardware. Skip reading it for now.
      */
     if (msm_mdss->is_mdp5)
         return 0;

In that case, what prevents us from moving this to dpu and start using 
catalog for this?

>>
>> /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
>>    * @id:                index identifying this block
>>    * @base:              register base offset to mdss
>>    * @features           bit mask identifying sub-blocks/features
>>    * @highest_bank_bit:  UBWC parameter
>>    * @ubwc_static:       ubwc static configuration
>>    * @ubwc_swizzle:      ubwc default swizzle setting
>>    * @clk_ctrls          clock control register definition
>>    */
>> struct dpu_mdp_cfg {
>>       DPU_HW_BLK_INFO;
>>       u32 highest_bank_bit;
>>       u32 ubwc_swizzle;
>>       struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
>> };
>>
>> We already do seem to have a couple of parameters. have to add the others.
>>
>> That way the number of functions wont keep growing.
>>
>>>>
>>>>>>
>>>>>>>      static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>>>>>>      {
>>>>>>>          int ret;
>>>>>>> +     u32 hw_rev;
>>>>>>>
>>>>>>>          ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
>>>>>>>          if (ret) {
>>>>>>> @@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>>>>>>          if (msm_mdss->is_mdp5)
>>>>>>>                  return 0;
>>>>>>>
>>>>>>> +     hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>>>>>>> +     dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>>>>>>> +     dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
>>>>>>> +             readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
>>>>>>
>>>>>> we are already printing the HW version here
>>>>>>
>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L1096
>>>>>>
>>>>>> Do you want to remove that print then? May be. Let me take a look.
>>>>>
>>>>> [skipped]
>>>>>
>>>
>>>
>>>
> 
> 
> 
