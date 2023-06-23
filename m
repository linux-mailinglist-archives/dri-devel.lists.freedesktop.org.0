Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9A73ADE2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993A010E0E1;
	Fri, 23 Jun 2023 00:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3909A10E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:35:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b47742de92so2294521fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687480546; x=1690072546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GXPeGk6lFZtTxBF8+AQRZTnHPh2sRuaIU2oiKKEfY3k=;
 b=vO+RI9aQ2DnAjMyqmtDCi886uUil7EMGvsv90LvXHvN7pdcYcNRd6r3rbiDij5aZeV
 jT/pClZOxp9aWBygYnunvf7+KYoORncyvsMkNlg4c3HYou4jj51x3J0T5SdGEaKI7k7H
 rS2aRcUVMl4yaW+Ggx5ZAiYmfV+gmSQrczNTwGuFlqijlkTj4ddN+ysD3c+OOrss1Ilu
 vuaFtDW2RcsXeQl6DauZjJOdLzxl6paF8fpnci+P9GhInoLxhhXJJY7smy3peDBDKdL8
 zdkausQLp6T3BpVXlrL+1VPDyrDAKQIPfhuJFHBuznhiJjPMM3ijPsNHwr3lVwR35jqp
 8SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687480546; x=1690072546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXPeGk6lFZtTxBF8+AQRZTnHPh2sRuaIU2oiKKEfY3k=;
 b=FU4iSof3U0p4FU+Y9daC/9Zgq8c0JS5cTlstic7eN6uu5wIZmzjMR7IDfDXtSkxOk5
 +y5La5QTFh0vLlKHI3coGuwL7pE8sjjnx60iq1SKB+Kq74kWKr30R9yx8YknfO94T25Z
 WnJZKTjnHoq91yIgMAkSmLmECnzNk+MuKsaxL+Q7gsIDEUctG1UM+PClt/LGLQqv3vus
 fFxxRuqdOdLAk8uRqLF6R4REkRiTOmB3lQEvJ6xDQW3bmmt0fYFm/gf1p5y2n30X2GBe
 ZiznYtyK4o6ThfyEQsldrOl22WIIvMfE424qRWi4718m0989pNNg4SZl0Lo9VUymd8Kc
 g9CA==
X-Gm-Message-State: AC+VfDw0LW7J9b5x4vhp75TTDHSB3ThcDA71FC1yu7wTL4QoQDIBHJAW
 800R08+TuNnmudymkaqfJis3KA==
X-Google-Smtp-Source: ACHHUZ4bHgC8KsDMx0/17Jrj9/Ch3wEqVnIvE3uiUrTLkUOlOgRRFC8H+i20RviADqmFrkSu6wNQeQ==
X-Received: by 2002:a2e:9c03:0:b0:2b4:6bc2:a540 with SMTP id
 s3-20020a2e9c03000000b002b46bc2a540mr9518045lji.15.1687480546212; 
 Thu, 22 Jun 2023 17:35:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a2e9851000000b002b331e241edsm1516732ljj.133.2023.06.22.17.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 17:35:44 -0700 (PDT)
Message-ID: <4bc1791f-3933-57e6-3caf-e77b059d0cc8@linaro.org>
Date: Fri, 23 Jun 2023 03:35:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 03:32, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 5:17 PM, Dmitry Baryshkov wrote:
>> On 23/06/2023 03:14, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
>>>> Provide actual documentation for the pclk and hdisplay calculations in
>>>> the case of DSC compression being used.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>
>>>> Changes since v1:
>>>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
>>>> - Added a pointer from dsi_timing_setup() docs to
>>>>    dsi_adjust_pclk_for_compression() (Marijn)
>>>> - Fixed two typo (Marijn)
>>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 
>>>> ++++++++++++++++++++++++++++--
>>>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct 
>>>> msm_dsi_host *msm_host)
>>>>       clk_disable_unprepare(msm_host->byte_clk);
>>>>   }
>>>> +/**
>>>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for 
>>>> compression case
>>>> + * @mode: the selected mode for the DSI output
>>>> + * @dsc: DRM DSC configuration for this DSI output
>>>> + *
>>>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
>>>> + * the compression ratio such that:
>>>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>>>> + *
>>>> + * Porches do not need to be adjusted:
>>>> + * - For the VIDEO mode they are not compressed by DSC and are 
>>>> passed as is.
>>>> + * - For the CMD mode there are no actual porches. Instead these 
>>>> fields
>>>> + *   currently represent the overhead to the image data transfer. 
>>>> As such, they
>>>> + *   are calculated for the final mode parameters (after the 
>>>> compression) and
>>>> + *   are not to be adjusted too.
>>>> + *
>>>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten 
>>>> to use
>>>> + *  refresh rate and data overhead as a starting point of the 
>>>> calculations.
>>>> + */
>>>>   static unsigned long dsi_adjust_pclk_for_compression(const struct 
>>>> drm_display_mode *mode,
>>>>           const struct drm_dsc_config *dsc)
>>>
>>> I am fine with this part of the doc.
>>>
>>>>   {
>>>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct 
>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>           if (ret)
>>>>               return;
>>>> -        /* Divide the display by 3 but keep back/font porch and
>>>> -         * pulse width same
>>>> +        /*
>>>> +         * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>>>> +         * not used, a single pixel is transferred at each pulse, no
>>>> +         * matter what bpp or pixel format is used. In case of DSC
>>>> +         * compression this results (due to data alignment
>>>> +         * requirements) in a transfer of 3 compressed pixel per pclk
>>>> +         * cycle.
>>>> +         *
>>>
>>> I dont want to talk about data alignment nor formats and I will not 
>>> ack any references to those.
>>>
>>> I would like to keep this simple and say that DPU sends 3 bytes of 
>>> compressed data / pclk (6 with widebus enabled) and all this math is 
>>> doing is that its calculating number of bytes and diving it by 3 OR 6 
>>> with widebus to calculate the pclk cycles. Thats it.
>>
>> This makes it unclear, why do we simply by 3 rather than doing * 
>> dsc_bpp / 24.  My description might be inaccurate as I don't have hw 
>> docs at hand, but simple description is not enough.
>>
> 
> Why is it unclear? With compression, we are saying we process at 3 
> compressed bytes / pclk and this math is accurately giving the pclk cycles.
> 
> You are once again trying to arrive at 3 with compression factor in mind 
> by calculating target_bpp / src_bpp.
> 
> I am saying that its independent of that. Whenever we do compression 
> rate is 3 bytes of compressed data (and 6 with widebus) irrespective of 
> what your dsc_bpp was.

3 bytes of compressed data = 4 * 6bpp pixels. So hdisplay should have 
been divided by 4 in such case. So, this is not just about bytes.

> 
>>>
>>>> +         * If widebus is enabled, bus width is extended to 6 bytes.
>>>> +         * This way the DPU can transfer 6 compressed pixels with bpp
>>>> +         * less or equal to 8 or 3 compressed pixels in case bpp is
>>>> +         * greater than 8.
>>>> +         *
>>>> +         * The back/font porch and pulse width are kept intact.  They
>>>> +         * represent timing parameters rather than actual data
>>>> +         * transfer. See the documentation of
>>>> +         * dsi_adjust_pclk_for_compression().
>>>
>>> this part is fine.
>>>
>>>> +         *
>>>> +         * XXX: widebus is not supported by the driver (yet).
>>>>            */
>>>>           h_total -= hdisplay;
>>>>           hdisplay = 
>>>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>

-- 
With best wishes
Dmitry

