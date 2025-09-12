Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80DB5557B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 19:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620E10E1AF;
	Fri, 12 Sep 2025 17:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yb1UxgJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C9610ECAF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:30:53 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-71d71bcab6fso19731387b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757698252; x=1758303052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=auNBcvl3SEsbJHPnjRRhDj6Gi+NyPWlHhGeNvhbSGjI=;
 b=Yb1UxgJsCp7E6YucZl/wioWPFXM3+Ej0X1kSLcz/Gg3HKQ0wWrkTlkfY4tNDO88A2r
 daAydhyAVDbWzpiZBBaQGjSIeqPk4C2N8/1VkmIThlDkxrSNCdOBi00dZMJhHxIDAfMI
 m5rZlJzCrBf1RDrOhQR8ffPIK+ObBayzdK0mhVbMvFFHI9znx2Rd5hcHNJqbIOiBY6Ob
 KUBL4m1s766Tf9M6v5ZgMaKXwAjM7evkNDE6OdvV+mqsTLzB7J6cgOIy6YphVwfzHgsK
 dAVVdIThtucdnqBS2sg/oDkztkQCe9W5+NeCkLtLgb0nKHCIawrWW3yiLXL5TSPLFO4+
 yMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757698252; x=1758303052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=auNBcvl3SEsbJHPnjRRhDj6Gi+NyPWlHhGeNvhbSGjI=;
 b=o2Gi+P5IoDgoHW0RQ7j94CCLiPW5exdQlL5qPHM9k+oUboEWKTbYSuexrbZmdtasLB
 QmdAfAQbmGeFKJk2Z3/xR6o/3dzDfKLarTwQScwLgKoJiuvwrXqqBKyjb8nKt1UPBrks
 fflDM1sUk8zeoq2CBLf20EeBoDrLWRr606soK0T6Tht1YXU2PHLLQVWCosSUY8PysuII
 zKqywht1nPxvOkv00G3PRp2B8oa+jh7a4J6ZfEjzIyksi0OUWg8P/mVp576XS60f2daa
 2cg4h4CIJNm72f80R3pYVtwPrjIdDFEFzBdIGIHY4D7kdRNQkj1IrPNT50OK1Kco3Zn8
 fVHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzU/9gb9kVs0SuClHnAAyULU6PxM8we0s2BaGddB68BGu2Ai0edtYmDN6p5N+4zu0gWW+rfiEZDGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZiKDUnwpBa0kVbgvlyyw3NH5Te6KglssmxqetLcwV0RVFjbx4
 B7I4lMUOuP6jzlgSLVEeYKhTRNvwniBzFo/dGVBCmh/AaAlaG+8iUkdlJ44ix3TTOKjmj72hYWJ
 wfJpDThUoK68CIZya1MPZQuDSpl7NakA=
X-Gm-Gg: ASbGnctoOOsIb//x+Fo5OVPDN6awrdUDJFblAuA9/SKScvOcVWEA78eT0W+oOhADeyK
 zbehaWJNsA91tPI9JUvy16azHYbXhl5b6CxD4cLiYkX8Nd6lshgzWGOTZhg18yCtSdn70anKOQo
 tY2KRVqYgahl4yCsv2pyQFz0O97v588cYyu6nbMBNtJCrRJezQ4g4WZ1f4rLnXdy8dUjmnUSMgm
 c8qKcKR3vjBbQNnK2/iA2cZcbAPJ0C1gXhNw+hVY2yzvP6AK5I29t10WnMqAH4qiHz9
X-Google-Smtp-Source: AGHT+IGITU3lo0Nc85OeLoKMyjH9+RFM86LRFnrm71Cg8EK1RTjnVlzcFez7i+udct1W4V2JM5TERjHI8MgSCWBrz5o=
X-Received: by 2002:a05:690c:7092:b0:71f:efa8:587a with SMTP id
 00721157ae682-730659c09c0mr38811187b3.44.1757698250349; Fri, 12 Sep 2025
 10:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
 <CAPaKu7RUx6KHyvdvrfX3u-7Lk=Wa3nmTh6-tD3CbReNAwNtgoQ@mail.gmail.com>
 <4506669.X9hSmTKtgW@workhorse>
