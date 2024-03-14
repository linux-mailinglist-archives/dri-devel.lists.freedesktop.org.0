Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84A87B910
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0BC10F951;
	Thu, 14 Mar 2024 08:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="WrCBGqrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EB010F94E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:05:05 +0000 (UTC)
Message-ID: <58cf7cb4-7d78-4d3d-9958-1c59b7f16379@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710403502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwOkeO0IePf2MkXjAfEBO6D0e7Im063f6cASBrBdNrQ=;
 b=WrCBGqrDp2ANKiyYR5AQSRarAuqSQVUzOzobJ1n7t2AW2HaJt5yHElD0HQyqsaiDGRuAfC
 GM9wNWBpX8zh8MFa9F0NdGObWkCFftnwoul76pj6skM0d680dUe/i87ho43RRpZfxyZIGD
 ifro2Fcb4W9clJAkPfFliRODGqUhClU=
Date: Thu, 14 Mar 2024 16:04:33 +0800
MIME-Version: 1.0
Subject: Re: [v4,08/13] drm/msm/dpu: add support for virtual planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240314000216.392549-9-dmitry.baryshkov@linaro.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240314000216.392549-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/14 08:02, Dmitry Baryshkov wrote:


[...]


>   
> +/**
> + * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
> + * @rm: DPU Resource Manager handle
> + * @global_state: private global state
> + * @crtc: DRM CRTC handle
> + * @reqs: SSPP required features
> + */
> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> +					struct dpu_global_state *global_state,
> +					struct drm_crtc *crtc,
> +					struct dpu_rm_sspp_requirements *reqs);
> +
> +/**
> + * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
> + *	blocks previously reserved for that use case.
> + * @rm: DPU Resource Manager handle
> + * @crtc: DRM CRTC handle
> + * @Return: 0 on Success otherwise -ERROR
> + */

But this function do not return any value, right?


> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
> +			     struct drm_crtc *crtc);
> +
>   /**
>    * Get hw resources of the given type that are assigned to this encoder.
>    */

-- 
Best regards,
Sui

