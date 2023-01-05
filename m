Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04A65EAFF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F124210E127;
	Thu,  5 Jan 2023 12:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021610E127
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:49:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d4so28030895wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3qMRF1GNRdJeDqkXuS2/nTO+iJTQuqw4vXy5aAbbK8=;
 b=X+2PEgw8rt7VT+EdaBphMOTic4+GLKrNo5BKPs7V4isiRAFuLwaAvBB6hEhMvsxkTp
 TfkDrSAUw0xWRoTQPLvLromGbOrePs0K7f+ta91kcazZvGWcblftX3Med5BuNdwvXdw1
 N0Uwmd5JJ+ifHeVx/lfVVXJJBgQUokhffq46c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3qMRF1GNRdJeDqkXuS2/nTO+iJTQuqw4vXy5aAbbK8=;
 b=ejfVmH8lzbUn+AloyGwcKAzKanZSdTcJPt6LvNCn6ZPpFu/ovOVyNxr8UctydHZTu4
 0j2LBhhGNjWEjM7tERsg9AkGu0pIbn6tKFOPNSrQwCvvInxHfK8q/h6RdVPFkGTGxtJr
 cKh8iHFlBtZ4LzH8Y5CrpDSFjZ0vFXcVQgYwsTPeTYuKWSpc6NqSKt+Gem2XZY+C/JSX
 My20gZidq9jXHlc+SoZbjJ8RMGtWosAQ0xLUCCsU93SfKneq4xamgInhcN3YJfTLk7NO
 9Zm4WTu89L4u9uTBU4X6JN5h3nY1g9eilHn4rrYv+7is+cTeVIeXIbPDjYZvCgqYoo5N
 alsg==
X-Gm-Message-State: AFqh2kpxycwOFKB5Xa8FahaNxbLnNi5qBaVUiS0+TQE5UKwRNTQYRXcz
 WA2kXPoEEzgwgmhOeQZpgfyfVA==
X-Google-Smtp-Source: AMrXdXszzCjklGnfpRwtfSRuYLCAYmB6iRZ01GByyDPZYpy5kgOcT+REOcuLIRSEsB2bdG+WQDpvAw==
X-Received: by 2002:a5d:5965:0:b0:27f:1c70:58c3 with SMTP id
 e37-20020a5d5965000000b0027f1c7058c3mr22851191wri.24.1672922995942; 
 Thu, 05 Jan 2023 04:49:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4ccb000000b002b6bcc0b64dsm382668wrt.4.2023.01.05.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:49:55 -0800 (PST)
Date: Thu, 5 Jan 2023 13:49:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
Message-ID: <Y7bHcRAvk6GgMi5F@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20221206192123.661448-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206192123.661448-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 06, 2022 at 11:21:23AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In cases where implicit sync is used, it is still useful (for things
> like sub-allocation, etc) to allow userspace to opt-out of implicit
> sync on per-BO basis.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c        |  3 ++-
>  drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++++++++
>  include/uapi/drm/msm_drm.h           |  4 +++-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 017a512982a2..e0e1199a822f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -45,9 +45,10 @@
>   * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
>   * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
>   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
> + * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
>   */
>  #define MSM_VERSION_MAJOR	1
> -#define MSM_VERSION_MINOR	9
> +#define MSM_VERSION_MINOR	10
>  #define MSM_VERSION_PATCHLEVEL	0
>  
>  static const struct drm_mode_config_funcs mode_config_funcs = {
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index eb3536e3d66a..8bad07a04f85 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -334,9 +334,20 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  		if (ret)
>  			return ret;
>  
> +		/* If userspace has determined that explicit fencing is
> +		 * used, it can disable implicit sync on the entire
> +		 * submit:
> +		 */
>  		if (no_implicit)
>  			continue;
>  
> +		/* Otherwise userspace can ask for implicit sync to be
> +		 * disabled on specific buffers.  This is useful for internal
> +		 * usermode driver managed buffers, suballocation, etc.
> +		 */
> +		if (submit->bos[i].flags & MSM_SUBMIT_BO_NO_IMPLICIT)
> +			continue;
> +
>  		ret = drm_sched_job_add_implicit_dependencies(&submit->base,

Won't this break shrinkers and fun stuff like that? It's why we added the
new USAGE_OTHER fence slot at least, and also why I wonder whether we
shouldn't push this into the helper to make the right call. Every driver
kinda needs the same wheel.
-Daniel

>  							      obj,
>  							      write);
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index f54b48ef6a2d..329100016e7c 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -222,10 +222,12 @@ struct drm_msm_gem_submit_cmd {
>  #define MSM_SUBMIT_BO_READ             0x0001
>  #define MSM_SUBMIT_BO_WRITE            0x0002
>  #define MSM_SUBMIT_BO_DUMP             0x0004
> +#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
>  
>  #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
>  					MSM_SUBMIT_BO_WRITE | \
> -					MSM_SUBMIT_BO_DUMP)
> +					MSM_SUBMIT_BO_DUMP | \
> +					MSM_SUBMIT_BO_NO_IMPLICIT)
>  
>  struct drm_msm_gem_submit_bo {
>  	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
