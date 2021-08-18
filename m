Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E300B3EF970
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 06:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C134F8932A;
	Wed, 18 Aug 2021 04:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7CB6E372
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:31:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i28so1831765lfl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 21:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bJVDC5sFMx5wdJrVE/CISF2TdQfB6rbYeeYCC0J1Ol8=;
 b=LiU1hgzrqwTnfH2RGkGOLvOMBIR+Dpr0pPox0drlJMVWW7rU2xXSm44gIeI0Xb4pT5
 1DCudjHNE+om3k16PzKa7gXd9w5/yPDgTlxoJPZ6PZkJ88qhuNXBI7j6uRQBnXkra+p1
 G8mYKN4huRcHr6lMOkR2iHFaktWcjtOCFhruBBUBGyInSaHjeOQ/MGLSXZnOOvUbWg5q
 hnuex/UPnBX0ZqA0EXW+bqgAYzqDV3YPuArMnDsPfTHvfMg8hkCHc8k3OocdmNqKVCgO
 0tnl22ivLpiKmcMsdUXvXY9Ki5SXuLaOXETJ3hpKkonGX9ienLPJKjeI8uFpB7i3Qjn+
 d3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bJVDC5sFMx5wdJrVE/CISF2TdQfB6rbYeeYCC0J1Ol8=;
 b=nwhCXuiNdZSwmK7vJeOQZbER+/b5uKIqiQA0HSfttk9h3G45l5N2edAM1iwRAvbl9n
 /tRqYgBZnvk3YP+YMxZqxjb0qCQ4ULjhHpr0TPHFJrwU3sjdi/YG/BNDEE6lImuxuK/8
 P2Mfx9PTAlTyW3xc1IaBkDuoXSMJTX4lk+qma1xhc2qla3i+FeoV9TegpVKN4qTyyapF
 GHgwSDa+DK8MRLIpxkxioo/aYQO6Fk/ITQWcBAifljQWrXxwP+YOfLC1SvutVWSnm9Zc
 sfwy/I8gOYPdbesBO6xGhIVR3CS5OuTR0zrdYFk8i/5nG6cYFbQDhKDGPmrfNdX/ty9Q
 i6Zw==
X-Gm-Message-State: AOAM533TZ1GjhlxRoEjd7eBYZENIgLbJ5K8H/TM0f7Az4PAIe+QNqvJU
 n8JZQa53wjkk5417w4hVCR4=
X-Google-Smtp-Source: ABdhPJx+RUklo1VZR89XCu0X3oAVXKEHQLdw/QolyoJg/PV7VvbR0COzQj6CtKZ4QI3fzPlA0p3mQg==
X-Received: by 2002:ac2:5b9d:: with SMTP id o29mr5044866lfn.26.1629261061194; 
 Tue, 17 Aug 2021 21:31:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id q5sm377111lfc.283.2021.08.17.21.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:31:00 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
From: Dmitry Osipenko <digetx@gmail.com>
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
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
Message-ID: <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
Date: Wed, 18 Aug 2021 07:30:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
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

18.08.2021 07:29, Dmitry Osipenko пишет:
> 18.08.2021 07:12, Dmitry Osipenko пишет:
>> 18.08.2021 06:55, Viresh Kumar пишет:
>>> On 17-08-21, 18:49, Dmitry Osipenko wrote:
>>>> 17.08.2021 10:55, Viresh Kumar пишет:
>>>> ...
>>>>>> +int dev_pm_opp_sync(struct device *dev)
>>>>>> +{
>>>>>> +	struct opp_table *opp_table;
>>>>>> +	struct dev_pm_opp *opp;
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	/* Device may not have OPP table */
>>>>>> +	opp_table = _find_opp_table(dev);
>>>>>> +	if (IS_ERR(opp_table))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	if (!_get_opp_count(opp_table))
>>>>>> +		goto put_table;
>>>>>> +
>>>>>> +	opp = _find_current_opp(dev, opp_table);
>>>>>> +	ret = _set_opp(dev, opp_table, opp, opp->rate);
>>>>>
>>>>> And I am not sure how this will end up working, since new OPP will be
>>>>> equal to old one. Since I see you call this from resume() at many
>>>>> places.
>>>>
>>>> Initially OPP table is "uninitialized" and opp_table->enabled=false,
>>>> hence the first sync always works even if OPP is equal to old one. Once
>>>> OPP has been synced, all further syncs are NO-OPs, hence it doesn't
>>>> matter how many times syncing is called.
>>>>
>>>> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/opp/core.c#L1012
>>>
>>> Right, but how will this work from Resume ? Won't that be a no-op ?
>>
>> The first resume initializes the OPP state on sync, all further syncs on
>> resume are no-ops.
>>
> 
> Notice that we use GENPD here. GENPD core takes care of storing PD's
> performance state (voltage in case of Tegra) and dropping it to 0 after
> rpm-suspend, GENPD core also restores the state before rpm-resume.

By 'here' I mean in this series.
