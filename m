Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C647845CA5A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE086E418;
	Wed, 24 Nov 2021 16:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373136E270
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:47:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05B4560FE3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637772476;
 bh=xZZelNzGy3fEF+TRUP3mu2a2dvknfo0hSlfUMkdbXnE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QB2Os1i5AAZ9Xb5Ny2MOKmxAU9QaCl4g4U/BMONy2Go/4aNLCZCzKJp4JxdPfjil5
 qHxNPAYki4sRFQnethGWNHA8GHDZbL88c3bDuLfvcdTBjwqsGNST4xcjN2W+EGY1y0
 TvtMabQArNlwiSl0HxWQWfW+MKM5rssREZWlgFg6NjwjKGpKe6g39mGxEVGA3oaNxX
 HdmkqI2DxHPlkYycjzpNmN6H99QT9uBQ/u82VVGRg2GOI7x+KvH19VBj7dIKiSmSJA
 ADAU0J4jKCyMB/cBewSPJ3BzTq+hVhklOzMuTKcMRu99LF5Z4XVXjwqpsz5TxBueIE
 8jyssOdTheYGg==
Received: by mail-wm1-f51.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso6025362wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:47:55 -0800 (PST)
X-Gm-Message-State: AOAM531pQe+6m5SOOm5rN2ITJ9YKxPRztdGOJChGaIkTn6GmcI4rGZhA
 clMuhak00icbu0eMnfi9JjEUsZmU1CGB5qnmigc=
X-Google-Smtp-Source: ABdhPJwbFP7vLbm8pNQQOpEuYc09R2zZihV7ND7aqtuJCkGnJDFI12J2lrIBTl3QZQQRaScbWu3GRnefAkQ3ygpVdCU=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr16061185wmi.173.1637772474274; 
 Wed, 24 Nov 2021 08:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
 <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
In-Reply-To: <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Nov 2021 17:47:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
Message-ID: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
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

On Wed, Nov 24, 2021 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 23.11.2021 01:21, Arnd Bergmann =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> The commit message is correct, however you could remove even more code
> here. But there is no need to make a v3 just because this patch because
> I already prepared patchset that revives this S/PDIF driver and enables
> HDMI audio on Tegra20. I'll take care of cleaning up the whole code of
> this driver.

Ok, perfect, thanks for taking a closer look as well.

>
> -       dmareq =3D platform_get_resource(pdev, IORESOURCE_DMA, 0);
> -       if (!dmareq) {
> -               dev_err(&pdev->dev, "No DMA resource\n");
> -               return -ENODEV;
> -       }
> -

Right, I think I considered doing this at some point as well, not sure
why I left it in for the version I posted. Passing the IORESOURCE_DMA
values is clearly wrong by itself and needs to be removed, though
it's not obvious what the correct way of requesting the DMA channel
is for this driver either, without a DT binding or users.

        Arnd
