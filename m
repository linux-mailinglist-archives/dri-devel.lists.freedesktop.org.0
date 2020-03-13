Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C901E186060
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081C16E221;
	Sun, 15 Mar 2020 23:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409476EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 10:04:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r15so11280140wrx.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q1BEt3UIGfTekolaIpPF/hNSscfxV9hshAR77bRQcfs=;
 b=Iro+3wZDWxCWBF3ZCk4grTtxEu8Ng2iTU/+5rxgpeCPlIMvgELtoh1xmBS6mLfYBJp
 PbKf695K0pbXUAtKLP81n78yrq39uBxyUxhVDEjljT/whkCSZqM6Jg2mOnzW6LaNCha8
 aqI0aswpcT9Wrv5bn1NFxW/5C/KUtz8ABt9I0XpHUu9fQjtK6GV3SJkyZNpqtXtNDcXm
 IPS1f3XXRq5PRyhiZhaQfY+WFVV84msB79je7IBk5pWsWkH/oJLcPrICAH9qW7Dw8tdP
 kwGJQBs+RqMQfqI3N8r8SOixaP1DgMzACMqqflMsgRcl0KTOu6NjLf5utsw9IJzFIM0H
 l7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q1BEt3UIGfTekolaIpPF/hNSscfxV9hshAR77bRQcfs=;
 b=pUrA2H+ILqnDJcwYiVa4cPuKFYOxSG96R4FbbChgW9Ouy7o2asxowbLYFl0vFQED6B
 ulOvio39BkkT1uWlBnuskdkAaIErGkYZIOm9ixzvxowSjosGrujPujqSBgdJGefA5CWA
 AaAfngoO2E8i2lAaTDcQuB+CeFLeamgJnWhfyNrAaXGNbScKbzb8iS4ysg2S/3+ovH/s
 ZjdRXfbm2TRaO/aCT7bZDFXpzuMqKyefr+H/jLytABsVcZrJqt69Sd9zk0ufSKOvliXt
 Px+EmvpSZ0dMO/6q/5fQlrgqhhJkkrUWVl9/SuXcdPhwFzdWEkom1gaFL5UAd/Uedbhb
 axOA==
X-Gm-Message-State: ANhLgQ1VlfUFteX8LHUm6hSH9dLNCl4O0k4F3yOUJqC5dyLvvzcVTY5H
 RnuDKRJq5mMx2X7m0uue0YPLEA==
X-Google-Smtp-Source: ADFU+vuSOxM7UP5iet+lNWpCxn8Nzw1dxCSR6mmfTI+siSqyYgXG1TXkJqWMlxCnj9dsZhpGWBOitA==
X-Received: by 2002:a5d:5691:: with SMTP id f17mr16399522wrv.74.1584093852416; 
 Fri, 13 Mar 2020 03:04:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id l83sm16694454wmf.43.2020.03.13.03.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 03:04:11 -0700 (PDT)
Date: Fri, 13 Mar 2020 10:04:07 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v4 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200313100407.GA144499@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309134117.2331-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukasz,

On Monday 09 Mar 2020 at 13:41:14 (+0000), Lukasz Luba wrote:
<snip>
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 9cd8f0adacae..0efd6cf6d023 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -1047,9 +1047,8 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_of_node);
>   * calculation failed because of missing parameters, 0 otherwise.
>   */
>  static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
> -					 int cpu)
> +					 struct device *cpu_dev)
>  {
> -	struct device *cpu_dev;
>  	struct dev_pm_opp *opp;
>  	struct device_node *np;
>  	unsigned long mV, Hz;
> @@ -1057,10 +1056,6 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
>  	u64 tmp;
>  	int ret;
>  
> -	cpu_dev = get_cpu_device(cpu);
> -	if (!cpu_dev)
> -		return -ENODEV;
> -
>  	np = of_node_get(cpu_dev->of_node);
>  	if (!np)
>  		return -EINVAL;
> @@ -1128,6 +1123,6 @@ void dev_pm_opp_of_register_em(struct cpumask *cpus)
>  	if (ret || !cap)
>  		return;
>  
> -	em_register_perf_domain(cpus, nr_opp, &em_cb);
> +	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, cpus);

Any reason for not checking the return value here ? You added a nice
check in scmi_get_cpu_power(), perhaps do the same thing here ?

