Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A386B1CEDB4
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9696E843;
	Tue, 12 May 2020 07:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0B06E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:57:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m12so12847640wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ETEJzrILDWcEXSuqI8CJBLVfITRJvsWlV8DeIS56yUg=;
 b=TYCFULo2Suie8IQQbYjij0fXBQIVOUeI8xv90SKGhM5ONz2C0tOD+JZgJvXZWV8rj1
 hVyNLva1zf1dfngbRmXj5nWT2LYLmXJYm7Vc5N0WBGJoZUG4D4sPk5K0DqdkpXUKs68N
 yNDAJiHCn8A02TXqcQ9lyTuTFNdWzUQNC3me3u/1RYQdyg8ABZSWn/yXuzOWlOc3IBmW
 kL+9ZFtfe+DRrR5ZQYEZqeLUyuRzdG+R/pYtfjhI/9bYEanyw2jau41e8wJJxf9efG+h
 7MEwuIBDRDzZqwEk16N8f4DzETeYRYp8/8fZ1m1afV8wanrkOItDXwjd39jiUMqFuWRK
 U3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ETEJzrILDWcEXSuqI8CJBLVfITRJvsWlV8DeIS56yUg=;
 b=uQQ0c4FDk+rANmjunyTyB+ot+UKXfKzsRhMM+xI3C2jnhDXdWODs3ox/SVPCpAVAbn
 U2oda0UI3nDYtdumWqVpu0XL/kfCDDGWfqnCNd0ypNBJmaS5pzd+9PDdYLJb9Aaa7+l7
 SYlCGbX1IPNICX60pjoTy0erWyspT0GLfp4a8pU0iIUISvfaY3LDVvwSsJCoAfVQbQTs
 llXqy6qUJv6Qx5X6FQVbZ6W0+qXvePNDK1auF3AfpavGdPIVdIVoRGw0KdxWMUFlRNBb
 hJEH86GiOOLusEPfVWoXp3hJTe4yTbgiTkAZZyjmeqwvC3tsJ7Tm5A0T4LzfTeYzVXw8
 y5FA==
X-Gm-Message-State: AGi0PuYvPwZj0nKpMXl780H6brXzkjfJ7ve9GM34BBFJE7umyYBnNh9h
 Zgi5EJBgqdcv987IC1VaPdHjsg==
X-Google-Smtp-Source: APiQypIA/BhPOSlxxVRft/M3ndyAAD/wbrIqEL1T+jhl+AK/cIZYzzYwO39nyIGbtRrwMvdTRb8hHw==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr30469520wmk.120.1589198246663; 
 Mon, 11 May 2020 04:57:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id y70sm27811096wmc.36.2020.05.11.04.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:57:25 -0700 (PDT)
Date: Mon, 11 May 2020 12:57:22 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 03/15] PM / EM: update callback structure and add
 device pointer
Message-ID: <20200511115722.GA13741@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-4-lukasz.luba@arm.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 11 May 2020 at 12:19:00 (+0100), Lukasz Luba wrote:
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 61623e2ff149..11ee24e06d12 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
>  }
>  
>  static int __maybe_unused
> -scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
> +scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
> +		   struct device *cpu_dev)
>  {
> -	struct device *cpu_dev = get_cpu_device(cpu);
>  	unsigned long Hz;
>  	int ret, domain;
>  
> -	if (!cpu_dev) {
> -		pr_err("failed to get cpu%d device\n", cpu);
> -		return -ENODEV;
> -	}
> -
>  	domain = handle->perf_ops->device_domain_id(cpu_dev);
>  	if (domain < 0)
>  		return domain;
> @@ -200,7 +195,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	policy->fast_switch_possible = true;
>  
> -	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);

So this one has no users after this patch right? I suppose you could
squash patch 05 in this one. But no big deal.

Acked-by: Quentin Perret <qperret@google.com>

> +	em_dev_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
>  
>  	return 0;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
