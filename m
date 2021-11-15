Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D545025B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490C66E488;
	Mon, 15 Nov 2021 10:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C46E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BC3A63214
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971821;
 bh=/t8XfUWWM8z249haMNnkzo9rz3rqA5hhnI/QUDdDTws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BuOY5ELTwM8ARl8dht0vPj74GqpW7Omi9ye6DZXl4ISYUdhHvn/MD+ynDDUT+QFtA
 v8L7yTHPnv3tNZT+6a7jmvQiyHLX42OhSBtuErgkkpXMWboLAxbpYYXhkMyhP3kE41
 WUL+WGa8r2Ml5m1pmbyJCKNiWaAA/tcOe62yL/fiNo14Evo43QgmMCKuyU9uToylcA
 J85yoCIJTYPD2hiiYP9cnEUTFS41uyXrFoia9J9lYRG9OY91kMrhg72OL5ozjj1uQi
 01RuRIianAw8FITBywentT0od4DYro7YDzqlmkyd3IDz3Pd+duWc1lFOAhroRxLO8P
 vWZ7OvjtlSIUw==
Received: by mail-wr1-f42.google.com with SMTP id d27so29623166wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 02:23:41 -0800 (PST)
X-Gm-Message-State: AOAM532bFu4tBr2vRRyUgUKr2NDM970gSNDkdeSusIeji+QweyKpaMT5
 4qQDAdzcrg6qhDQcahYZjx95dRQn/sqCKN4WUO8=
X-Google-Smtp-Source: ABdhPJzrg17TRzVZ0g7WiohBQZUnVilsZRnhlMklfo7pQF89sOPyjg8lWeE+TbAhUi7fYkrm+wuR9SFoHCL7lz7Lazw=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45210699wrl.336.1636971819867; 
 Mon, 15 Nov 2021 02:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
 <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
In-Reply-To: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:23:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 10:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > ---
> >  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
>
> This driver has been already deleted from the staging tree. See [0].

Ok, thanks! I'll just leave out the patch from future submissions, and remove
it completely once your commit hits mainline.

       Arnd
