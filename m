Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537636D14E4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 03:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E710F0CC;
	Fri, 31 Mar 2023 01:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79810F0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:19:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h11so19984008lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225539;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qsSO8THJVrcS4ifRHKVmZEymloUn1utwmX9qYag6oI=;
 b=nW06D4wzTs64UgyCGWMT6YJIxzX4dVhscs85xkjP0gaAE9B3RXlUMU5jVgwM4BtX1H
 AmlofGUO2LV+ddM+YOWODgIwtRuqv/CVRqcggnAPt3xhxZu0vcwl2jgZpEwE2Z9bhDfa
 sN/SX1fudHKSJQ6aSKHEHHEgNkeUtLfFiukTYxoeMMJfC7Sc/eCeFU1gHnxAlJbh8DSb
 kF+IpS4aSPbGDlZelrt1rbWYbLV88UpI3MoMWvP1F1KTS8VIUaqKtdpO5kUxTlYzTWz5
 bvoiRIUbROSfrIiu2VJjiZBUBJTfw/OVViTEXiRw40OX4dlQYTOB7sr5UWxjYTvbMy4Z
 +aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225539;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qsSO8THJVrcS4ifRHKVmZEymloUn1utwmX9qYag6oI=;
 b=YC7+jfU3/6Bnqtj78bIRoghzCWyqFqj3g3jELofzupMB4Md9o+iK7qXoxHEd8QtzUx
 TRIP7WB1jo9qsuKjdvyrJIonuzDme8XMsEp8G9GpEIIV9JuCyM7xjbiIvDlxOLJ47eD3
 O8qGck5sIhSDtRr0x7wTbONgk+2I69HCNfNnYwHNzE8h00gGF5cObVlxk7e8wGuqpPwP
 N7qZ4ZSijGqRUr8HUN1Ysqpm+FGqnxmVpNvaqvJU6avNLKIOzqkGnL05ePSwuV+Do+F8
 ztEE+CfBCpxsdXUVVlWCwDIeXxeKxeWryZdMBVVheufNr8RK/7XGUeeQXUzdekNkCkeN
 OfUg==
X-Gm-Message-State: AAQBX9c0YzWxoJjqKcyH2qMj5C6gALOhX4VJ/HfafvXxP9CtT3FTVsHI
 9ELVbM9eRiX6Vo4lPKra2yDLiA==
X-Google-Smtp-Source: AKy350bU9ipGgx2/y7ZZIKaor5lLuUgNweLbyf2VCr9nml7RNdw6xRljE8rt7YjtzeQGA1bBPfbGEg==
X-Received: by 2002:ac2:4db7:0:b0:4e8:3d0:84b4 with SMTP id
 h23-20020ac24db7000000b004e803d084b4mr2325817lfe.24.1680225539226; 
 Thu, 30 Mar 2023 18:18:59 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a19c505000000b004dc48d91061sm153418lfe.304.2023.03.30.18.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 18:18:58 -0700 (PDT)
Message-ID: <3ec1ec74-5999-2c46-0d45-b12f8e59c709@linaro.org>
Date: Fri, 31 Mar 2023 03:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
 <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
 <CAA8EJprriCLXR+P7ZOWLQCOhvi0WCUzNrCu4eyyqegNtPZbBUg@mail.gmail.com>
 <f5c3694f-a890-1087-4a73-34800cb40769@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f5c3694f-a890-1087-4a73-34800cb40769@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.03.2023 03:12, Jessica Zhang wrote:
