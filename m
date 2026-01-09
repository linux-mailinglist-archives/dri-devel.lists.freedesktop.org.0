Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4AD0ADC6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F610E8E4;
	Fri,  9 Jan 2026 15:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1vshY+C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKg94CYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075610E26D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:22:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609CHxc83542293
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=loy0TPHhWcKiYp5c2ufkllth
 GFm2RkqaWI7+xw8R/rU=; b=h1vshY+CvQSI+rOUlkhgEwIKpwLR+icxlT7gduvW
 0M8H/54/hB/r7wMC41zh4aO9fO+1eb/tMQ5OIANvTXxq7xhFe2whnduCmRZBTecP
 RBKAhGadRt7GFOl2VCbIsoonq8VvDyXy+SrgLLJHe0v+CD2eudjDrCgRm0qlKSPh
 4emMfcto8Fhfr/rCu3ZMHVy3IrA/bgAzheobDItn8phc1p2zr5vji1+TItQZOU/p
 /ynGDEzhH6YdI1/iA92Yr4PgI8TcftzXv0t3+blWfMKnefpfRu5Gq/4A2d5ScKCT
 1DC+Kc8G2EklaVyW0bNwvku+QddAi7Uny45Q3v1gSl50Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b1q43-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 15:22:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb9f029f31so1101999085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767972161; x=1768576961;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=loy0TPHhWcKiYp5c2ufkllthGFm2RkqaWI7+xw8R/rU=;
 b=LKg94CYfMBnXmZ6jCIbM+zAr1ea4zTbvha1d6GObVbVEdP/9DaMRToUJXN8I4r4Tut
 HKeTLmstyJosWwzgfJxQwa+ETdoieHLalghQuImTUUGKBqKDQQNY8FGPBKr4KQ6HW/IY
 0tex9bdQPesRMn82jte9PQw7vE+gBezC05F5SpxZQJjPIwloJjiF+GujhEpxsT0JWaGM
 L5R06L7h7vUJH7q9W9ZnqeR1qpN1zIhaGpyoHfTBGsA9v/ZdqE7nOyeEiuu8TsIJqxra
 RjyuQRPJELQgTf27UAFe2vuR5dNWw+sfsimPklA5E+9lt5pZvuftGfhB84ZRmrDiE7wM
 na1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767972161; x=1768576961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loy0TPHhWcKiYp5c2ufkllthGFm2RkqaWI7+xw8R/rU=;
 b=e+6mREkIIdeP+QxWioVAQ0Gw6DLEwtyYUQii21i52WEwakKsSVbhnhssk7GwyXF8yp
 1LGvYvpakRVgjqiIgLEmc2KBWShwtshmK/hrqyrk+xJqANwBwYPiWy/PrrD+BufZQ8Fz
 Mi875NCEfvoP0fVBtTm7dBwYtYCfBqEd/1ULs7k9di0R0XPevroF5jCoolSTb3mabr86
 +aOvcmWaOwHrwpsQofyjvbSfQI6rn2gcvOh+HDKclcFSDKgNYvSBbndLFJA4URMuWLfm
 yO9ECnKOEa73qiEPxVYb2I5V52x7CXS+tsyTEiYTCD1wjUFvgGbIlFuez8XJba886ca4
 qcZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoge4Xk9vE0jp9L3IYLo0/GlIFqmHR8ojp5R/1GzdAYnaKE3lJfX3G1KoMR2orfNANqASICcWiUVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn8VOmKZ8/MpDbjWJKLDbGomYxh1VMIo2QKUNg7BiJaYvXltG2
 yfBUkyMiNuvydEg7LehEcHSpuuap+DHOGF0Cl75p3d4IVkA7TvnGFfnG+pcsGIBiEhqskiTbWSX
 wbIW0G6NjuowJebVpUJ4iqNFLNzSE9COJtQ1K52TzRZ9KC85eOXusSg+UhOzNazEpi0v1H3E=
X-Gm-Gg: AY/fxX4HNI0avLwrmmpkvtyrR64qg9R58GXairAeqzRVNh2dB9v9FHkWAceONStkQRM
 h4BWmyCUHWzAZW2/3kj97dbOijl+o/N+Elt1Dfmf3wZeN+9iQi/0xkWo7TfgLXCCHIqyvVvlqWY
 2hRx1XK0tmgt1GRSaHP9gyc7w5SZUSdMQsucRboyce0ucl79REsqoDBohL3OTfbeRHQ4F+5p1Y5
 s7OVO8q0UJQQ5qaQZnDVp9ms5kF9s6zWzlaBSbGXLtPEhEhst1ix62Ulh2NI8itRI6uF3DAHs6V
 NU/ksjQCnNHcEh7/prdgGJ04S507vHAS5aMlftXVqFs9h7R2Pf0+lhualogXI/tgqGivHPEE4XK
 v71Rn+CIhxHEPonerYpOFDMCKjYEgAelkZNDS8NMlkrRBfVYUXj9bSjewSCDBsvhVxdBlopA5cj
 wSzvWxnuarsaq1kiGOUsAVMAE=
