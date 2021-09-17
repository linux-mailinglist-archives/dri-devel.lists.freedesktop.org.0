Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5740FF4C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4126EE63;
	Fri, 17 Sep 2021 18:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDDA6EE66
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:23:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631903042; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lA9m8iW0h+GpB3q/tv02Ab4h8KK1vfBdEm/JgwArBvI=;
 b=pgb/HbKdoolPMD+ZalULwpMbdR7JzKSYOm2rv0VweaIG+y52eSViiaPDU5Uogz1lTWN/tWio
 v3wXSiW/XxaJ0tMYSY8YvnnNnYNLk6bvQD7Kkiw8HDUBrFMpO+0II8BjtxF9wTbSoGEzRsiZ
 JYnF4uP1+M+3ieX7PPpwcl5H9ug=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6144dd2eb585cc7d24b0a102 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:23:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B34E5C4314C; Fri, 17 Sep 2021 18:23:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3A1AC43639;
 Fri, 17 Sep 2021 18:23:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2021 11:23:38 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, freedreno@lists.freedesktop.org, Rob Clark
 <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [RESEND PATCH v6 04/14] drm/msm/dpu: Replace
 definitions for dpu debug macros
In-Reply-To: <20210721175526.22020-5-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-5-sean@poorly.run>
Message-ID: <745692f677884badc0829193842967dd@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The debug messages shouldn't be logged as errors when debug categories
> are enabled. Use the drm logging helpers to do the right thing
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run
> #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..c33164d3944a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,27 +31,15 @@
>   * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
>   * @fmt: Pointer to format string
>   */
> -#define DPU_DEBUG(fmt, ...)                                            
>     \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
> 
>  /**
>   * DPU_DEBUG_DRIVER - macro for hardware driver logging
>   * @fmt: Pointer to format string
>   */
> -#define DPU_DEBUG_DRIVER(fmt, ...)                                     
>     \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> -			DRM_ERROR(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> -
> -#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> +#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, 
> ##__VA_ARGS__)
> +
> +#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
> 
>  /**
>   * ktime_compare_safe - compare two ktime structures
