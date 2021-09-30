Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E741DC08
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB06E40F;
	Thu, 30 Sep 2021 14:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1266E40F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:08:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y26so25863837lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FbYwtZf63HA1feBdReYPazjfCwECYf7J/LcnagkS5eU=;
 b=qRQIo8RwUav2UmTra9oF6epGn59qVcbfkWvdDGVDc/I3VvWeddwr1dqwKGHN43kWcO
 DaknpPTwDGNSY0qj/vuZMQ+EkFjjT/DDyA8yAVbb5t8+cbMVH3ESCPkcYm04Ck8YWr43
 zrplPFlPo+zCWrz4Vd8LF+IXnAG5rtwSZu7cV47thKqF865BwfegPZ11umUl0wvxpi3u
 69cI9QAnuHM4T4curizIUlc+msZ3JMRXmJ23U1OoUXyP/pCpqx5znnf8RaSyTf/Iij/X
 R01C7FPFx014oNqZOzPeCr4tdIky5Bmc4sGwQxivsb0fd368heHcy8U6CVbuaHa44hXZ
 JOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbYwtZf63HA1feBdReYPazjfCwECYf7J/LcnagkS5eU=;
 b=GmpEho2uhVX9GLjoEdXv+Wrg4Mtr2pSwkw1g6Kabu9ueTbkT5vdNq/V3zbdv2RLn3G
 7yfaQT5X8399+aYn6RPOVJigy+DNPjj700sgewohl/kgrn5MolB4rUdryzAa0oi59mks
 IW6Mky1gCKlutDQDjCnhltCJSSvo/4VbID3/20jBKvVBsR7dW+/kmHAHqSDArx1KMCmL
 rQsTx20Md5ld8pM03iNu4H+g7oRtcShPdA5NGOEiG0XwrSgVpvaS1SJKQzPR2v3mZfI5
 uwQ6XHXsLX74d8rGAT4k1HjH9zZ78fRxeqghx7sfSA+J51YBiH87OSBCnKn2fBnNlOnx
 9/fA==
X-Gm-Message-State: AOAM532+JwGUy50RhCzZNA42OkNiNfpm/njsuzUQHNxUV7vVwyeb6aGz
 u/yKHYsPmhWBCzEJMKH8lJQ=
X-Google-Smtp-Source: ABdhPJw2MpyVxuwrGHjgPVIzNI4sHyolChi3D2RfJQLhexFRsDLjbr061I9VfMnIzN8pIMuESKq7Kw==
X-Received: by 2002:a2e:5046:: with SMTP id v6mr6445920ljd.368.1633010931799; 
 Thu, 30 Sep 2021 07:08:51 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.googlemail.com with ESMTPSA id r22sm357824lji.5.2021.09.30.07.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 07:08:51 -0700 (PDT)
Subject: Re: [PATCH v13 16/35] usb: chipidea: tegra: Add runtime PM and OPP
 support
To: Peter Chen <peter.chen@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-17-digetx@gmail.com> <20210930140630.GA6697@Peter>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e8eb0f29-2ffb-b1d8-34bf-7dff1e8ba1f8@gmail.com>
Date: Thu, 30 Sep 2021 17:08:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210930140630.GA6697@Peter>
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

30.09.2021 17:06, Peter Chen пишет:
> On 21-09-27 01:40:39, Dmitry Osipenko wrote:
>> The Tegra USB controller belongs to the core power domain and we're going
>> to enable GENPD support for the core domain. Now USB controller must be
>> resumed using runtime PM API in order to initialize the USB power state.
>> We already support runtime PM for the CI device, but CI's PM is separated
>> from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
>> to the driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 53 ++++++++++++++++++++++++----
>>  1 file changed, 46 insertions(+), 7 deletions(-)
...
> 
> I got below compile error if only compile this file, I think previous patches
> should include the definition, if that, feel free to add my ack to this
> patch.
> 
> Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> drivers/usb/chipidea/ci_hdrc_tegra.c:308:8: error: implicit declaration of function ‘devm_tegra_core_dev_init_opp_table_common’;
> did you mean ‘devm_tegra_core_dev_init_opp_table’? [-Werror=implicit-function-declaration]
>   308 |  err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |        devm_tegra_core_dev_init_opp_table

That's correct, devm_tegra_core_dev_init_opp_table_common() is added by
an earlier patch of this series. Thank you!
