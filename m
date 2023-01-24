Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2867A515
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8009F10E263;
	Tue, 24 Jan 2023 21:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D29310E263
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:37:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hw16so42611226ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nsphrrjxZf/+mPZVnaJS6mjjScGG2KpHZGQnFCMnJoo=;
 b=rjGqwSb2fN+qTpPLAqi4z5UfpQGufsABBYNRT6ynzNViP1u3Q907adnDyoZxvyCYjK
 5eqUDck80qxisGW+W9wQJd+Jp+oLFul1/eTtB4/Kxpx28lHQqqsUUxuPCM3j8kK1fp9q
 38zn3t9cOfSz5TR+HZXLk6kARLe8SExs+btfkZ8lpaP0tecv9P64tsp+2VWdbiVVbTa4
 PHxPlt5bI9EnERZN0W8NYffbx5GBTzpNmbya7aSRII/1+EU+IWaWysFLIHPKPU6t2dvu
 ZWoQxySrL3ATrLkM4QSSetovok/zLYHsDOcFVF+ZW3+H8u3csdCe5SlEZUq9tsrcy1dJ
 byvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nsphrrjxZf/+mPZVnaJS6mjjScGG2KpHZGQnFCMnJoo=;
 b=Xfzys4napBluCG2FoJGP4xSCD9Co22jS8p3MS+bm6W2imOnwQ1eEQou7hHphdP8uaK
 aCYTg25Bf9+nxmjYV89cXHtO5uvMW8mL2Z1sDZ0Lri4f43VNSD8a/6a95KGy+UzrTzdH
 8zYIt8z6xuBjGckrgwgcq2NfcwfcMgeQaofU3aLni9+EPbjQjA+OAzGLSVz8QHDSyijT
 iUc4qLENGwgWeqSqWJNn1q4qCsY2B7g1dDaNxdNxSdaX+omZ2fj+UZG0sd0zPInsmoaU
 3kLhbMfMyGaY9P7X3DRrygEteenJL0u/XUSixcaSq1vrzX9xvxv//G+t1jmSIql/wWjl
 uWiA==
X-Gm-Message-State: AFqh2kp8mNRDS5NnBbaO/qx+Y1fDC123YI5yearqHdH1VBV1qRj3MbBk
 4kQ+aENSc+/j8t8rnRzOIP6urA==
X-Google-Smtp-Source: AMrXdXvjtnBcp5rMK6F+wDLvmFhhGha2RHemyD07HuF63iQgwpduKDRPkAT+MHX2dcbxMf0v6EAjEw==
X-Received: by 2002:a17:906:9f03:b0:877:962f:be0a with SMTP id
 fy3-20020a1709069f0300b00877962fbe0amr16968479ejc.37.1674596274530; 
 Tue, 24 Jan 2023 13:37:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090682cd00b0086ffe8a00fdsm1407592ejy.84.2023.01.24.13.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:37:54 -0800 (PST)
Message-ID: <6f15bfe3-68f9-6da5-0363-ff7b854dce69@linaro.org>
Date: Tue, 24 Jan 2023 23:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine
 programming to work for DSC
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
 <8392e1f3-8459-4408-41de-564a41980b4c@linaro.org>
 <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 19:55, Kuogee Hsieh wrote:
> 
> On 1/24/2023 1:11 AM, Dmitry Baryshkov wrote:
>> On 23/01/2023 20:24, Kuogee Hsieh wrote:
>>> Current implementation timing engine programming does not consider
>>> compression factors. This patch add consideration of DSC factors
>>> while programming timing engine.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   2 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  14 ++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 
>>> +++++++++++++--------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
>>>   5 files changed, 110 insertions(+), 54 deletions(-)
>>>
>>
>> [skipped]
>>
>>> @@ -113,82 +124,96 @@ static void 
>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>>       /* read interface_cfg */
>>>       intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>>>   -    if (ctx->cap->type == INTF_DP)
>>> +    if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
>>>           dp_intf = true;
>>>         hsync_period = p->hsync_pulse_width + p->h_back_porch + 
>>> p->width +
>>> -    p->h_front_porch;
>>> +            p->h_front_porch;
>>>       vsync_period = p->vsync_pulse_width + p->v_back_porch + 
>>> p->height +
>>> -    p->v_front_porch;
>>> +            p->v_front_porch;
>>
>> Actually I went on through the history and found the previous 
>> submission, https://patchwork.freedesktop.org/patch/471505/.
>> Exactly the same piece of code. Did you expect that the comments will 
>> be different this time?
>>
>> I really hoped that at that time we already went through this. But it 
>> seems I was wrong. That series went through v10 or v12 before being 
>> accepted. And it was just adding wide_bus_en. Back at that time we 
>> lightly discussed that the code will receive compression support. But 
>> I never expected to see the original submission again.
>>
>> It might sound bad, but could you please find somebody who can do 
>> internal review for you? Good internal review.
>>
>> That said, I really do not expect to see v2 before the whole series is 
>> reworked, restructured and prepared for the review on your side.
> 
> This timing engine code is derived from our downstream code directly and 
> it has been used at many mobile devices by many vendors for many years 
> already.
> 
> On the other words, it had been tested very thorough and works on 
> dsi/dp/hdmi/dsc/widebus applications.

As far as I understand, it has been tested on the recent generations of 
the hardware. I doubt that anybody retests new techpack drops on 
previous hardware generations. Correct?

When was the last time this particular code drop was tested on 
INTF_HDMI? I think it was back in the 4.4 era. Newer vendor kernels do 
not have hdmi-staging, so at least the claim of testing this codepiece 
on HDMI is not correct.

