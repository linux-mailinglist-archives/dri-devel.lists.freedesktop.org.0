Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F61397D0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8F6E11F;
	Mon, 13 Jan 2020 17:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673EB6E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:33:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578936835; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=w+XPcExk+Qre2Gbc4AQCx9OnrvzBE4v0GR5D1rNcKaY=;
 b=fYJU0xvAACTCYjMcq8Fs116Y1KNLukmv2alvnWQT8miF1EL8Nz5OpnuMsTJ8o8ulOVIQ63Be
 yaEc/M2rsCw+7quPmplJB9Q3WdtOnk6UIdkrs5SV5lmaP9chidk5FrWev1ux0RAtV9lu2GVU
 TK+IkjI0f0BJ/FZt+h3Pzn6m+Z4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1caa02.7f0c8c354538-smtp-out-n01;
 Mon, 13 Jan 2020 17:33:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0D92BC447A5; Mon, 13 Jan 2020 17:33:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE2EFC433CB;
 Mon, 13 Jan 2020 17:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE2EFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Jan 2020 10:33:50 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: allow zapfw to not be specified in gpulist
Message-ID: <20200113173349.GB26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Brian Masney <masneyb@onstation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 12, 2020 at 11:53:58AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices we want to require the path to come from the
> firmware-name property in the zap-shader dt node.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 456bb5af1717..c146c3b8f52b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
>  		if (ret)
>  			fw = ERR_PTR(ret);
> -	} else {
> +	} else if (fwname) {
>  		/* Request the MDT file from the default location: */
>  		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	} else {
> +		/*
> +		 * For new targets, we require the firmware-name property,
> +		 * if a zap-shader is required, rather than falling back
> +		 * to a firmware name specified in gpulist.
> +		 *
> +		 * Because the firmware is signed with a (potentially)
> +		 * device specific key, having the name come from gpulist
> +		 * was a bad idea, and is only provided for backwards
> +		 * compatibility for older targets.
> +		 */
> +		return -ENODEV;
>  	}

A possible future optimization would be to move a lot of this to the target
specific code but we can do that once we're sure that all the rest of the
fallout has bee militated.

>  
>  	if (IS_ERR(fw)) {
> @@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* Each GPU has a target specific zap shader firmware name to use */
> -	if (!adreno_gpu->info->zapfw) {
> -		zap_available = false;
> -		DRM_DEV_ERROR(&pdev->dev,
> -			"Zap shader firmware file not specified for this target\n");
> -		return -ENODEV;
> -	}
> -
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>  
> -- 
> 2.24.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
