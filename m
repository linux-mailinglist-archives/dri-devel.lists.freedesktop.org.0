Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9B4503C7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4169B6E938;
	Mon, 15 Nov 2021 11:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2BB6E938
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:50:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A4AB9CA;
 Mon, 15 Nov 2021 12:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636977002;
 bh=8re/QsV/3GPHXV9j74dqu0H+3pTypCailVuz8uMMvrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTtRDp36OT7fx+mEQdB5Q6I6Uf3svTjc7O60k3oZ4d4LDZwX9gRNLXKCFKYdS58b6
 iochdzQTE6K7vejlHf4MMrQFHA3VGrfZCRSuARACO154L7RPOUcQFEq3FEieaAnbP9
 1Q/7byArzgxRl2K9AECFy7SDhkfUFmq2YmZNiRrQ=
Date: Mon, 15 Nov 2021 13:49:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hi Arnd,

On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
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

I don't think we need a generic API in this case. The DMA engine is
specific to the display device, I don't foresee a need to mix-n-match.

> I'll change s/Abuse/Use/ for the moment until I get a definite answer.
> 
> > > +      * of a video group.
> > >        */
> > > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > > -             chan->video_group = config->slave_id != 0;
> > > +     pconfig = config->peripheral_config;
> >
> > This could be moved to the variable declaration above, up to you.
> 
> I considered that but since it doesn't fit in a normal 80-column
> line, it seemed best to do it here.
> 
> > > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > > +         config->peripheral_size == sizeof(*pconfig))
> >
> > Silently ignoring a size mismatch isn't nice. Could we validate the size
> > at the beginning of the function and return an error ?
> 
> Yes, good idea. Since this would mean a bug in another driver,
> I'll add a WARN_ON() as well to make it clear which driver caused it.
> This is what I have now, let me know if you have any further suggestions:
> 
>         /*
>          * Use the peripheral_config to indicate that the channel is part
>          * of a video group. This requires matching use of the custom
>          * structure in each driver.
>          */
>         pconfig = config->peripheral_config;
>         if (WARN_ON(config->peripheral_size != 0 &&
>                     config->peripheral_size != sizeof(*pconfig)))
>                 return -EINVAL;

How about

 	if (WARN_ON(config->peripheral_config &&
		    config->peripheral_size != sizeof(*pconfig)))

> 
>         spin_lock_irqsave(&chan->lock, flags);
>         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
>             config->peripheral_size == sizeof(*pconfig))

And here you can test pconfig != NULL.

>                 chan->video_group = pconfig->video_group;
>         spin_unlock_irqrestore(&chan->lock, flags);
> 
>         return 0;
> 
> > With these issues addressed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
