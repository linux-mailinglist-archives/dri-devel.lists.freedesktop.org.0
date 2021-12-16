Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB347744E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE81121F8;
	Thu, 16 Dec 2021 14:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42E81121F8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:19:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b40so49916663lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FHZhtH3DW7AMrBjP8iVuxcvAkwhLC1m6PQhYldA9iJU=;
 b=kfQna7lwKWEWNyGl0m+WM04u4GvDzlfWdVJpaVjT3VLpr11FElsgNikURpISaLmqEB
 gSnfcAyYPclS/JMQBjs4BWeC4liYjwwJhGaI2CLj9zwVCtQp20VEezdXRdvXOfU+rQv+
 cvdiG+BIckrRWvJ5LmWc6gi1KqhH5V1mE4tW41nr4+IFwNca4fR7ttL4xlWwn74TndKS
 G0whMZLLYcMsAAhjjKd4W8N2DSbx8f8iAVMtBkeyqMXniFfccMFxE6qkDTG53a+wbF/W
 fUHDrFY0WxEr+0Me59Iq1ISBYx2DSYnRx5jkh9GCiG6ldF+F7h4CTLIk/j1S9Ue9eW4l
 GW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FHZhtH3DW7AMrBjP8iVuxcvAkwhLC1m6PQhYldA9iJU=;
 b=aW/ySwAvf6e7DqT4VOnF3tJ9pyK9wmJyJaSHAyH3zFNWrMEn8FRahBmnOvG2QqNkFl
 WxrMJde664Q/CPZEliTX5My9fPpjAPiEoyTi4xohuEoi9FTz5v6T3ymTOVTZU0n21qK+
 80ZrTJ89caQQZ9oneOAGCkhhrWBPBTa3xrYL912sv6gpDTJPAlz1BiGqkSZSgYzeKeZK
 i1INZZkCtAJ5nJbY0tli+ITz3f7sThi2BcgKnp4fpwjgDq2izxzAAuU/BMYhj7q+ohCJ
 DhwBEwqiNk+7Seum3pD0RlUcPMmM9ozmdSL1Mbubkuk7gzIouUZP+2UZpfZQ91LTnL0s
 oMHQ==
X-Gm-Message-State: AOAM5309RmYe7y71zFZ5oKJM9MHun3YfADBoJPjeVkCqdwl2D7Y/5vlF
 XJX7OACXbQpd+WTzOajAq6g=
X-Google-Smtp-Source: ABdhPJwTCLw6X+g8WZv+7SknvWAEs+qjM7J+ZiSnSsKS4sTnaSQels7ZUzqMKyR6w73ajpLDsSHcBA==
X-Received: by 2002:a19:8c48:: with SMTP id i8mr14971511lfj.179.1639664349109; 
 Thu, 16 Dec 2021 06:19:09 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id k14sm1148653ljk.57.2021.12.16.06.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:19:08 -0800 (PST)
Subject: Re: [PATCH v16 00/40] NVIDIA Tegra power management patches for 5.17
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com> <YboP9IFMUrUnEzrU@orome>
 <6baf6013-fbb2-b42f-5b26-2d10a2ca9374@gmail.com> <Ybs7zKQY1uJCJ2f3@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f4ba1201-e3f4-d0cc-17df-9645783dee04@gmail.com>
Date: Thu, 16 Dec 2021 17:19:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybs7zKQY1uJCJ2f3@orome>
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, David Heidelberg <david@ixit.cz>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 16:14, Thierry Reding пишет:
> On Wed, Dec 15, 2021 at 07:11:53PM +0300, Dmitry Osipenko wrote:
>> 15.12.2021 18:55, Thierry Reding пишет:
>>> On Wed, Dec 01, 2021 at 02:23:07AM +0300, Dmitry Osipenko wrote:
>>>> This series adds runtime PM support to Tegra drivers and enables core
>>>> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>>>>
>>>> All patches in this series are interdependent and should go via Tegra tree
>>>> for simplicity.
>>>
>>> So these can be applied in any order without breaking anything?
>>
>> Please notice that the word is *inter* dependent, not *in* dependent.
>>
>> There is a build dependency for the patches. The first two "soc/tegra"
>> must be applied first.
> 
> Okay, so I've separated the first two patches out into a separate stable
> branch that I can share between the Tegra and drm/tegra trees to pull in
> the build dependency and then I've applied the driver patches to those
> two trees and I've verified that the two branches build correctly. I've
> not done any runtime testing, but I'll trust you on that.

I only compile-tested VIC and NVDEC drivers, but they should be okay,
and thus, everything should be good.

>> The "soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30"
>> *must* be the last applied patch if we want to preserve bisectability.
>> The core voltage scaling can be enabled only once all the drivers got
>> the power management support.
>>
>> The rest could be applied out-of-order.
> 
> One last remaining question: I don't think I can apply that one patch if
> it requires that all the others are enabled first because it would
> basically create a circular dependency.
> 
> Can I pick up the final 7 patches (the DT ones) independently of that
> one patch without things breaking? If so, one option we could try is to
> wait for both Tegra and drm/tegra trees to get merged into v5.17-rc1 and
> then send that one patch (which is only a 4-line diff) right after
> v5.17-rc1 so that it makes it into v5.17-rc2. That avoids the circular
> dependency and should get everything enabled for v5.17.
> 
> Do you see any problems with that?
Deferring that one patch till v5.17-rc2 will work, thank you.
