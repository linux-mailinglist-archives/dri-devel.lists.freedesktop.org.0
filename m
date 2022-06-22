Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D725545A5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30110EEE5;
	Wed, 22 Jun 2022 11:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E3D10EEE5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 11:14:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o8so22927765wro.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
 b=z/ocsiUElwq2Ol2fF5l1HRqMMaNGMSC1/+8oQHLpQWLu429YrVBR/tnvq7KNWtwIO1
 vKJqA7rgUAiiGOKNdlwMjFurZAQLeqniaiGR74ASbDLlSriMOOzxItVhWE0QSvWSDF1z
 wnPR/hU6q/nU74KNLjXg2X84SJR1U2jxSqWO8a/x7jRbPZXjDqGeLFevtBezqUe56R1a
 7f0rlv+IRmpyGwRbiZXR3FrVvja2Yq3MOLg0mNs6za1kfz0V4uxdyGWKXZaA8ELytILx
 BDkiRFg7pp2SBYMObq/aoJYfogEZJWR+YhfycgXRStqMXxha87O37ft3cnQe33+/4mvE
 LISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
 b=X94Er2WkjBI05x450nBteiBAMaiVTgxzLReCMc+KnNyGkCKQpKB9oZD1ZQ0C5cD2Xy
 vHQbG6KN3MTF7WCo85DJncoHu2tuurce3Sy52f8t0yg8LJyAgq/fcG7Ple6ovlsL6prZ
 TW+2MCnXgrGH4J5V+j62/gm5yeHlsaDiBhaXT+HowpekAJVd+0mow3mZnlJBxJ8rcVNa
 7mtpDeIoXfOskGGSt6MLCsJVW1xhtrUCfDsMEIurLifAhLKdW0S+5Yox9DWHWohnqDMg
 QwEUP4t7neBTt6qc+rqBEEbiIDZ/aRr+53fzJcT0jZyw6DGuFNDH4ekcGlqoMVfcS8uv
 IhQQ==
X-Gm-Message-State: AJIora+Oxa9+Jyo7Bnxpub9PbL/GTGf+KgL4XMycKr4FBJeolxMohDa8
 fvM4JHyjrjXxHuT/5uUpO1BRxw==
X-Google-Smtp-Source: AGRyM1v8ZhY0hH8c8n7TvnmAfbU48Dyk1bFg4uJSDokafOQgQ79E0o3w+OeeG5ifCToe2pBEDS6Ykw==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr2726909wrr.410.1655896484628; 
 Wed, 22 Jun 2022 04:14:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1a3a:95bd:5b55:a798?
 ([2001:861:44c0:66c0:1a3a:95bd:5b55:a798])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b0021b91ec8f6esm7841714wrj.67.2022.06.22.04.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 04:14:43 -0700 (PDT)
Message-ID: <d57a6c52-a9e1-5660-cd47-6f9ba2389d86@baylibre.com>
Date: Wed, 22 Jun 2022 13:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
 <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Alexandru Ardelean <aardelean@deviqon.com>,
 Tomislav Denis <tomislav.denis@avl.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>,
 linux-iio <linux-iio@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Keguang Zhang <keguang.zhang@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dmaengine <dmaengine@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-crypto <linux-crypto@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 12:36, Andy Shevchenko wrote:
> On Tue, Jun 21, 2022 at 11:01 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>> On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:
> 
> ...
> 
>> (Pro tipp: The commit in next has a Link: footer. If you follow the
>> link, you find the thread that was actually applied (i.e. v9) and where
>> the fix is also contained.)
> 
> Even easier, you may take a message-id from the Link and supply to `b4`:
> 
>    b4 mbox ${message-id}
>    mutt -f ${message-id}.mbx # or whatever MUA that handles mboxes
> 
> 
> Dunno if `b4` has capability to parse Link instead of message-id.
> 

It does:


$ b4 mbox https://lore.kernel.org/r/20220616144915.3988071-1-windhl@126.com
Looking up https://lore.kernel.org/r/20220616144915.3988071-1-windhl%40126.com
Grabbing thread from lore.kernel.org/all/20220616144915.3988071-1-windhl%40126.com/t.mbox.gz
5 messages in the thread
Saved ./20220616144915.3988071-1-windhl@126.com.mbx

Neil
