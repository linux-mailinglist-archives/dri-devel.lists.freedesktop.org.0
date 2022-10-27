Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FF60F1CA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF24610E53D;
	Thu, 27 Oct 2022 08:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F5810E53D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:05:24 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f23so656947plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sql+Rr6DrOQzxcxiEzDTWhDssE9ABXcq2lRpWcbPbWI=;
 b=wmtMoHhM7uspTGMQFmqR0TSsTvi8olpJcfGv3QmnI7VkoQppvutu22gulZguTxBaqo
 bp1A19eJq1XK0NXfSKyjkwDK/9iLZBcdcLLIBOKLU48su51D27MLsTyxHGnB9j/+sVCq
 1Ak+9bn8icFC3cm69+GS5lvuiNmJrcOYXF77IfwsNcz+PIHtXDt6KMBYLvGznmaIDJir
 eviCsgEuD2znZrRvWvNAoikvJ4aFxr4USltgUeZfo22RHof/R3w4+ylSH2TeBm4YMLyX
 BzevUk5vw/7L7ulOExe2mLo9DvSTPL+DDxFBucivfIOYTILwDp2RK/YdfJWERD58/oI7
 2HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sql+Rr6DrOQzxcxiEzDTWhDssE9ABXcq2lRpWcbPbWI=;
 b=jpqU8lM+2Vixm4s25s8X7157KHPvKb+WK9Ho9gmfBMuicr9WAEBcfR+QBypURMZ77N
 CsnK1Z3pIN+W+oGkd5gyzgPRctHFsG3Ment1/Ytd73dqPOLJRfAYA0B8A/Ovr2zGNT96
 Sx4qVxPxYH/ksojSqAeFByGLNZbo0UuypMhBd19dVdCswf4fcaUjbCNY7cB63UMvAvnD
 eE7s1ggax49BnEclimHPFiszCFdd2nWWaDliQYu9wdLz+U+DGxgkpMKljtKmIgqkA5O1
 56RF5nRkobckVNCf9Ds/GKUXW5wf+u58xTGuHRQ1k4IJyYq63LonaUT8DUFHi4B8k46M
 husw==
X-Gm-Message-State: ACrzQf2W5xn9mdBdF6mTtnbeJ0+RI/boxouXcVFvOycmnL0I1j7xePkO
 yNyD4vi1ryHozAeZlq0F12mQ/CG6X6yEyg==
X-Google-Smtp-Source: AMsMyM71ps0bazOq0Z7yGgKMJqS6PEa1XhxiHHFqdfKJA1fG9M1vZM01GCryVNs97C/2vDe4jz/jwQ==
X-Received: by 2002:a17:902:ea02:b0:181:f8d2:1c2b with SMTP id
 s2-20020a170902ea0200b00181f8d21c2bmr49049802plg.107.1666857924316; 
 Thu, 27 Oct 2022 01:05:24 -0700 (PDT)
Received: from localhost ([122.172.87.26]) by smtp.gmail.com with ESMTPSA id
 q34-20020a635062000000b0044ba7b39c2asm531976pgl.60.2022.10.27.01.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:05:23 -0700 (PDT)
Date: Thu, 27 Oct 2022 13:35:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH v2] drm/lima: Fix opp clkname setting in case of missing
 regulator
Message-ID: <20221027080519.lfpduyt7jcwh3b4k@vireshk-i7>
References: <20221027073200.3885839-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027073200.3885839-1-nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27-10-22, 09:32, Erico Nunes wrote:
> Commit d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
> introduced a regression as it may undo the clk_names setting in case
> the optional regulator is missing. This resulted in test and performance
> regressions with lima.
> 
> Restore the old behavior where clk_names is set separately so it is not
> undone in case of a missing optional regulator.
> 
> Fixes: d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
> v2: revert back to using devm_pm_opp_set_clkname and
> devm_pm_opp_set_regulators
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index 011be7ff51e1..bc8fb4e38d0a 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -112,11 +112,6 @@ int lima_devfreq_init(struct lima_device *ldev)
>  	unsigned long cur_freq;
>  	int ret;
>  	const char *regulator_names[] = { "mali", NULL };
> -	const char *clk_names[] = { "core", NULL };
> -	struct dev_pm_opp_config config = {
> -		.regulator_names = regulator_names,
> -		.clk_names = clk_names,
> -	};
>  
>  	if (!device_property_present(dev, "operating-points-v2"))
>  		/* Optional, continue without devfreq */
> @@ -124,7 +119,15 @@ int lima_devfreq_init(struct lima_device *ldev)
>  
>  	spin_lock_init(&ldevfreq->lock);
>  
> -	ret = devm_pm_opp_set_config(dev, &config);
> +	/*
> +	 * clkname is set separately so it is not affected by the optional
> +	 * regulator setting which may return error.
> +	 */
> +	ret = devm_pm_opp_set_clkname(dev, "core");
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_opp_set_regulators(dev, regulator_names);
>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
