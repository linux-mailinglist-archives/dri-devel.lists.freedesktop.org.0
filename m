Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A74504EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2B26ED99;
	Mon, 15 Nov 2021 13:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D54E6ED99
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:06:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1142FD3E;
 Mon, 15 Nov 2021 14:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636981573;
 bh=S400eBbi5TVNWpj2Sq2il82O7vrNbB0L6EDIkwL9CvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuJFczqyURd3bNnnE6zXNftSaB5jKtcwJnjQTyM3WJG89V2u+Roo+NiwAr/RUngIA
 E2c1ezIwcRsLVNxRRAuadHct1K/oTpdoEKIdJ5k7m96EiJ+UGAbd4M/hv76UAtnoqx
 GP2lyD8TkFiLO/jC+DLqQVsUesrxNYWsEhNFrXjc=
Date: Mon, 15 Nov 2021 15:05:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
 <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 01:38:07PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart wrote:
> > On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> > > On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > > > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > > >       spin_lock_irqsave(&chan->lock, flags);
> > > > >
> > > > >       /*
> > > > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > > > -      * group.
> > > > > +      * Abuse the peripheral_config to indicate that the channel is part
> > > >
> > > > Is it still an abuse, or is this now the right way to pass custom data
> > > > to the DMA engine driver ?
> > >
> > > It doesn't make the driver any more portable, but it's now being
> > > more explicit about it. As far as I can tell, this is the best way
> > > to pass data that cannot be expressed through the regular interfaces
> > > in DT and the dmaengine API.
> > >
> > > Ideally there would be a generic way to pass this flag, but I couldn't
> > > figure out what this is actually doing, or whether there is a better
> > > way. Maybe Vinod has an idea.
> >
> > I don't think we need a generic API in this case. The DMA engine is
> > specific to the display device, I don't foresee a need to mix-n-match.
> 
> Right. I wonder if there is even a point in using the dmaengine API
> in that case, I think for other single-purpose drivers we tend to just
> integrate the functionality in the client driver. No point changing this
> now of course, but it does feel odd.

I agree, and that's what I would have done as well, if it wasn't for the
fact that the DMA engine also supports a second client for audio. This
isn't supported in upstream yet. We could still have created an ad-hoc
solution, possibly based on the components framework, but the DMA engine
subsystem wasn't a bad fit.

> From my earlier reading of the driver, my impression was that this
> is just a memory-to-memory device, so it could be used that way
> as well, but does need a flag when working on the video memory.
> I couldn't quite make sense of that though.

It's only memory-to-device (video and audio). See figures 33-1 and 33-16
in https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

> > >         /*
> > >          * Use the peripheral_config to indicate that the channel is part
> > >          * of a video group. This requires matching use of the custom
> > >          * structure in each driver.
> > >          */
> > >         pconfig = config->peripheral_config;
> > >         if (WARN_ON(config->peripheral_size != 0 &&
> > >                     config->peripheral_size != sizeof(*pconfig)))
> > >                 return -EINVAL;
> >
> > How about
> >
> >         if (WARN_ON(config->peripheral_config &&
> >                     config->peripheral_size != sizeof(*pconfig)))
> >
> > >
> > >         spin_lock_irqsave(&chan->lock, flags);
> > >         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > >             config->peripheral_size == sizeof(*pconfig))
> >
> > And here you can test pconfig != NULL.
> 
> Good idea. Changed now, using 'if (pconfig)' without the '!= NULL'
> in both expressions.

Sounds good to me.

-- 
Regards,

Laurent Pinchart
