Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FB3F80CA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B936E4A7;
	Thu, 26 Aug 2021 02:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22B6E4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:55:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id q21so882353plq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
 b=BqMyQF/pRrF5xvz5gMLvg1PjbQE0frktW1h8fThSOxAyiiCfj3dL0xTey26htEbkAU
 qVk4YC/4pxXxGHnr1GTo9bAoMJ4eX1tti5O7V1wnRrIafIwyVqmUZ2m6I0wxB2W1enrU
 HYOhVAex2Ke6zlvt61UNmgKkPh0dFb29lz983ZdH0aQ73RTHtAt7M1/VCP+x5TO9AjAI
 IJ3QFiGrCxXaLSKuBsbiYJZ42RDh74ChanCbedOwOUd6kuh7jO/uAx7AqCUeER3jlnSQ
 JtlHN1LIH4ywCIyB5pTCzFG5gUqpfLooaOTxS3rQYlWnLCOQf96ZEpwgb/6YUmVVCCWa
 uEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XZJy3B7m2q1WQYxMFNJqVt+qoddOU66BMzkNgwutOWg=;
 b=EG9DK0KfqrGT1oBjekM6dohNWVxV7midaTfU0gIMD60ZkgaUoqI/KE9tpBTX6VUfK1
 c0vmNnGgsM/qKkjMxfPkWE+ULyf8E6BWRDHJgxqgZtUV8ovJ74IZ/I3qLMKj2LCDx7io
 cizvw+Q9ZfwLtRW3AGMSAmL9mje1zCj9fKlzZkuhQr471Eb3jsPxON+qRDhPbHFILXAv
 WSuMrj3epdnUctJHmsqWxJL+0BsJK3O8yjfR9slKjt8ByFYFC4mPxENZf1gCMSKdNtlT
 g17F47TxXgftmPlfi6NtIsQaX5A93YS+pD5moxkaK59SK6ZesVUsciJO9syUZXBvZkCL
 3KTA==
X-Gm-Message-State: AOAM532uA4PqAxB7ViiuczGDi8aJZMgmqJ5vW8iWfGhsr0IfIqFpDV9t
 +aJoaHodw/UmTdrHtgBnvlAyJw==
X-Google-Smtp-Source: ABdhPJxp/UrPyXCwFMVDb4P8xsIyAd9gtXZ72kFLG9qw2YDutl/4rgLBxJGBT6WkpyrCaGfD2F0KiA==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr14265346pjb.22.1629946555282; 
 Wed, 25 Aug 2021 19:55:55 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 22sm1308517pgn.88.2021.08.25.19.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:55:54 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:25:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
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
Message-ID: <20210826025550.sshd7xl3gsuendoi@vireshk-i7>
References: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
 <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
 <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
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

On 26-08-21, 08:24, Viresh Kumar wrote:
> On 25-08-21, 18:41, Dmitry Osipenko wrote:
> > Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.
> > 
> > Viresh / Ulf, what do you think about this:
> 
> This is what I have been suggesting from day 1 :)
> 
> https://lore.kernel.org/linux-staging/20210818055849.ybfajzu75ecpdrbn@vireshk-i7/
> 
>  "
>   And if it is all about just syncing the genpd core, then can the
>   genpd core do something like what clk framework does? i.e. allow a
>   new optional genpd callback, get_performance_state() (just like
>   set_performance_state()), which can be called initially by the core
>   to get the performance to something other than zero.
>  "
> 
> Looks good to me :)

When you refresh this stuff, please send only 3-4 patches to update
the core stuff and show an example. Once we finalize with the
interface, you can update all the users. Else this is just noise for
everyone else.

-- 
viresh
