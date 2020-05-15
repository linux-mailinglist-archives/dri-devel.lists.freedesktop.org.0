Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486891D42B2
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 03:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3DC6E10C;
	Fri, 15 May 2020 01:05:39 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FD66E10C
 for <dri-devel@freedesktop.org>; Fri, 15 May 2020 01:05:37 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k19so247577pll.9
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
 b=nC6qh/RRtLo5YkFASVNTjzmS6hB2wcHOSlCr6oyH+TRQvoERZi7p4K1Xcm4kuC4zfI
 IPZu7/uOH/jDh4/sS6a6Wl7/uYnk7PYrM5mxSbz3KCnEHIgK9FBWlUpMFggDwzTHihUK
 oVuWf5zTDw/mr7UpS8XDlsrUQ8ldUVXmPUc90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
 b=d7FgSvRIeeGMGz91+ldFyUNy4Q8V/cMYSGknYpKDw5pziN+rZMKZILmGZXSEHDw1vX
 AzPOzHyvMosrAgQwWeTV3pMg7DrNnwrypbe+41KS+vE1LNxls4FGmcG8wBAGrg/NDqvK
 /db12csa1PLmZEl8YKjhgqX2gkjlDwT3e2nT/qP/h2xPBOKrAyNsfTWNQ041Xdaie9Lx
 XdsiFQAUfLmYWk1i47LLkRmnWPT20B5FO1DVdNknnAqGhhofMAXmliNapi5s1q0Jq7HR
 a2qVG0Bj4YgbVYpztIDthIgQ0D6xTgI0eEdcwS7Tm1jLBXFE9N4rAgxzkns4OuU8X37N
 bF+Q==
X-Gm-Message-State: AOAM531EGrKg7dER/wrYNu8kAE4aoz3TlCgBT323rFTteJvzCDTXqOQU
 gWX28Bh8FnzX5cVvnBRXkXj15w==
X-Google-Smtp-Source: ABdhPJwB6PAoOJYeS3qdfXHG1VARwSCyiTzJNK443oUUSG4LRJTMdwSgD9Whi8xkSHQq+C2mHa74PQ==
X-Received: by 2002:a17:90b:c90:: with SMTP id o16mr717743pjz.59.1589504737439; 
 Thu, 14 May 2020 18:05:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id g14sm363169pfh.49.2020.05.14.18.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 18:05:36 -0700 (PDT)
Date: Thu, 14 May 2020 18:05:35 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to set DDR
 bandwidth
Message-ID: <20200515010535.GX4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> This patches replaces the previously used static DDR vote and uses
> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> GPU frequency.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2d8124b..79433d3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> 
>  	gmu->freq = gmu->gpu_freqs[perf_index];
> 
> -	/*
> -	 * Eventually we will want to scale the path vote with the frequency but
> -	 * for now leave it at max so that the performance is nominal.
> -	 */
> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);

Is there a particular reason to keep this one liner in a separate patch?
I think it would make sense to squash it into "drm: msm: a6xx: send opp
instead of a frequency" and change the subject of the combined patch to
something like "drm: msm: a6xx: Scale the DDR bandwidth dynamically".
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