>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_of_register_em);
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> index fe83d7a210d4..fcf2dab1b3b8 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -333,18 +333,18 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
>  		return false;
>  
>  	policy = cpufreq_cdev->policy;
> -	if (!cpumask_equal(policy->related_cpus, to_cpumask(em->cpus))) {
> +	if (!cpumask_equal(policy->related_cpus, em_span_cpus(em))) {
>  		pr_err("The span of pd %*pbl is misaligned with cpufreq policy %*pbl\n",
> -			cpumask_pr_args(to_cpumask(em->cpus)),
> +			cpumask_pr_args(em_span_cpus(em)),
>  			cpumask_pr_args(policy->related_cpus));
>  		return false;
>  	}
>  
>  	nr_levels = cpufreq_cdev->max_level + 1;
> -	if (em->nr_cap_states != nr_levels) {
> +	if (em->nr_perf_states != nr_levels) {
>  		pr_err("The number of cap states in pd %*pbl (%u) doesn't match the number of cooling levels (%u)\n",

s/cap states/performance states

> -			cpumask_pr_args(to_cpumask(em->cpus)),
> -			em->nr_cap_states, nr_levels);
> +			cpumask_pr_args(em_span_cpus(em)),
> +			em->nr_perf_states, nr_levels);
>  		return false;
>  	}

<snip>
> +static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
> +				int nr_states, struct em_data_callback *cb)
>  {
>  	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
>  	unsigned long power, freq, prev_freq = 0;
> -	int i, ret, cpu = cpumask_first(span);
> -	struct em_cap_state *table;
> -	struct em_perf_domain *pd;
> +	struct em_perf_state *table;
> +	int i, ret;
>  	u64 fmax;
>  
> -	if (!cb->active_power)
> -		return NULL;
> -
> -	pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
> -	if (!pd)
> -		return NULL;
> -
>  	table = kcalloc(nr_states, sizeof(*table), GFP_KERNEL);
>  	if (!table)
> -		goto free_pd;
> +		return -ENOMEM;
>  
> -	/* Build the list of capacity states for this performance domain */
> +	/* Build the list of performance states for this performance domain */
>  	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
>  		/*
>  		 * active_power() is a driver callback which ceils 'freq' to
> -		 * lowest capacity state of 'cpu' above 'freq' and updates
> +		 * lowest performance state of 'dev' above 'freq' and updates
>  		 * 'power' and 'freq' accordingly.
>  		 */
> -		ret = cb->active_power(&power, &freq, cpu);
> +		ret = cb->active_power(&power, &freq, dev);
>  		if (ret) {
> -			pr_err("pd%d: invalid cap. state: %d\n", cpu, ret);
> +			dev_err(dev, "EM: invalid perf. state: %d\n",
> +				ret);

Not easy to figure out which device has a problem with this. I'm
guessing you went that way since this is called before ida_simple_get() ?
Could that be refactored to make the error message more useful ?

>  			goto free_cs_table;
>  		}

<snip>
> +/**
> + * em_unregister_perf_domain() - Unregister Energy Model (EM) for the device
> + * @dev		: Device for which the EM is registered
> + *
> + * Try to unregister the EM for the specified device (it checks current
> + * reference counter). The EM for CPUs will not be freed.
> + */
> +void em_unregister_perf_domain(struct device *dev)
> +{
> +	struct em_device *em_dev, *tmp;
> +
> +	if (IS_ERR_OR_NULL(dev))
> +		return;
> +
> +	/* We don't support freeing CPU structures in hotplug */
> +	if (_is_cpu_device(dev))
> +		return;

Can we WARN() here ?

> +
> +	mutex_lock(&em_pd_mutex);
> +
> +	if (list_empty(&em_pd_dev_list)) {
> +		mutex_unlock(&em_pd_mutex);
> +		return;
> +	}
> +
> +	list_for_each_entry_safe(em_dev, tmp, &em_pd_dev_list, em_dev_list) {
> +		if (em_dev->dev == dev) {
> +			kref_put(&em_dev->kref, _em_release);
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&em_pd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(em_unregister_perf_domain);

Otherwise this looks pretty good to me. So, with these small nits
addressed:

  Acked-by: Quentin Perret <qperret@google.com>

Thanks!
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
