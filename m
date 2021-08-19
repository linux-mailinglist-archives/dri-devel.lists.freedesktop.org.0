Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FE3F132F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DAA6E49D;
	Thu, 19 Aug 2021 06:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770426E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 06:17:29 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id l11so3310968plk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Z7TQEkkTOfvT3y1VcK9cbeGmLxLBDuWce4oY9e31CIQ=;
 b=n8Z7pceL3Q1hHrYhRGbE2Ft6ysYoV2T29GwsgsIk5zym7iZcje0CXVg1jI36aNnFP1
 wEt31EiA2dUBQwlv5rK6Pb4jBRjUZnVnX9lq3yYWlZnsAiqoC84b2+sIg5qRcoOEikt2
 Bl5OLXFHBLycojOK68FIhPW3b2fskqhF3vr/eyYOYKdL7QspG0UOJAgIVnJ/rUe4LZFr
 9Mx+8O2v0d2rHrH3yazUPQGMQQQiYdzhDIVBgB1HMOdlKqueyQlS0Pa++oE7KDNseaKY
 ZqQcskpZ4qIHBPun+Nz8BNcPrFRsCGUIgrdD9AWMNWaoX41LuxEow35zOBfD0rRFPHfn
 o2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Z7TQEkkTOfvT3y1VcK9cbeGmLxLBDuWce4oY9e31CIQ=;
 b=KN6M5FTXV2VotR5jxAdL6e1ouCjTFcluWVyL1K4aTUkXMXkCNuA0RAhPWa9kiTi4wO
 f4E7EKgui/u+1P2DiC1Afyhkwvsfc9vi/k56i7MN4UlYoOeVYJUOUkPYxoxqZUZhveHT
 tQ2r43sfODDp6BVIdSuNSGKmWTlHeCHU9P0f3XBQ2VB3p7aXpkXTJQRMdwZWX+RHjrlJ
 Z++0958YPMtrrQ3MSG3Z7p3mUXpoThCOEJjGMSQmy9o9KprniPL2VUob8RFiyC7+8wQI
 9wiDxlIP+otzKPZ1l20JTPdaQHtVJpADR4icX2dkJJbpAENZSNgEjCRFDq1oqG/awSZN
 g+gQ==
X-Gm-Message-State: AOAM533Wu1I3zjVGC6bXDxG5lWGzjslY67wQ+gKwePL5rvaVeV1lBOD+
 SZFs31jgq//gXuhp35stqlAxBw==
X-Google-Smtp-Source: ABdhPJwi8ECnFjz7ftlBUkQP1U01xvcbaFwYmCvSxRCVadF/ZCBCreA9Xq0KVJGpteNV1tSqbtF8Eg==
X-Received: by 2002:a17:90a:ce88:: with SMTP id
 g8mr13456163pju.116.1629353849006; 
 Wed, 18 Aug 2021 23:17:29 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id r18sm2222724pgk.54.2021.08.18.23.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:16:53 -0700 (PDT)
Date: Thu, 19 Aug 2021 11:46:17 +0530
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
Message-ID: <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
References: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
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

On 18-08-21, 18:55, Dmitry Osipenko wrote:
> 18.08.2021 12:41, Ulf Hansson пишет:
> 
> Either way gives the equal result. The new callback allows to remove the
> boilerplate dev_pm_opp_set_rate(clk_get_rate() code from the rpm-resume
> of consumer devices, that's it.

It may not be equal, as dev_pm_opp_set_rate() may do additional stuff,
now or in a later implementation. Currently it only does
regulator_enable() as a special case, but it can be clk_enable() as
well. Also, this tries to solve the problem in a tricky/hacky way,
while all you wanted was to make the genpd aware of what the
performance state should be.

Your driver can break tomorrow if we started to do more stuff from
this API at another time.

> > dev_pm_opp_set_rate() is best called from consumer drivers, as they
> > need to be in control.
> >> What we need here is just configure. So something like this then:
> The intent wasn't to use dev_pm_opp_set_rate() from
> __genpd_dev_pm_attach(), but to set genpd->rpm_pstate in accordance to
> the h/w configuration.

Right.

> On Tegra we have a chain of PDs and it's not trivial to convert the
> device's OPP into pstate because only the parent domain can translate
> the required OPP.

The driver should just be required to make a call, and OPP/genpd core
should return it a value. This is already done today while setting the
pstate for a device. The same frameworks must be able to supply a
value to be used for the device.

> Viresh, please take a look at what I did in [1]. Maybe it could be done
> in another way.

I looked into this and looked like too much trouble. The
implementation needs to be simple. I am not sure I understand all the
problems you faced while doing that, would be better to start with a
simpler implementation of get_performance_state() kind of API for
genpd, after the domain is attached and its OPP table is initialized.

Note, that the OPP table isn't required to be fully initialized for
the device at this point, we can parse the DT as well if needed be.

-- 
viresh