What is the earliest chip that has been driven by this particular code 
instance?

> When i brought dsc v1.2 over, I just merged it over and did not consider 
> too much.
> 
> Can we adapt this code so that both upstream and down stream shared same 
> timing engine programming so that easier to maintain?

We have been discussing exactly the same piece of code a year ago. Could 
you please recheck the comments that were provided to your patches. And 
I actually mean that. There were 12 iterations of wide bus patchset. 
Timing engine programming patch had 8. I do not want to start again from 
the very beginning.

The basic idea is that you have to evolve the code rather than flushing 
us with the 'latest and greatest code dump'. Split this into individual 
atomic changes that we can review. Provide justification (= motivation) 
for each change. Previously we haven't seen them.

We know that current function works. We must be able to assume that new 
instance doesn't break things. Or, if something breaks, understand which 
particular change broke it. Consider the case that your patch breaks 
msm8998. Or sdm845. How can we cope? Would you be able to spot the place 
which did that? I know I wouldn't. The only way would be to revert the 
patch completely. And inherently the whole series.

>>
>>>         display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
>>> -    hsync_period) + p->hsync_skew;
>>> +            hsync_period) + p->hsync_skew;
>>>       display_v_end = ((vsync_period - p->v_front_porch) * 
>>> hsync_period) +
>>> -    p->hsync_skew - 1;
>>> +            p->hsync_skew - 1;
>>> +
>>> +    hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>>         hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>>>       hsync_end_x = hsync_period - p->h_front_porch - 1;
>>>   -    if (p->width != p->xres) { /* border fill added */
>>> -        active_h_start = hsync_start_x;
>>> -        active_h_end = active_h_start + p->xres - 1;
>>> -    } else {
>>> -        active_h_start = 0;
>>> -        active_h_end = 0;
>>> -    }
>>> -
>>> -    if (p->height != p->yres) { /* border fill added */
>>> -        active_v_start = display_v_start;
>>> -        active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>> -    } else {
>>> -        active_v_start = 0;
>>> -        active_v_end = 0;
>>> -    }
>>> -
>>> -    if (active_h_end) {
>>> -        active_hctl = (active_h_end << 16) | active_h_start;
>>> -        intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>>> -    } else {
>>> -        active_hctl = 0;
>>> -    }
>>> -
>>> -    if (active_v_end)
>>> -        intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>>> -
>>> -    hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>> -    display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>> -
>>>       /*
>>>        * DATA_HCTL_EN controls data timing which can be different from
>>>        * video timing. It is recommended to enable it for all cases, 
>>> except
>>>        * if compression is enabled in 1 pixel per clock mode
>>>        */
>>> +    if (!p->compression_en || p->wide_bus_en)
>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>>> +
>>>       if (p->wide_bus_en)
>>> -        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>>> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>>   +    /*
>>> +     * If widebus is disabled:
>>> +     * For uncompressed stream, the data is valid for the entire active
>>> +     * window period.
>>> +     * For compressed stream, data is valid for a shorter time period
>>> +     * inside the active window depending on the compression ratio.
>>> +     *
>>> +     * If widebus is enabled:
>>> +     * For uncompressed stream, data is valid for only half the active
>>> +     * window, since the data rate is doubled in this mode.
>>> +     * p->width holds the adjusted width for DP but unadjusted width 
>>> for DSI
>>> +     * For compressed stream, data validity window needs to be 
>>> adjusted for
>>> +     * compression ratio and then further halved.
>>> +     */
>>>       data_width = p->width;
>>>   +    if (p->compression_en) {
>>> +        if (p->wide_bus_en)
>>> +            data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6);
>>> +        else
>>> +            data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
>>> +    } else if (!dp_intf && p->wide_bus_en) {
>>> +        data_width = p->width >> 1;
>>> +    } else {
>>> +        data_width = p->width;
>>> +    }
>>> +
>>>       hsync_data_start_x = hsync_start_x;
>>>       hsync_data_end_x =  hsync_start_x + data_width - 1;
>>>   +    display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>>       display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>>>         if (dp_intf) {
>>>           /* DP timing adjustment */
>>>           display_v_start += p->hsync_pulse_width + p->h_back_porch;
>>>           display_v_end   -= p->h_front_porch;
>>> +    }
>>> +
>>> +    intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>>> +    intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>>> +    active_h_start = hsync_start_x;
>>> +    active_h_end = active_h_start + p->xres - 1;
>>> +    active_v_start = display_v_start;
>>> +    active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>>   -        active_h_start = hsync_start_x;
>>> -        active_h_end = active_h_start + p->xres - 1;
>>> -        active_v_start = display_v_start;
>>> -        active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>> +    active_hctl = (active_h_end << 16) | active_h_start;
>>>   -        active_hctl = (active_h_end << 16) | active_h_start;
>>> +    if (dp_intf) {
>>>           display_hctl = active_hctl;
>>>   -        intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;
>>> +        if (p->compression_en) {
>>> +            active_data_hctl = (hsync_start_x + p->extra_dto_cycles) 
>>> << 16;
>>> +            active_data_hctl += hsync_start_x;
>>> +
>>> +            display_data_hctl = active_data_hctl;
>>> +        }
>>>       }
>>>   +    _check_and_set_comp_bit(ctx, p->dsc_4hs_merge, 
>>> p->compression_en, &intf_cfg2);
>>> +
>>>       den_polarity = 0;
>>>       if (ctx->cap->type == INTF_HDMI) {
>>>           hsync_polarity = p->yres >= 720 ? 0 : 1;
>>> @@ -202,7 +227,7 @@ static void 
>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>

-- 
With best wishes
Dmitry

