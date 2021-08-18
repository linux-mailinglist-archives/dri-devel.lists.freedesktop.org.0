Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21C3F00F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2116E50E;
	Wed, 18 Aug 2021 09:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EA26E50E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:50:48 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g14so1574220pfm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HyhZskvnkMHQUsBUgjlwBTJK659CA+CwU8djwVBZ2sM=;
 b=WeXABN/OK1Wr8lx7yIzjEQc22keli5/mPbqOsII32BzwbNTl5ULMEk37J2dJ8WBIc8
 ZnFr2sJXSoQcvyE/NTKrdgFlaJaQ5o8OxVWXD6PUNqbIuMj7u3RPYczNpQRUfi51aU4K
 IMg9JXqfomBw0MGOEn5iaKId1Us1CN3Pm6n193v6mGKDxjCswxDgh1VAt9J14Z2xnhK9
 TjVyhjtcpvAwdRJrWEVMHqX2US4YAz29pKFNe9gxQYZqLn/NPPMrB0GL1Cn9pdhRH215
 rF0aZ83JvYygnG0uw5U83BQhbi3YsDjTjk/h7pS55RDpk7eJ2g4J4R4IDq7w+OQTfMd1
 Zzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HyhZskvnkMHQUsBUgjlwBTJK659CA+CwU8djwVBZ2sM=;
 b=cVh5PqU4ad9VMwy8p/KE/VwusRjxszhKCpJGsxAtQSZxJVLElFeJMaXEt+jrOIWqNt
 pwbcoazh3/VPhGK17Yq3Sd7L9bqTzpFWFUOLbhzJxf6PCB+96Jkhd0CtTsnaVFhDZy04
 3lwUszltL4El49NlsplqhNFzbIwY8+W+jaHKu+/J1Wxk3COVVBF3cQ/2XsT5pT52K3JR
 JU0z4CpCu1voppmRF3yJ3sFkzOWPl6QvWa0UXaDz3yTchHnmbNuML9ii6YCsmVTc/gsH
 O9q6agErjy9xdYvrTe3vPAb4gfv8EOXMjuJRVYQGogUAP0ZraquCN3AaFXu0ziNmtQ72
 +roQ==
X-Gm-Message-State: AOAM533kdcTHpMn2HHX9J7f7aepiWd+Ggj0fP1JxhocDMcw42ZEpwi3a
 KP8lVkGvcifNJt5EfhS/I0bfqw==
X-Google-Smtp-Source: ABdhPJzNgodhRJ4P04IWzIYvulf9/hQQBrDCKLc4ZA4G1N3jYvdGFtkpsn+640r5oaGBQ5g20Y+t7Q==
X-Received: by 2002:a63:3c5d:: with SMTP id i29mr8049824pgn.147.1629280247471; 
 Wed, 18 Aug 2021 02:50:47 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id i11sm6720260pgo.25.2021.08.18.02.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:50:47 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:20:44 +0530
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
Message-ID: <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
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

On 18-08-21, 11:41, Ulf Hansson wrote:
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > What we need here is just configure. So something like this then:
> >
> > - genpd->get_performance_state()
> >   -> dev_pm_opp_get_current_opp() //New API
> >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >
> > This can be done just once from probe() then.
> 
> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?

The opp core already has a way of finding current OPP, that's what
Dmitry is trying to use here. It finds it using clk_get_rate(), if
that is zero, it picks the lowest freq possible.

> I am sure I understand the problem. When a device is getting probed,
> it needs to consume power, how else can the corresponding driver
> successfully probe it?

Dmitry can answer that better, but a device doesn't necessarily need
to consume energy in probe. It can consume bus clock, like APB we
have, but the more energy consuming stuff can be left disabled until
the time a user comes up. Probe will just end up registering the
driver and initializing it.

-- 
viresh
