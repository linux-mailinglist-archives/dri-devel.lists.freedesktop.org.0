Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33C3EEF69
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B4C6E1DE;
	Tue, 17 Aug 2021 15:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61176E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 15:49:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id k5so14395518lfu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
 b=qCj8PB2xsh0Gwhg/Mz8T/C3RsrPHTbLP+N4lR2Yg2TB3ET2WkMAO1wgbBYR2q7lO68
 Pc49VlqXQ3dpjJrNlM2C3tPYEqqyhTGSf8sYJWR5lp0WvXn++4GF++0cA3bUAvac9XRG
 g9ViFPs99qgAUHDXdueeQwSgYGDFI/IeqfENUgVVD/rI4Q1ZQoN06DvNSee5A4aKmCOu
 S+uE5zA5q9Snqs4dlpyOLydNmfB2J5W4GujW2PkG6xWyoiPHtLSNJ/LrYoAzYXP3c7VD
 AfB16sdCF6PcILWyGV5dGRZGFQ3HUP80m2Rig47x3ImvxaecyvAZWvXPV2nsoVl7dQ3l
 YRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fG8UNioj9Gykdv3jKLDDqlFZPR9Bq4ObXeUmu51BqTw=;
 b=BbzmH59duLnTK4GsPzGK5usUBJu4lPs8X42U1zJ+zQAb22va3ckaP6diQJjCePcNeF
 LZR6JHBV2G8M2F9ABQQa886AiSUm/moK1jCnL0azWL769zBK+moi1GpuTfmFxq+nMHTZ
 jjbC0ywo47/SdhhS6IAbjkQtwzM+QfVPoVuNF1s+OnMFyerYCzCyJDjsjbtwWh0b5+7a
 XJbncw9Kk4NMJ2UjIPBEG+kKJ8VMZZOp1tyWE1Y5TqntsnRLrU/05uNoSxCnopN6N1aU
 IAUNCqST8MBGgB5mwL/O5GRq4tW+j4VMWIvTRBa3Uidll2b2qAcMjetzOjYL46tpIGzw
 5SIw==
X-Gm-Message-State: AOAM530mYAzHtpEKT0zgd4kbaNyCnwgXZ9ulbAZerDspW8MOFxcJcunZ
 fu9wM5KuOgG/QTEHldvBO5I=
X-Google-Smtp-Source: ABdhPJxH1hLTa5AxArOQ97RRWFvJ/qFdnD++u1srz4ssoaY8ztFeO7SrfDBXxb0r5VIrFxPoMPyxwA==
X-Received: by 2002:a19:7603:: with SMTP id c3mr2817435lff.543.1629215345270; 
 Tue, 17 Aug 2021 08:49:05 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id k1sm221767lfg.187.2021.08.17.08.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:49:04 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
Date: Tue, 17 Aug 2021 18:49:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

17.08.2021 10:55, Viresh Kumar пишет:
...
>> +int dev_pm_opp_sync(struct device *dev)
>> +{
>> +	struct opp_table *opp_table;
>> +	struct dev_pm_opp *opp;
>> +	int ret = 0;
>> +
>> +	/* Device may not have OPP table */
>> +	opp_table = _find_opp_table(dev);
>> +	if (IS_ERR(opp_table))
>> +		return 0;
>> +
>> +	if (!_get_opp_count(opp_table))
>> +		goto put_table;
>> +
>> +	opp = _find_current_opp(dev, opp_table);
>> +	ret = _set_opp(dev, opp_table, opp, opp->rate);
> 
> And I am not sure how this will end up working, since new OPP will be
> equal to old one. Since I see you call this from resume() at many
> places.

Initially OPP table is "uninitialized" and opp_table->enabled=false,
hence the first sync always works even if OPP is equal to old one. Once
OPP has been synced, all further syncs are NO-OPs, hence it doesn't
matter how many times syncing is called.

https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/opp/core.c#L1012

> what exactly are you trying to do here ? Those details would be good
> to have in commit log as well, I haven't really followed V7 of your
> series.

I'm initializing voltage/power state of OPP table in accordance to the
clock rate, bumping voltage before clock is enabled by device driver.
I'll improve the commit message.

An alternative to the explicit syncing could be something like a new
dev_pm_opp_resume/suspend helpers that will take care of
enabling/disabling the OPP table clock/etc and syncing the OPP state
with h/w.
