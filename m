Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE746736EA8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA0510E2EA;
	Tue, 20 Jun 2023 14:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2C410E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 14:27:50 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so3478930e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687271268; x=1689863268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QL0Cko3uBzMm/HpOTK6oblEuEno/5jvJGr7KxndV3SE=;
 b=McUBP87vyqrA53ERhRujBQEUgwTmauOCx0GEoddsQOzpH6bWZ5qETA/pxl0V2s2OdJ
 zECsvkkj/t0ybTUVPfHQVuQphCvmsILkM76SeoaZTEfRgWzaVGt4x3rdkSLp8JwgsaJC
 Qm4Q6Q5rl1RupzNRMWhOwwWXr9OcmbkAVgMj7ri88B02vQI6EuUwHHNeWws2b27hpu4f
 cgo0gmkR+ngMgGeTOSZROUAMyV84zmimZ1fP0H2KaPK+dVmYZS7sqDBkGDZQ85A/mxIG
 ojT+bq1M84g626+wkE8g0HWWnmNp6VH9NQQAuPPz78eYNEhjtxt28ZLqg/UCE7rm+cas
 upTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687271268; x=1689863268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QL0Cko3uBzMm/HpOTK6oblEuEno/5jvJGr7KxndV3SE=;
 b=D+9NqBKhv4D4kKJLBxUp0oceu5AlZygLIH0+G/uC1DMBD4hqwqx5WgvHDK1r/nYF3n
 ccOQARiCQIoRCCpj8XT7Y27FjcezK5y+qYrK8i8zbxuP97mq84lDBF/ABIMZMoWPPNG3
 GMd8mUQFyi/vRIJ8mM8BHvklWEq7+p8BHGPVdDOmWq5yxD0mMKpDTHG7xZ+0QJ55Gdhe
 ljyZaJ4ut8FiHH0rOc7mDUPiJbZg/sRL7NO559Hb8Z4BzSB7jt/5pN+CyyAXS/bsUm+p
 t08vMRQUFPTJ3d5awq9zAFencJAUBNna/DJLO3TluwCQU/L1vxeTDphOHikIpdohXcqy
 J3NA==
X-Gm-Message-State: AC+VfDzCD+3/tzvEmUNuVc24Wsj0J5hr6tkPqhdKwTud5GEs33dYuHSU
 a6UFPvebLiCtu9IyUTv690IfqA==
X-Google-Smtp-Source: ACHHUZ5TnnAIIiguHGXusN4aum6VsWmxFR20qZZiawgPx50YsJ04xVQBjB1XPAa8vpmWrTVNqC7iGg==
X-Received: by 2002:ac2:5f9a:0:b0:4f8:631b:bf74 with SMTP id
 r26-20020ac25f9a000000b004f8631bbf74mr4520495lfe.38.1687271267749; 
 Tue, 20 Jun 2023 07:27:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a19760f000000b004f877fcd65fsm383950lff.188.2023.06.20.07.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 07:27:47 -0700 (PDT)
Message-ID: <c4dd336c-940d-16fe-9c8c-c2d31ed28792@linaro.org>
Date: Tue, 20 Jun 2023 17:27:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <6rcphtpxou2ef3z44upzfbx23ahmqc4f3eys6qreozutt7v6z6@b22a535fhpor>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6rcphtpxou2ef3z44upzfbx23ahmqc4f3eys6qreozutt7v6z6@b22a535fhpor>
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

On 20/06/2023 15:05, Marijn Suijten wrote:
> On 2023-06-20 00:06:47, Dmitry Baryshkov wrote:
>> Provide actual documentation for the pclk and hdisplay calculations in
>> the case of DSC compression being used.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v1:
>> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
>> - Added a pointer from dsi_timing_setup() docs to
>>    dsi_adjust_pclk_for_compression() (Marijn)
>> - Fixed two typo (Marijn)
>>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 3f6dfb4f9d5a..a8a31c3dd168 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> +/**
>> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
>> + * @mode: the selected mode for the DSI output
> 
> The
> 
>> + * @dsc: DRM DSC configuration for this DSI output
>> + *
>> + * Adjust the pclk rate by calculating a new hdisplay proportional to
>> + * the compression ratio such that:
>> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> 
> And in v1 you explained that it is _not_ about bpp...

Hmm, this bit stayed intact, so I'm slightly confused here.

  This function is about BPP and compressed rate. dsi_timing_setup() is 
about bytes.

> 
>> + *
>> + * Porches do not need to be adjusted:
>> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
>> + * - For the CMD mode there are no actual porches. Instead these fields
> 
> I feel like "For VIDEO mode" and "For CMD mode" reads more naturally, no
> need for "the", but I don't know the grammar rule that states so.

Ack

> 
>> + *   currently represent the overhead to the image data transfer. As such, they
>> + *   are calculated for the final mode parameters (after the compression) and
>> + *   are not to be adjusted too.
>> + *
>> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
>> + *  refresh rate and data overhead as a starting point of the calculations.
> 
> Nit: well, refresh rate is already part of this calculation (that's how
> drm_display_mode's clock member comes to be, and how drm_mode_vrefresh()
> figures out fps after the fact).  It's all about the per-CMD transfer
> overhead in bytes that is currently not part of the calculation.

Please correct me if I'm wrong, we start from mode->clock. Refresh rate 
isn't even a part of struct drm_display_mode.

> 
>> + */
>>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>>   		const struct drm_dsc_config *dsc)
>>   {
>> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (ret)
>>   			return;
>>   
>> -		/* Divide the display by 3 but keep back/font porch and
>> -		 * pulse width same
>> +		/*
>> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
> 
> Should this be pixels (1 pixel), not bytes, just like in the compressed
> scenario?

No.

> 
>> +		 * not used, a single pixel is transferred at each pulse, no
>> +		 * matter what bpp or pixel format is used. In case of DSC
>> +		 * compression this results (due to data alignment
>> +		 * requirements) in a transfer of 3 compressed pixel per pclk
>> +		 * cycle.
>> +		 *
>> +		 * If widebus is enabled, bus width is extended to 6 bytes.
>> +		 * This way the DPU can transfer 6 compressed pixels with bpp
>> +		 * less or equal to 8 or 3 compressed pixels in case bpp is
>> +		 * greater than 8.
> 
> Okay, so one can not send more than 6 pixels even if the bpp is less
> than 8, is what this comes down to.

Yes.

> 
>> +		 *
>> +		 * The back/font porch and pulse width are kept intact.  They
>> +		 * represent timing parameters rather than actual data
>> +		 * transfer. See the documentation of
>> +		 * dsi_adjust_pclk_for_compression().
> 
> Nit: note that this is only for VIDEO mode, h_total and ha_end are
> accurately unused in the CMDmode path below.
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

