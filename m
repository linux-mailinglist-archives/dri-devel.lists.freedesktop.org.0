Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CDA3EF995
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 06:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7F5894C1;
	Wed, 18 Aug 2021 04:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C4894C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:37:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id w4so1152546ljh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 21:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
 b=YypYPePkPS0/5iONL6py8zYup5OlWdAHOzXwUxSzXCTttHeiyHI1wBwOMxdh2YLTML
 GUG8WKu/wZ5FCfyCJkx9ssRzVLntih0+ubH+uDS+zmF3bxOqd2tl/449gf1xUqAVXItO
 LqiecgJsCsgvauiiDdsEehmvy0IU9XdA8B4yG8nhfmpfcFmWhN5Jun7BhL8RSDevKzhD
 5m92TbfweR+jl3jR2rl2muugEzylfS+HI0GxLknGIK7R/Man0BfWVmBpB4t+5yrdD4Ss
 yfjwL+HUMAT1ajkSz1UUq6oqw5ejKgNP+90FXVrdigsXBfoBVVWYufOaoxLArk4ZGnuj
 JnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S4mf5vN/pcvdDF2PDP6Ptfzme/x90AlzqPWZLad8qYk=;
 b=ohz0Unc1gPPoy9H/+WDayqb1KhajK7YiQfo4OVNZ+tnX3tMqt+Pg1Wzph4fy/3Mg/n
 4HYo89mKy1OhJ6UhMmqIjDcmjp4qEvzC9sQsjnWIpAtNneQLeQQInh8kTYD3+7DG3DHh
 +nrwjbuuyS/yeC7iEM4LyYj0NFA7njwL86/8TXc1ejKPnHpmCzLySqrYiCA0dE+zPGrL
 RPXZr7pfG9839D+fEQBnZLOdN5uKEl2xOoxG2OiewOap8iqktFqXv4IOYwpT0bYPc/Eg
 V7S4+Fz/6Q6zGyOFtLkobg9aUOZchcyMkTws8yoAQJ7b7irri8g2K+gW7qg8PflVksx/
 K4IQ==
X-Gm-Message-State: AOAM530baKBaZXpPvZrNwWY9hQXkE6t97kpA1a39g7LrFiMpHWh0sMfh
 6wLHWpBnq6u+72vzqQuC+OU=
X-Google-Smtp-Source: ABdhPJyVioyoewr8IK0TXDc8qP95URDUgfYjdExTYurgnMDYKEK8I1b+Ft9rT09ZtYUxKjozPrkphA==
X-Received: by 2002:a05:651c:32f:: with SMTP id
 b15mr5355209ljp.322.1629261468379; 
 Tue, 17 Aug 2021 21:37:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id s27sm379103lfs.279.2021.08.17.21.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:37:47 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
Date: Wed, 18 Aug 2021 07:37:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
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

18.08.2021 07:31, Viresh Kumar пишет:
> On 18-08-21, 07:12, Dmitry Osipenko wrote:
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
> 
> But the OPPs should already be initialized as someone must have called
> opp-set-rate earlier ? Why do this from resume and not probe ?

This will set voltage level without having an actively used hardware.
Take a 3d driver for example, if you set the rate on probe and
rpm-resume will never be called, then the voltage will be set high,
while hardware is kept suspended if userspace will never wake it up by
executing a 3d job.
