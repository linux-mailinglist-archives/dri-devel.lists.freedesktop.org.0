Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583EC543F57
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817A112400;
	Wed,  8 Jun 2022 22:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EC31123DD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 22:46:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id b12so13296487ljq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 15:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pV0bLHLcHxt3gP1STJ/0zYvbBgAyD7Z2w5ngdARasiM=;
 b=IntT2XMRjViwUSti6cMyUM30E1hcGvire5J7Tx05fy+aKqawVNjIiOO+IVOq57s2BI
 5lP9ShUxPUZahhn4iyM09eNY9BUEzDP2NteTscehhRB7Y4PX4dJls7damUB9/NPk+s7H
 Qvd+CR14Y0rrHJ6YSBJOKvvjg0LYwzWQ2VHyau0j3L0pp++ZS7mwo5FmqtntnMZEw0fQ
 QE/PDOHYju9NTVorqVOPWyfEQNar4TWcbWThCncyz/g30sFvDiC0kp+g4W1/0N2/1YXy
 F2lK0WV3v7qUsSmM9pfaFsBDYI53tgYp12GUBxAUMrXzN7xdbgHRyYxT/s606vLv2d3r
 +PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pV0bLHLcHxt3gP1STJ/0zYvbBgAyD7Z2w5ngdARasiM=;
 b=yz8KTDABbP5NmGeUBKkhj4KIIIDvvc+is6TjrPg05vgCJ6s7VZIVAEUF9mjLWz/n7a
 UZXr/kBGhnm/O0YFj4kDgxFEn0iClBB+cWRz2PaRyY3EbwOKErWc3AVu+NUw5M2WfDIM
 Cne/uwdKcd0av+J4nwafKYlFi+UsSHa6f9Iky23wyR4E5Ry9P5YY48f3dKhFRqoW5CLF
 WUwa0hjxkTIndr088FjR4ANhCE770uRVYQXqXsAfla9UQZIw4tANHzfIwGbJgw/DdCaC
 hbHuH3AoS6iPLROUpT7j6HtBWDhJRIFFezXBryGPRIDb+xtmXeK/+QooAbC2jLq76PSM
 sTDw==
X-Gm-Message-State: AOAM531EEidNNX2gftaFIjtoGYn8L6Xd3swaUEHGgrR1KXQTC5cz4ioM
 0DacIcOnYMPzKy7ckJ5CbwuckQ==
X-Google-Smtp-Source: ABdhPJzytuIPS4ghPWxpt9YNtTk5BYdKLsZlcxzFpBfw5bci5w574v+7wnJC75IHSzNvZEwAj8kh8A==
X-Received: by 2002:a2e:9547:0:b0:24f:2e31:6078 with SMTP id
 t7-20020a2e9547000000b0024f2e316078mr58360218ljh.102.1654728367187; 
 Wed, 08 Jun 2022 15:46:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a2e505c000000b00253deeaeb3dsm3447890ljd.131.2022.06.08.15.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 15:46:06 -0700 (PDT)
Message-ID: <af4a03c1-70f5-79da-8c6f-932e213415b1@linaro.org>
Date: Thu, 9 Jun 2022 01:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com>
 <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
 <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
 <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com>
 <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
 <e56780cb-44c1-b26b-90b8-ceb40b8f218b@quicinc.com>
 <CAA8EJprCHW61_0zd+GqOZgpx1C-CDv6iuJZU60cc-1M2YZZhpw@mail.gmail.com>
 <cb9bf456-2c50-2c59-1738-c72c920330d7@quicinc.com>
 <2d61784b-fe0c-f572-dc75-2ccd38ff0f6a@linaro.org>
 <08d454e6-5728-63e3-8b67-44158e84b775@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <08d454e6-5728-63e3-8b67-44158e84b775@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 01:42, Abhinav Kumar wrote:
> 
> 
> On 6/8/2022 3:38 PM, Dmitry Baryshkov wrote:
>> On 09/06/2022 01:35, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/8/2022 3:30 PM, Dmitry Baryshkov wrote:
>>>> On Wed, 8 Jun 2022 at 22:29, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 6/2/2022 1:13 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 2 Jun 2022 at 21:18, Abhinav Kumar 
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 6/1/2022 1:04 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar 
>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar 
>>>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> Replace magic register writes in msm_mdss_enable() with 
>>>>>>>>>>>> version that
>>>>>>>>>>>> contains less magic and more variable names that can be 
>>>>>>>>>>>> traced back to
>>>>>>>>>>>> the dpu_hw_catalog or the downstream dtsi files.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       drivers/gpu/drm/msm/msm_mdss.c | 79 
>>>>>>>>>>>> ++++++++++++++++++++++++++++++----
>>>>>>>>>>>>       1 file changed, 71 insertions(+), 8 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>>>>>>>>>>>> b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>>>>>>> index 0454a571adf7..2a48263cd1b5 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>>>>>>>>>> @@ -21,6 +21,7 @@
>>>>>>>>>>>>       #define HW_REV                              0x0
>>>>>>>>>>>>       #define HW_INTR_STATUS                      0x0010
>>>>>>>>>>>>
>>>>>>>>>>>> +#define UBWC_DEC_HW_VERSION          0x58
>>>>>>>>>>>>       #define UBWC_STATIC                 0x144
>>>>>>>>>>>>       #define UBWC_CTRL_2                 0x150
>>>>>>>>>>>>       #define UBWC_PREDICTION_MODE                0x154
>>>>>>>>>>>> @@ -132,9 +133,63 @@ static int 
>>>>>>>>>>>> _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>       }
>>>>>>>>>>>>
>>>>>>>>>>>> +#define UBWC_1_0 0x10000000
>>>>>>>>>>>> +#define UBWC_2_0 0x20000000
>>>>>>>>>>>> +#define UBWC_3_0 0x30000000
>>>>>>>>>>>> +#define UBWC_4_0 0x40000000
>>>>>>>>>>>> +
>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss 
>>>>>>>>>>>> *msm_mdss,
>>>>>>>>>>>> +                                    u32 ubwc_static)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + 
>>>>>>>>>>>> UBWC_STATIC);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss 
>>>>>>>>>>>> *msm_mdss,
>>>>>>>>>>>> +                                    unsigned int ubwc_version,
>>>>>>>>>>>> +                                    u32 ubwc_swizzle,
>>>>>>>>>>>> +                                    u32 highest_bank_bit,
>>>>>>>>>>>> +                                    u32 macrotile_mode)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     u32 value = (ubwc_swizzle & 0x1) |
>>>>>>>>>>>> +                 (highest_bank_bit & 0x3) << 4 |
>>>>>>>>>>>> +                 (macrotile_mode & 0x1) << 12;
>>>>>>>>>>>> +
>>>>>>>>>>>> +     if (ubwc_version == UBWC_3_0)
>>>>>>>>>>>> +             value |= BIT(10);
>>>>>>>>>>>> +
>>>>>>>>>>>> +     if (ubwc_version == UBWC_1_0)
>>>>>>>>>>>> +             value |= BIT(8);
>>>>>>>>>>>> +
>>>>>>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss 
>>>>>>>>>>>> *msm_mdss,
>>>>>>>>>>>> +                                    unsigned int ubwc_version,
>>>>>>>>>>>> +                                    u32 ubwc_swizzle,
>>>>>>>>>>>> +                                    u32 ubwc_static,
>>>>>>>>>>>> +                                    u32 highest_bank_bit,
>>>>>>>>>>>> +                                    u32 macrotile_mode)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +     u32 value = (ubwc_swizzle & 0x7) |
>>>>>>>>>>>> +                 (ubwc_static & 0x1) << 3 |
>>>>>>>>>>>> +                 (highest_bank_bit & 0x7) << 4 |
>>>>>>>>>>>> +                 (macrotile_mode & 0x1) << 12;
>>>>>>>>>>>> +
>>>>>>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>>>>>>> +
>>>>>>>>>>>> +     if (ubwc_version == UBWC_3_0) {
>>>>>>>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>>>>>>>> +             writel_relaxed(0, msm_mdss->mmio + 
>>>>>>>>>>>> UBWC_PREDICTION_MODE);
>>>>>>>>>>>> +     } else {
>>>>>>>>>>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>>>>>>>> +             writel_relaxed(1, msm_mdss->mmio + 
>>>>>>>>>>>> UBWC_PREDICTION_MODE);
>>>>>>>>>>>> +     }
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>
>>>>>>>>>>> Is it possible to unify the above functions by having the 
>>>>>>>>>>> internal
>>>>>>>>>>> ubwc_version checks?
>>>>>>>>>>
>>>>>>>>>> Note, it's not the ubwc_version, it is the 
>>>>>>>>>> ubwc_dec_hw_version. And
>>>>>>>>>> also different functions take different sets of arguments.
>>>>>>>>>>
>>>>>>>>>>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
>>>>>>>>>>>
>>>>>>>>>>> I have not looked into each bit programming but from the top 
>>>>>>>>>>> level so
>>>>>>>>>>> feel free to correct if wrong but it seems both do write 
>>>>>>>>>>> UBWC_STATIC
>>>>>>>>>>> (different values based on different UBWC versions) and write 
>>>>>>>>>>> some extra
>>>>>>>>>>> registers based on version
>>>>>>>>>>
>>>>>>>>>> This is what both the current code and the downstream do. See
>>>>>>>>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312 
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks for pointing to the downstream method for this,
>>>>>>>>>
>>>>>>>>> This is exactly what i was also suggesting to do when I mentioned
>>>>>>>>> unifying the above functions.
>>>>>>>>>
>>>>>>>>> So instead of having a separate function for each version why 
>>>>>>>>> not handle
>>>>>>>>> all the versions in the same function like what the link you 
>>>>>>>>> have shown
>>>>>>>>> does.
>>>>>>>>
>>>>>>>> I wouldn't like that. The downstream uses hw_catalog to pass all
>>>>>>>> possible parameters. We do not, so we'd have a whole set of 
>>>>>>>> artificial
>>>>>>>> values.
>>>>>>>>
>>>>>>>
>>>>>>> Now that you brought that up, why cannot even upstream dpu start 
>>>>>>> using
>>>>>>> catalog for ubwc settings?
>>>>>>
>>>>>> Because msm_mdss lives out of disp/dpu1. And using the disp/dpu1 for
>>>>>> it would be an inversion of dependencies.
>>>>>> I like the fact that msm_mdss is independent of mdp/dpu drivers and I
>>>>>> do not want to add such dependency.
>>>>>>
>>>>>
>>>>> Ok, so I think this function itself is placed incorrectly. It 
>>>>> should not
>>>>> be in msm_mdss.c and should in the DPU folder.
>>>>>
>>>>> This check tells me that this will not be executed for mdp5 devices.
>>>>>
>>>>>      /*
>>>>>        * HW_REV requires MDSS_MDP_CLK, which is not enabled by the 
>>>>> mdss on
>>>>>        * mdp5 hardware. Skip reading it for now.
>>>>>        */
>>>>>       if (msm_mdss->is_mdp5)
>>>>>           return 0;
>>>>
>>>> This condition should be changed to check for the MDP_CLK being
>>>> available in the clocks array rather than checking for is_mdp5. I'd
>>>> like to phase is_mdp5 away at some point.
>>>>
>>>>> In that case, what prevents us from moving this to dpu and start using
>>>>> catalog for this?
>>>>
>>>> Because there is nothing tying mdss and dpu drivers. For example, is
>>>> the msm8998 (3.0.0) the DPU or MDP5 device? MSM8996?
>>>> Neither struct msm_mdss nor the MDSS device itself are accessible
>>>> through the msm_drv (or dpu_kms).
>>>> I think trying to invent such a link would make the code worse.
>>>>
>>>
>>> Right, what I am trying to mention with that check is that means that 
>>> code does not run today for mdp5 and it still works fine.
>>>
>>> So why not just move it to DPU first to carry less burden of these 
>>> extra register settings which are unused today for mdp5 anyway.
>>
>> As I mentioned, there is no good way. msm_mdss doesn't know about DPU. 
>> DPU doesn't know about the msm_mdss. Even the msm_drv doesn't know 
>> about the msm_mdss.
>>
>> If you can sketch a nice piece of code, could you please demonstrate 
>> your idea?
>>
> 
> No, so I am not suggesting to do it in msm_mdss. Only then you will need 
> msm_mdss to have knowledge of whether its DPU or MDP5.
> 
> Correct me if wrong. msm_mdss is common to both MDP5 and DPU.
> 
>  From the above check its clear that this code does not run for MDP5.
> 
> So I am suggesting move this code completely to dpu_runtime_resume().
> 
> That way you can use catalog there.
> 
> I am questioning why we even need this function to be in msm_mdss. It 
> can just belong in DPU as its not being used by MDP5 today.

