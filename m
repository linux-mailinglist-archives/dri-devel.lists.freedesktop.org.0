Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53F2837C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E538489DFA;
	Mon,  5 Oct 2020 14:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCAD89DED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:29:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601908143; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Du5NtEFvNYmCUvOsD7gLJswyvJ7gQ2zl+ZNfqLu9afE=;
 b=FcHRsWIAER5tse4XxFNWTgqF/CvnX8w3kczwMiJaRJNfpuAKdCdCDeG6XfnILX4YYDVCNSms
 89i5/rHCuQUKVeU2zTYU/sRavfyj0Rd8HPBvpq7OujW11bSBQrX3bTvJbAZk6NlA/TsZ40ki
 mGEkLQGrPshdXndlasBYFo7DxDY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7b2daf4f8cc67c31bea90c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:29:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DA350C43387; Mon,  5 Oct 2020 14:29:02 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 19C61C433C8;
 Mon,  5 Oct 2020 14:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19C61C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 5 Oct 2020 08:28:58 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 08/14] drm/msm: Remove obj->gpu
Message-ID: <20201005142858.GG4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-9-robdclark@gmail.com>
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

On Sun, Oct 04, 2020 at 12:21:40PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It cannot be atomically updated with obj->active_count, and the only
> purpose is a useless WARN_ON() (which becomes a buggy WARN_ON() once
> retire_submits() is not serialized with incoming submits via
> struct_mutex)

Somebody will prove me wrong but the longer we go without 2D the less likely it
is that we'll ever see it.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 2 --
>  drivers/gpu/drm/msm/msm_gem.h | 1 -
>  drivers/gpu/drm/msm/msm_gpu.c | 5 -----
>  3 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b04ed8b52f9d..c52a3969e60b 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -753,7 +753,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>  
>  	if (!atomic_fetch_inc(&msm_obj->active_count)) {
>  		mutex_lock(&priv->mm_lock);
> -		msm_obj->gpu = gpu;
>  		list_del_init(&msm_obj->mm_list);
>  		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
>  		mutex_unlock(&priv->mm_lock);
> @@ -769,7 +768,6 @@ void msm_gem_active_put(struct drm_gem_object *obj)
>  
>  	if (!atomic_dec_return(&msm_obj->active_count)) {
>  		mutex_lock(&priv->mm_lock);
> -		msm_obj->gpu = NULL;
>  		list_del_init(&msm_obj->mm_list);
>  		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
>  		mutex_unlock(&priv->mm_lock);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index e05b1530aca6..61147bd96b06 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -64,7 +64,6 @@ struct msm_gem_object {
>  	 *
>  	 */
>  	struct list_head mm_list;
> -	struct msm_gpu *gpu;     /* non-null if active */
>  
>  	/* Transiently in the process of submit ioctl, objects associated
>  	 * with the submit are on submit->bo_list.. this only lasts for
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index fd3fc6f36ab1..c9ff19a75169 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -800,11 +800,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  		struct drm_gem_object *drm_obj = &msm_obj->base;
>  		uint64_t iova;
>  
> -		/* can't happen yet.. but when we add 2d support we'll have
> -		 * to deal w/ cross-ring synchronization:
> -		 */
> -		WARN_ON(is_active(msm_obj) && (msm_obj->gpu != gpu));
> -
>  		/* submit takes a reference to the bo and iova until retired: */
>  		drm_gem_object_get(&msm_obj->base);
>  		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
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
