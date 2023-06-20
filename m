Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E57369F0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D6D10E2B7;
	Tue, 20 Jun 2023 10:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219EE10E2A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:53:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f8792d2e86so1285443e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258385; x=1689850385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DGZA36U9+mS8P8FwUzMqtiJLWLWVTpus9jpYOIpJAHI=;
 b=zCLktcawGwl3ZsPxU9EJABiM6P9enioML2D1kbJFa+KbHw1qJ5sjDW0ffcEe9niZ/0
 K4D0P/vMKB8dwFifr6bjUBTbEeZUj0QNz83ZF8KnmM3+++6nDECD86HqiQaxoI5yrxDP
 9D83SaroydyiLMvQuL0C1UMyz0CG2GnoDtfuDCxE3iDPA92DT405VdpgFL+uC+UPvFWf
 c80eTqgAua38kS9+DW1YKIpXn2I6IpAVceUyWS9HPJusdCb6AbMJwNdV3jZK8CKVv4+s
 5PrZNmI2rhcJSsa/W/YV090GYv95VmFJ4dRY1LIzpVMGHyWnhC+di5QaokLwUgoNSAh1
 4tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258385; x=1689850385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DGZA36U9+mS8P8FwUzMqtiJLWLWVTpus9jpYOIpJAHI=;
 b=b9hVyrII70exzptX+XuLfbj23k6av5D8b5k+RFuCR9rkW/XlHUdk24eL9/EVOs4r1f
 rmj/VBGMeJjaDH24ZnJHfq5pQ9z/IOym5Aq5A6JUgMiutibqYqdCofXEoPIvfWtJ47W4
 qEpNqAii3QP8OpqoUUIXA4urXryhukUiDsOcSla0xabef0PevtHAKe4bqIeptlXj91xd
 VnoM4MizWZ/TFtBSOB7I5EvIvNOn+GLZWpMC2jDt6CLH2HZJo32D2HF+UkAhrj6cDANp
 aOIlWYKlTDy4Xg8v53xyftPKz/oeEPB+GM9NLC13G+RIdGsOeRbhLdQWfDNzOngoUSjM
 8wXQ==
X-Gm-Message-State: AC+VfDy13ilSzS1kE0LAUsMCV6RW7ub80bC7xJuTfrqh0r4pyXgeiAbi
 8pDLURXnFDWRtd75J37O0Pqaig==
X-Google-Smtp-Source: ACHHUZ40vJmWNB5SpAS465doS632Log2ryoWnrvOSMPC8fEFO3Ml72G8Z0/MPWI1sB4NDEzcqssZtA==
X-Received: by 2002:a19:6544:0:b0:4ed:cc6d:61fe with SMTP id
 c4-20020a196544000000b004edcc6d61femr6652989lfj.24.1687258384796; 
 Tue, 20 Jun 2023 03:53:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ac2598f000000b004f60a2429d4sm322093lfn.78.2023.06.20.03.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:53:04 -0700 (PDT)
Message-ID: <58cb9077-5c39-5374-3d81-7922af9648a0@linaro.org>
Date: Tue, 20 Jun 2023 13:53:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/8] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-4-dmitry.baryshkov@linaro.org>
 <5b72eb45-d2fa-a3b7-5792-d496dbde4314@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b72eb45-d2fa-a3b7-5792-d496dbde4314@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2023 13:46, Konrad Dybcio wrote:
> On 20.06.2023 02:08, Dmitry Baryshkov wrote:
>> The max_per_pipe_ib is a constant across all CRTCs and is read from the
>> catalog. Drop corresponding calculations and read the value directly at
>> icc_set_bw() time.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> This looks good, but doesn't apply on next-20230620

Hmm. It applied w/o any issues here.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
>>   3 files changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 9902febc72c0..ba146af73bc5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>>   	memset(perf, 0, sizeof(struct dpu_core_perf_params));
>>   
>>   	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
>> -	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
>>   	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>>   
>>   	DRM_DEBUG_ATOMIC(
>> -		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
>> +		"crtc=%d clk_rate=%llu core_ab=%llu\n",
>>   			crtc->base.id, perf->core_clk_rate,
>> -			perf->max_per_pipe_ib, perf->bw_ctl);
>> +			perf->bw_ctl);
>>   }
>>   
>>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>> @@ -199,9 +198,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>   				dpu_crtc_get_client_type(tmp_crtc)) {
>>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>>   
>> -			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
>> -					dpu_cstate->new_perf.max_per_pipe_ib);
>> -
>>   			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
>>   
>>   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
>> @@ -217,7 +213,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>   	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>>   
>>   	for (i = 0; i < kms->num_paths; i++)
>> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
>> +		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
>>   
>>   	return ret;
>>   }
>> @@ -320,15 +316,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>   		 * 2. new bandwidth vote - "ab or ib vote" is lower
>>   		 *    than current vote at end of commit or stop.
>>   		 */
>> -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
>> -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
>> -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
>> -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
>> +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
>> +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
>>   			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
>>   				crtc->base.id, params_changed,
>>   				new->bw_ctl, old->bw_ctl);
>>   			old->bw_ctl = new->bw_ctl;
>> -			old->max_per_pipe_ib = new->max_per_pipe_ib;
>>   			update_bus = true;
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> index e02cc2324af2..2bf7836f79bb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> @@ -16,12 +16,10 @@
>>   
>>   /**
>>    * struct dpu_core_perf_params - definition of performance parameters
>> - * @max_per_pipe_ib: maximum instantaneous bandwidth request
>>    * @bw_ctl: arbitrated bandwidth request
>>    * @core_clk_rate: core clock rate request
>>    */
>>   struct dpu_core_perf_params {
>> -	u64 max_per_pipe_ib;
>>   	u64 bw_ctl;
>>   	u64 core_clk_rate;
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 1edf2b6b0a26..ff5d306b95ed 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1400,8 +1400,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
>>   	seq_printf(s, "core_clk_rate: %llu\n",
>>   			dpu_crtc->cur_perf.core_clk_rate);
>>   	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
>> -	seq_printf(s, "max_per_pipe_ib: %llu\n",
>> -				dpu_crtc->cur_perf.max_per_pipe_ib);
>>   
>>   	return 0;
>>   }

-- 
With best wishes
Dmitry

