Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1C6A2FBC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 14:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593610E05D;
	Sun, 26 Feb 2023 13:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C908810E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 13:09:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s22so5106265lfi.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 05:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YnjF1sEV5Slpav8CN8W9wle1FqVe/LUBAIS6618cS64=;
 b=xMUS3PIsVLoJmEzlubNdZAIZ/PiGdEN57jv6aV6vVmvmLoxP8BF0SweDPw8bmjwP9a
 SnIzGfiQm9PCNVJIkl4E06B7p1L0wKlazERHaLElDwJvrPKNyp10TVyjUN1WUQLklmWZ
 fAeFKhRo6z/NYKT1V12rS2p7UBzRTjvXz68lcwAjiFhSL/d41lrgyJvfYPgsW5P8Osl2
 TrtZsUPpdpQbNxzjZjzTlk5PB6IYw2wd4WH7V+WBm+VROa3ocmiMRoGG1zxtWPPEHxPJ
 pwuZZW38WSEGX/At4lS0H+zYQ5sjtwAbRos2/Ubem3tlLj8A3xi/BvF2XEMLv9qWlaz3
 uhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YnjF1sEV5Slpav8CN8W9wle1FqVe/LUBAIS6618cS64=;
 b=qB38S5krgnWwD+NH2/0EkvGJ4vmgVDcqGd7JM7E5B7E73v5lWPH4OCLWHGUpNIJXBk
 RhhemLaI/XjGVVkdWWf++7QgO+oOc7ICngqT2/dvRa4rQXoftwHUb4CG8EZulqzQfGXT
 TaRvU94leMOycv+XMPQBtJ4mAIhmlco16bhVQLN0DQ7o65Ftw1HeJj5rRMigMYyBjEAe
 vppMLWG4fP6pI6Yux74DSGGh6/b3auZNNtH+Y/ekGb+s1JEWXgLPqpBjPNBZ9qd6dU0p
 L4zB+rgfY0s+JvKMHh+ZTGawKlGxzGF9meGJ7um3gIo4sbw1lxI8pTmP6E1jcg/+7lzh
 ULRA==
X-Gm-Message-State: AO0yUKXsSjarWWE4QP0gd+zmFqE5OMfLE4JjeD28Ro0ydauHnV++AuCP
 7/7pFGxQVnFoz5nbzLu5boaA5Q==
X-Google-Smtp-Source: AK7set/le4LmGOWaS7f3NvN7MniMRSRHgIY7TP+eWhLs8+POZ8+GqLWBfmn8IKvpWAsFn6IlvicZhg==
X-Received: by 2002:ac2:5961:0:b0:4dc:823c:8127 with SMTP id
 h1-20020ac25961000000b004dc823c8127mr6458141lfp.57.1677416992898; 
 Sun, 26 Feb 2023 05:09:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r26-20020ac25a5a000000b004dda87e7de7sm553762lfn.81.2023.02.26.05.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 05:09:52 -0800 (PST)
