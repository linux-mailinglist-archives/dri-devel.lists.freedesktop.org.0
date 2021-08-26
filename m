Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17893F80BE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E716E49F;
	Thu, 26 Aug 2021 02:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5086F6E49F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:54:32 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so1295659pjx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zY5JqCFiL9ajwRDJE9ra9rr5h/8lLdU1bpaSqHW2cUY=;
 b=zBbl6+vdhsHvJNmzRzPXjUjbZjS1JrIbTs8BWJQyR5yrjQ0NIdbYJbf6GP5pApFCVp
 QwHpr9xoOjbWOHQbf9w84qKF6hnSDYRTcKs92IQ4JEXvC49dJwGf73JNm9e6WL0CaiJ3
 5m6NOPRUdzpMEkdzaTnJgAib8c7/I1cWyzCPMW9eSlXIY9pGdD3717L7Hz3AuL6VwDK4
 N4OzVhpVgELJBvWYnrW5vu5o6L3KYwE3MnqcLvfRQ8BGGYt0siZaxfeUknn6gUpgr0d+
 DOZnGFD+Kfi4FkVDiCh75RoA6R1huFUJmi6KO1t34IILBc+ygQJ2sBcVh+9gAmmY5SNn
 0pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zY5JqCFiL9ajwRDJE9ra9rr5h/8lLdU1bpaSqHW2cUY=;
 b=hhao1z8Y1esbs/l3+HJfvm3hrRPQbKZevxk3MN7lTB6FKB3TptFT2MWn4PCLiYFKtq
 X1X6SDEjt5q6OXArY+8UlwTM8GzDnFfsUfw1fwOKNjoYX+Sv5IUumSXArg/hICHHxDy0
 1UwygcqAJS+Hs07bYdU14EbeGLYvlx18h6WcgHR03JRpY4eHmRqDylm38AVvH45VlWf1
 JJMhusCh1/OBTKOD32A/gNHxKnYIQhRNfnQpjS6HKt7xn+r4wa6CWiNY6juYkDcANAoo
 Gu80I10dubGV+jbu4K6iiD22e5vgacKvSfFJbt0Yt8Fna9KWqeiWMKFvkeKdQaNOkNgW
 kbxQ==
X-Gm-Message-State: AOAM532nqhePyeCvQf62nIcwYO5aEeKYTN43O/n9D2gLUVve39pZzOgQ
 AGUFtbp0SfPBfebzI+jRKvQoUQ==
X-Google-Smtp-Source: ABdhPJwJ9pkRHq/CTCcQjTYNpLDk2RhglIYRZ3ZolL1qTMxvdQiuO7bqSMhmqzPibKf11tEWAM5bLQ==
X-Received: by 2002:a17:903:31d6:b0:133:9932:6998 with SMTP id
 v22-20020a17090331d600b0013399326998mr1459044ple.45.1629946472125; 
 Wed, 25 Aug 2021 19:54:32 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id nl9sm7142139pjb.33.2021.08.25.19.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:54:31 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:24:27 +0530
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
Message-ID: <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
References: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
 <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
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

On 25-08-21, 18:41, Dmitry Osipenko wrote:
> Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.
> 
> Viresh / Ulf, what do you think about this:

This is what I have been suggesting from day 1 :)

https://lore.kernel.org/linux-staging/20210818055849.ybfajzu75ecpdrbn@vireshk-i7/

 "
  And if it is all about just syncing the genpd core, then can the
  genpd core do something like what clk framework does? i.e. allow a
  new optional genpd callback, get_performance_state() (just like
  set_performance_state()), which can be called initially by the core
  to get the performance to something other than zero.
 "

Looks good to me :)

-- 
viresh