In-Reply-To: <4506669.X9hSmTKtgW@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 10:30:39 -0700
X-Gm-Features: AS18NWA3g27VWsDg6RRczXJZXbzk7vegWWvE1nw-YT0mXkpVh9cJ-UmAELnMQuY
Message-ID: <CAPaKu7R_VUnX0TibokX0edQPVjritJgABEVZ-Sy=6EiVt7GrAw@mail.gmail.com>
Subject: Re: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 12, 2025 at 3:59=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 12 September 2025 06:48:17 Central European Summer Time Chia-I=
 Wu wrote:
> > On Fri, Sep 5, 2025 at 3:24=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > The MT8196 SoC uses an embedded MCU to control frequencies and power =
of
> > > the GPU. This controller is referred to as "GPUEB".
> > >
> > > It communicates to the application processor, among other ways, throu=
gh
> > > a mailbox.
> > >
> > > The mailbox exposes one interrupt, which appears to only be fired whe=
n a
> > > response is received, rather than a transaction is completed. For us,
> > > this means we unfortunately need to poll for txdone.
> > >
> > > The mailbox also requires the EB clock to be on when touching any of =
the
> > > mailbox registers.
> > >
> > > Add a simple driver for it based on the common mailbox framework.
> > >
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/mailbox/Kconfig             |  10 ++
> > >  drivers/mailbox/Makefile            |   2 +
> > >  drivers/mailbox/mtk-gpueb-mailbox.c | 330 ++++++++++++++++++++++++++=
++++++++++
> > >  3 files changed, 342 insertions(+)
> > >
> > > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > > index 02432d4a5ccd46a16156a09c7f277fb03e4013f5..2016defda1fabb5c0fcc8=
078f84a52d4e4e00167 100644
> > > --- a/drivers/mailbox/Kconfig
> > > +++ b/drivers/mailbox/Kconfig
> > > @@ -294,6 +294,16 @@ config MTK_CMDQ_MBOX
> > >           critical time limitation, such as updating display configur=
ation
> > >           during the vblank.
> > >
> > > +config MTK_GPUEB_MBOX
> > > +       tristate "MediaTek GPUEB Mailbox Support"
> > > +       depends on ARCH_MEDIATEK || COMPILE_TEST
> > > +       help
> > > +         The MediaTek GPUEB mailbox is used to communicate with the =
embedded
> > > +         controller in charge of GPU frequency and power management =
on some
> > > +         MediaTek SoCs, such as the MT8196.
> > > +         Say Y or m here if you want to support the MT8196 SoC in yo=
ur kernel
> > > +         build.
> > > +
> > >  config ZYNQMP_IPI_MBOX
> > >         tristate "Xilinx ZynqMP IPI Mailbox"
> > >         depends on ARCH_ZYNQMP && OF
> > > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > > index 98a68f838486eed117d24296138bf59fda3f92e4..564d06e71313e6d1972e4=
a6036e1e78c8c7ec450 100644
> > > --- a/drivers/mailbox/Makefile
> > > +++ b/drivers/mailbox/Makefile
> > > @@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)   +=3D mtk-adsp-mailbox=
.o
> > >
> > >  obj-$(CONFIG_MTK_CMDQ_MBOX)    +=3D mtk-cmdq-mailbox.o
> > >
> > > +obj-$(CONFIG_MTK_GPUEB_MBOX)   +=3D mtk-gpueb-mailbox.o
> > > +
> > >  obj-$(CONFIG_ZYNQMP_IPI_MBOX)  +=3D zynqmp-ipi-mailbox.o
> > >
> > >  obj-$(CONFIG_SUN6I_MSGBOX)     +=3D sun6i-msgbox.o
> > > diff --git a/drivers/mailbox/mtk-gpueb-mailbox.c b/drivers/mailbox/mt=
k-gpueb-mailbox.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..0236fb358136e434a09a2=
1ef293fe949ced94123
> > > --- /dev/null
> > > +++ b/drivers/mailbox/mtk-gpueb-mailbox.c
> > > @@ -0,0 +1,330 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * MediaTek GPUEB mailbox driver for SoCs such as the MT8196
> > > + *
> > > + * Copyright (C) 2025, Collabora Ltd.
> > > + *
> > > + * Developers harmed in the making of this driver:
> > > + *  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > + */
> > > +
> > > +#include <linux/atomic.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/device.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/mailbox_controller.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#define MBOX_CTL_TX_STS 0x0000
> > > +#define MBOX_CTL_IRQ_SET 0x0004
> > > +#define MBOX_CTL_IRQ_CLR 0x0074
> > > +#define MBOX_CTL_RX_STS 0x0078
> > > +
> > > +#define MBOX_FULL BIT(0) /* i.e. we've received data */
> > > +#define MBOX_CLOGGED BIT(1) /* i.e. the channel is shutdown */
> > > +
> > > +struct mtk_gpueb_mbox {
> > > +       struct device *dev;
> > > +       struct clk *clk;
> > > +       void __iomem *mbox_mmio;
> > > +       void __iomem *mbox_ctl;
> > > +       void **rx_buf;
> > > +       atomic_t *rx_status;
> > > +       struct mbox_controller mbox;
> > > +       unsigned int *chn;
> > > +       int irq;
> > > +       const struct mtk_gpueb_mbox_variant *v;
> > > +};
> > > +
> > > +struct mtk_gpueb_mbox_ch {
> > > +       const char *name;
> > > +       const int num;
> > > +       const unsigned int tx_offset;
> > > +       const unsigned int tx_len;
> > > +       const unsigned int rx_offset;
> > > +       const unsigned int rx_len;
> > > +       const bool no_response;
> > > +};
> > > +
> > > +struct mtk_gpueb_mbox_variant {
> > > +       unsigned int num_channels;
> > > +       const struct mtk_gpueb_mbox_ch channels[] __counted_by(num_ch=
annels);
> > > +};
> > > +
> > > +/**
> > > + * mtk_gpueb_mbox_read_rx - read RX buffer from MMIO into ebm's RX b=
uffer
> > > + * @ebm: pointer to &struct mtk_gpueb_mbox instance
> > > + * @channel: number of channel to read
> > > + */
> > > +static void mtk_gpueb_mbox_read_rx(struct mtk_gpueb_mbox *ebm,
> > > +                                  unsigned int channel)
> > > +{
> > > +       const struct mtk_gpueb_mbox_ch *ch;
> > > +
> > > +       ch =3D &ebm->v->channels[channel];
> > > +
> > > +       memcpy_fromio(ebm->rx_buf[channel], ebm->mbox_mmio + ch->rx_o=
ffset,
> > > +                     ch->rx_len);
> > > +
> > > +}
> > > +
> > > +static irqreturn_t mtk_gpueb_mbox_isr(int irq, void *data)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D data;
> > > +       u32 rx_handled =3D 0;
> > > +       u32 rx_sts;
> > > +       int i;
> > > +
> > > +       rx_sts =3D readl(ebm->mbox_ctl + MBOX_CTL_RX_STS);
> > > +
> > > +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> > > +               if (rx_sts & BIT(i)) {
> > > +                       if (!atomic_cmpxchg(&ebm->rx_status[i], 0,
> > > +                                           MBOX_FULL | MBOX_CLOGGED)=
)
> > > +                               rx_handled |=3D BIT(i);
> > > +               }
> > > +       }
> > We can loop over bits that are set in rx_sts, if we expect that only a
> > few bits are set most of the time.
>
> Could you elaborate on your preferred approach? num_channels will be
> smaller than the bit width of rx_sts. I could loop from __fls down to
> 0 checking for (!rx_sts ^ rx_handled) for an early exit, but I'm not
> sure if this microoptimisation is what you meant or if that even makes
> much sense instruction cost wise.
>
> Alternatively, I could loop from __fss to num_channels.
>
> Is there some commonly used hyper-optimised "loop over set bits" macro
> that I'm unfamiliar with?
Not sure if there is a macro, but panthor open-codes something like

  while (rx_sts) {
    int chan =3D ffs(rx_sts) - 1;
    rx_sts &=3D ~BIT(chan);
    // do away with chan
  }

