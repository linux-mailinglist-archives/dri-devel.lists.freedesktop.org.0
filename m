Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5AF42496F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 00:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952F6EE7D;
	Wed,  6 Oct 2021 22:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108AE6EEAD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 22:03:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x27so16258696lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ocF1Zd1GgargbSRFkTmMQuOw5z6Jk+7ep3c3eIOkpY0=;
 b=ifXynuue/W+cts8xYAzQAjPsqjJAD3xm4bF5WPNBP3JdeZZeTkuHZ6o05Wga1mAEPW
 uZBGIlccZgW7Zx08VO5j7forCX1vkPQvvoGq55QfThNxZroKaf7wt+EiygR38dICdv6x
 rroUayAcRJedS+qeeYmhsWhHm9O8SGdiRISMqWg3sIqmtQtasrIDTGpy16tLvBqOnPdS
 7VFt0DzOxk9oISnLMP0hp7pLoAYRpd/mP7Y5dJB/Ou/2xDx40RzvKuKuN/+zcyw8MIYR
 7Kez1XrR98p/rr4uEPM0EsltzlzBLHnnhIfQ1lPQ+eKwuV1vbQZ+k+eIoHRBG6pJrLDt
 WmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ocF1Zd1GgargbSRFkTmMQuOw5z6Jk+7ep3c3eIOkpY0=;
 b=RkbCjuN1IoJZTP0s9WCyLvKW9iEOSv3akMqM9r1x/HzlkOho91q4mz5R4edWl3jYy0
 KGQCoVakggJFMqjpYkA+I21qryQNnD3d183toCJBkO3hsigmPZkV6W/6qmwR5oB0AaPJ
 fL1LLXceLnz2t5WxxDDI28KMHB0fsoXZrVj17bdqDtCetvEyIzfJYMBWa2lZoVciBtVO
 d9yXAPH6X6+Su2UZjBicQQkC7gMZtppkQUpjkyxZ2k/RZh4piW1i2vgZYQuDuLPnzBwG
 EByaIceIffBNPUZOjQgBC5+YwCyTdBoALa8NrLL4hcU2FKy/gBANFKYHVS36KZ2LUKJW
 54sg==
X-Gm-Message-State: AOAM530lk0xLx2tVEBEYwEo26HvGMtVKiCjjYpp/1dqSRPNfmiqpL+0Z
 RJgEKiV2wib8fwrcFNOvQtU=
X-Google-Smtp-Source: ABdhPJzzU4Kir/q2zSrh7VeOqOd6EwnvXqJt373WnDkIWpzjoqXokHPpHUyjZ+sXTNvD05zQT1QiYQ==
X-Received: by 2002:a05:651c:169c:: with SMTP id
 bd28mr586938ljb.476.1633557806201; 
 Wed, 06 Oct 2021 15:03:26 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id d7sm2600461lfa.80.2021.10.06.15.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 15:03:25 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
 <CAPDyKFq_-HGPRNiNDmnEbuah0mUYoRUWVs1SvbQ6VNMMwEcXjA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5dfe7463-7a92-59c5-3ba6-57d31fc5833c@gmail.com>
Date: Thu, 7 Oct 2021 01:03:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq_-HGPRNiNDmnEbuah0mUYoRUWVs1SvbQ6VNMMwEcXjA@mail.gmail.com>
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

06.10.2021 15:38, Ulf Hansson пишет:
>>> Right, so the PM domain managed in tegra_genpd_power_on|off() can
>>> still be powered on/off, as long as the clock remains ungated?
>> Not ungated, but prepared.
> Okay, thanks for clarifying!
> 
> In summary, it sounds like you should be able to fix this problem in
> the I2C driver as I suggested above. If that works, that seems much
> better.

I'll try this variant, thank you.

> Moreover, it would leave the clocks gated/unprepared when the system
> is fully suspended, which I guess is better from an energy point of
> view?

The clocks are kept gated, it wasn't a problem. The problem was that
clocks were needed to be enabled temporarily. In order to enable a
clock, it needs to be prepared first. When clock is prepared, it resumes
clock's device RPM.

Keeping clocks prepared shouldn't make a noticeable difference from the
energy POV since clocks are gated. It's only voltage that is kept high,
but we need to keep it high during suspend anyways in order to resume
successfully. The hardware is mostly gated during suspend, depending on
suspend mode, so the power consumption difference is negligible. At
least I haven't seen any problems, battery doesn't drain during suspend.
