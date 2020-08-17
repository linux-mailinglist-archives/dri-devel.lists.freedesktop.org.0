Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF83246DB3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 19:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4C789D4B;
	Mon, 17 Aug 2020 17:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4689D44
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:11:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597684263; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=IqsNUvABr0OrpoE56YQ1186lSjWEeIkkE5qYTPlZ1U4=;
 b=Ae2OoQ+U1/a1XiMPhGVVf2vRKJwry+1DPXuKm0wKUn2KAmN7o+a0RSGZc7Qb/dqc6jyCmGS7
 YTd0qqE+oiuykT70DvldoYWJefr0xRCqz47ftrPt4eE55RV0dOSJDKqolWbSqIgtyUJagedX
 Y2p04ZJwL15ml3xW87XSSV99PdU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f3aba26cbcd42bdeeec8124 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 17:11:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5148EC43391; Mon, 17 Aug 2020 17:11:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4EE4C433C6;
 Mon, 17 Aug 2020 17:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4EE4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 11:10:56 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: make ringbuffer readonly
Message-ID: <20200817171056.GA7438@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200817162309.362032-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817162309.362032-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 09:23:09AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The GPU has no business writing into the ringbuffer, let's make it
> readonly to the GPU.

Yep. There are some additional things we can do in the a6xx family to make this
even more robust but for the vast majority of targets out in this world this is
a good and necessary fix.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index e397c44cc011..39ecb5a18431 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -27,7 +27,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	ring->id = id;
>  
>  	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
> -		MSM_BO_WC, gpu->aspace, &ring->bo, &ring->iova);
> +		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &ring->bo,
> +		&ring->iova);
>  
>  	if (IS_ERR(ring->start)) {
>  		ret = PTR_ERR(ring->start);
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
