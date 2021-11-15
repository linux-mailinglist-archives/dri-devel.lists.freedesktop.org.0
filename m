Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB42450804
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470646E1A3;
	Mon, 15 Nov 2021 15:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782C6E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:15:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F24AB63212
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636989318;
 bh=caNhQR6MItqyqj8aVGADFWmRHHEWyDNeG1UmwE7ptic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V/bQc6DKqJJ9P37PTBVcjhzef7pDvNHRvr3F3EgUQSqR6cy9gSS6hyzZDciApni0a
 3QMWN6MNNmORUy4BghYhYSm0TENrtMowNG+BxfSpe4F6N3jXjJPkkbXvN49Ox0bMTt
 fWhgBksXDZXchbDYG70HcbRVWZGHGtswftEIz2iyfbKUP7KKPZVOsGmmLlIrKIXyeJ
 gzuikhV7beCSHi+4AycaC9/XDi8NPveqOXyRlBsMjwDJnNyhOY3SSISSPPYeOikYGF
 0Xs8EXetoSOIeENEILqVUTpQifde5TJSWu7mnaCK9kgeWQDH6Cm3MkdBV5hVy9UqQz
 656gt9SaY+hCg==
Received: by mail-wm1-f43.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso330198wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 07:15:17 -0800 (PST)
X-Gm-Message-State: AOAM5323/cUBDTw0YkoY8EjUO1/qRQjntTb302RSfzENS1n1RLKWZKqY
 emPOG/V6Tni6wFIPd3XzzaKYl44zSOc5zqaEpZw=
X-Google-Smtp-Source: ABdhPJy8n2MSwzh6suyWZ9JESZ+B+WCCwhvtwsBUIZeDj84QhV0+ZckRDxWsOxlhdmOo7jylNl8QiKm3gBRShRPmqHI=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr42651026wmj.35.1636989316377; 
 Mon, 15 Nov 2021 07:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
 <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
In-Reply-To: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 16:15:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Laxman Dewangan <ldewangan@nvidia.com>,
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
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 3:46 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 15.11.2021 14:53, Lars-Peter Clausen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> That Tegra SPDIF driver was never used. Still there is a growing
> interest nowadays in making it alive by implementing HDMI audio support
> for Tegra20 SoC. It was on my todo list for a long time, I'll try to
> prioritize that work 5.17, it shouldn't take much effort.
>
> The slave_id should be removed anyways, it won't be needed.

Ok, thanks for the background, I'll mention that in the changelog text then=
.

     Arnd
