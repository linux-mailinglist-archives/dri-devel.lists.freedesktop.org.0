Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A116A1416E5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B946E054;
	Sat, 18 Jan 2020 09:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F826F4F0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:54:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j42so22203534wrj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
 b=OWTd1xPAQY9tXJXOZoWIjFDzF/j5k4C12aIyvlJSkkdhXlVbD45jelTm6GVI3uVYL7
 n9xkBrIBsIRyofHDfGxI/l2E5DARRbN+kNYjfXDlt0D2NMz3tS9otMH27qG8unAMXkVK
 vbv+o0soDwEv+wngnnE6P2hSuYjaWEszgXFVB2E8sY/8BNNmwio0HXgTBeM5ojO90Xqz
 eXsC84eVsPLNozUlGBGgx1RDyImJeajA48zW6/mFqj9bm+S8xvtQCF24bQIklM7kmSQd
 UX9n+G82Jt0cw5vAEM+XOAz116BMbTc1FuSDri3NMDqzY9VqQE8QDk2hGTzsWxJxyW1O
 /sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
 b=q7Lf17mIusiZLTLI74y5Uz73WN2bE1nztQuf4jqb252j+5tQQe1qqJ+MdMgnipNUFr
 GuoUH+IhNerEEy9VpKXyhR2OgfsWjw32nva+Fwv0T6xj/f+yOGWSabtcOdZjhSWcIOoe
 ztDBnLS2oCyxac7hxp3nLkB3H881aAT9FOn495NnL57tiLRPZSoCFMn6l844E7zq42PW
 I+3JItP3Lf25A54WR3tr6utDHdaoM42PLRhiM/l+CAHJ2S0dTIbpd0uns1G6Yq/sfYdf
 W+5aVEY+q/NKnAAMFoBwTB/AP/qw8KyrfBhPfYClQcnrD8W+VI820Xk0SkHwdl73262B
 hjBw==
X-Gm-Message-State: APjAAAUOhIaw58Abj3tP4KRt+8fHkd4PVt9EGHN3TRkf/XqAGDjiCr5B
 IGP3YQxPVD1tfY1EJZU+Nc2EoQ==
X-Google-Smtp-Source: APXvYqxFsuT0KTxqOuP7M5Z4+OnjHn0WdKusB9YxUQXSRSUEjOMXSk8sV+Vlqk3Ea2XuYbdpzPevfg==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr2534273wrx.66.1579258481679; 
 Fri, 17 Jan 2020 02:54:41 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id b17sm33252857wrp.49.2020.01.17.02.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 02:54:40 -0800 (PST)
Date: Fri, 17 Jan 2020 10:54:37 +0000
From: Quentin Perret <qperret@google.com>
To: lukasz.luba@arm.com
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200117105437.GA211774@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116152032.11301-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, kernel-team@android.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lukasz,

Still reading through this, but with small changes, this looks pretty
good to me.

On Thursday 16 Jan 2020 at 15:20:29 (+0000), lukasz.luba@arm.com wrote:
> +int em_register_perf_domain(struct device *dev, unsigned int nr_states,
> +			struct em_data_callback *cb)
>  {
>  	unsigned long cap, prev_cap = 0;
>  	struct em_perf_domain *pd;
> -	int cpu, ret = 0;
> +	struct em_device *em_dev;
> +	cpumask_t *span = NULL;
> +	int cpu, ret;
>  
> -	if (!span || !nr_states || !cb)
> +	if (!dev || !nr_states || !cb || !cb->active_power)

Nit: you check !cb->active_power in em_create_pd() too I think, so only
one of the two is needed.

>  		return -EINVAL;
>  
> -	/*
> -	 * Use a mutex to serialize the registration of performance domains and
> -	 * let the driver-defined callback functions sleep.
> -	 */
>  	mutex_lock(&em_pd_mutex);
>  
> -	for_each_cpu(cpu, span) {
> -		/* Make sure we don't register again an existing domain. */
> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
> +	if (_is_cpu_device(dev)) {
> +		span = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!span) {
> +			mutex_unlock(&em_pd_mutex);
> +			return -ENOMEM;
> +		}
> +
> +		ret = dev_pm_opp_get_sharing_cpus(dev, span);
> +		if (ret)
> +			goto free_cpumask;

That I think should be changed. This creates some dependency on PM_OPP
for the EM framework. And in fact, the reason we came up with PM_EM was
precisely to not depend on PM_OPP which was deemed too Arm-specific.

Suggested alternative: have two registration functions like so:

	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
			       struct em_data_callback *cb);
	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
			       struct em_data_callback *cb);

where em_register_cpu_pd() does the CPU-specific work and then calls
em_register_dev_pd() (instead of having that big if (_is_cpu_device(dev))
as you currently have). Would that work ?

Another possibility would be to query CPUFreq instead of PM_OPP to get
the mask, but I'd need to look again at the driver registration path in
CPUFreq to see if the policy masks have been populated when we enter
PM_EM ... I am not sure if this is the case, but it's worth having a
look too.

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
