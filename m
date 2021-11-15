Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9C45076C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBA96EA91;
	Mon, 15 Nov 2021 14:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54636EA4B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:46:25 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k2so28547320lji.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=MKv4lJzovSleVVtb8Uez4QS8nWVoyslVc4dAhZ3Ja9hcfOWhdQeyMWw6FHhrLjYpMe
 nYJhoHPJHieO78N1tejBSn1JjrO7HehrBzOD6p80ebHQ/GkZbHzj+oDCc5U4EAGGyBKV
 xbJLawSqjqY4fBNx9jKlTQhw4P401MYqth7VhZkzSxvdhwOw2g0BxwUpHsNeyVoCEXwg
 AneGSb38fLLRS0lfd/WXUhHjDQTfopD289+UYtNAyG6eoU7lhx2ZHI9h8rOgSDINeyOy
 BSHVlS4ECWcjRF5ej1E2mdUBpiNe11q16/40ayNE4SINNFWYIMy3ZhzwXNTN4fPHDK38
 wMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=uqPKOXC4nH7KMrI37ZUvnv/apmrndEG9euzB50PLvzAuPMQNQQ0PTgHZTxBqoFw13H
 EwmH0k89gFx2DpNb7udYfwKDaoCIDKIWy4ue2Q3Gu/1pUUrmURGBkkh6OS/ZEk/hmvps
 AJFAxmdBvwexc6IsUKw4uwWjQdkShUkOSjKSPtqyKx8qlMx/qMDSJpRb+JG9/lRd8uZd
 n6p1CC7P1G/nKTbs/LVyYZFyhKiLUQkQHoBf65oMb8SPybFlGnt4yDcT7QJcW19Rutot
 o0ZjnpA1YTbBimQraUjqWK/xcCWtlE57lW2uPQFhs1oxhAuiAR3y67gY5e5ew7bRa/rA
 bqqA==
X-Gm-Message-State: AOAM530IKebGcpNZKNeF9COi1M6yCu9UAw/ZC4Q4ZLjJdokUVELPbjAx
 6S8rgM0o8w6fzrhzfkjKWQA=
X-Google-Smtp-Source: ABdhPJyGzX+uJoClUoX59O9YRdwTgWzR3XA1e/9PtaHs0iyNVaYjGst0rpo/clkWJ4amyTD6J2hiFA==
X-Received: by 2002:a2e:b711:: with SMTP id j17mr29887114ljo.39.1636987584324; 
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.googlemail.com with ESMTPSA id j2sm1445777lfr.109.2021.11.15.06.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
Date: Mon, 15 Nov 2021 17:46:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15.11.2021 14:53, Lars-Peter Clausen пишет:
> On 11/15/21 11:42 AM, Arnd Bergmann wrote:
>> On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de>
>> wrote:
>>> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> This field is never set, and serves no purpose, so remove it.
>>> I agree that we should remove it. Its been legacy support code for a
>>> while, but the description that there is no user is not right.
>>>
>>> The tegra20_spdif driver obviously uses it and that user is removed in
>>> this patch. I think it makes sense to split that out into a separate
>>> patch with a description why the driver will still work even with
>>> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
>>> driver.
>> Ok, I'll split out the tegra patch and try to come up with a better
>> description for it. What I saw in that driver is it just passes down the
>> slave_id number from a 'struct resource', but there is nothing in
>> the kernel that sets up this resource.
>>
>> Do you or someone else have more information on the state of this
>> driver? I can see that it does not contain any of_device_id based
>> probing, so it seems that this is either dead code, the platform_device
>> gets created by some other code that is no longer compatible with
>> this driver.
> 
> I've looked into this a while back, when I tried to remove slave_id. And
> as far as I can tell there were never any in-tree users of this driver,
> even back when we used platform board files. Maybe somebody from Nvidia
> knows if there are out-of-tree users.

That Tegra SPDIF driver was never used. Still there is a growing
interest nowadays in making it alive by implementing HDMI audio support
for Tegra20 SoC. It was on my todo list for a long time, I'll try to
prioritize that work 5.17, it shouldn't take much effort.

The slave_id should be removed anyways, it won't be needed.
