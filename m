Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98033EEF93
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4F6E1D7;
	Tue, 17 Aug 2021 15:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773A96E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 15:53:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y34so42247896lfa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1x/HqtgkDsm/ejKQeETrdsQe6dZCILRZB7KrDkPDRw=;
 b=An4PsjL/Vf5udfyNdAKTCYWd10EU58Kpxe8zKg/t9npZAavumDMU+X9iBgUDO5Z8Zq
 qLi7UARHs5EBlnNEWrEBaiEyo4AvkdNde23Gx7Ech/+7twOysiNWaNZJNc4c1H9Unsq3
 EZ9/NC8tZYzsvHiEyEjIq8t7XNVBW4+7jhFenO5mQmYIgRBk+TxgMXr2m4yePVU5ry+F
 yIAUTR2f68Q14RQm9v+g3T6mw1go0mbvXB6UoQIJuFvpfbNq+pUgeWHg895WJQXEl29h
 zNHJ3yrbMGXltFkn0e1Yqc4GHFXDR5UTFoNhdaUppdVMQxIsBTVP10kUU2MP/Em1dvWL
 oObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1x/HqtgkDsm/ejKQeETrdsQe6dZCILRZB7KrDkPDRw=;
 b=Upo44aV/gox5pL1sfHk/C3LyToS8rr/94L3o8WY5cUiGv8Wp8+15fRfJIYngYaSwvz
 HF4zybyWA9oW0bOP/mybVJCfrfM3wVqDizGvJZfDUf2bN5PBqv6VX5C14JGJ2K2iPDrJ
 jyGYGsrfF8HVg6ibFZQs7XT6px+j8SmRyBZROJJxhcbmwfLRdcjxCB6fmCQtx7PfT0Oo
 +dQMy/8pWF8UwhBBv+7nqJUSAkEOJMWaGkP9BOXgbPz306x3RSF06HG1amJL/PafSvJV
 MK4SwP9UCNbGB7KWpfGnYWDTOVS0QOjKmpBlYlPxfbMeh/r6bxrzV4SqK48p44OQv34A
 J/HA==
X-Gm-Message-State: AOAM530tFuNuhoXvGgoFxIH8IagTGCay7OROkMIClNJ6CbLDwGCY87Pm
 jDJzm/Ywde+LbDtwfl+Nijs=
X-Google-Smtp-Source: ABdhPJzKDCfx8XTSv5rLHo+odlu5xNPqb9QF4cuJdpvDud3tFDUajnizSUcMOMnHR+YPCBFb3Bv9Ew==
X-Received: by 2002:ac2:4f8f:: with SMTP id z15mr2811432lfs.361.1629215591955; 
 Tue, 17 Aug 2021 08:53:11 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id r20sm223793lff.93.2021.08.17.08.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:53:11 -0700 (PDT)
Subject: Re: [PATCH v8 22/34] spi: tegra20-slink: Add OPP support
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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
 <20210817012754.8710-23-digetx@gmail.com>
 <20210817122244.GA4290@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a0e49d91-e812-5b55-e90f-bfba8476faa3@gmail.com>
Date: Tue, 17 Aug 2021 18:53:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817122244.GA4290@sirena.org.uk>
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

17.08.2021 15:22, Mark Brown пишет:
> On Tue, Aug 17, 2021 at 04:27:42AM +0300, Dmitry Osipenko wrote:
>> The SPI on Tegra belongs to the core power domain and we're going to
>> enable GENPD support for the core domain. Now SPI driver must use OPP
>> API for driving the controller's clock rate because OPP API takes care
>> of reconfiguring the domain's performance state in accordance to the
>> rate. Add OPP support to the driver.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> Is there a concrete dependency here or can I merge this separately?

This patch depends on the new OPP helpers added earlier in this series.
In particular it depends on these patches:

opp: Add dev_pm_opp_sync() helper
soc/tegra: Add devm_tegra_core_dev_init_opp_table_simple()

Thank you for the ack!
