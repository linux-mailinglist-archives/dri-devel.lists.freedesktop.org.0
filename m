Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E66D12DF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158FE10F099;
	Thu, 30 Mar 2023 23:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1494910F099
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:14:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k37so26690719lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=15Mk4RKbLr0KjCNm31D+PfN2gSo67inyBWHvjJWdVEs=;
 b=lJH0UbZRLPt038P2oRLeOjpkxOxue7nuGuJTqzCWD+u4bz7lQ3bEmbER/zuGwtCY+I
 h+Ca5YnEBZfPbsz7ztkLoiM8nlwxU3kM5zRsRjc6wuLBGZFA7cIdxE5f4cP8Xz/2mesl
 wgXwGCjhiij0wB0XkSmleYUVsPgi/U3mvH1pgRI9sDuM5FUy+Nyx4XeknGR0SoXP/45G
 e3JPmP2oq9PiAq8Su5WAUBZt/528Sb0lLcGspZMVtewOrY3y8z1LM+KIxrCSvD18r72V
 eZKLnqIECjquu3P8iKvt1p7DjSLEvg2por/dXGv3jkDVlDRO4qF/mgsrGER+5jiHWbL6
 HwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=15Mk4RKbLr0KjCNm31D+PfN2gSo67inyBWHvjJWdVEs=;
 b=Pu4UWwXcgRKKvjW6vL2ZHfd9i3SlO7bUUgY1s8TjeKjGUxRzvmrnEEdi83DMeu6AQP
 DB2cpYDB2rFOXRXPP5qiZof35kdNU1Rgz3gcO4A1Rky7RWjocjw4NhkwT+nS3AIa7idR
 mVF5iPUYv1lJSb2ubqhE01h3JuqNA1yG43UKaUAk0a6KBm8VeZRDODTBiUEajBrCnkXM
 NMlMBAxBR7x8+Y8QM1Br3f/Tg5mhmO9+63XI9PcWFWtJ9VruKZTU1OKKQ6Hcg/R3PQbn
 NQ/4pB1SA9pd4r6Uayk2isnMRCCzkLbHRdNEM5lfZqKjRRJ8lKGgf60N01Vd/Bb1xcQQ
 SAJg==
X-Gm-Message-State: AAQBX9ceDb0wWRG6y5GGIQkm7o1vBjJiRaOVzj7TvmYNdz8npj1yrycz
 9A4pj1ZcnnMErfPuxTAut3BWlQ==
X-Google-Smtp-Source: AKy350bPktyAkzAW1HaUs4Mvez0JloF5vhUTu+hwF2dpdaXsE/RDkqKod5Cwh6XlVWLKWSLWhQcgHw==
X-Received: by 2002:a19:750b:0:b0:4dd:a0f6:8f3b with SMTP id
 y11-20020a19750b000000b004dda0f68f3bmr6649500lfe.15.1680218072286; 
 Thu, 30 Mar 2023 16:14:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u10-20020ac243ca000000b004e90dee5469sm124721lfl.157.2023.03.30.16.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 16:14:31 -0700 (PDT)
Message-ID: <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
Date: Fri, 31 Mar 2023 02:14:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 01:49, Jessica Zhang wrote:
> 
> 
> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>> Use MSM and DRM DSC helper methods.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 74d38f90398a..7419fe58a941 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -31,6 +31,7 @@
>>>   #include "msm_kms.h"
>>>   #include "msm_gem.h"
>>>   #include "phy/dsi_phy.h"
>>> +#include "disp/msm_dsc_helper.h"
>>>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>   {
>>>       struct drm_dsc_config *dsc = msm_host->dsc;
>>>       u32 reg, reg_ctrl, reg_ctrl2;
>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>> +    u32 slice_per_intf;
>>>       u32 pkt_per_line;
>>>       u32 eol_byte_num;
>>>       /* first calculate dsc parameters and then program
>>>        * compress mode registers
>>>        */
>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>
>> This looks good
>>
>>>       /*
>>>        * If slice_count is greater than slice_per_intf
>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>       if (dsc->slice_count > slice_per_intf)
>>>           dsc->slice_count = 1;
>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
>>> +            dsi_get_bpp(msm_host->format));
>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>
>> And for these values the result is definitely changed. Separate patch 
>> & description please. Just in case, "values per downstream kernel" is 
>> not a proper description for such changes.
> 
> Hi Dmitry,
> 
> Sure, I can put this into a separate patch.
> 
> The reason this was changed from slice_count to SLICE_PER_PKT was 
> because slice count and slice per packet aren't always equivalent. There 
> can be cases where panel configures DSC to have multiple soft slices per 
> interface, but the panel only specifies 1 slice per packet.

Please put this nice description into the commit message. It is exactly 
what I was looking for!

BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will stay 
at "1"? If so, it might be easier to drop it and instead add a comment.

Regarding eol_byte_num, probably the best explanation would be that is 
is a size of a padding rather than a size of a trailer bytes in a line 
(and thus original calculation was incorrect).

> 
>>
>>>       if (is_cmd_mode) /* packet data type */
>>>           reg = 
>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>       DBG("");
>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>>> +        /* Default widebus_en to false for now. */
>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, 
>>> mode->hdisplay,
>>> +                dsi_get_bpp(msm_host->format));
>>> +
>>
>> This is definitely something new and thus should probably go into a 
>> separate patch and be described. Also I'm not sure how does that 
>> interact with the hdisplay-related calculations below, under the 
>> if(dsc) clause.
> 
> After double-checking the math here, I think this part of the change is 
> actually wrong. pclk_per_line is essentially doing hdisplay / 3, which 
> is a repeat of what's being done in the `if (dsc)` block.
> 
> Will replace `hdisplay /= 3` with the pclk_per_line calculation.

Thanks!

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>       /*
>>>        * For bonded DSI mode, the current DRM mode has
>>>        * the complete width of the panel. Since, the complete
>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct 
>>> msm_dsi_host *msm_host, struct drm_dsc
>>>           return ret;
>>>       }
>>> -    dsc->initial_scale_value = 32;
>>> +    dsc->initial_scale_value = 
>>> drm_dsc_calculate_initial_scale_value(dsc);
>>
>> This is fine, we only support 8bpp where these values match.
>>
>>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>       return drm_dsc_compute_rc_parameters(dsc);
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

