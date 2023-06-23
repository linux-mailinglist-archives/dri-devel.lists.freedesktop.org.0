Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717573BF3C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7810E6AC;
	Fri, 23 Jun 2023 20:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704C310E6AC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:11:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f86bc35f13so1447311e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687551058; x=1690143058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=blZRrqOta5NXgkBA3J1YzIv2rFtc+iJmH4Rx4e4aGUA=;
 b=m2Cl6ckxIiAV3cCbb2qF5CndWXDkuVEfG7QVgez8ODcpOVsEVVTrK1RJB/bkA3r2QT
 bAOuCFfnRZ1VzasJbAlHeag7iTk8VuJr5MvEsNJ+oMI9LzBAFs5qEalhFDiP5c3yxRvU
 K1Ktp/bv860ELsOw/tJxR+8LGOR5+y2K/AB9RcTmkc+VatsUcIwz34QPhYMYPTZQdhc1
 zhrI7rc2YOjaXRqF7fKhb3NmwopXOA7llJcLKw/lKZOpEwWWEdEq6aGluza2GA5pvGFL
 INqHVbJQwgmdXl46zqQLoYlpMXETKqvmTGwLSp9eZbOvlvgVN0VgbzaxKCUnlFfRmuEd
 i6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687551058; x=1690143058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blZRrqOta5NXgkBA3J1YzIv2rFtc+iJmH4Rx4e4aGUA=;
 b=ItGSVHJZlz5e+dQQ1+pG5LEXpthvNisAfg48okjCy6qXMx1K/SqYBCeycZ9/ukdU9m
 xZXcmTgCQ+U0dbrLB73twJORidwEcA/9JYlrg6EJYEh+I9e5f5dzPLcngx0Fd5odajcp
 tJNrOMRe4p4cg2X8D8r530R+W7mkILWQGdA/18a4Bc3fOhD86+SPRkLtkampqCzhaqM0
 CKNyub32xVSMcHZHOAxaEupLg3LwOiELmb3AO/BjZwpZjD0JXxyZcpsA4WTR4FK+Bgkn
 jZ+dXkvRfy/ITbH/+jw77XNphMP5iKkxOImz1fbq44QCrNbnIBxNdRHF+pojaQsJRzNF
 xa4g==
X-Gm-Message-State: AC+VfDzRveagQxaoG77yy8tBTILOmKCY6ZDAcIrSnPKgJ91Qss+Tp92/
 ZbdCevUt/tqrzZpw5D31Bie9bQ==
X-Google-Smtp-Source: ACHHUZ4LpN3BxztqQoSjYQdDbceqYGbzPm2Ub8FRxg59fhQwYbWR2zypzFbsl+yrqzWTMtexPtdPVw==
X-Received: by 2002:ac2:4992:0:b0:4f8:421f:cd37 with SMTP id
 f18-20020ac24992000000b004f8421fcd37mr4334455lfl.56.1687551057536; 
 Fri, 23 Jun 2023 13:10:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a19f80b000000b004eff1163c37sm3244lff.308.2023.06.23.13.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 13:10:57 -0700 (PDT)
Message-ID: <a3ce94a4-8e5b-427c-28ad-1bfad041d097@linaro.org>
Date: Fri, 23 Jun 2023 23:10:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
 <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
 <6e2ded6a-63a9-d32a-7a2f-67d3c72b1aa2@quicinc.com>
 <gpxqh6mu5dora7ul4agaflmzqiq7ps6j2dic3zj2ygvp7dsori@lnbnexnbqthg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <gpxqh6mu5dora7ul4agaflmzqiq7ps6j2dic3zj2ygvp7dsori@lnbnexnbqthg>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 23:02, Marijn Suijten wrote:
