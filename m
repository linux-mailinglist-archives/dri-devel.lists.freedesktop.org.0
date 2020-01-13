Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E5139826
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A3589B96;
	Mon, 13 Jan 2020 17:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B53A89AEE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:55:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578938127; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=hhV7louupacu1XrOTKOPtlsP0IGei6JTdzbFTbyzEUI=;
 b=sw4M0qT/FnPEZybV4J1X/yddP+FnK1hz0ttrN7ysFMc7u0yESJ1zTHUeqeI3UXE4azpEKgoe
 RVhgxhdEiiWzwObPmPvKzYxGbG7SehbUkR6fWRdKvq5su+W/1vPmPJSuWAxYkxGaiSvNxCi7
 Tr9enVKHqpUPHKi3Yjr0wbK1LE8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1caf0e.7f30e07c4df8-smtp-out-n02;
 Mon, 13 Jan 2020 17:55:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 56B9FC4479F; Mon, 13 Jan 2020 17:55:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE4FC447A2;
 Mon, 13 Jan 2020 17:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DE4FC447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Jan 2020 10:55:22 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Brian Ho <brian@brkho.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: Add a GPU-wide wait queue
Message-ID: <20200113175522.GD26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Ho <brian@brkho.com>,
 freedreno@lists.freedesktop.org, robdclark@chromium.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 hoegsberg@chromium.org, Sean Paul <sean@poorly.run>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-2-brian@brkho.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113153605.52350-2-brian@brkho.com>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 10:36:04AM -0500, Brian Ho wrote:
> This wait queue is signaled on all IRQs for a given GPU and will be
> used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
> until the value at a given iova reaches a certain condition.
> 
> Signed-off-by: Brian Ho <brian@brkho.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
>  drivers/gpu/drm/msm/msm_gpu.h | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a052364a5d74..d7310c1336e5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  static irqreturn_t irq_handler(int irq, void *data)
>  {
>  	struct msm_gpu *gpu = data;
> +	wake_up_all(&gpu->event);
> +

I suppose it is intentional to have this happen on *all* interrupts because you
might be using the CP interrupts for fun and profit and you don't want to plumb
in callbacks?  I suppose it is okay to do this for all interrupts (including
errors) but if we're spending a lot of time here we might want to only trigger
on certain IRQs.


>  	return gpu->funcs->irq(gpu);
>  }
>  
> @@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	spin_lock_init(&gpu->perf_lock);
>  
> +	init_waitqueue_head(&gpu->event);
> +
>  
>  	/* Map registers: */
>  	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c9dc8..60562f065dbc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -104,6 +104,9 @@ struct msm_gpu {
>  
>  	struct msm_gem_address_space *aspace;
>  
> +	/* GPU-wide wait queue that is signaled on all IRQs */
> +	wait_queue_head_t event;
> +
>  	/* Power Control: */
>  	struct regulator *gpu_reg, *gpu_cx;
>  	struct clk_bulk_data *grp_clks;
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