The region used by the mdss is not mapped by the DPU (or MDP5). This 
caused some confusion with DPU code trying to write to the non-mapped or 
incorrect memory areas before we ended up with Jonathan fixing the code 
in 544d8b96150d ("drm/msm/dpu: update UBWC config for sm8150 and sm8250").

> 
>>>
>>>>>>> /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
>>>>>>>     * @id:                index identifying this block
>>>>>>>     * @base:              register base offset to mdss
>>>>>>>     * @features           bit mask identifying sub-blocks/features
>>>>>>>     * @highest_bank_bit:  UBWC parameter
>>>>>>>     * @ubwc_static:       ubwc static configuration
>>>>>>>     * @ubwc_swizzle:      ubwc default swizzle setting
>>>>>>>     * @clk_ctrls          clock control register definition
>>>>>>>     */
>>>>>>> struct dpu_mdp_cfg {
>>>>>>>        DPU_HW_BLK_INFO;
>>>>>>>        u32 highest_bank_bit;
>>>>>>>        u32 ubwc_swizzle;
>>>>>>>        struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
>>>>>>> };
>>>>>>>
>>>>>>> We already do seem to have a couple of parameters. have to add 
>>>>>>> the others.
>>>>>>>
>>>>>>> That way the number of functions wont keep growing.
>>>>
>>>>
>>
>>


-- 
With best wishes
Dmitry
