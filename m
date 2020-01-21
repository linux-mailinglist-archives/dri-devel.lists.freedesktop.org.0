Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC5144D69
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187F6FAE8;
	Wed, 22 Jan 2020 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFEA6EC31
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:09:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so2478021wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8os47Jh+iH/mWhGJOKaN0Ikowvgw7Dsg6piAesimf+8=;
 b=iNHLk9Soh1BgMmomizmi4fIcor2oN/NsBEzYcXn39v8n4anlIoYM5pz+LSafgd8Spu
 f+S7jCQINFEBJ4GDG4xVgihL44c++E/0Tg7Shs1Ps4QiMQ+Do8ke4XZtb91mtCCPSb17
 8jgPfcy7ylRBXPBUjDLzy7qpdgFjobOdmL+AyehNXUbus45Wmkzcz9npQK6FoRh2lfld
 RgloPfjLJuxfGsc3KMrRsmMDzHu36mcWyIeIyYDOEtja0RuhZt+1QHUg64Sy4nQtummn
 SwblUn6R1sIWp1O85xu9BZGrKNkVu0yj2lUWmC2wFXq9newsw22roQLk7hwpoD5DrjFT
 RJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8os47Jh+iH/mWhGJOKaN0Ikowvgw7Dsg6piAesimf+8=;
 b=HNvzd7Mn5ma+4rO6Igji/muMcdPqs1euk16shYOzoNZE3mouMCi4YHu1/jNgGGPtrn
 q9iAxVDtZX2GLKn1AE7SWsLHsKRCn2L3g5IHxUxewUP8oasZM3TApUrOAbMkKxtVqld5
 lYC2r6CVCPoU3rzWuJZsV5yuQrT937f81eknUw9syLxWx9e0lVZ/ghXIGQFww3xpCzzj
 rMEHKslAxHwXLuy9wx8S0Pryk3csMKM6I7A1ppjD4SCUB71ju2isKxURx9atyxefXLgt
 R4yTfvm9Aj6r1UZ4FxAQeTK4CXvHzdgwW7pyGegI/+N0qLtEBT1Lv5ZPnWWwWM7Xa/fT
 Mj1Q==
X-Gm-Message-State: APjAAAXdClHe+rtxxEdlfQH1lqoe0gy7toZPRi32bZRgAQBYKBFG/UmZ
 4oZcYCRhzKbdbU+qEqxLyWH2dwMCzYk+b+8G
X-Google-Smtp-Source: APXvYqzMOzjFtDVGl6edwO/7tSb9RrQo9+Hb9CFGAJn1i1sGI47f1x+xTj047nTS+b5NOSYS7F4xnw==
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr4493720wrs.247.1579601338751; 
 Tue, 21 Jan 2020 02:08:58 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id u18sm51454016wrt.26.2020.01.21.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 02:08:58 -0800 (PST)
Date: Tue, 21 Jan 2020 10:08:54 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121100854.GB157387@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
 <20200120152804.GB164543@google.com>
 <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
 rui.zhang@intel.com, mgorman@suse.de, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 20 Jan 2020 at 16:20:49 (+0000), Lukasz Luba wrote:
> On 1/20/20 3:28 PM, Quentin Perret wrote:
> > Agreed, this looks a bit confusing. It should be trivial to make
> > em_dev_get() (or whatever we end up calling it) work for CPUs too,
> > though. And we could always have a em_cpu_get(int cpu) API that is a
> > basically a wrapper around em_dev_get() for convenience.
> 
> The problem not only here is that we have a CPU index 'int cpu'
> and if we ask for device like:
> 
> struct device *dev = get_cpu_device(cpu);
> 
> It might be not the same device that was used during the
> registration, when we had i.e. 4 CPUs for the same policy:
>
> int cpu_id = cpumask_first(policy->cpus);
> struct device *cpu_dev = get_cpu_device(cpu_id);
> em_register_perf_domain(cpu_dev, nr_opp, &em_cb);
> 
> That's why the em_cpu_get() is different than em_get_pd(), mainly by:
> if (cpumask_test_cpu(cpu, em_span_cpus(em_pd)))
> 
> It won't be simple wrapper, let me think how it could be handled
> differently than it is now.

Right so I suppose the easiest solution would be to do the opposite of
my first suggestion. That is, make em_get_pd() call em_cpu_get() if the
device is a CPU device, or proceed to the PD list iteration for other
devices. And em_cpu_get() can remain as you originally suggested (that
is, iterate over the PDs and test the mask).

That should ensure em_get_pd() always works, em_cpu_get() is still there
handy for the scheduler and such, and the two EM lookup functions (for
CPUs or for devices) are kept cleanly separated.

Thoughts ?

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
