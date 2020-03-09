Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138917EC4C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 23:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469A26E11D;
	Mon,  9 Mar 2020 22:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CFE6E11F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 22:50:44 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F5562253D;
 Mon,  9 Mar 2020 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583794244;
 bh=SbGvCdG/e6XNfTS1VgIQo0Zu/6dVT8qotNh+oyjO5M8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=1vg95p8COlpVYDXX1h4S4r+J5SHvpD73ztst8VndTbVLSSBmaFQ0xiIff7V3npw+p
 HwpkR0B3AjsVB+aMbUhJ6d4JxHnyyp9zru3MTVtxVL7dgIGmaLzceEU3HGsng1ibYh
 mewKaYlRLGQvVtehs20lzu/ZLAN4vkYGVY5sqVuE=
MIME-Version: 1.0
In-Reply-To: <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
 <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
 <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 09 Mar 2020 15:50:43 -0700
Message-ID: <158379424337.149997.7454036134629466675@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Chen-Yu Tsai <wens@csie.org>, Allison Randal <allison@lohutok.net>,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, fwll.ch@freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo Serra (2020-03-06 14:09:50)
> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dv., 6 de mar
> 2020 a les 22:37:
> >
> > Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
> > > On 5/3/20 22:01, Stephen Boyd wrote:
> > > > Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
> > > >> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> > > >> new file mode 100644
> > > >> index 000000000000..473cdf732fb5
> > > >> --- /dev/null
> > > >> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > >> @@ -0,0 +1,154 @@
> > > >> +// SPDX-License-Identifier: GPL-2.0-only
> > > >> +/*
> > > >> + * Copyright (c) 2014 MediaTek Inc.
> > > >> + * Author: James Liao <jamesjj.liao@mediatek.com>
> > > >> + */
> > > >> +
> > > >> +#include <linux/clk-provider.h>
> > > >> +#include <linux/of_device.h>
> > > >> +#include <linux/platform_device.h>
> > > >> +
> > > >> +#include "../../clk/mediatek/clk-gate.h"
> > > >> +#include "../../clk/mediatek/clk-mtk.h"
> > > >
> > > > Why not use include/linux/clk/?
> > > >
> > >
> > > I can move these files to include, this will impact a lot more of drivers but,
> > > yes, I think is the right way.
> > >
> > > > But I also don't understand why the clk driver is moved outside of
> > > > drivers/clk/ into drivers/soc/. Commit text saying that it has shared
> > > > registers doesn't mean it can't still keep the clk driver part in the
> > > > drivers/clk/ area.
> > > >
> > >
> > > Actually moving this to the soc directory has been requested by CK (mediatek) as
> > > a change in v8. You can see the discussion in [1]
> > >
> >
> > I can reply there in that thread if necessary, but we shouldn't need to
> > force simple-mfd into DT bindings to support this. Match the compatible
> > string in drivers/soc/ and register devices in software for the
> > different pieces of this overall hardware block. If necessary, pass down
> > the ioremapped addresss down through device data to each logical driver
> > in the respective subsystem.
> >
> > So yes, it looks like an MFD, but that doesn't mean we have to change
> > the DT binding or put it in drivers/mfd to support that. And we don't
> > have to fix any problems with allowing two drivers to probe the same
> > compatible string.
> >
> 
> That thread maybe has too much information and things evolved since
> then. Note that the final solution is not an MFD neither we change the
> bindings. I pointed to that thread just because CK (CK please correct
> me if I'm wrong) thought that the driver is not a pure clock driver
> and he preferred to move to drivers/soc/mediatek (in that thread, he
> exposes his opinion on that).  Sorry to introduce more confusion.
> 
> You seem to be fine with the approach (just minor changes), so it
> looks to me that the only problem is if this should be in drivers/clk
> or drivers/soc. Honestly, this is not something I can't decide and
> I'll let you (the soc and clk maintainers) decide. I don't really have
> a strong opinion here. I don't mind move again to drivers/clk if that
> is what we want but let's come to an agreement.
> 

It's already in drivers/clk, so leave the clk part there and register
the clk device and any other devices by matching the compatible in
drivers/soc. That is my preferred solution. Can that be done?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
