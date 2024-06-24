Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A345915678
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 20:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CFC10E16C;
	Mon, 24 Jun 2024 18:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="b96I4IBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4710E16C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 18:27:27 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dff02b8a956so4137053276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1719253646; x=1719858446;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TS7GRJVBSbiXIfOc3555Cy+7DvtDs4tYIL95YiKGyb0=;
 b=b96I4IBU5HXTuOTeLKtz+VzNICA8znlgsQK8ija5Js28zMV1e3H1ObY9BfUWE6EtXC
 6cA+K89gc7Ae+1JYbSkGrsLK5HzbZFNUB73bvWdTRSs0BQX4cyArz+GjF9RXp2C12j2l
 HdiHisYaras+B3Ap1C4v/iJsNyFe5pchNhaPsiFZaceVLHij4RVPW0y4Q5Ruas+jzIYf
 XecKNLHdANwRMs6+ic2McMCe6cPaswpvgxLqJU16EmYzgMyGgVOXOTgFy7tyYIDI/5uI
 ViHfVeUBHAh9WpPxQoUlkjdm1UuNjP/9T1yq2F3MmhCzYag1H97jQs7fZtDBsHV1hsAa
 zIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719253646; x=1719858446;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TS7GRJVBSbiXIfOc3555Cy+7DvtDs4tYIL95YiKGyb0=;
 b=eAr6pGCG8W8WMQPVWSIBwleq0eECy9orRB/arAVCO1rcRm+icg6YpR9Ap3zOPk/O49
 +3cgT5ABmCNJLYH+GQxDIdWk+br/BGrAY/XfYOuxALaP9MsMX7eEXigVT+ES/LCmDiz8
 fkhDESLobdu/tpjn1avYkw5hueK2OMvNQ2TU7JhgektquSx5wlF02DXL5OskiJSYbSQF
 T6PFY+tIbkjea/zEQHjAoCn1+ct0VAqcGA9F3hAi+AFbmO+aTv1IWRJ2UawQZ4sgDa2O
 COMmvzN7XhmLpr//E2Ebcv2hephWKYrAwWyJeocgVugkWx3EOXAiPoqjDULn55Jr5Mt8
 VJoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv7klxUXRc8SUbBLkEcqPVjG1apIyuVNGLq+W0UlX/vXXlSSUWHSq83zEIn8xnbbKtlMWdpfi40v9cO5xlhjPyAe742FUO3lJkLE/yT5I7
X-Gm-Message-State: AOJu0Yw9hRnCsNqux6hDZUgznjf9iwlgEvB240YfpCCgrk4lkgSus58o
 uNTWUHiS1CDSltiOEKrEkcUe4anPICb8cC8H9GZQCZNpcsjUgqWLzvkm6iRYREjw0PtwO1VmEoj
 SvhmicU+Bo6Pg1izG3Izx6nCzmbIhOr/PPfiv6Q==
X-Google-Smtp-Source: AGHT+IHNIsxL7IdqCLVSyINZgDjQkCRHKPTAM+t9FlDhG+E0Ru/sJKPmgt69/U4c0BD886Tzeyv8OL4cFF7/wYneLNI=
X-Received: by 2002:a25:8442:0:b0:dfe:199d:798f with SMTP id
 3f1490d57ef6-e0300f40230mr5287028276.19.1719253645903; Mon, 24 Jun 2024
 11:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-10-dave.stevenson@raspberrypi.com>
 <ZmCqxhv2jF3bT8dH@lizhi-Precision-Tower-5810>
In-Reply-To: <ZmCqxhv2jF3bT8dH@lizhi-Precision-Tower-5810>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 24 Jun 2024 19:27:10 +0100
Message-ID: <CAPY8ntBZaS_hrDnrrEUohsc+V27fFho3Je+bJRDYFKcQ5vfPgQ@mail.gmail.com>
Subject: Re: [PATCH 09/18] dmaengine: bcm2835: Add function to handle DMA
 mapping
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vladimir Murzin <vladimir.murzin@arm.com>, Phil Elwell <phil@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, iommu@lists.linux.dev, 
 linux-sound@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jun 2024 at 19:13, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, May 24, 2024 at 07:26:53PM +0100, Dave Stevenson wrote:
