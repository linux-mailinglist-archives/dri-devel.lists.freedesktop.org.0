Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0209958F2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6D610E08E;
	Tue,  8 Oct 2024 21:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="iMrmLS85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21F9610E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1728421817; bh=lp34xle93S64JDLrFewD47jcAq158vsvHfk6XjoYYqs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iMrmLS853loo0HAldVopE0pLNxAhpMt24hXWKsvcwmLTsDeZSG04JOrEnQzzfggRM
 ofvMczhyer48zQmPTwav/TKFaxsM+EIr3gfFL4XT70bkSsmLLPGFNJ7WjavDMoMXCM
 XQj1sjDApUXfQPp+bZ9WnjJA9yXBjNE/hIClhpddnYP9KfkxP0YeMO/au0d56okYC/
 qkQxZSz5pjO76hqsBrUoSvDeO2xJn75o6Qu7EDdM0HN/Dudg+Kzas2c6zOezzHn4Bn
 5jvoz2IBa5x8DhtrRiA9lEciZ/UWnlwAI3PGdL4AtFfyu4jXOV5J2k9oDKeVFTwzPh
 mo8xWu4/HRz3OP9zDqYMRDBMRIlNnwV3+AIOeQdvulDyarO1aThWhkV5pAuVhXcUA+
 +pqKIRRBEC+v6oZ/v7kD2bDp0laVA6SrCU4fFKgDQefPxpu9jw3yMbYqwcIREvi0yc
 AuuImkurDVtHLpF1zlV80lmB3YzYkWGNusrV3ztK3u1DWiojUqrYdfoyuNTXhBHF0B
 CmQueOQvzubkRB4/wkqS/xyXAQS7QeAZB1u41plaYuyhn3uT/u1+TkUiBqlpaazMSU
 tkjLb6hx2PgM+lGKL6qNtLeILttuJOm75VODMsxHEkzkCRln8oiywPxcg1ftROmPM6
 J4Q+Tp55TrdaQoWq+2JNaWVc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 0420C16B16D;
 Tue,  8 Oct 2024 23:10:16 +0200 (CEST)
Message-ID: <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
Date: Tue, 8 Oct 2024 23:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -7,6 +7,7 @@
>   #include "a6xx_gpu.h"
>   #include "a6xx_gmu.xml.h"
>   #include "msm_mmu.h"
> +#include "msm_gpu_trace.h"
>   
>   /*
>    * Try to transition the preemption state from old to new. Return
> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>   
>   	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>   
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>   	/*
>   	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>   	 * is skipped due to it being already in flight when requested.
> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>   	 */
>   	ring->restore_wptr = false;
>   
> +	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
> +		ring ? ring->id : -1);
> +
There is no need for the ternary operator. "ring" should be non-NULL, 
otherwise the code would have already crashed.
So the change can just be
     trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
-- 
Kees