X-Received: by 2002:a05:620a:172c:b0:8b2:ef6c:802f with SMTP id
 af79cd13be357-8c3893f7e3bmr1563024185a.59.1767972161062; 
 Fri, 09 Jan 2026 07:22:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEW8cHslVnozbH0FQY7+gVXqiAda7H7WnZddF0wYfrOU+UFBSmBPwML6d/rabRKq5TRaZB9w==
X-Received: by 2002:a05:620a:172c:b0:8b2:ef6c:802f with SMTP id
 af79cd13be357-8c3893f7e3bmr1563016785a.59.1767972160509; 
 Fri, 09 Jan 2026 07:22:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d86bsm2870638e87.23.2026.01.09.07.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:22:39 -0800 (PST)
Date: Fri, 9 Jan 2026 17:22:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNCBTYWx0ZWRfXzEtbvx7UkEPJ
 Mmay5WCG9NTBidBe550MDTNg/EdUjl7oTJYAO7lFtqLi6JqZai7Kouv6x8VsjlitvwTyD9NbDJI
 sFHypxmRL6Qgb5m9ddcEuiTTdRuO6YHbek/GPWyT+TaJ6BCkQn2SG9KMq1h65MNOWSmKuJ3bQVu
 RByPD4+yTKJsVW1LetHlUvlGfxtkw4sdpOuBWQz7vzGXGhJPF8D1taCVJlztgWbNnxRvECYP/XO
 I9nfcq5/g6clUl2/LPhZsL+BozHZ70dtdMCZORtx4GIrCjXf29Fwqy8MCbmEQq40C9GacjRbQmR
 dnGURibXPusz+Jc1mYMVywi45otEDo7jCx4gQXgNBkvxrpVx9PABVAVqDMXqLX1Z7G+9mKp+4Pi
 vXeqvIlG9vbTmrDEdpWW1YNrdtWcohETpQ28KrimMMN2ViEr6Urz5X7rBbNxooBtMvBlmZlOiWj
 HZoo/uj9H5ozU35o8vQ==
X-Proofpoint-ORIG-GUID: imIJT-xqeDcCIvnF3aSvsnz0wx67FDDy
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=69611d41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ss2zht_kmVFDEoSxsDsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: imIJT-xqeDcCIvnF3aSvsnz0wx67FDDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090114
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.

Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
doesn't do anything with clocks. I think we should have a call to
clk_disable_unprepare() before that and clk_prepare_enable() in the
resume path.

> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.
> 
> Fix this by setting the corresponding OPP corner during both power-on
> and power-off sequences to ensure proper alignment of rail voltage and
> clock frequency.
> 
> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

No empty lines between the tags. Also please cc stable.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0623f1dbed97..c31488335f2b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
>  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  	struct dev_pm_opp *opp;
>  	int ret = 0;
> -	unsigned long max_freq = ULONG_MAX;
> +	dpu_kms->max_freq = ULONG_MAX;
> +	dpu_kms->min_freq = 0;
>  
> -	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> +	if (!IS_ERR(opp))
> +		dev_pm_opp_put(opp);
> +
> +	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
>  	if (!IS_ERR(opp))
>  		dev_pm_opp_put(opp);
>  
> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  
> -	/* Drop the performance state vote */
> -	dev_pm_opp_set_rate(dev, 0);
> +	/* adjust the performance state vote to low performance state */
> +	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);

Here min_freq is the minumum working frequency, which will keep it
ticking at a high frequency.  I think we are supposed to turn it off
(well, switch to XO). Would it be enough to swap these two lines
instead?

>  	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>  
>  	for (i = 0; i < dpu_kms->num_paths; i++)
> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  	struct drm_device *ddev;
>  
>  	ddev = dpu_kms->dev;
> +	/* adjust the performance state vote to high performance state */
> +	if (dpu_kms->max_freq != ULONG_MAX)
> +		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);

This one should not be necessary, we should be setting the performance
point while comitting the DRM state.

>  
>  	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
>  	if (rc) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 993cf512f8c5..8d2595d8a5f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -92,6 +92,9 @@ struct dpu_kms {
>  	struct clk_bulk_data *clocks;
>  	size_t num_clocks;
>  
> +	unsigned long max_freq;
> +	unsigned long min_freq;
> +
>  	/* reference count bandwidth requests, so we know when we can
>  	 * release bandwidth.  Each atomic update increments, and frame-
>  	 * done event decrements.  Additionally, for video mode, the
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
