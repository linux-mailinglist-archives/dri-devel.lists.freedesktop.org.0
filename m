Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C347591563C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 20:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95CC10E516;
	Mon, 24 Jun 2024 18:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Lose1cti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E21510E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 18:11:16 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6325b04c275so46294747b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1719252675; x=1719857475;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5jGR9g/Bb8Va571zVMLt5UXvxDZ++mFdkIqRAoUvAic=;
 b=Lose1ctip7vskxeB7Z2gGnTTyYf3taDmy5DFzy1Dho4X6jPHbfplzQK3e5rh9ytNgt
 x8HhNQ8K7BbolC1zP2iz42RkLUNAbLOwEi0Oh5vgdwvilKvMh78Esq9SRtU4SoVkYv3B
 sqhwQmxqXb+W8qAgNsBC/i2Xjw14bcIRPLn/lE+Vpgu7Abq8fdxTNd/jCYrB4BruvKv3
 Nq856Ltg1pYsySlzU9XNX1mB4szjr2ZvVx2ZkCipv1RauSwypVjnbIVQYq3mmzFB2XIv
 ctwee4MEb/B2PIDvgWrVbZaUhqms1zDcbxBrcz6dE1x5IjNuxNBbUIviRWgow9Ec4Pjm
 Bh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719252675; x=1719857475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5jGR9g/Bb8Va571zVMLt5UXvxDZ++mFdkIqRAoUvAic=;
 b=iaRr2rSzXs0BDll8gSKdZqiKkTafFN/sAsopQkuzwAOl1Ao90AUu+SZbgf09WrG5T+
 O4PCTXKQWRyiNsyGSE/rgibNXo0Fem6GTfHkD9cfJELeWnpX6CCxeU19p3qCXJY4f75O
 oKqK5FMeSxIIBLSWSBqwOSg65Z9EvlU0xgoXRwJK/ka+R7BEML9rPtxVUWjePkm8o9UH
 QlsWiWcrL6CRr7E+Kz2SQ1vttr41ctA8/AnC6JXGFo2OGWMSkgjD1DDG2cEoR75uj6ed
 EgBM3r9DuEGGZHkC/i0B9DzhI5yChOWbhPSMzdDYrdLbrWVcGzbqyBfDyCSu0snjAiO+
 4EPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0C8HYQxNCMIRC9j7ky0N1TDx48H3zuuhg5dFTLGoQi8PaKrV4rISuVS18yxS3+mZ7KbVYlEvPspsU6CIOz+3uq9Pmh+RA5md2I1BGyZPy
X-Gm-Message-State: AOJu0YzExYYapqLZ5uffjP+auhQ+7oeVK3oMbzkTHiekv8r4f8YrA2q0
 c8MIyIVYs8QBCCTbZG0dOhVAtAmnxCsT2/Cg7Vh6pyYsdKOlMaGiSUoC6UFc9SWdQRh6h/2kI6G
 9c9gkcuMAO//wuF1It183DPuLIdyFytLK79dhNA==
X-Google-Smtp-Source: AGHT+IFaAqmhNPlm6MCoDVgffhkfuksOWP1wIZM8AnbBnkW6RDpNrHr6R7v3rNj3Wz45MorU/sgEZjJu5xv7+4bnw1s=
X-Received: by 2002:a25:c54d:0:b0:e02:bf87:7cd4 with SMTP id
 3f1490d57ef6-e0303fea2bdmr5469380276.53.1719252675064; Mon, 24 Jun 2024
 11:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-9-dave.stevenson@raspberrypi.com>
 <ZmCo4IfRhEzMf9gs@lizhi-Precision-Tower-5810>
In-Reply-To: <ZmCo4IfRhEzMf9gs@lizhi-Precision-Tower-5810>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 24 Jun 2024 19:10:58 +0100
Message-ID: <CAPY8ntBNz5tGfVz7FJ0wvzxWZ+AyjbTn7JbDFX=cNq-EN2Vu5A@mail.gmail.com>
Subject: Re: [PATCH 08/18] dmaengine: bcm2835: pass dma_chan to generic
 functions
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
 linux-sound@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
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

