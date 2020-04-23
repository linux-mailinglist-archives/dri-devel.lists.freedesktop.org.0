Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3D1B5F86
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA876E8DB;
	Thu, 23 Apr 2020 15:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8616E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:38:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587656326; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=BRAibgfRj7aiNJ9xmqPaKVlJBsIulp+Nf9+VhQlrZxs=;
 b=qnwwlkRaux2Z2fYtjaBIWCZLTBFd23PQBGonG/PKCnawLRUyDFJ1mRTSnKN7FJtqqNHaTWRT
 aOG+97SbTWG4CdG3zWPeQYObqg4ZXrC9XqnfUvdEfWbT1IatYaJtto9jgbup7msiAOF1y0/p
 Xy48tyde7vZpP1rLkeL+6JmBCgo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b685.7f279b754ed8-smtp-out-n05;
 Thu, 23 Apr 2020 15:38:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 209DDC433F2; Thu, 23 Apr 2020 15:38:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E71B2C433D2;
 Thu, 23 Apr 2020 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E71B2C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 23 Apr 2020 09:38:38 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 4/9] drm/msm/a6xx: add A640/A650 to gpulist
Message-ID: <20200423153837.GB15079@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Brian Masney <masneyb@onstation.org>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Enrico Weigelt <info@metux.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-5-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-5-jonathan@marek.ca>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Enrico Weigelt <info@metux.net>, Wambui Karuga <wambui.karugax@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:41:22PM -0400, Jonathan Marek wrote:
> Add Adreno 640 and 650 GPU info to the gpulist.
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 24 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 +++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb3a6e597d76..1156f72532a4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -189,6 +189,30 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a630_zap.mdt",
> +	}, {
> +		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
> +		.revn = 640,
> +		.name = "A640",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a640_gmu.bin",
> +		},
> +		.gmem = SZ_1M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a640_zap.mdt",
> +	}, {
> +		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
> +		.revn = 650,
> +		.name = "A650",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
> +			[ADRENO_FW_GMU] = "a650_gmu.bin",
> +		},
> +		.gmem = SZ_1M + SZ_128K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a650_zap.mdt",
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1d5c43c22269..a7647eaacc7a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -197,7 +197,7 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>  		*value = adreno_gpu->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
> -		*value = 0x100000;
> +		*value = !adreno_is_a650(adreno_gpu) ? 0x100000 : 0;

This will likely be 0 from here on out. This is okay for now, but we might need
to consider adding the gmem base to the GPU list to avoid some ugly
conditionals.

>  		return 0;
>  	case MSM_PARAM_CHIP_ID:
>  		*value = adreno_gpu->rev.patchid |
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 9ff4e550e7bd..88ae1b2813ef 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -237,6 +237,16 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
>         return gpu->revn == 630;
>  }
>  
> +static inline int adreno_is_a640(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 640;
> +}
> +
> +static inline int adreno_is_a650(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 650;
> +}
> +
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>  const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>  		const char *fwname);
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
