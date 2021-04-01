Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17D351F44
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 21:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E886ECFE;
	Thu,  1 Apr 2021 19:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C316E02C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 19:07:39 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id r17so2988530ilt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9C+FFwnBAe64h+qwHiP+qtCvnvucT5ifSE8KQCnxsp8=;
 b=C9EQAWrni2VVf/IH5dUSEExom9+aSu9C68jL+QiborrKED99S8W2GaA5rmp0M7mKXc
 nYsXjh/MsONwdIzQ+O/91MoLjiXhZqVewk0ZsaEza3Ne/fMLkwXQYk0jYzXkNkRxZJKo
 SX97pVO2pvswfSNL6cn46FCl4kpajC7RIaauZYUgWb+EzC1iJ2pUq2lOZ4p/ngHGhZOM
 +4JCAISPw204JloFi+N071TkD0FrYbWMMsiNkstYaEV9YTigdbk2TlCcBmeQs0JGzox0
 q5Fmw9eRVkAtGeSmsbov0DCU+o9I7CY8npufRTiVXbatHjx0l2f971lKkafrhMnhoAUf
 2X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9C+FFwnBAe64h+qwHiP+qtCvnvucT5ifSE8KQCnxsp8=;
 b=WoqLnrW70gB8b7B3HdPqQG5tmw1aUAnhVnG/CQoEvqaeKt2lDZmtLM0f6Bgx1/6Y+X
 /orEENm9CCEY3Fldu4bAip2gRvufj/QlPPfnWYy1uqdweAZT7kvvhMcWopMGd+1jMuta
 glJ6tFSpEBPEgs7fUaUJSFE2otq0C9SyFOW2cBlUM9X0T5WUsLehP9QVM/P6u3TmuMW0
 hJ00vDl/ihWnvdAQ21yb6lPu4QsQ0s/rcGKtYgxYDDbz2uPSb6pJXB63+7xR2tx5Jq1h
 9B9NsweNko0gF457oDWSAlXKyHQhg0CUZ4c/Dj2dsxy2P9uoBud4pO3lJnSELBunAIp2
 0MiA==
X-Gm-Message-State: AOAM530ril5FwdkXI+1iFNsX8BEcOqp77Er3Ys1f2nbMpX4nxaU9w4lI
 AIAmXM9OWeT3sRkxRzKZk7OkoQ==
X-Google-Smtp-Source: ABdhPJxiRs/x+5B2W/f1zPuC9GKMaBC8DgCx8seLEH3tteQmxTEfXXxXlf1ZnjyW6A5osVZNP0AGkg==
X-Received: by 2002:a92:d74c:: with SMTP id e12mr8081607ilq.13.1617304059115; 
 Thu, 01 Apr 2021 12:07:39 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id k6sm2972150ili.12.2021.04.01.12.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 12:07:38 -0700 (PDT)
Date: Thu, 1 Apr 2021 13:07:36 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE
 microcode
Message-ID: <20210401190736.7snhq4qqe2nvbdul@cosmicpenguin.net>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 freedreno@lists.freedesktop.org
References: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 05:02:23PM +0300, Dmitry Baryshkov wrote:
> I suppose the microcode version check for a650 is incorrect. It checks
> for the version 1.95, while the firmware released have major version of 0:
> 0.91 (vulnerable), 0.99 (fixing the issue).
> 
> Lower version requirements to accept firmware 0.99.

Ugh, my ugly.  .95 is the actual version that fixed it but since .99 is what is
going into the l-f repo it is fine to use that as a baseline.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>


> Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
> Cc: Akhil P Oommen <akhilpo@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cb2df8736ca8..896b47dc9c85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>  	}  else {
>  		/*
>  		 * a650 tier targets don't need whereami but still need to be
> -		 * equal to or newer than 1.95 for other security fixes
> +		 * equal to or newer than 0.95 for other security fixes
>  		 */
>  		if (adreno_is_a650(adreno_gpu)) {
> -			if ((buf[0] & 0xfff) >= 0x195) {
> +			if ((buf[0] & 0xfff) >= 0x095) {
>  				ret = true;
>  				goto out;
>  			}
>  
>  			DRM_DEV_ERROR(&gpu->pdev->dev,
>  				"a650 SQE ucode is too old. Have version %x need at least %x\n",
> -				buf[0] & 0xfff, 0x195);
> +				buf[0] & 0xfff, 0x095);
>  		}
>  
>  		/*
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
