Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B848B3B310
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78210EB42;
	Fri, 29 Aug 2025 06:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rd4NlY8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0710EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:13:17 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b4d1e7d5036so95896a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756447997; x=1757052797; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
 b=Rd4NlY8fbk8XUeFtGpE2XtDuhOhndXL5pZjVxooUFfjpitJx61P1AmNwj+o1bqUNzt
 21b0ExMSucmMJDYJmeTjlLRFbfpMkReysEOXepMJuZ/6RAjYpQ9/U+BVxqGShtNki2S2
 MKvNQ1k1RAT4DKhT3uSPGjXDSeVSgB81mPALxoptTjmp27snLTKmCErZcqnJIIkIkOn2
 cBRanGmevFEyKq45jn9wkeMXY9ErsVbn/YWs5wFPVXx5tOn+uHRGdge7ACFkWH8jNuoQ
 q/+kIP8TYMPQxmK4E9iUzCSlj5e7fJqssQ1GvkFBUhaX36ccxmfDq2BMPye3JN5Tp569
 CmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756447997; x=1757052797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
 b=YYrSmubnwSCdXKMVa5B31Rao5j2fwuuRz+FlioAD6JLuoZcKZu4a5f1RNw5lI/ILIx
 kSrGa0f5g23lL3K+dLEoTewdrlfanh5uKmShjsN0GjECkLQaRNRLN80aUH+YcyLjEiSf
 /2ZBHBbh1zDvzhEVfBlqt6GcW79A4zavKIcdd1uDlo+om4WOuzvEzrOdVaOjavP8mSlL
 fHCDHi+OQwirni5EwKs7EOsNx7qtJNSrWQdZBB8HgI2uvzSzh9j6m8UXrdSq4ffkSIEq
 ZjCxUZhutcIw2NRDo6aOQXQAAhf8lojF3m/ZBSskfpL0gbO9huCsPLJim5ZT/ysSz1Mc
 t2Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX92s70jNzKV/NHK54OIXvaOj1XqJmdJC889+8ipR6eSKjxRvhbsVeGwJgNVTeIdMxpyMf4dhrHApg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRRiW0YN2BTN/dmltgf6x76eczoWmhnxY5VR9satsvz8T/uxWg
 fBN0o6S6qlvd0Uy+ylgZe/OHK8wNupsaJdUusqoIcKJb9tzTQSMDP50PBDy4l56oXac=
X-Gm-Gg: ASbGncuFivWpKzUfjMGp8a7osadF4NeMSBzdh5Zg5GpDzspWrr1di2qGBrhf2xE4lDf
 msMfgo+ShrUmuGbTnU0JxSWWAHGcHl299ljqL2MCe1wyhzq1gZxGPdivbbhAgG3jlV3l/POmht2
 e21D+4W5qLWiEWWTXNeskcVAiUnx1q6MpyynXUJbramd1hWgDlxbDCet/XyvIFv0ADSzOHrzg4g
 vlBPCg3NZo1o+bqaPh86ho9ixpooli54Sv8cgdXefgeEVCrENb50PpyCSrLJS/GCvJ8QqVqZ7K4
 SvS8fxr4NR2PJZDxXcf3+KkzcKr9Y1f4zOnn26xTAzAp3JaXickO50bTtKdAoErvKsHmjTPJpAl
 CPMGSGGnW9sBoWx+lqs5mtmg8jQ2nW8NDTS0=
X-Google-Smtp-Source: AGHT+IFWh4jzpCyQazo33Du3vwJOQK6BMtgUKuJSYiyNvSKeAM+9t6q52OKXzZUwBWVIjDVwh5LnnA==
X-Received: by 2002:a17:903:248:b0:248:7018:c739 with SMTP id
 d9443c01a7336-2487018c906mr177164055ad.28.1756447996693; 
 Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm13362715ad.112.2025.08.28.23.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:43:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] cpufreq: s5pv210: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061313.bloyct5htjym6b3j@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-11-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-11-zhangzihuan@kylinos.cn>
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

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 76c888ed8d16..95f1568e9530 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -555,7 +555,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  						 unsigned long event, void *ptr)
>  {
>  	int ret;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
>  	policy = cpufreq_cpu_get(0);
>  	if (!policy) {
> @@ -564,7 +564,6 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  	}
>  
>  	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> -	cpufreq_cpu_put(policy);
>  
>  	if (ret < 0)
>  		return NOTIFY_BAD;

Merged with minor change:

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 95f1568e9530..4215621deb3f 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -554,10 +554,9 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
                                                 unsigned long event, void *ptr)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
        int ret;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);

-       policy = cpufreq_cpu_get(0);
        if (!policy) {
                pr_debug("cpufreq: get no policy for cpu0\n");
                return NOTIFY_BAD;

-- 
viresh
