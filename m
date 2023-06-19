Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD453735EC3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 22:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5365F10E0C9;
	Mon, 19 Jun 2023 20:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539010E0CE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 20:57:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b47a15ca10so20874861fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687208245; x=1689800245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DdgLBE7ortnikmhoP1Yw2NLv7TWW6NRWleDmf5QpKEo=;
 b=M8WHDSQRj8BMjGsZ0EpBTXSR8iWAXp+0iL/4cqDrTB5spLjhzBAFmtxNY6YkZKMG6G
 qbBMU1W666e1xlWMLOiYCHsMw0PDh5laDHWITK0PiSNzYCxP9HhY7WwIHoQ5880U16op
 RKuyzAstn9EHoL5l+0rZtJrVr0OKBZwEGd1enLg9sO4eyGc6HQfs8eOSY6Ub0Wykbt+V
 yp/ZjxA+DNuxHEGwZl09HaLVdbP583jnbkdPGu81sTRbSqH+Yua+Lapqy7MU6E4KQ8fn
 Wvtumccy4Ub8lPFZjxQ9nvFt363PLPYylPBjkz0is3C0rW278fMQluRFanTWr72dg7Ds
 noog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687208245; x=1689800245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DdgLBE7ortnikmhoP1Yw2NLv7TWW6NRWleDmf5QpKEo=;
 b=gjDK9KcHqia03RgAF3xCYbZYyahl1iPF7UdHKCqEi0r1ds3EKXRodQiorKdE4kcQ0H
 7yKi8/H20zx8AjLrILleyqmgtsHORUE1fc1tqgXiCWmfC632B+j0EImYtSCqVMtBJYdp
 Y35929owSKdCyP6drrUa8zkhzPmIDiogejzrer7v1a0MWqSHO+/Ag5t2dyk2KnNw5aup
 nZbmFUqt6e32LvS7y/NvSvTbknE/4ZmNdLBA10jtMRyaK9r1CSGLg4DgP2HksvSvXAkk
 zzaoz8UHRL/8um0tPw8iubuSG4ZEYViO41i0r/TkG5oAPZpB0yqAuIOteCBOuAXjfWcG
 HTTg==
X-Gm-Message-State: AC+VfDy5s/jSUmkzjU8QizFXG5oqSpo1hQhl6FaNf9U+bRs9lsIHkL5U
 xwv+iRctFtnSUJAh/2DUQl268g==
X-Google-Smtp-Source: ACHHUZ4Zk55ODVpUx1QnaQ5Rr+X6R+tCa0odArHwPhMZ9ilpWM+NeG7YePDIF7QbTi7AU8heat1PKg==
X-Received: by 2002:a2e:9050:0:b0:2b3:31c1:c747 with SMTP id
 n16-20020a2e9050000000b002b331c1c747mr6458810ljg.24.1687208244935; 
 Mon, 19 Jun 2023 13:57:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a2e8096000000b002b21089f747sm50130ljg.89.2023.06.19.13.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 13:57:23 -0700 (PDT)
Message-ID: <677b74dc-e0f5-22e9-2b21-a7272c661b6e@linaro.org>
Date: Mon, 19 Jun 2023 23:57:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
 <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <h2u5wsfbfpz7qivmxl3t37xen452zxt76uheonkwcihytfmb3l@axiy5bmwf4ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 15:25, Marijn Suijten wrote:
> On 2023-06-16 12:41:52, Dmitry Baryshkov wrote:
>> Provide actual documentation for the pclk and hdisplay calculations in
>> the case of DSC compression being used.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 3f6dfb4f9d5a..72c377c9c7be 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> +/*
>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> 
> Make this a kerneldoc with:

Ack

> 
>      /**
>       * dsi_adjust_pclk_for_compression() - Adjust ...
> 
>> + * the compression ratio such that:
>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
>> + *
>> + * Porches do not need to be adjusted:
>> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> 
> as-is

Cambridge dictionary gives this "as is", without dash.

> 
> Though this was never tested nor confirmed by QUIC, but we can assume it
> is the case for now?
> 
>> + * - For the CMD mode the are no actual porches. Instead they represent the
> 
> the are no -> these are not
> 
> they currently* represent.  

Ack

> Let's make sure that folks read the FIXME
> below by perhaps rewording it right into this entry?

I kept it separately, so that the FIXME can be removed once CMD handling 
is reworked.

> 
>> + *   overhead to the image data transfer. As such, they are calculated for the
>> + *   final mode parameters (after the compression) and are not to be adjusted
>> + *   too.
>> + *
>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
>> + *  refresh rate and data overhead as a starting point of the calculations.
>> + */
>>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>>   		const struct drm_dsc_config *dsc)
>>   {
>> @@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (ret)
>>   			return;
>>   
>> -		/* Divide the display by 3 but keep back/font porch and
>> -		 * pulse width same
>> +		/*
>> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
>> +		 * not used, a single pixel is transferred at each pulse, no
>> +		 * matter what bpp or pixel format is used. In case of DSC
>> +		 * compression this results (due to data alignment
>> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> 
> 3 compressed bytes*, not pixels.

No, that's the point. With 6bpp one can think that 4 pixels would fit, 
but they don't.

> 
>> +		 * cycle.
>> +		 *
>> +		 * If widebus is enabled, bus width is extended to 6 bytes.
>> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> 
> pixels -> bytes?

Same comment, no.

> 
>> +		 * less or equal to 8 or 3 compressed pyxels in case bpp is
> 
> pixels*... bytes?
> 
> And I will ask this **again**: does this mean we can halve pclk?

My guess would be no, since all other data transfers are not scaled by 
wide bus.

> 
>> +		 * greater than 8.
>> +		 *
>> +		 * The back/font porch and pulse width are kept intact.  They
>> +		 * represent timing parameters rather than actual data
>> +		 * transfer.
> 
> See FIXME above on dsi_adjust_pclk_for_compression()?
> 
> Thanks so much for finally putting some of this to paper.
> 
> - Marijn
> 
>> +		 *
>> +		 * XXX: widebus is not supported by the driver (yet).
>>   		 */
>>   		h_total -= hdisplay;
>>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

