Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34B3EFC3C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D8C6E435;
	Wed, 18 Aug 2021 06:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125AA6E436
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:23:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q21so3053547ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HRbW8G1xwSB2ls1NijjktR4beuv1neTM9+sNIEIh1SY=;
 b=QhekG6HEhPh05G6EVGmH5gG1vsu7rLtXHoMmf8TooWyY48CtokKXpp3Ao28M9gzDIL
 bOVJgsJpVuu4U6ZWhqbn/zzSzP/fh3SXlt9kSPpa9GZDTZZhDmzkZCL094g6b3/xpTlq
 nR0VqcsEMuT8DrZzKg9OpHD9vAWhvLMA9THzTn2p/fALoh3IOyqRWsGfYkKKKn80LTpF
 0ONjMpwOjktQ6neNrcoQ/FCq6G1LpKBpZ2d3r2xDohXQf3R33Yqsm7PvyRSmOAMdrmX2
 8g7Na8C+8jCc1UJQu7St/hkelmGm9SnYblY2IzzA+hu0M9oU3v9y97qHAydPZ+UblpGW
 RUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HRbW8G1xwSB2ls1NijjktR4beuv1neTM9+sNIEIh1SY=;
 b=oLXqksE0GkgPO5RJmJi7f7Dq+wNMuDx6k6Jb5cdpQUY9X8KiedOmW79CtS5zc5JdJh
 ajnt+4+/cxTbjmlmKg08mhuTw6NTWjr/4Z+mcb8mKaNYwnsBAffHt2R2cIYooXEjlNoi
 38uh8X7xva5OepA1NwTeF9IqX2gS7Ya2J92kUzbaAe0McCxQnNw+fNd5WiXPkdhJMY3L
 6PYZQjnS0/pVyur6KYFLJztJVduruaYIgsMl2ukTEuW/41ZdrUN6Bp43gN0HcfP8VrMF
 xrEM5WZGI+eghdNuHzQw/IQC84Mgc0gOSMfp86qeKtu5YKxtIr3LvdHimMzHzqLbXVku
 pE7Q==
X-Gm-Message-State: AOAM530LRHdZCY3f26MLmJq2rkxI4JySLRj7Rk4LjPtAXABN/f2qLdnj
 IaiDeTGS4yItSw9tjKc88Wk=
X-Google-Smtp-Source: ABdhPJyL01ZM7X19Ri9kaNq915zcz165uE238H3LdTxs+q0TxSrtrvPc1BOJdsnl0Akd4i2Y2iKECw==
X-Received: by 2002:a2e:a785:: with SMTP id c5mr6383685ljf.434.1629267778216; 
 Tue, 17 Aug 2021 23:22:58 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id w4sm503212ljg.99.2021.08.17.23.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 23:22:57 -0700 (PDT)
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
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
Date: Wed, 18 Aug 2021 09:22:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
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

18.08.2021 08:58, Viresh Kumar пишет:
> On 18-08-21, 08:21, Dmitry Osipenko wrote:
>> Yes, GENPD will cache the perf state across suspend/resume and initially
>> cached value is out of sync with h/w.
>>
>> Nothing else. But let me clarify it all again.
> 
> Thanks for your explanation.
> 
>> Initially the performance state of all GENPDs is 0 for all devices.
>>
>> The clock rate is preinitialized for all devices to a some default rate
>> by clk driver, or by bootloader or by assigned-clocks in DT.
>>
>> When device is rpm-resumed, the resume callback of a device driver
>> enables the clock.
>>
>> Before clock is enabled, the voltage needs to be configured in
>> accordance to the clk rate.
>>
>> So now we have a GENPD with pstate=0 on a first rpm-resume, which
>> doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
>> pstate in accordance to the h/w config.
> 
> What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> instead ? That will work, right ? The advantage is it works without
> any special routine to do so.

It will work, but a dedicated helper is nicer.

> I also wonder looking at your gr3d.c changes, you set a set-opp
> helper, but the driver doesn't call set_opp_rate at all. Who calls it
> ?

dev_pm_opp_sync() calls it from _set_opp().

> And if it is all about just syncing the genpd core, then can the genpd
> core do something like what clk framework does? i.e. allow a new
> optional genpd callback, get_performance_state() (just like
> set_performance_state()), which can be called initially by the core to
> get the performance to something other than zero. opp-set-rate is
> there to set the performance state and enable the stuff as well.
> That's why it looks incorrect in your case, where the function was
> only required to be called once, and you are ending up calling it on
> each resume. Limiting that with another local variable is bad as well.

We discussed variant with get_performance_state() previously and Ulf
didn't like it either since it still requires to touch 'internals' of GENPD.