>
> > > +
> > > +       writel(rx_handled, ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > > +
> > > +       if (!(rx_sts ^ rx_handled))
> > "rx_sts =3D=3D rx_handled" should be more direct.
>
> Good point, will change.
>
> > > +               return IRQ_WAKE_THREAD;
> > > +
> > > +       dev_warn_ratelimited(ebm->dev, "spurious interrupts on 0x%04X=
\n",
> > > +                            rx_sts ^ rx_handled);
> > > +       return IRQ_NONE;
> > It seems a bit too punishing when there are spurious interrupts. I
> > wonder if we should warn, but return IRQ_WAKE_THREAD as long as
> > rx_handled !=3D 0.
> >
> > Also, if another interrupt can fire before mtk_gpueb_mbox_thread runs,
> > that's data dropping rather than spurious interrupts.
> >
>
> Yeah, I agree that this is bad. As wens pointed out, my IRQ clearing
> earlier would most certainly open us up to losing data. I'll
> definitely look into changing this; iirc the current code resulted
> from me being unsure whether partially handled IRQs should still
> be counted as a handled IRQ or not.
If we only get rx data (response) as a result of tx data (request),
this would be fine. But if there can be unsolicited tx data (looking
at fast_dvfs_event), yeah, we are clearing irq too early.

>
> > > +}
> > > +
> > > +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D data;
> > > +       irqreturn_t ret =3D IRQ_NONE;
> > > +       int status;
> > > +       int i;
> > > +
> > > +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> > > +               status =3D atomic_cmpxchg(&ebm->rx_status[i],
> > > +                                       MBOX_FULL | MBOX_CLOGGED, MBO=
X_FULL);
> > > +               if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> > We could also save rx_handled from mtk_gpueb_mbox_isr and loop over
> > bits that are set.  If we do that, ebm->rx_status[i] is guaranteed to
> > be MBOX_FULL | MBOX_CLOGGED.
> >
>
> Wouldn't storing rx_handled open us up to data races with unpleasant
> code to try and prevent them? As far as I understand, the ISR is allowed
> to fire again before the thread has completed. Having the rx_status bits
> as individual atomics gives us finer granularity than needing to protect
> the entire set of bits.
>
> If there is some way to pass data from the ISR to the awoken thread
> directly as a per-invocation parameter rather than a squirreled away
> member of the driver private struct, then I agree doing it your way
> seems better.
>
> > > +                       mtk_gpueb_mbox_read_rx(ebm, i);
> > > +                       mbox_chan_received_data(&ebm->mbox.chans[i],
> > > +                                               ebm->rx_buf[i]);
> > It looks like we read the data and pass it on to the client
> > immediately. Does each channel need its own rx_buf?
> >
>
> Yeah, common mailbox framework does not do a copy here, it just passes
> the pointer. Which is good, because nobody likes copies, and it
> prevents the mailbox core from needing to know the size of received
> data.
>
> So the individual rx_bufs are needed to prevent channel cross-talk.
I checked a few other mailbox drivers. The data pointer could even
point to local variables in some cases. It seems, in general,
mbox_client cannot expect the data to be valid after
mbox_chan_received_data returns.