Message-ID: <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
Date: Sun, 26 Feb 2023 15:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2023 02:47, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 2/25/2023 7:23 AM, Dmitry Baryshkov wrote:
>> On 25/02/2023 02:36, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
>>>> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>>>>> 24 февраля 2023 г. 23:23:03 GMT+02:00, Abhinav Kumar 
>>>>>> <quic_abhinavk@quicinc.com> пишет:
>>>>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>>>>> Add DSC helper functions based on DSC configuration profiles to 
>>>>>>>>> produce
>>>>>>>>> DSC related runtime parameters through both table look up and 
>>>>>>>>> runtime
>>>>>>>>> calculation to support DSC on DPU.
>>>>>>>>>
>>>>>>>>> There are 6 different DSC configuration profiles are supported 
>>>>>>>>> currently.
>>>>>>>>> DSC configuration profiles are differiented by 5 keys, DSC 
>>>>>>>>> version (V1.1),
>>>>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>>>>>>
>>>>>>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>>>>>>
>>>>>>>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
>>>>>>>> Also please check that they can be used for i915 or for amdgpu 
>>>>>>>> (ideally for both of them).
>>>>>>>>
>>>>>>>
>>>>>>> No, it cannot. So each DSC encoder parameter is calculated based 
>>>>>>> on the HW core which is being used.
>>>>>>>
>>>>>>> They all get packed to the same DSC structure which is the struct 
>>>>>>> drm_dsc_config but the way the parameters are computed is 
>>>>>>> specific to the HW.
>>>>>>>
>>>>>>> This DPU file helper still uses the drm_dsc_helper's 
>>>>>>> drm_dsc_compute_rc_parameters() like all other vendors do but the 
>>>>>>> parameters themselves are very HW specific and belong to each 
>>>>>>> vendor's dir.
>>>>>>>
>>>>>>> This is not unique to MSM.
>>>>>>>
>>>>>>> Lets take a few other examples:
>>>>>>>
>>>>>>> AMD: 
>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165
>>>>>>>
>>>>>>> i915: 
>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L379
>>>>>>
>>>>>> I checked several values here. Intel driver defines more bpc/bpp 
>>>>>> combinations, but the ones which are defined in intel_vdsc and in 
>>>>>> this patch seem to match. If there are major differences there, 
>>>>>> please point me to the exact case.
>>>>>>
>>>>>> I remember that AMD driver might have different values.
>>>>>>
>>>>>
>>>>> Some values in the rc_params table do match. But the 
>>>>> rc_buf_thresh[] doesnt.
>>>>
>>>> Because later they do:
>>>>
>>>> vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
>>>>
>>>>>
>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L40
>>>>>
>>>>> Vs
>>>>>
>>>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>>>>> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>>>> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>>>> +};
>>>>
>>>> I'd prefer to have 896, 1792, etc. here, as those values come from the
>>>> standard. As it's done in the Intel driver.
>>>>
>>>
>>> Got it, thanks
>>>
>>>>> I dont know the AMD calculation very well to say that moving this 
>>>>> to the
>>>>> helper is going to help.
>>>>
>>>> Those calculations correspond (more or less) at the first glance to
>>>> what intel does for their newer generations. I think that's not our
>>>> problem for now.
>>>>
>>>
>>> Well, we have to figure out if each value matches and if each of them 
>>> come from the spec for us and i915 and from which section. So it is 
>>> unfortunately our problem.
>>
>> Otherwise it will have to be handled by Marijn, me or anybody else 
>> wanting to hack up the DSC code. Or by anybody adding DSC support to 
>> the next platform and having to figure out the difference between 
>> i915, msm and their platform.
>>
> 
> Yes, I wonder why the same doubt didn't arise when the other vendors 
> added their support both from other maintainers and others.
> 
> Which makes me think that like I wrote in my previous response, these 
> are "recommended" values in the spec but its not mandatory.

I think, it is because there were no other drivers to compare. In other 
words, for a first driver it is pretty logical to have everything 
handled on its own. As soon as we start getting other implementations of 
a feature, it becomes logical to think if the code can be generalized. 
This is what we see we with the HDCP series or with the code being moved 
to DP helpers.

> 
> Moving this to the drm_dsc_helper is generalizing the tables and not 
> giving room for the vendors to customize even if they want to (which the 
> spec does allow).

That depends on the API you select. For example, in 
intel_dsc_compute_params() I see customization being applied to 
rc_buf_thresh in 6bpp case. I'd leave that to the i915 driver.

In case the driver needs to perform customization of the params, nothing 
stops it drop applying after filling all the RC params in the 
drm_dsc_config struct via the generic helper.