> 
> 
> On 3/30/2023 5:16 PM, Dmitry Baryshkov wrote:
>> On Fri, 31 Mar 2023 at 03:07, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/30/2023 4:14 PM, Dmitry Baryshkov wrote:
>>>> On 31/03/2023 01:49, Jessica Zhang wrote:
>>>>>
>>>>>
>>>>> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>>>>>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>>>>>> Use MSM and DRM DSC helper methods.
>>>>>>>
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>>>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> index 74d38f90398a..7419fe58a941 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> @@ -31,6 +31,7 @@
>>>>>>>    #include "msm_kms.h"
>>>>>>>    #include "msm_gem.h"
>>>>>>>    #include "phy/dsi_phy.h"
>>>>>>> +#include "disp/msm_dsc_helper.h"
>>>>>>>    #define DSI_RESET_TOGGLE_DELAY_MS 20
>>>>>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct
>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>    {
>>>>>>>        struct drm_dsc_config *dsc = msm_host->dsc;
>>>>>>>        u32 reg, reg_ctrl, reg_ctrl2;
>>>>>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>>>>>> +    u32 slice_per_intf;
>>>>>>>        u32 pkt_per_line;
>>>>>>>        u32 eol_byte_num;
>>>>>>>        /* first calculate dsc parameters and then program
>>>>>>>         * compress mode registers
>>>>>>>         */
>>>>>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>>>>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>>>>>
>>>>>> This looks good
>>>>>>
>>>>>>>        /*
>>>>>>>         * If slice_count is greater than slice_per_intf
>>>>>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct
>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>        if (dsc->slice_count > slice_per_intf)
>>>>>>>            dsc->slice_count = 1;
>>>>>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>>>>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
>>>>>>> +            dsi_get_bpp(msm_host->format));
>>>>>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>>>>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>>>>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>>>>>
>>>>>> And for these values the result is definitely changed. Separate patch
>>>>>> & description please. Just in case, "values per downstream kernel" is
>>>>>> not a proper description for such changes.
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Sure, I can put this into a separate patch.
>>>>>
>>>>> The reason this was changed from slice_count to SLICE_PER_PKT was
>>>>> because slice count and slice per packet aren't always equivalent.
>>>>> There can be cases where panel configures DSC to have multiple soft
>>>>> slices per interface, but the panel only specifies 1 slice per packet.
>>>>
>>>> Please put this nice description into the commit message. It is exactly
>>>> what I was looking for!
>>>>
>>>> BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will stay
>>>> at "1"? If so, it might be easier to drop it and instead add a comment.
>>>
>>> MSM_DSC_SLICE_PER_PKT is the default value for panels that don't specify
>>> a slice_per_pkt value. (Now that I think about it, might be better to
>>> call it MSM_DSC_DEFAULT_SLICE_PER_PKT instead...)
>>
>> Note, there is no slice_per_pkt in drm_dsc_config, so we must come up
>> with another way to pass this data from the panel or to deduce the
>> value in our driver.
> 
> AFAIK we aren't developing on any panels that have a non-default slice-per-packet count right now, so I'm not sure if it would be worth the effort to add this if there's no panel we can validate it on.
Some (but not all) SONY phones use panels with that set to 2, I'd
greatly appreciate fully implementing this.

Konrad
> 
> FWIW, downstream reads slice_per_pkt from a custom DT entry [1]
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/dsi-panel-r66451-dsc-fhd-plus-120hz-cmd.dtsi#115
> 
>>
>>>
>>> I don't expect it to change in the future, but it's a little more
>>> readable than just dividing by 1 IMO. If you prefer dropping the macro
>>> and adding a comment, I'm also okay with that.
>>
>> There is no need to divide by 1, the value doesn't change. So I'd
>> probably prefer something like:
>>
>> /* Default to 1 slice per packet */
>> if (panel_slice_per_pkt)
>>      pkt_per_line = slice_per_intf / panel_slice_per_pkt;
>> else
>>      pkt_per_line = slice_per_intf;
>>
>> Or:
>>
>> /* Default to 1 slice per packet */
>> slice_per_pkt = 1;
>> if (panel_slice_per_pkt)
>>      slice_per_pkt = panel_slice_per_pkt;
>> pkt_per_line = slice_per_intf / slice_per_pkt;
> 
> Acked.
> 
>>
>> BTW: could you possibly change 'intf' to 'line' to v2? It seems there
>> is a mixture of them through the code. If there is a difference
>> between intf and line which is not yet posted, it's fine to keep the
>> current code. WDYT?
> 
> AFAIK 'line' and 'intf' seem to be equivalent. I'll make this change once I confirm this.
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>
>>>> Regarding eol_byte_num, probably the best explanation would be that is
>>>> is a size of a padding rather than a size of a trailer bytes in a line
>>>> (and thus original calculation was incorrect).
>>>>
>>>>>
>>>>>>
>>>>>>>        if (is_cmd_mode) /* packet data type */
>>>>>>>            reg =
>>>>>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>>>>>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct
>>>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>>>        DBG("");
>>>>>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>>>>>>> +        /* Default widebus_en to false for now. */
>>>>>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc,
>>>>>>> mode->hdisplay,
>>>>>>> +                dsi_get_bpp(msm_host->format));
>>>>>>> +
>>>>>>
>>>>>> This is definitely something new and thus should probably go into a
>>>>>> separate patch and be described. Also I'm not sure how does that
>>>>>> interact with the hdisplay-related calculations below, under the
>>>>>> if(dsc) clause.
>>>>>
>>>>> After double-checking the math here, I think this part of the change
>>>>> is actually wrong. pclk_per_line is essentially doing hdisplay / 3,
>>>>> which is a repeat of what's being done in the `if (dsc)` block.
>>>>>
>>>>> Will replace `hdisplay /= 3` with the pclk_per_line calculation.
>>>>
>>>> Thanks!
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jessica Zhang
>>>>>
>>>>>>
>>>>>>>        /*
>>>>>>>         * For bonded DSI mode, the current DRM mode has
>>>>>>>         * the complete width of the panel. Since, the complete
>>>>>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct
>>>>>>> msm_dsi_host *msm_host, struct drm_dsc
>>>>>>>            return ret;
>>>>>>>        }
>>>>>>> -    dsc->initial_scale_value = 32;
>>>>>>> +    dsc->initial_scale_value =
>>>>>>> drm_dsc_calculate_initial_scale_value(dsc);
>>>>>>
>>>>>> This is fine, we only support 8bpp where these values match.
>>>>>>
>>>>>>>        dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>>>>>        return drm_dsc_compute_rc_parameters(dsc);
>>>>>>>
>>>>>>
>>>>>> -- 
>>>>>> With best wishes
>>>>>> Dmitry
>>>>>>
>>>>
>>>> -- 
>>>> With best wishes
>>>> Dmitry
>>>>
>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