>
> > > +                       /* FIXME: When does MBOX_FULL get cleared? He=
re? */
> > > +                       atomic_set(&ebm->rx_status[i], 0);
> > > +                       ret =3D IRQ_HANDLED;
> > > +               }
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *da=
ta)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->de=
v);
> > > +       unsigned int *num =3D chan->con_priv;
> > > +       int i;
> > > +       u32 *values =3D data;
> > > +
> > > +       if (*num >=3D ebm->v->num_channels)
> > > +               return -ECHRNG;
> > Can this ever happen? (I am not familiar with the mbox subsystem)
>
> Only if someone with a pointer to chan modifies con_priv outside of
> what the mailbox driver set. It's an unlikely scenario, so I do think
> I can remove this check, but the downside is that if someone ever does
> manage to do this then the next line is a convenient read primitive.
That should be an invalid usage that we hopefully don't need to worry
about. Otherwise, as things are, *num can also be modified after the
check so the check is not sufficient.

>
> > > +
> > > +       if (!ebm->v->channels[*num].no_response &&
> > > +           atomic_read(&ebm->rx_status[*num]))
> > > +               return -EBUSY;
> > When no_response is true, rx_status is 0. We probably don't need to
> > check no_response.
>
> Now that I'm thinking about it, I can probably get rid of no_response
> altogether. It was originally added because I conflated txdone with
> response received, and one particular command on the sleep channel,
> namely powering off the MFG, is unable to ever cause a response
> interrupt to fire.
>
> Since we now poll for txdone anyway using the TX status register, I
> don't think this is needed at all anymore, so I'll try and get
> rid of it.
>
> > > +
> > > +       writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > > +
> > > +       /*
> > > +        * We don't want any fancy nonsense, just write the 32-bit va=
lues in
> > > +        * order. memcpy_toio/__iowrite32_copy don't work here, becau=
se fancy.
> > > +        */
> > > +       for (i =3D 0; i < ebm->v->channels[*num].tx_len; i +=3D 4) {
> > > +               writel(values[i / 4],
> > > +                      ebm->mbox_mmio + ebm->v->channels[*num].tx_off=
set + i);
> > > +       }
> > > +
> > > +       writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->de=
v);
> > > +       unsigned int *num =3D chan->con_priv;
> > > +
> > > +       if (*num >=3D ebm->v->num_channels)
> > > +               return -ECHRNG;
> > > +
> > > +       atomic_set(&ebm->rx_status[*num], 0);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void mtk_gpueb_mbox_shutdown(struct mbox_chan *chan)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->de=
v);
> > > +       unsigned int *num =3D chan->con_priv;
> > > +
> > > +       atomic_set(&ebm->rx_status[*num], MBOX_CLOGGED);
> > > +}
> > > +
> > > +static bool mtk_gpueb_mbox_last_tx_done(struct mbox_chan *chan)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->de=
v);
> > > +       unsigned int *num =3D chan->con_priv;
> > > +
> > > +       return !(readl(ebm->mbox_ctl + MBOX_CTL_TX_STS) & BIT(*num));
> > > +}
> > > +
> > > +const struct mbox_chan_ops mtk_gpueb_mbox_ops =3D {
> > > +       .send_data =3D mtk_gpueb_mbox_send_data,
> > > +       .startup =3D mtk_gpueb_mbox_startup,
> > > +       .shutdown =3D mtk_gpueb_mbox_shutdown,
> > > +       .last_tx_done =3D mtk_gpueb_mbox_last_tx_done,
> > > +};
> > > +
> > > +static struct mbox_chan *
> > > +mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
> > > +                       const struct of_phandle_args *sp)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(mbox->dev);
> > > +
> > > +       if (!sp->args_count)
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       if (sp->args[0] >=3D ebm->v->num_channels)
> > > +               return ERR_PTR(-ECHRNG);
> > > +
> > > +       return &mbox->chans[sp->args[0]];
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_probe(struct platform_device *pdev)
> > > +{
> > > +       struct mtk_gpueb_mbox *ebm;
> > > +       unsigned int rx_buf_sz;
> > > +       void *buf;
> > > +       unsigned int i;
> > > +       int ret;
> > > +
> > > +       ebm =3D devm_kzalloc(&pdev->dev, sizeof(*ebm), GFP_KERNEL);
> > > +       if (!ebm)
> > > +               return -ENOMEM;
> > > +
> > > +       ebm->dev =3D &pdev->dev;
> > > +       ebm->v =3D of_device_get_match_data(ebm->dev);
> > > +
> > > +       dev_set_drvdata(ebm->dev, ebm);
> > > +
> > > +       ebm->clk =3D devm_clk_get_enabled(ebm->dev, NULL);
> > > +       if (IS_ERR(ebm->clk))
> > > +               return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
> > > +                                    "Failed to get 'eb' clock\n");
> > > +
> > > +       ebm->mbox_mmio =3D devm_platform_ioremap_resource_byname(pdev=
, "mbox");
> > > +       if (IS_ERR(ebm->mbox_mmio))
> > > +               return dev_err_probe(ebm->dev, PTR_ERR(ebm->mbox_mmio=
),
> > > +                                    "Couldn't map mailbox registers\=
n");
> > > +
> > > +       ebm->mbox_ctl =3D devm_platform_ioremap_resource_byname(pdev,=
 "mbox_ctl");
> > > +       if (IS_ERR(ebm->mbox_ctl))
> > > +               return dev_err_probe(
> > > +                       ebm->dev, PTR_ERR(ebm->mbox_ctl),
> > > +                       "Couldn't map mailbox control registers\n");
> > > +
> > > +       rx_buf_sz =3D (ebm->v->channels[ebm->v->num_channels - 1].rx_=
offset +
> > > +                    ebm->v->channels[ebm->v->num_channels - 1].rx_le=
n);
> > rx is after tx in mmio. The first half of the space is wasted.
> >
> > We follow mtk_gpueb_mbox_read_rx by mbox_chan_received_data. It seems
> > we only need max of rx_len's.
>
> We do need the sum of all rx_len's but you're correct that the current co=
de
> allocates too much memory. What I think it should do is
>
> last rx_offset + last rx_len - first rx_offset
>
> to get the total amount of MMIO occupied by RX.
>
> > > +
> > > +       buf =3D devm_kzalloc(ebm->dev, rx_buf_sz, GFP_KERNEL);
> > > +       if (!buf)
> > > +               return -ENOMEM;
> > > +
> > > +       ebm->rx_buf =3D devm_kmalloc_array(ebm->dev, ebm->v->num_chan=
nels,
> > > +                                        sizeof(*ebm->rx_buf), GFP_KE=
RNEL);
> > > +       if (!ebm->rx_buf)
> > > +               return -ENOMEM;
> > > +
> > > +       ebm->mbox.chans =3D devm_kcalloc(ebm->dev, ebm->v->num_channe=
ls,
> > > +                                      sizeof(struct mbox_chan), GFP_=
KERNEL);
> > > +       if (!ebm->mbox.chans)
> > > +               return -ENOMEM;
> > > +
> > > +       ebm->rx_status =3D devm_kcalloc(ebm->dev, ebm->v->num_channel=
s,
> > > +                                     sizeof(atomic_t), GFP_KERNEL);
> > > +       if (!ebm->rx_status)
> > > +               return -ENOMEM;
> > > +
> > > +       ebm->chn =3D devm_kcalloc(ebm->dev, ebm->v->num_channels,
> > > +                               sizeof(*ebm->chn), GFP_KERNEL);
> > > +
> > > +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> > > +               ebm->rx_buf[i] =3D buf + ebm->v->channels[i].rx_offse=
t;
> > > +               spin_lock_init(&ebm->mbox.chans[i].lock);
> > > +               /* the things you do to avoid explicit casting void* =
*/
> > I actually prefer an inline helper that casts chan->con_priv to the
> > channel number. Another option is "chan - ebm->mox.chans".
>
> Hmmm, yeah. Though, I don't enjoy chan - ebm->mbox.chans because now we'r=
e
> in the woods regarding pointer arithmetics.
>
> I think the inline helper makes more sense, even if explicitly using a
> pointer as an integer gives me the heebie-jeebies.
>
> > > +               ebm->chn[i] =3D i;
> > > +               ebm->mbox.chans[i].con_priv =3D &ebm->chn[i];
> > > +               atomic_set(&ebm->rx_status[i], MBOX_CLOGGED);
> > > +       }
> > > +
> > > +       ebm->mbox.dev =3D ebm->dev;
> > > +       ebm->mbox.num_chans =3D ebm->v->num_channels;
> > > +       ebm->mbox.txdone_poll =3D true;
> > > +       ebm->mbox.txpoll_period =3D 0; /* minimum hrtimer interval */
> > > +       ebm->mbox.of_xlate =3D mtk_gpueb_mbox_of_xlate;
> > > +       ebm->mbox.ops =3D &mtk_gpueb_mbox_ops;
> > > +
> > > +       ebm->irq =3D platform_get_irq(pdev, 0);
> > > +       if (ebm->irq < 0)
> > > +               return ebm->irq;
> > > +
> > > +       ret =3D devm_request_threaded_irq(ebm->dev, ebm->irq, mtk_gpu=
eb_mbox_isr,
> > > +                                       mtk_gpueb_mbox_thread, 0, NUL=
L, ebm);
> > > +       if (ret)
> > > +               return dev_err_probe(ebm->dev, ret, "failed to reques=
t IRQ\n");
> > > +
> > > +       ret =3D devm_mbox_controller_register(ebm->dev, &ebm->mbox);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct mtk_gpueb_mbox_variant mtk_gpueb_mbox_mt8196 =3D=
 {
> > > +       .num_channels =3D 12,
> > > +       .channels =3D {
> > > +               { "fast_dvfs_event", 0, 0x0000, 16, 0x00e0, 16, false=
 },
> > > +               { "gpufreq",         1, 0x0010, 32, 0x00f0, 32, false=
 },
> > > +               { "sleep",           2, 0x0030, 12, 0x0110,  4, true =
 },
> > > +               { "timer",           3, 0x003c, 24, 0x0114,  4, false=
 },
> > > +               { "fhctl",           4, 0x0054, 36, 0x0118,  4, false=
 },
> > > +               { "ccf",             5, 0x0078, 16, 0x011c, 16, false=
 },
> > > +               { "gpumpu",          6, 0x0088, 24, 0x012c,  4, false=
 },
> > > +               { "fast_dvfs",       7, 0x00a0, 24, 0x0130, 24, false=
 },
> > > +               { "ipir_c_met",      8, 0x00b8,  4, 0x0148, 16, false=
 },
> > > +               { "ipis_c_met",      9, 0x00bc, 16, 0x0158,  4, false=
 },
> > > +               { "brisket",        10, 0x00cc, 16, 0x015c, 16, false=
 },
> > > +               { "ppb",            11, 0x00dc,  4, 0x016c,  4, false=
 },
> > > +       },
> > > +};
> > > +
> > > +static const struct of_device_id mtk_gpueb_mbox_of_ids[] =3D {
> > > +       { .compatible =3D "mediatek,mt8196-gpueb-mbox",
> > > +         .data =3D &mtk_gpueb_mbox_mt8196 },
> > > +       { /* Sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mtk_gpueb_mbox_of_ids);
> > > +
> > > +static struct platform_driver mtk_gpueb_mbox_drv =3D {
> > > +       .probe =3D mtk_gpueb_mbox_probe,
> > > +       .driver =3D {
> > > +               .name =3D "mtk-gpueb-mbox",
> > > +               .of_match_table =3D mtk_gpueb_mbox_of_ids,
> > > +       }
> > > +};
> > > +module_platform_driver(mtk_gpueb_mbox_drv);
> > > +
> > > +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>=
");
> > > +MODULE_DESCRIPTION("MediaTek GPUEB mailbox driver for SoCs such as t=
he MT8196");
> > > +MODULE_LICENSE("GPL");
> > >
> > > --
> > > 2.51.0
> > >
> >
>
> Thank you for your review!
>
> Kind regards,
> Nicolas Frattaroli
>
>
