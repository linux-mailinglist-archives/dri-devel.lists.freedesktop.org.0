Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A815714B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084C89B12;
	Mon, 10 Feb 2020 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F586EAA8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 12:04:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so2481977wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 04:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R5h5Hhfr0C30ek8CnrJ517u633l7rUglq+J5+Ky2pSU=;
 b=TSdbH1Lsaj15vZh5emaVkjGWlxSCoTfeQeU3gLRTOwpLcnalRwRfArvK9g5tD84AOV
 WzchK0g1R/Nf9Yh7XJ7gZdrKTnE5132QPOMWe1IMFEW1YVOlkqSD6Xq/h4ebN0X5R1uF
 xgcBnxLit2Kbh011VO7HArzZ+pDTDnOJQNDegC5p9Ccon1asad7i++4EikadZCvIR67P
 F4kWIKeFyJtka5J2x1HDSTUR1ygNZKGeEVglBen++7LlgN7+Uo89775vErlaxUjeRIlh
 BbFXlo3pol7vA/SyXDgkEsk6a8HQehBiLNeUS7zEhsloDDmBcf0aVwezLGxLuJJLzy5L
 0U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R5h5Hhfr0C30ek8CnrJ517u633l7rUglq+J5+Ky2pSU=;
 b=KVXrEPRnHgVCHOP8rNrk1T7gC3I0Dh4CJ+xeyfPTMa+XdC79gIL5C0M+VOa5uhTBxP
 COYtKMGGSrPtUjwM6ixlOTuyCT+nWFMJuLwC5l1YFSocDY01u4yVfVeRe4D7uyJJt1F4
 6eb+qJS9qr/nFYNhFX32xSF+sgWTs/ThY0Zmg9hE1x+rwfPngFKTFKNiFdB1upzkFCIv
 76L8bm3H3oZKAhfNdjpMXqtUsNR5NfRhK9b9V+19siTR3iXd7kmfyWvWmLnApx2DzfJk
 RBQVVAXIrhiv+Ch708fPklvorNNYgq3gTzkQ5oJdd38ShtRfkH3X53MLxAkZ1YzBsdaR
 eQ3Q==
X-Gm-Message-State: APjAAAVkN2xtq6vGgn466SZOu+8dnT5dfYZDQrtEnSd7QTWPob/9LCGL
 MaJF0+CEc3lNBmwIsh4q/B7gmw==
X-Google-Smtp-Source: APXvYqwtC2bAQXniWiUc5oiGG0sJlgv9qLGg10xcRaZ8yTuXclNOUd0zGaxgEu16v3Q2wEfpyVEgZw==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr4060275wmg.86.1581077074857;
 Fri, 07 Feb 2020 04:04:34 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id e18sm3052153wrw.70.2020.02.07.04.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 04:04:33 -0800 (PST)
Date: Fri, 7 Feb 2020 12:04:30 +0000
From: Quentin Perret <qperret@google.com>
To: lukasz.luba@arm.com
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
Message-ID: <20200207120430.GA242912@google.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206134640.11367-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 bsegall@google.com, alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday 06 Feb 2020 at 13:46:37 (+0000), lukasz.luba@arm.com wrote:
>  2. Core APIs
> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>  Drivers are expected to register performance domains into the EM framework by
>  calling the following API::
>  
> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
> -			      struct em_data_callback *cb);
> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
> +		struct em_data_callback *cb, cpumask_t *cpus);
>  
> -Drivers must specify the CPUs of the performance domains using the cpumask
> +Drivers must specify the device pointer of the performance domains as first

I find this sentence a little odd no?

>  argument, and provide a callback function returning <frequency, power> tuples
> -for each capacity state. The callback function provided by the driver is free
> +for each performance state. The callback function provided by the driver is free
>  to fetch data from any relevant location (DT, firmware, ...), and by any mean
> -deemed necessary. See Section 3. for an example of driver implementing this
> +deemed necessary. For other devices than CPUs the last argumant must be set to

s/argumant/argument

> +NULL. Only for CPUfreq drivers it is obligatory to specify the cpumask.

Please note that as of today nothing mandates the caller to be a CPUFreq
driver -- it could be anything in theory. I'd say 'only for CPU devices'
instead.

