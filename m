Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785A45291F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 05:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B996E5BD;
	Tue, 16 Nov 2021 04:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5736E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 04:29:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66AA16023D;
 Tue, 16 Nov 2021 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637036939;
 bh=rcwRBlCKqfF/fOP7nToqyQtxiDrvbRwb9qhV9pcd3SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCkkYmiCsuCs6VTYyStyePuhjavoZznkD15Pfk4kfmFcnpOyhqwefXwCEerdsi5BB
 gaxqtKh7IVnWz3O+cSAsdJUjs6zKFkagpHyNquC8O99klBS/lKo/7gFtT7CHdCC6ar
 6K/pSsHI8+2FH3V1I1L7V2qq8dmjNebnK0MyEtDZ/hdrNv4x1IyseRUmNFq3EiZJ7c
 1oiPRI0DMs2kje0Hvslatdsud/obFQMRW9uHW8NpKk4mIv94ytNZbHvJadN/Nn9YZY
 tGLIxmhA6nCk6OcdFZAV34UHFuwVplf/2bcz9WsNFmm3THY7N2KypMCnwedbGoDGcy
 AW5qdaBZVvhpQ==
Date: Tue, 16 Nov 2021 09:58:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZMzhoWX0S5oPI6j@matsya>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
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
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15-11-21, 11:21, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > >       spin_lock_irqsave(&chan->lock, flags);
> > >
> > >       /*
> > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > -      * group.
> > > +      * Abuse the peripheral_config to indicate that the channel is part
> >
> > Is it still an abuse, or is this now the right way to pass custom data
> > to the DMA engine driver ?
> 
> It doesn't make the driver any more portable, but it's now being
> more explicit about it. As far as I can tell, this is the best way
> to pass data that cannot be expressed through the regular interfaces
> in DT and the dmaengine API.
> 
> Ideally there would be a generic way to pass this flag, but I couldn't
> figure out what this is actually doing, or whether there is a better
> way. Maybe Vinod has an idea.
> 
> I'll change s/Abuse/Use/ for the moment until I get a definite answer.

I would feel this is still not use for the peripheral_config, but lets
keep it to get rid of slave_id.

Also, I would be better if this was moved to DT as the next cell, don't
recall why that was not done/feasible.

-- 
~Vinod
