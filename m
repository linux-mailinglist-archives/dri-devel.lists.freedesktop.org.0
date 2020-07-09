Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DF21B0C0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0976EB7E;
	Fri, 10 Jul 2020 07:53:55 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9EB6EB2C
 for <dri-devel@freedesktop.org>; Thu,  9 Jul 2020 20:05:47 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id u8so1527733qvj.12
 for <dri-devel@freedesktop.org>; Thu, 09 Jul 2020 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
 b=AhNQ3fbwpzkEIcm+5ODN2ebHaNffsSaihE9J64OOIAKCSrPOSi8UTKlTBg+IOFXo9t
 5bjjk0weUCuGjLom8mO3n25mxkCZmksLojflbh+6QCihWuuzCh0ut7Do9/4MUH9uccBR
 bBPDd5Twd+Cbygxijcpwr3A11Rjp0BYBxDFWkVNH+XYp6OstTJeK2RnMGDUNmPdn9/pC
 C5py86ce/WHUUfwQNnkMrv0D5p/H4i/o21HHeP9NzG5bCDisxZgP7a9fEfN1lP29epEn
 E5qBcFQSAVhLpxnKd+CBvjfwNG6AgFsvOtC7UZuWlI5TTwoOj9pJVUXPhZS7mVHl0uAX
 sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PycHeytyEXnAfxuN7qqf3DZk4rAs+Sr/OQVpihKvwZY=;
 b=oS4Nf5O3H6dwyj9b+HIU1KHnJAe4JklpnIMmqoys8r8+U7GUfOO0hYFEDfORhwYzOC
 to/7OY003+W+9tMC/iYT3EvUGBin6JsVJvNFRgPFPTVsybTpCmJU6BSzOgxHZwjY9okU
 WFYcUqDBjq809XPlNkJ0e4Lq6+vo5fIwrg9zEFs70Lx8CN3RL+pqF9iLN8A19xc5iU4p
 o51Y7eApxUsP+aAcqenGVvYlfcFu+JrMHsk+b2LhdtGoRg5c7+EVzAXeFbkk+pi5bk3g
 N1USeyTiuRu3hPDi8y8UTO52tWrNRmnPzAlVGie/7g1luEOBmNiOLL7cuiLzamQqSPeP
 D4yA==
X-Gm-Message-State: AOAM531i0Q6NvkBjEGqrHveQTIl0+rQMO94VEVUCz+r3PFbGJZZ6b6to
 knauKI1GMbaUvKNc1638dPnfEQ==
X-Google-Smtp-Source: ABdhPJxcQip3en72uHZuZNYNwMWZgp8T1yNScrJF7eAeMu6gqoKUSdmJo+0p2Tl8FLdWhxkvOaeMpQ==
X-Received: by 2002:a0c:fa84:: with SMTP id o4mr64584468qvn.186.1594325146682; 
 Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id a185sm4702422qkg.3.2020.07.09.13.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 13:05:46 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through hfi
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
Date: Thu, 9 Jul 2020 16:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, sibis@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/20 4:00 PM, Akhil P Oommen wrote:
> Newer targets support changing gpu frequency through HFI. So
> use that wherever supported instead of the legacy method.
> 

It was already using HFI on newer targets. Don't break it in one commit 
then fix it in the next.

> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 233afea..b547339 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -121,6 +121,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   		if (gpu_freq == gmu->gpu_freqs[perf_index])
>   			break;
>   
> +	if (!gmu->legacy) {
> +		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +		return;
> +	}
> +
>   	gmu->current_perf_index = perf_index;
>   	gmu->freq = gmu->gpu_freqs[perf_index];
>   
> @@ -893,10 +899,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>   	enable_irq(gmu->hfi_irq);
>   
>   	/* Set the GPU to the current freq */
> -	if (gmu->legacy)
> -		a6xx_gmu_set_initial_freq(gpu, gmu);
> -	else
> -		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> +	a6xx_gmu_set_initial_freq(gpu, gmu);
>   
>   	/*
>   	 * "enable" the GX power domain which won't actually do anything but it
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
