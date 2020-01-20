Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA01430A3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CC16EA2F;
	Mon, 20 Jan 2020 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF56E9BE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 15:28:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d73so12234wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 07:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w+9WBX8T8487sYdaCRBOXdftKEOOIGARUU12ptPCXoI=;
 b=WM3/QuTjf8YHugRgHr0CAc4EPmW7lL5TBdACtz7cIwWejTZRMsjvhvpYDk1vBCv8x/
 mwSEMBD6BloK3XpD4M9pIYUXdWrL2+620dZ1+sv7VzGqnDERmsL63ChlF8tg20oIUyHN
 52ASdnLuNO3Sz8qauPMfDhgnCWpxUMumc6RftxuofGduJ6V4Ri+m9/ezp6kMCpjP0Cag
 AtFqAedbPek8I2J21QlxubzVd67+p4k75DZEBCr6gQdRH2dUKnHDTWK3kJyHePYYwXMd
 8gKlHjdsZ26gCY4wieLh8B5FzXN/qNQg1wHFrQ0GWe3qX7B5O2cOpVF0DpGUbwhfDz+P
 oqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w+9WBX8T8487sYdaCRBOXdftKEOOIGARUU12ptPCXoI=;
 b=K9513BZPNb4nXAB0ko0dKrCcFpszx2V+8YqoyCIsEXZApwGP4Cl/nywbRWfH41zBlY
 7FwP56rAJ1p7FJnRr+14F6nbhxjGzKKAf2I+uw4SPQ+ZF7WFqwIkFcddUuCxEszVM/69
 UqCwE6rjDAvoZPXa4WkhE+TwbmVLtQOfX6vlghdlMCmmll6HCyfLj+AbEjgpTqQ82uiu
 B2AaQn0dTo7SSUZyKGuvx+4lU3GWrQOJLFxPqihxyFCpfF5jhNHxKz5PYQdCSQsoDTR0
 hj4cPRGl021oBVyBrF9ldv1MB1rEQrWDpdcBlLw6W6XGomcvAjIw7EANKFQGSBHDQEkZ
 fZdw==
X-Gm-Message-State: APjAAAVQY7PlDTX2vJiZ/sShRfnNr2G2fzxJtrdBLzEDRL8z3O9UlPPB
 7OMQbFyxywu4UiKNQmTOKgTSDQ==
X-Google-Smtp-Source: APXvYqxyY0xjDcRn7kSUge9Pe/ZJykQdMkCOLrQxdDGvp71dWPGzFxihXcV4Py+Y8+/t7qRz+k6uxg==
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr19453471wmg.34.1579534088409; 
 Mon, 20 Jan 2020 07:28:08 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id d14sm51225920wru.9.2020.01.20.07.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 07:28:07 -0800 (PST)
Date: Mon, 20 Jan 2020 15:28:04 +0000
From: Quentin Perret <qperret@google.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200120152804.GB164543@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
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
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 20 Jan 2020 at 15:53:35 (+0100), Dietmar Eggemann wrote:
> Would be really nice if this wouldn't be required. We should really aim
> for 1 framework == 1 set of interfaces.
> 
> What happens if someone calls em_get_pd() on a CPU EM?
> 
> E.g:
> 
>  static struct perf_domain *pd_init(int cpu)
>  {
> -       struct em_perf_domain *obj = em_cpu_get(cpu);
> +       struct device *dev = get_cpu_device(cpu);
> +       struct em_perf_domain *obj = em_pd_get(dev);
>         struct perf_domain *pd;
> 
> Two versions of one functionality will confuse API user from the
> beginning ...

Agreed, this looks a bit confusing. It should be trivial to make
em_dev_get() (or whatever we end up calling it) work for CPUs too,
though. And we could always have a em_cpu_get(int cpu) API that is a
basically a wrapper around em_dev_get() for convenience.

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
