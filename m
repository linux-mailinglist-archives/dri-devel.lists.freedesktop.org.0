Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A372A0C0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75DF10E15F;
	Fri,  9 Jun 2023 16:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85A510E6C9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 16:58:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f640e48bc3so2523805e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686329881; x=1688921881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SUb5nVm7hFEBhuv59behzuKW8dLna7emUUL4IOqj/Es=;
 b=k0pP6Yhd3tBEViDCSHkbzEXgsqBEiMFY4yu+KoHTzdKB2j5qstboVWNWylre1DXBAi
 bIOqo0z/GXU22r0SD+x4ONdlvCmhoecZ5INom/OyUQgupL45ebVoRNdWWribHpPyBrkj
 W6iv9HkY1PNCAhp9gdn9wz2y9nRHHoJMsAEAXJOnkYtl0MW9rdC6CpFqIJdhr3QKYF1X
 OGFU1rKCxbgE6MHmhJIs1ldfddy9bjqDjIlQMsM4PyX8OVvrnUCP+q9Hj6lHWWaGJcl/
 nFDhDQLI0Lltq/2EdH3GOUgjKeKTauO+4tUXrrSaPCsx2z1pLaZ7zaSsqS0Ixa6qO0O5
 YSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686329881; x=1688921881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SUb5nVm7hFEBhuv59behzuKW8dLna7emUUL4IOqj/Es=;
 b=Lf41vFC7U3DinL3SBW+RDzvEETDTZwIavhRb/Ug8/Dta5n8lAQomZD22/BcQmZQDxp
 Q2v41sF4YANiu4TOcIJzlyWrCw2YzFheKvSECMHt0g3OyLcMXgtFKzzc0IeW0GqxjJWu
 e554FzVqZ85GcTm1j/D0+p/IyvdOdKBJePVTWyJzGZjoHZxHEolPHE6wUwxBpJzXvSGA
 4nC5/z2z719pKCPr4xr5op39RhiLvQFrgzgut3j8BD4FaTWYT9Qw0d5EHerHUTsSt+YK
 CaM4q+C7x5B3Bzia/24vOxmynMgOGCXgva0JJ888A2d2u6mn1omO0DPTNKPXunggPZOb
 W/dw==
X-Gm-Message-State: AC+VfDyqBQhjCoLquwjoR0cLOzj1pM5L2nXksac9QhFJ6+YXr+TjyI6d
 56ofBW2V3hjjicW1h4tF5hmNwQ==
X-Google-Smtp-Source: ACHHUZ5XREmgDhoET21rXfbNBJMsOO4k1ia54yVbEFbqrn3hb5hXibwbLwjxN3epvSvRqhrKKRNXdA==
X-Received: by 2002:a19:6550:0:b0:4f4:b218:e85f with SMTP id
 c16-20020a196550000000b004f4b218e85fmr1067786lfj.31.1686329881358; 
 Fri, 09 Jun 2023 09:58:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x3-20020ac259c3000000b004f39bb71ed2sm601806lfn.138.2023.06.09.09.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 09:58:00 -0700 (PDT)
Message-ID: <f34a03ce-6295-b5d1-bf42-a43cfb382ea3@linaro.org>
Date: Fri, 9 Jun 2023 19:58:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for compression
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 23:36, Marijn Suijten wrote:
> Same title suggestion as earlier: s/adjust/reduce
> 
> On 2023-05-22 18:08:56, Jessica Zhang wrote:
>> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
>> is enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index a448931af804..88f370dd2ea1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>> +static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
> 
> Nit: adjust_pclk_for_compression
> 
> As discussed before we realized that this change is more-or-less a hack,
> since downstream calculates pclk quite differently - at least for
> command-mode panels.  Do you still intend to land this patch this way,
> or go the proper route by introducing the right math from the get-go?
> Or is the math at least correct for video-mode panels?

Can we please postpone the cmd-vs-video discussion? Otherwise I will 
reserve myself a right to push a patch dropping CMD mode support until 
somebody comes with a proper way to handle CMD clock calculation.


It is off-topic for the sake of DSC 1.2 support. Yes, all CMD panel 
timings are a kind of a hack and should be improved. No, we can not do 
this as a part of this series. I think everybody agrees that with the 
current way of calculating CMD panel timings, this function does some 
kind of a trick.

> 
> This function requires a documentation comment to explain that all.
> 
>> +		const struct drm_dsc_config *dsc)
>> +{
>> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> 
> This sounds like a prime candidate for msm_dsc_get_bytes_per_line(), if
> bits_per_component==8 is assumed.  In fact, it then becomes identical
> to the following line in dsi_host.c which you added previously:
> 
> 	hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);

This would imply a simple /3, but as far as I understand it is not 
correct here.

> 
> If not, what is the difference between these two calculations?  Maybe
> they both need to be in a properly-named helper.
> 
>> +			dsc->bits_per_component * 3);

I hope to see a documentation patch to be posted, telling that this 
scales hdisplay and thus pclk by the factor of compressed_bpp / 
uncompressed_bpp.

This is not how it is usually done, but I would accept a separate 
documentation patch going over the calculation here and in 
dsi_timing_setup (and maybe other unobvious cases, if there is anything 
left).

> 
> As we established in the drm/msm issue [2] there is currently a
> confusion whether this /3 (and the /3 in dsi_timing_setup) come from the
> ratio between dsi_get_bpp() and dsc->bpp or something else.  Can you
> clarify that with constants and comments?
> 
> [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/24
> 
>> +
>> +	return (new_hdisplay + (mode->htotal - mode->hdisplay))
>> +			* mode->vtotal * drm_mode_vrefresh(mode);
> 
> As clarified in [1] I was not necessarily suggesting to move this math
> to a separate helper, but to also use a few more properly-named
> intermediate variables to not have multi-line math and self-documenting
> code.  These lines could be split to be much more clear.

I think it's fine more or less. One pair of parenthesis is unnecessary, 
but that's mostly it. Maybe `new_htotal' variable would make some sense.

Also, please excuse me if this was discussed somewhere. This calculation 
means that only the displayed data is compressed, but porches are not 
touched. Correct?

> 
> [1]: https://lore.kernel.org/linux-arm-msm/u4x2vldkzsokfcpbkz3dtwcllbdk4ljcz6kzuaxt5frx6g76o5@uku6abewvye7/
> 
>> +}
>> +
>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
>> +		const struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>   {
>>   	unsigned long pclk_rate;
>>   
>> @@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>>   	if (is_bonded_dsi)
>>   		pclk_rate /= 2;
>>   
>> +	/* If DSC is enabled, divide hdisplay by compression ratio */
>> +	if (dsc)
>> +		pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);

Looking for the perfection, I'd also move the pclk adjustment to come 
before the is_bonded_dsi check.

> 
> The confusion with this comment (and the reason the aforementioned
> discussion [2] carried on so long) stems from the fact a division makes
> sense for a bit/byte clock, but not for a pixel clock: we still intend
> to send the same number of pixels, just spending less bytes on them.  So
> as you clarify the /3 above, can you also clarify that here or drop this
> comment completely when the function is correctly documented instead?
> 
> - Marijn
> 
>> +
>>   	return pclk_rate;
>>   }
>>   
>> @@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>   	u8 lanes = msm_host->lanes;
>>   	u32 bpp = dsi_get_bpp(msm_host->format);
>> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>>   	unsigned long pclk_bpp;
>>   
>>   	if (lanes == 0) {
>> @@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>   
>>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   {
>> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
>> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>>   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>   							msm_host->mode);
>>   
>>
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry

