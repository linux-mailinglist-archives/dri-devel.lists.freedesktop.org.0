Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3A4502AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08E86ECEE;
	Mon, 15 Nov 2021 10:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37346ECEE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:42:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79FA36322E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636972950;
 bh=GF5ppKwJBGyzBz8YYmc0v0PuTfRZzEb8KsPYdX9kZys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ah/2tRgiVpL5fsi7FPpcL635JDhcln6l2ExZIWHTLBUbMjdBJtz0DoVh8A2lD2GeS
 Vn5loajjfQVDFPQtLSRLZGgFOOu9gaKK3ygqoSrLlln9jWXCpaNqhh48lZ8c+k+4gu
 sRf7wuCD69gIDwdqAcDKjxNp/YsEuFSMvDDDQT7VHpaJYuJxZPW/xofRGd5PidTsHa
 kAWstx1aMCAeHyFhdJIprnubYysWs5QAKZBMy/vWApTOP0uD7D8phUBIQiY3lLQ5f/
 +MVP+HB9F9xrWDthVsi8GxjjhUCyNhOn85FTRAs3rVEuGA/K5Upw6e+cpw5gK86TyV
 zRQeafG4VMnqA==
Received: by mail-wm1-f52.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so12067350wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 02:42:30 -0800 (PST)
X-Gm-Message-State: AOAM531dJ0c0BmzeBnTCTKBpcW74Gxmv9vxApKbjcUxMeILtI49hVCwk
 +bOVFRKsVpRlgJolueY092DBA/ZxLyp0p+ZqYJI=
X-Google-Smtp-Source: ABdhPJxXAexhirAvGW2LKyfe3zijMEf2dKYT5qfqRJ6eAMXzz6GR60sm0yXhnH6+pWfe4YG9EjpedQhiHwxXAXFjyDM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr57234330wmi.173.1636972948695; 
 Mon, 15 Nov 2021 02:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
In-Reply-To: <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:42:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de> wrote:
>
> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This field is never set, and serves no purpose, so remove it.
>
> I agree that we should remove it. Its been legacy support code for a
> while, but the description that there is no user is not right.
>
> The tegra20_spdif driver obviously uses it and that user is removed in
> this patch. I think it makes sense to split that out into a separate
> patch with a description why the driver will still work even with
> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
> driver.

Ok, I'll split out the tegra patch and try to come up with a better
description for it. What I saw in that driver is it just passes down the
slave_id number from a 'struct resource', but there is nothing in
the kernel that sets up this resource.

Do you or someone else have more information on the state of this
driver? I can see that it does not contain any of_device_id based
probing, so it seems that this is either dead code, the platform_device
gets created by some other code that is no longer compatible with
this driver.

      Arnd
