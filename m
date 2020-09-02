Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FC25B56A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 22:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915D6E4FF;
	Wed,  2 Sep 2020 20:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37FC6E503
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 20:41:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599079289; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ItMRyIeX4np4JSQjaT+BlHS0iWdkB//XkRrvXZ7e/40=;
 b=ODIoMWsv7kILbjYJN5dyJ/CvlqpIE4qO6C+Quh8pXJnQPeVZia4Bv59U2yOSfACw7reLUh2Y
 Q8gpuzxrq0cOsFdTpGqe+aMhRZPTDXWuKvqDg79RRlhlOKs63Ak9sXjnnqXxf+QYCzntSk7B
 G3xoInK5AgL/XI72xdTfz4E3E1s=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f500353380a624e4daf1c75 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 20:40:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 51D99C433A0; Wed,  2 Sep 2020 20:40:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F17FC433CA;
 Wed,  2 Sep 2020 20:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F17FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 2 Sep 2020 14:40:45 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/gpu: Add GPU freq_change traces
Message-ID: <20200902204045.GA22040@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200901154200.2451899-1-robdclark@gmail.com>
 <20200901154200.2451899-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901154200.2451899-2-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 08:41:54AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Technically the GMU specific one is a bit redundant, but it was useful
> to track down a bug.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 ++
>  drivers/gpu/drm/msm/msm_gpu_trace.h   | 31 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 46a29e383bfd..ab1e9eb619e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -11,6 +11,7 @@
>  #include "a6xx_gpu.h"
>  #include "a6xx_gmu.xml.h"
>  #include "msm_gem.h"
> +#include "msm_gpu_trace.h"
>  #include "msm_mmu.h"
>  
>  static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
> @@ -124,6 +125,8 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>  	gmu->current_perf_index = perf_index;
>  	gmu->freq = gmu->gpu_freqs[perf_index];
>  
> +	trace_msm_gmu_freq_change(gmu->freq, perf_index);
> +
>  	/*
>  	 * This can get called from devfreq while the hardware is idle. Don't
>  	 * bring up the power if it isn't already active
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d5645472b25d..b02866527386 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -32,6 +32,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> +	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
> +
>  	if (gpu->funcs->gpu_set_freq)
>  		gpu->funcs->gpu_set_freq(gpu, opp);
>  	else
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index 122b84789238..07572ab179fa 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -83,6 +83,37 @@ TRACE_EVENT(msm_gpu_submit_retired,
>  		    __entry->start_ticks, __entry->end_ticks)
>  );
>  
> +
> +TRACE_EVENT(msm_gpu_freq_change,
> +		TP_PROTO(u32 freq),
> +		TP_ARGS(freq),
> +		TP_STRUCT__entry(
> +			__field(u32, freq)
> +			),
> +		TP_fast_assign(
> +			/* trace freq in MHz to match intel_gpu_freq_change, to make life easier
> +			 * for userspace
> +			 */
> +			__entry->freq = DIV_ROUND_UP(freq, 1000000);
> +			),
> +		TP_printk("new_freq=%u", __entry->freq)
> +);
> +
> +
> +TRACE_EVENT(msm_gmu_freq_change,
> +		TP_PROTO(u32 freq, u32 perf_index),
> +		TP_ARGS(freq, perf_index),
> +		TP_STRUCT__entry(
> +			__field(u32, freq)
> +			__field(u32, perf_index)
> +			),
> +		TP_fast_assign(
> +			__entry->freq = freq;
> +			__entry->perf_index = perf_index;
> +			),
> +		TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
> +);
> +
>  #endif
>  
>  #undef TRACE_INCLUDE_PATH
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