Hi Frank.

On Wed, 5 Jun 2024 at 19:05, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, May 24, 2024 at 07:26:52PM +0100, Dave Stevenson wrote:
> > From: Stefan Wahren <stefan.wahren@i2se.com>
> >
> > In preparation to support more platforms pass the dma_chan to the
> > generic functions. This provides access to the DMA device and possible
> > platform specific data.
>
> why need this change? you can easy convert between dma_chan and
> bcm2835_chan.

These patches are leading to adding a bcm2711_chan structure for a new
(but very closely related) variant of the DMA controller.

dma_chan is the generic structure, therefore we can keep more
commonality between the variants if we use that wherever possible.

  Dave

> >
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 24 ++++++++++++++----------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index e2f9c8692e6b..aefaa1f01d7f 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -288,12 +288,13 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
> >  }
> >
> >  static bool
> > -bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
> > +bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
> >                                struct bcm2835_dma_cb *control_block,
> >                                size_t len, size_t period_len,
> >                                size_t *total_len)
> >  {
> > -     size_t max_len = bcm2835_dma_max_frame_length(chan);
> > +     struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> > +     size_t max_len = bcm2835_dma_max_frame_length(c);
> >
> >       /* set the length taking lite-channel limitations into account */
> >       control_block->length = min_t(u32, len, max_len);
> > @@ -417,7 +418,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
> >               /* set up length in control_block if requested */
> >               if (buf_len) {
> >                       /* calculate length honoring period_length */
> > -                     if (bcm2835_dma_create_cb_set_length(c, control_block,
> > +                     if (bcm2835_dma_create_cb_set_length(chan, control_block,
> >                                                            len, period_len,
> >                                                            &total_len)) {
> >                               /* add extrainfo bits in info */
> > @@ -485,8 +486,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
> >       }
> >  }
> >
> > -static void bcm2835_dma_abort(struct bcm2835_chan *c)
> > +static void bcm2835_dma_abort(struct dma_chan *chan)
> >  {
> > +     struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >       void __iomem *chan_base = c->chan_base;
> >       long int timeout = 10000;
> >
> > @@ -513,8 +515,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >       writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
> >  }
> >
> > -static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> > +static void bcm2835_dma_start_desc(struct dma_chan *chan)
> >  {
> > +     struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >       struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
> >       struct bcm2835_desc *d;
> >
> > @@ -533,7 +536,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >
> >  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >  {
> > -     struct bcm2835_chan *c = data;
> > +     struct dma_chan *chan = data;
> > +     struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >       struct bcm2835_desc *d;
> >       unsigned long flags;
> >
> > @@ -566,7 +570,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >                       vchan_cyclic_callback(&d->vd);
> >               } else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
> >                       vchan_cookie_complete(&c->desc->vd);
> > -                     bcm2835_dma_start_desc(c);
> > +                     bcm2835_dma_start_desc(chan);
> >               }
> >       }
> >
> > @@ -594,7 +598,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
> >       }
> >
> >       return request_irq(c->irq_number, bcm2835_dma_callback,
> > -                        c->irq_flags, "DMA IRQ", c);
> > +                        c->irq_flags, "DMA IRQ", chan);
> >  }
> >
> >  static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
> > @@ -682,7 +686,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
> >
> >       spin_lock_irqsave(&c->vc.lock, flags);
> >       if (vchan_issue_pending(&c->vc) && !c->desc)
> > -             bcm2835_dma_start_desc(c);
> > +             bcm2835_dma_start_desc(chan);
> >
> >       spin_unlock_irqrestore(&c->vc.lock, flags);
> >  }
> > @@ -846,7 +850,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
> >       if (c->desc) {
> >               vchan_terminate_vdesc(&c->desc->vd);
> >               c->desc = NULL;
> > -             bcm2835_dma_abort(c);
> > +             bcm2835_dma_abort(chan);
> >       }
> >
> >       vchan_get_all_descriptors(&c->vc, &head);
> > --
> > 2.34.1
> >
