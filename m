Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3928377A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7686689CD5;
	Mon,  5 Oct 2020 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660589CC4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:16:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601907403; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=gjIe2ygMMO0OxoF/7nC6agXSEHwLrd1WXB+jbD6E5Co=;
 b=gWzJpdkyKRm3FsGPkeqvZJlHU+l82FPgGVGEP5u1kT2A8GtiGyISbm0NAA5doBXnoW7+zJq7
 8p0PfnEMuKCsWQp7caJZB9KuXZrlbtYnUFibLGivD+QT7NkIy04A5IBvPPQqWlZQoz6ROStl
 bo+p6KPsUHTLFUkfmkNkKzSMk1o=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f7b2acad63768e57be7c475 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:16:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6B020C433FE; Mon,  5 Oct 2020 14:16:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43500C433C8;
 Mon,  5 Oct 2020 14:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43500C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 5 Oct 2020 08:16:36 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 03/14] drm/msm: Move update_fences()
Message-ID: <20201005141636.GB4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-4-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 12:21:35PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Small cleanup, update_fences() is used in the hangcheck path, but also
> in the normal retire path.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 31fce3ac0cdc..ca8c95b32c8b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -265,6 +265,20 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
>  	return ret;
>  }
>  
> +static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> +		uint32_t fence)
> +{
> +	struct msm_gem_submit *submit;
> +
> +	list_for_each_entry(submit, &ring->submits, node) {
> +		if (submit->seqno > fence)
> +			break;
> +
> +		msm_update_fence(submit->ring->fctx,
> +			submit->fence->seqno);
> +	}
> +}
> +
>  #ifdef CONFIG_DEV_COREDUMP
>  static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>  		size_t count, void *data, size_t datalen)
> @@ -411,20 +425,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>   * Hangcheck detection for locked gpu:
>   */
>  
> -static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> -		uint32_t fence)
> -{
> -	struct msm_gem_submit *submit;
> -
> -	list_for_each_entry(submit, &ring->submits, node) {
> -		if (submit->seqno > fence)
> -			break;
> -
> -		msm_update_fence(submit->ring->fctx,
> -			submit->fence->seqno);
> -	}
> -}
> -
>  static struct msm_gem_submit *
>  find_submit(struct msm_ringbuffer *ring, uint32_t fence)
>  {
> -- 
> 2.26.2
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
