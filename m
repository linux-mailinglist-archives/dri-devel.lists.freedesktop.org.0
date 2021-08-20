Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB23F2673
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 07:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA46E9F8;
	Fri, 20 Aug 2021 05:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5E06E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:18:46 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id q2so8021030pgt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=chAct3ipnxxeeUzw3hiYvmSC99rC9KHQnQdo3Qo5wI0=;
 b=PAK0FwHpNruccQOMJcEETGgiuehcBfGqSXwbOalixpfWmC8iUPHKv0ZRFhT4USGW3L
 s3ikZix1CXYk8w3jX5LaxfyZfb40GBiPWSjG9bWn3gJp9a9Md0FR48UGizRgXzY9ODgl
 10gDNc8YxX4abwwur3/2Ib4tR0HK4fxAVz95jdn0g5Bjm1f+zlmZUdf0J4uOmNCA+73o
 QmFwB0uLKerpVDInoO9o15o02ie64XpCaCSsIImcFb/KjT6Us0KvUWI0KV441DGxP1Gb
 Qjx6eoerfkbM7U/RrGe2d3xgWfRJJ6PVyX/2MvEkhvBiHXfKbkbdOk6b4KB2LrxPQeQV
 fLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=chAct3ipnxxeeUzw3hiYvmSC99rC9KHQnQdo3Qo5wI0=;
 b=aDzXNjxBVbQ27V2xbufdQj8lyQ91rCE/KGXqt7Sry0r6l5+UF+8KSOkF9RtZjP6L1v
 ysUzqeha0zGQhR7qRigEONGAd/Ti0YdFzp5RdEKyCTh8Rpq/N/5PCacmci9e5CW1gtFP
 8WH5BQMZr2hjlWm7quuZ0Wx/6pdv8Q02UxO2UA4ck7CVYcEB96qaMoDmKQFv3RS24+FE
 bh9TCcBpvyBk2dggrrEZnQ6Ed6hOpER2A1RkBm2nmfRMAAZ7EOZV1tNIdNC6x4JYBB1m
 kAT4XFjvHtWaiGjitT1+nScdqIK237+duXFwxNcOJuRopNbvqbZ8mm/yUPteQ7h4if7p
 M7NA==
X-Gm-Message-State: AOAM532dm1/3v1IVqe2CdFpGbhD02D55YGRwo/rn1nL+2sJLigHAt16B
 zl4Qh83VEqrIZesp0zo4q66pfA==
X-Google-Smtp-Source: ABdhPJwH30rFrNGt2fTNK9Na7wrgKwgjGw7543RwntMIs+dfy9PTWNVMu53RFGAQHLSof48YBaglZA==
X-Received: by 2002:a62:8283:0:b0:3e0:f3f3:839d with SMTP id
 w125-20020a628283000000b003e0f3f3839dmr17811980pfd.37.1629436725848; 
 Thu, 19 Aug 2021 22:18:45 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id i26sm5582209pfu.6.2021.08.19.22.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 22:18:45 -0700 (PDT)
Date: Fri, 20 Aug 2021 10:48:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
References: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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

On 19-08-21, 16:55, Ulf Hansson wrote:
> Right, that sounds reasonable.
> 
> We already have pm_genpd_opp_to_performance_state() which translates
> an OPP to a performance state. This function invokes the
> ->opp_to_performance_state() for a genpd. Maybe we need to allow a
> genpd to not have ->opp_to_performance_state() callback assigned
> though, but continue up in the hierarchy to see if the parent has the
> callback assigned, to make this work for Tegra?
> 
> Perhaps we should add an API dev_pm_genpd_opp_to_performance_state(),
> allowing us to pass the device instead of the genpd. But that's a
> minor thing.

I am not concerned a lot about how it gets implemented, and am not
sure as well, as I haven't looked into these details since sometime.
Any reasonable thing will be accepted, as simple as that.

> Finally, the precondition to use the above, is to first get a handle
> to an OPP table. This is where I am struggling to find a generic
> solution, because I guess that would be platform or even consumer
> driver specific for how to do this. And at what point should we do
> this?

Hmm, I am not very clear with the whole picture at this point of time.

Dmitry, can you try to frame a sequence of events/calls/etc that will
define what kind of devices we are looking at here, and how this can
be made to work ?

> > > Viresh, please take a look at what I did in [1]. Maybe it could be done
> > > in another way.
> >
> > I looked into this and looked like too much trouble. The
> > implementation needs to be simple. I am not sure I understand all the
> > problems you faced while doing that, would be better to start with a
> > simpler implementation of get_performance_state() kind of API for
> > genpd, after the domain is attached and its OPP table is initialized.
> >
> > Note, that the OPP table isn't required to be fully initialized for
> > the device at this point, we can parse the DT as well if needed be.
> 
> Sure, but as I indicated above, you need some kind of input data to
> figure out what OPP table to pick, before you can translate that into
> a performance state. Is that always the clock rate, for example?

Eventually it can be clock, bandwidth, or pstate of anther genpd, not
sure what all we are looking for now. It should be just clock right
now as far as I can imagine :)

> Perhaps, we should start with adding a dev_pm_opp_get_from_rate() or
> what do you think? Do you have other suggestions?

We already have similar APIs, so that won't be a problem. We also have
a mechanism inside the OPP core, frequency based, which is used to
guess the current OPP. Maybe we can enhance and use that directly
here.

-- 
viresh