> On 2023-06-23 12:54:17, Abhinav Kumar wrote:
>>
>>
>> On 6/23/2023 12:26 AM, Marijn Suijten wrote:
>>> On 2023-06-22 17:32:17, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/22/2023 5:17 PM, Dmitry Baryshkov wrote:
>>>>> On 23/06/2023 03:14, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
>>>>>>> Provide actual documentation for the pclk and hdisplay calculations in
>>>>>>> the case of DSC compression being used.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes since v1:
>>>>>>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
>>>>>>> - Added a pointer from dsi_timing_setup() docs to
>>>>>>>      dsi_adjust_pclk_for_compression() (Marijn)
>>>>>>> - Fixed two typo (Marijn)
>>>>>>>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>>>>>>>     1 file changed, 38 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host
>>>>>>> *msm_host)
>>>>>>>         clk_disable_unprepare(msm_host->byte_clk);
>>>>>>>     }
>>>>>>> +/**
>>>>>>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for
>>>>>>> compression case
>>>>>>> + * @mode: the selected mode for the DSI output
>>>>>>> + * @dsc: DRM DSC configuration for this DSI output
>>>>>>> + *
>>>>>>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
>>>>>>> + * the compression ratio such that:
>>>>>>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>>>>>>> + *
>>>>>>> + * Porches do not need to be adjusted:
>>>>>>> + * - For the VIDEO mode they are not compressed by DSC and are
>>>>>>> passed as is.
>>>>>>> + * - For the CMD mode there are no actual porches. Instead these fields
>>>>>>> + *   currently represent the overhead to the image data transfer. As
>>>>>>> such, they
>>>>>>> + *   are calculated for the final mode parameters (after the
>>>>>>> compression) and
>>>>>>> + *   are not to be adjusted too.
>>>>>>> + *
>>>>>>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to
>>>>>>> use
>>>>>>> + *  refresh rate and data overhead as a starting point of the
>>>>>>> calculations.
>>>>>>> + */
>>>>>>>     static unsigned long dsi_adjust_pclk_for_compression(const struct
>>>>>>> drm_display_mode *mode,
>>>>>>>             const struct drm_dsc_config *dsc)
>>>>>>
>>>>>> I am fine with this part of the doc.
>>>>>>
>>>>>>>     {
>>>>>>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host
>>>>>>> *msm_host, bool is_bonded_dsi)
>>>>>>>             if (ret)
>>>>>>>                 return;
>>>>>>> -        /* Divide the display by 3 but keep back/font porch and
>>>>>>> -         * pulse width same
>>>>>>> +        /*
>>>>>>> +         * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>>>>>>> +         * not used, a single pixel is transferred at each pulse, no
>>>>>>> +         * matter what bpp or pixel format is used. In case of DSC
>>>>>>> +         * compression this results (due to data alignment
>>>>>>> +         * requirements) in a transfer of 3 compressed pixel per pclk
>>>>>>> +         * cycle.
>>>>>>> +         *
>>>>>>
>>>>>> I dont want to talk about data alignment nor formats and I will not
>>>>>> ack any references to those.
>>>>>>
>>>>>> I would like to keep this simple and say that DPU sends 3 bytes of
>>>>>> compressed data / pclk (6 with widebus enabled) and all this math is
>>>>>> doing is that its calculating number of bytes and diving it by 3 OR 6
>>>>>> with widebus to calculate the pclk cycles. Thats it.
>>>>>
>>>>> This makes it unclear, why do we simply by 3 rather than doing * dsc_bpp
>>>>> / 24.  My description might be inaccurate as I don't have hw docs at
>>>>> hand, but simple description is not enough.
>>>>>
>>>>
>>>> Why is it unclear? With compression, we are saying we process at 3
>>>> compressed bytes / pclk and this math is accurately giving the pclk cycles.
>>>>
>>>> You are once again trying to arrive at 3 with compression factor in mind
>>>> by calculating target_bpp / src_bpp.
>>>>
>>>> I am saying that its independent of that. Whenever we do compression
>>>> rate is 3 bytes of compressed data (and 6 with widebus) irrespective of
>>>> what your dsc_bpp was.
>>>
>>> Abhinav, this is exactly what the confusion the pclk series is about.
>>> There it was said (and committed to mainline now!) that pclk is based on
>>> the compression factor of target_bpp / src_bpp.  Now you are saying
>>> there is a fixed number of bytes sent by the (wide)bus between DPU-DSC
>>> and DSI.
>>>
>>> Is pclk used for more purposes besides just ticking for the data
>>> transfer between DPU and DSI?
>>>
>>
>> There is no confusion between what was said earlier and now.
>>
>> This line is calculating the number of pclks needed to transmit one line
>> of the compressed data:
>>
>> hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>
>> msm_dsc_get_bytes_per_line() is calculating the number of compressed
>> bytes as it uses the target bits_per_pixel
>>
>> 126 	 * @bits_per_pixel:
>> 127 	 * Target bits per pixel with 4 fractional bits, bits_per_pixel << 4
>> 128 	 */
>> 129 	u16 bits_per_pixel;
>>
>> (like I have said a few times, hdisplay is perhaps confusing us)
>>
>> If you calculate the bytes this way you are already accounting for the
>> compression, so where is the confusion.
>>
>> The pclk calculation does the same thing of using the ratio instead.
> 
> This is not answering my question whether the ratio for pclk calculation
> should also be adjusted to account for widebus.  And if the ratio is
> fixed, why use a fixed factor here but the ratio between
> src_bpp:target_bpp here?  It only adds extra confusion.

Wide bus is dicussed separately. I think the question you are trying to 
ask is "why are we not using msm_dsc_get_bytes_per_line() in 
dsi_adjust_pclk_for_compression()?"

-- 
With best wishes
Dmitry

