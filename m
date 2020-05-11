Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE01CEDC1
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DB36E85B;
	Tue, 12 May 2020 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B2F89F31
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:43:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so5126158wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0fpk5Xqv9Yro05H314xa5B77PsSpk1e22VGbukZepR0=;
 b=mEYRAbohHj9FT80QIN/XzGP0RK1RJdYQ+SPBVrhjGvEG1fo/b/wSbQUryrPWgltT0o
 IkcFU/TN3+CssRVyv7w9pbFo1Ao857ZUnI61mXnTixG4CNdUkxo1TqBtb+18gV/r0s9T
 PPmzLqaj4sRqLx9LKDx1ZKjj7S/l7K66pZ7BoueguIMGC7RkhcUpGCTxIqf80k1bRJMt
 K4r7mmsbyu5ERiD9qkW6VioEmXn0IV06q0wEgK46c748II6H/HGiqFskqR/x66mf2GeN
 X68E2XP0oEEZzqsVFopP+39+jSNN9eg9gI+iHo96H/QWJXde4g2p+s6l6KmyLM09APAS
 DDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0fpk5Xqv9Yro05H314xa5B77PsSpk1e22VGbukZepR0=;
 b=UJCT8L+Na7xfLxmPAApruwxv5so0vrwKXWNkEde11ZQYm5srm06bs5PjSrPwmQd5so
 hLb/QKaSJhGHcBYQjdKEBAFU/QVhxMmwSbMxowzDzFFG78EiwPLB1KnhrnbdOZEMF2Qp
 MFQgTYpNJOsr5bxohzO8rnlFi1ePvf1tdVT8nOYck9OIT2LLDifVdEqfLG0qhO7a9JMP
 esjwgt+F6heCDYRppdJnrxQVXP0qAbb66QIevi6VnnLXO0mtmsDrA9cKMNV1jS6c0zwA
 pzPBktNssx9IzICARlD9ZBMmfVvnP+zGM3CP9dbTqG+W11C8Rph651ayzKifQlvHc0DZ
 YekQ==
X-Gm-Message-State: AGi0PuZmpxKx5Ua67UP/zngwH148aAWWqIOUzt0emv1JdC6OQAc8Flqe
 4D4UW7FYuiKb1x/vOLUJjWoprQ==
X-Google-Smtp-Source: APiQypItJDTCfkEocXHWq2r5Ng7HfPcqePb/ZXsdjVC/ZzMJj4eOCaQ+uMUlRLgbkt8pygDOHi6PUw==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr18960567wrn.297.1589204603437; 
 Mon, 11 May 2020 06:43:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id q184sm27142122wma.25.2020.05.11.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:43:22 -0700 (PDT)
Date: Mon, 11 May 2020 14:43:19 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 04/15] PM / EM: add support for other devices than
 CPUs in Energy Model
Message-ID: <20200511134319.GA29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-5-lukasz.luba@arm.com>
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

Hey Lukasz,

On Monday 11 May 2020 at 12:19:01 (+0100), Lukasz Luba wrote:
<snip>
> @@ -27,12 +29,15 @@ struct em_perf_state {
>   * em_perf_domain - Performance domain
>   * @table:		List of performance states, in ascending order
>   * @nr_perf_states:	Number of performance states
> - * @cpus:		Cpumask covering the CPUs of the domain
> + * @cpus:		Cpumask covering the CPUs of the domain. It's here
> + *			for performance reasons to avoid potential cache
> + *			misses during energy calculations in the scheduler

And because that saves a pointer, and simplifies allocating/freeing that
memory region :)

<snip>
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index 5b8a1566526a..9cc7f2973600 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -2,8 +2,9 @@
>  /*
>   * Energy Model of CPUs

Should this comment change too?

<snip>
> -static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
> +static void em_debug_create_pd(struct device *dev)
>  {
>  	struct dentry *d;
> -	char name[8];
>  	int i;
>  
> -	snprintf(name, sizeof(name), "pd%d", cpu);
> -
>  	/* Create the directory of the performance domain */
> -	d = debugfs_create_dir(name, rootdir);
> +	d = debugfs_create_dir(dev_name(dev), rootdir);

So what will be the name for the perf domain of CPUs now? cpuX?

<snip>
> @@ -142,8 +149,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>  		 */
>  		opp_eff = freq / power;
>  		if (opp_eff >= prev_opp_eff)
> -			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
> -					cpu, i, i - 1);
> +			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
> +					i, i - 1);

It feels like changing from warn to debug doesn't really belong to this
patch no?

<snip>
> @@ -216,47 +274,50 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>  	 */
>  	mutex_lock(&em_pd_mutex);
>  
> -	for_each_cpu(cpu, span) {
> -		/* Make sure we don't register again an existing domain. */
> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
> -			ret = -EEXIST;
> -			goto unlock;
> -		}
> +	if (dev->em_pd) {
> +		ret = -EEXIST;
> +		goto unlock;
> +	}
>  
> -		/*
> -		 * All CPUs of a domain must have the same micro-architecture
> -		 * since they all share the same table.
> -		 */
> -		cap = arch_scale_cpu_capacity(cpu);
> -		if (prev_cap && prev_cap != cap) {
> -			pr_err("CPUs of %*pbl must have the same capacity\n",
> -							cpumask_pr_args(span));
> +	if (_is_cpu_device(dev)) {

Something like

	if (!_is_cpu_device(dev))
		goto device;

would limit the diff a bit, but that may just be personal taste.

But appart from these nits, the patch LGTM.

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