> So if this has any merit and if you or Marijn would like to take it up, 
> go for it. We would do the same thing as either of you would have to in 
> terms of figuring out the difference between msm and the i915 code.
> 
> This is not a generic API we are trying to put in a helper, these are 
> hard-coded tables so there is a difference between looking at these Vs 
> looking at some common code which can move to the core.
> 
>>>
>>>>>
>>>>> Also, i think its too risky to change other drivers to use whatever 
>>>>> math
>>>>> we put in the drm_dsc_helper to compute thr RC params because their 
>>>>> code
>>>>> might be computing and using this tables differently.
>>>>>
>>>>> Its too much ownership for MSM developers to move this to 
>>>>> drm_dsc_helper
>>>>> and own that as it might cause breakage of basic DSC even if some 
>>>>> values
>>>>> are repeated.
>>>>
>>>> It's time to stop thinking about ownership and start thinking about
>>>> shared code. We already have two instances of DSC tables. I don't
>>>> think having a third instance, which is a subset of an existing
>>>> dataset, would be beneficial to anybody.
>>>> AMD has complicated code which supports half-bit bpp and calculates
>>>> some of the parameters. But sharing data with the i915 driver is
>>>> straightforward.
>>>>
>>>
>>> Sorry, but I would like to get an ack from i915 folks if this is going
>>> to be useful to them if we move this to helper because we have to 
>>> look at every table. Not just one.
>>
>> Added i915 maintainers to the CC list for them to be able to answer.
>>
> 
> Thanks, lets wait to hear from them about where finally these tables 
> should go but thats can be taken up as a separate effort too.
> 
>>>
>>> Also, this is just 1.1, we will add more tables for 1.2. So we will 
>>> have to end up changing both 1.1 and 1.2 tables as they are different 
>>> for QC.
>>
>> I haven't heard back from Kuogee about the possible causes of using 
>> rc/qp values from 1.2 even for 1.1 panels. Maybe you can comment on 
>> that? In other words, can we always stick to the values from 1.2 
>> standard? What will be the drawback?
>>
>> Otherwise, we'd have to have two different sets of values, like you do 
>> in your vendor driver.
>>
> 
> I have responded to this in the other email.
> 
> All this being said, even if the rc tables move the drm_dsc_helper 
> either now or later on, we will still need MSM specific calculations for 
> many of the other encoder parameters (which are again either hard-coded 
> or calculated). Please refer to the sde_dsc_populate_dsc_config() 
> downstream. And yes, you will not find those in the DP spec directly.
> 
> So we will still need a dsc helper for MSM calculations to be common for 
> DSI / DP irrespective of where the tables go.
> 
> So, lets finalize that first.

I went on and trimmed sde_dsc_populate_dsc_config() to remove 
duplication with the drm_dsc_compute_rc_parameters() (which we already 
use for the MSM DSI DSC).

Not much is left:

dsc->first_line_bpg_offset set via the switch

dsc->line_buf_depth = bpc + 1;
dsc->mux_word_size = bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC:
         DSC_MUX_WORD_SIZE_8_10_BPC;

if ((dsc->dsc_version_minor == 0x2) && (dsc->native_420))
     dsc->nsl_bpg_offset = (2048 *
              (DIV_ROUND_UP(dsc->second_line_bpg_offset,
                                 (dsc->slice_height - 1))));

dsc->initial_scale_value = 8 * dsc->rc_model_size /
                         (dsc->rc_model_size - dsc->initial_offset);


mux_word_size comes from the standard (must)
initial_scale_value calculation is recommended, but not required
nsl_bpg_offset follows the standard (must), also see below (*).

first_line_bpg_offset calculation differs between three drivers. The 
standard also provides a recommended formulas. I think we can leave it 
as is for now.

I think, that mux_word_size and nsl_bpg_offset calculation should be 
moved to drm_dsc_compute_rc_parameters(), while leaving 
initial_scale_value in place (in the driver code).

* I think nsl_bpg_offset is slightly incorrectly calculated. Standard 
demands that it is set to 'second_line_bpg_offset / (slice_height - 1), 
rounded up to 16 fraction bits', while SDE driver code sets it to the 
value rounded up to the next integer (having 16 fraction bits 
representation).

In my opinion correct calculation should be:
dsc->nsl_bpg_offset = DIV_ROUND_UP(2048 * dsc->second_line_bpg_offset,
                                 (dsc->slice_height - 1));

Could you please check, which one is correct according to the standard?


-- 
With best wishes
Dmitry