<snip>
> @@ -24,51 +27,65 @@ struct em_cap_state {
>  
>  /**
>   * em_perf_domain - Performance domain
> - * @table:		List of capacity states, in ascending order
> - * @nr_cap_states:	Number of capacity states
> - * @cpus:		Cpumask covering the CPUs of the domain
> + * @table:		List of performance states, in ascending order
> + * @nr_perf_states:	Number of performance states
> + * @priv:		In case of EM for CPU device it is a Cpumask
> + *			covering the CPUs of the domain

Could you turn @priv back into 'unsigned long priv[0];' and keep the
allocation as it is today ? That is, append the cpumask to the struct.

This empty pointer for non-CPU devices is just wasted space, and pointer
chasing isn't good for your caches. Given that you pre-allocate the pd
in em_create_pd() you could just have a special case for CPUs there I
suppose. And _is_cpu_em() will have to check the bus like you did in v1.

>   *
> - * A "performance domain" represents a group of CPUs whose performance is
> - * scaled together. All CPUs of a performance domain must have the same
> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
> - * CPUFreq policies.
> + * In case of CPU device, a "performance domain" represents a group of CPUs
> + * whose performance is scaled together. All CPUs of a performance domain
> + * must have the same micro-architecture. Performance domains often have
> + * a 1-to-1 mapping with CPUFreq policies.
> + * In case of other devices the 'priv' field is unused.
>   */
>  struct em_perf_domain {
> -	struct em_cap_state *table;
> -	int nr_cap_states;
> -	unsigned long cpus[0];
> +	struct em_perf_state *table;
> +	int nr_perf_states;
> +	void *priv;
>  };

<snip>
>  struct em_data_callback {
>  	/**
> -	 * active_power() - Provide power at the next capacity state of a CPU
> -	 * @power	: Active power at the capacity state in mW (modified)
> -	 * @freq	: Frequency at the capacity state in kHz (modified)
> -	 * @cpu		: CPU for which we do this operation
> +	 * active_power() - Provide power at the next performance state of a
> +	 *		    device
> +	 * @power	: Active power at the performance state in mW (modified)
> +	 * @freq	: Frequency at the performance state in kHz (modified)
> +	 * @dev		: Device for which we do this operation (can be a CPU)
>  	 *
> -	 * active_power() must find the lowest capacity state of 'cpu' above
> +	 * active_power() must find the lowest performance state of 'dev' above
>  	 * 'freq' and update 'power' and 'freq' to the matching active power
>  	 * and frequency.
>  	 *
> -	 * The power is the one of a single CPU in the domain, expressed in
> -	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
> -	 * range.
> +	 * In case of CPUs, the power is the one of a single CPU in the domain,
> +	 * expressed in milli-watts. It is expected to fit in the
> +	 * [0, EM_MAX_POWER] range.
>  	 *
>  	 * Return 0 on success.
>  	 */
> -	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
> +	int (*active_power)(unsigned long *power, unsigned long *freq,
> +			    struct device *dev);

Given that you've made explicit in the doc of struct em_perf_state that
'power' can be a 'total' value (static + dynamic), this could be renamed
I suppose.

<snip>
>  /**
>   * em_cpu_get() - Return the performance domain for a CPU
>   * @cpu : CPU to find the performance domain for
>   *
> - * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
> + * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
>   * exist.
>   */
>  struct em_perf_domain *em_cpu_get(int cpu)
>  {
> -	return READ_ONCE(per_cpu(em_data, cpu));

Since CPU perf domains are guaranteed to never go away, it'd be safe to
keep that per-CPU variable and avoid the locking and list manipulation
below. No strong opinion, though.

> +	struct em_device *em_dev;
> +
> +	mutex_lock(&em_pd_mutex);
> +
> +	if (list_empty(&em_pd_dev_list))
> +		goto unlock;
> +
> +	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
> +		if (!_is_cpu_em(em_dev->em_pd))
> +			continue;
> +
> +		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
> +			mutex_unlock(&em_pd_mutex);
> +			return em_dev->em_pd;
> +		}
> +	}
> +
> +unlock:
> +	mutex_unlock(&em_pd_mutex);
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(em_cpu_get);

<snip>
>  /**
> - * em_register_perf_domain() - Register the Energy Model of a performance domain
> - * @span	: Mask of CPUs in the performance domain
> - * @nr_states	: Number of capacity states to register
> + * em_register_perf_domain() - Register the Energy Model (EM) of a performance
> + *		domain for the device
> + * @dev		: Device for which the EM is to register
> + * @nr_states	: Number of performance states to register
>   * @cb		: Callback functions providing the data of the Energy Model
> + * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
> + *		obligatory. It can be taken from i.e. 'policy->cpus'. For other

It should be policy->related_cpus actually (or 'real_cpus' even) -- PM_EM
ignores hotplug ATM. Perhaps we should document that somewhere ...

> + *		type of devices this should be set to NULL.
>   *
>   * Create Energy Model tables for a performance domain using the callbacks
>   * defined in cb.
> @@ -196,63 +361,129 @@ EXPORT_SYMBOL_GPL(em_cpu_get);

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
