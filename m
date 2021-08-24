Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97E3F5667
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 05:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9231189B61;
	Tue, 24 Aug 2021 03:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FACF89B61
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 03:04:24 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id n5so13275235pjt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 20:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ftVLBcz2CA6HVw5Sak06NSKiX7H+vKeynT4dia9GcmU=;
 b=k+9ugNQMNP1T757zCmBjD0HZ4Cm6T3BE+v/X7Wxf65qXhZ4Y1Om/ZwreVVsFldU5ED
 26Au5VziBd3fTRw9qajnc5Q1bzTZtCXlNbNzYEhhdrLy0j6q3RP41Bfsx2Vet4JiZwHE
 HpssKarI+iW9nKfS+aZW4kug15wwleM1PIEsfGzs+E/ENGb7NoFhvlaUVQuCR3IWspbE
 1jdc92yTGvHUY8w5qgAHpd6F4jZjsLSyz7OphX6zYHG1h8uepViMakkTUt9Apji0AqlD
 h496UE7ulnKIyaYIIz+9WlMWKL7f+UCly0DgUoeMlhVK/OeculmtFoztQ69V1z3oNjW5
 BaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ftVLBcz2CA6HVw5Sak06NSKiX7H+vKeynT4dia9GcmU=;
 b=mFn7u1Q7ltgR4iYbS7nEBbYR/rJfiEm/oqnTgpwy15R/WpCGJvNSCXB86tMbiD0aRU
 EROpC+cmDYji9ABIxSTIaxl26QIowCmQVGjZtRm3BLEuoxIAe25t3ifgMDmrzq5RghC3
 SgXSo53Ny3ht35ncD+drEZ1Bxkv/hUkeikKNJOyDCSBII9jTE9HGmZpn980yNmxa0BLD
 bb432Hd6iBLBCT6CCbYAWtBKACiupPwvP+ZI5pXyshfb9V/NiSDHW9aM8llN9N0YBLqZ
 qCa9CoEDk98zTSmamfm1kamzFN97JmKRGpNIweVJriI9TXoxo1shImc03LHIpDgWjQ1N
 23nA==
X-Gm-Message-State: AOAM531lcFatMHEcrmDfqVwxKrXkv6D9ylaVMifmS8+RP5/W71Rmr6Pk
 To0kdfnPZuxurZTCFtLRsQrv/w==
X-Google-Smtp-Source: ABdhPJxgNZPrPk9tzmxpkCehrPdfFes88M8DqFhHlA/X7V8qZTGRmqZiqGy9NJMzzCPLtwobPdjSGw==
X-Received: by 2002:a17:902:e547:b029:12c:563c:4a03 with SMTP id
 n7-20020a170902e547b029012c563c4a03mr30922945plf.46.1629774264209; 
 Mon, 23 Aug 2021 20:04:24 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id c12sm16184839pfl.56.2021.08.23.20.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 20:04:23 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:34:21 +0530
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
Message-ID: <20210824030421.3tjfjkx3c2silbnz@vireshk-i7>
References: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
 <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
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

On 23-08-21, 23:24, Dmitry Osipenko wrote:
> It's not clear to me whether it will be okay to add a generic OPP syncing by clock rate or should it be a Tegra-specific helper. Viresh, what do you think about this generic OPP helper:
> 
> /**
>  * dev_pm_opp_sync_with_clk_rate() - Sync OPP state with clock rate
>  * @dev:	device for which we do this operation
>  *
>  * Sync OPP table state with the current clock rate of device.
>  *
>  * Return: 0 on success or a negative error value.
>  */
> int dev_pm_opp_sync_with_clk_rate(struct device *dev)
> {
> 	struct opp_table *opp_table;
> 	int ret = 0;
> 
> 	/* Device may not have OPP table */
> 	opp_table = _find_opp_table(dev);
> 	if (IS_ERR(opp_table))
> 		return 0;
> 
> 	/* Device may not use clock */
> 	if (IS_ERR(opp_table->clk))
> 		goto put_table;
> 
> 	/* Device may have empty OPP table */
> 	if (!_get_opp_count(opp_table))
> 		goto put_table;
> 
> 	ret = dev_pm_opp_set_rate(dev, clk_get_rate(opp_table->clk));
> put_table:
> 	/* Drop reference taken by _find_opp_table() */
> 	dev_pm_opp_put_opp_table(opp_table);
> 
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(dev_pm_opp_sync_with_clk_rate);

I am not sure why you still need this, hope we were going another way
? Anyway I will have a look at what you have posted now.

-- 
viresh