> > The code handling DMA mapping is currently incorrect and
> > needs a sequence of fixups.
>
> Can you descript what incorrect here?

Clients are passing in DMA addresses, not CPU physical addresses. I'll
update the commit message.

> > Move the mapping out into a separate function and structure
> > to allow for those fixes to be applied more cleanly.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 46 ++++++++++++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index aefaa1f01d7f..ef1d95bae84e 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -65,6 +65,10 @@ struct bcm2835_cb_entry {
> >       dma_addr_t paddr;
> >  };
> >
> > +struct bcm2835_dma_chan_map {
> > +     dma_addr_t addr;
> > +};
> > +
> >  struct bcm2835_chan {
> >       struct virt_dma_chan vc;
> >
> > @@ -74,6 +78,7 @@ struct bcm2835_chan {
> >       int ch;
> >       struct bcm2835_desc *desc;
> >       struct dma_pool *cb_pool;
> > +     struct bcm2835_dma_chan_map map;
>
> I suppose map should in bcm2835_desc.  if put in chan, how about client
> driver create two desc by bcm2835_dma_prep_slave_sg()?
>
> prep_slave_sg()
> submit()
> prep_savle_sg()
> submit()
> issue_pending()

I'm basing this on rcar-dmac.c which has a similar mode of operation.

For devices such as HDMI audio, I2S, SPI, etc, the peripheral's
address is constant. Mapping and unmapping adds an overhead. Retaining
the mapping in the chan structure allows the mapping to be cached
whilst the address remains the same, and is released whenever the
address changes.

If the map is in bcm2835_desc then as the desc is freed after every
transfer you'd have to unmap.

  Dave

> Frank
>
> >
> >       void __iomem *chan_base;
> >       int irq_number;
> > @@ -268,6 +273,19 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
> >       }
> >
> >       return false;
> > +};
> > +
> > +static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
> > +                                   phys_addr_t dev_addr,
> > +                                   size_t dev_size,
> > +                                   enum dma_data_direction dev_dir)
> > +{
> > +     struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> > +     struct bcm2835_dma_chan_map *map = &c->map;
> > +
> > +     map->addr = dev_addr;
> > +
> > +     return 0;
> >  }
> >
> >  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
> > @@ -734,13 +752,19 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
> >       }
> >
> >       if (direction == DMA_DEV_TO_MEM) {
> > -             if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> > +             if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
> > +                                            c->cfg.src_addr_width,
> > +                                            DMA_TO_DEVICE))
> >                       return NULL;
> > -             src = c->cfg.src_addr;
> > +
> > +             src = c->map.addr;
> >       } else {
> > -             if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> > +             if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
> > +                                            c->cfg.dst_addr_width,
> > +                                            DMA_FROM_DEVICE))
> >                       return NULL;
> > -             dst = c->cfg.dst_addr;
> > +
> > +             dst = c->map.addr;
> >       }
> >
> >       /* count frames in sg list */
> > @@ -795,14 +819,20 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
> >                             __func__, buf_len, period_len);
> >
> >       if (direction == DMA_DEV_TO_MEM) {
> > -             if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> > +             if (bcm2835_dma_map_slave_addr(chan, c->cfg.src_addr,
> > +                                            c->cfg.src_addr_width,
> > +                                            DMA_TO_DEVICE))
> >                       return NULL;
> > -             src = c->cfg.src_addr;
> > +
> > +             src = c->map.addr;
> >               dst = buf_addr;
> >       } else {
> > -             if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> > +             if (bcm2835_dma_map_slave_addr(chan, c->cfg.dst_addr,
> > +                                            c->cfg.dst_addr_width,
> > +                                            DMA_FROM_DEVICE))
> >                       return NULL;
> > -             dst = c->cfg.dst_addr;
> > +
> > +             dst = c->map.addr;
> >               src = buf_addr;
> >       }
> >
> > --
> > 2.34.1
> >
