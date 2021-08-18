Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AF3EFA7B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A826E3C6;
	Wed, 18 Aug 2021 06:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373306E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:00:37 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id c17so1153293plz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
 b=IZiDZuRS1dgbax2OIM0qBL1zjf9wYlmKLTEfzJy5RuUwQu4eQ6Cqmnd2ZfQ9EnnS5E
 Jr1fAcgL/JdFgkFZ89xjBuBPSORKqFiw+3e1WhRfjnkRI6XhhARyc2h+l5KPSXucToC1
 5NtBgghBSCisOGicrsb9AX3gqpRGgB9wryJPh6wD220SUglcmvJcuJFjUggtI/Et9Qhq
 yJL8iRXbbCgl4lZdUfxZejEJadW6CurxesAMbeYQ33LbfTu1KA1dNxOq6HMfw0FLGwDr
 OcBg18AVZFD7ZTL3PphKIXIDGtjeF3qBwk12Pxl3ByoW3VLzL+hvaHjyLcAcizZ3cE8S
 xzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
 b=WDUzaWNGkg/niiV5vOOx88dz2jfUK5udnlDg3JzLYgqKedjJFh7QQyZbXzxgdnIL3n
 80yM0nX+ID9doiEpu2yqRxYt8bsfNxB8scRvEkK7rPjLgw6BJd275koC+w9dDE+eVpma
 b9C7nC/ZQNy6vRNb2s/s459f7ib+HYTxtJ/qI9jUDdKo7A3ktKUEU5aUZ0/enbTYifJC
 HIPdbQboRbYxloJB8AWki4x+0HwTfKfs9/xnV5Rhx+sCBR0SFXE8WkBWnFMN2uQse4qT
 aUFe8eqcmKGXheqcJnoj+CoJE8LH8imins9VCVjr6tgiMuT40kzqc/ng3Rp5sVCR1/wv
 hlPg==
X-Gm-Message-State: AOAM531dYAGOMYfaPzjRX6uwett0cB5W9WgEEgUssoasUenxKgF2KtPP
 sWPG07+pCEK2zmpZyaFOuYrwbA==
X-Google-Smtp-Source: ABdhPJz6nHvt8tLhRUxNLQv5z93Dx/TL1iQrf7p3Xot0rNlhIhtJA6nFhb5bwd/3tPACvE5mJ3aZJA==
X-Received: by 2002:a17:902:edc8:b029:12d:4a06:1c25 with SMTP id
 q8-20020a170902edc8b029012d4a061c25mr5874222plk.61.1629266436958; 
 Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 136sm6020660pge.77.2021.08.17.23.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:30:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818060034.tdu3ocbqlnao336u@vireshk-i7>
References: <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
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

On 18-08-21, 11:28, Viresh Kumar wrote:
> On 18-08-21, 08:21, Dmitry Osipenko wrote:
> > Yes, GENPD will cache the perf state across suspend/resume and initially
> > cached value is out of sync with h/w.
> > 
> > Nothing else. But let me clarify it all again.
> 
> Thanks for your explanation.
> 
> > Initially the performance state of all GENPDs is 0 for all devices.
> > 
> > The clock rate is preinitialized for all devices to a some default rate
> > by clk driver, or by bootloader or by assigned-clocks in DT.
> > 
> > When device is rpm-resumed, the resume callback of a device driver
> > enables the clock.
> > 
> > Before clock is enabled, the voltage needs to be configured in
> > accordance to the clk rate.
> > 
> > So now we have a GENPD with pstate=0 on a first rpm-resume, which
> > doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
> > pstate in accordance to the h/w config.
> 
> What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> instead ? That will work, right ? The advantage is it works without
> any special routine to do so.
> 
> I also wonder looking at your gr3d.c changes, you set a set-opp
> helper, but the driver doesn't call set_opp_rate at all. Who calls it
> ?
> 
> And if it is all about just syncing the genpd core, then can the genpd
> core do something like what clk framework does? i.e. allow a new
> optional genpd callback, get_performance_state() (just like
> set_performance_state()), which can be called initially by the core to
> get the performance to something other than zero. opp-set-rate is
> there to set the performance state and enable the stuff as well.
> That's why it looks incorrect in your case, where the function was
> only required to be called once, and you are ending up calling it on
> each resume. Limiting that with another local variable is bad as well.

Ulf, this last part is for you :)

-- 
viresh
