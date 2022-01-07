Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5D48718D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5021711220C;
	Fri,  7 Jan 2022 03:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9611220C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 03:58:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p13so10930461lfh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKNMJyJbEEL5q9peHIeW1VWZHuVFJtpU7pIceN/pwjU=;
 b=Ct5qh0NnIjgjBBI8xvXdVNKrKFDmuJqDQ6lk+nREa2ajHPDsDrFmIqTCK/ih45n/+i
 MxVvKQX4wxPd/KqFTbXeaMVUspFFe2zOFPIHwD8+X/hDyeWjkxKrw/miIwgpNC8CyAQY
 dWpmeQvSJ9tTMcsSrDml7yTQw1BbaBypeNN3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKNMJyJbEEL5q9peHIeW1VWZHuVFJtpU7pIceN/pwjU=;
 b=TlLAjlnOQSKvxZwUbGu7VSdDaLf+qnVh7HOtd6f/IbYm6nxZ7GPQ/Dhz8h6zlTXsKO
 urgxtmJOQEvffejmTYnH7PMHSQX10wyRjELOYMCJRLur7VoEzw/h8pe/1ZcgpmjUWcVS
 XXnJ7WHiUGKVqAMczQoqcdQz7hjzOQyup2lyV4H/ciwacWTsYiuxVFNV4yPHleBZL2lQ
 KJRvEIYQtA/QbjzFC4riuB0ZRrsldFzk/GpqpL21DV7fyBZtji321aKTRkhKLUqBLQgw
 4QvzQS7QNqojn7NzKNd1MqNMUjNPZSe0EjGcHQSMk+okALFcgxn/+bA41CxDZVumUufe
 NMgA==
X-Gm-Message-State: AOAM532IGiCIF7Mi2Lt7ONSaMOBUcqoOyq8VqncM26f7mz0xdHEiAs9P
 +ldbhhzQOdOIiZ2VIlqM3qUbMO9fJUZ02fB0+vIB7A==
X-Google-Smtp-Source: ABdhPJwB2LOLwXDSwFYbn94VKmzms3kaczzZBBcQQ0Iamv202Lew+ehb6NgWIJQfYAZCzjaWayYDS1PcdtAvATpbHog=
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr43356738ljp.201.1641527880239; 
 Thu, 06 Jan 2022 19:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
 <509b82079256ffaa0d844ae5a79a436fced16f3f.camel@mediatek.com>
In-Reply-To: <509b82079256ffaa0d844ae5a79a436fced16f3f.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Jan 2022 11:57:49 +0800
Message-ID: <CAGXv+5EmnGFDnZE01mFfC=WHReOLdbuqCpAmwJNMvm6N93wRew@mail.gmail.com>
Subject: Re: [PATCH 2/3] phy: mediatek: phy-mtk-mipi-dsi: Reorder and stop
 implicit header inclusion
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, linux-phy@lists.infradead.org,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 4:48 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
> > All the headers for phy-mtk-mipi-{dsi,dsi-mt8173,dsi-mt8183}.c were
> > included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
> > increase readability and sensibly reduce build times, the inclusions
> > should be done per-file, also avoiding to include unused headers and
> > should not be implicit.
> >
> > For this reason, move the inclusions to each file and remove unused
> > ones.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c |  4 ++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c |  4 ++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi.c        |  7 +++++++
> >  drivers/phy/mediatek/phy-mtk-mipi-dsi.h        | 10 ++--------
> >  4 files changed, 17 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > index 95a0d9a3cca7..59f028da9d3e 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
> > @@ -4,7 +4,11 @@
> >   * Author: jitao.shi <jitao.shi@mediatek.com>
> >   */
> >
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  #define MIPITX_DSI_CON               0x00
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > index 01b59527669e..6c6b192485ba 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
> > @@ -4,7 +4,11 @@
> >   * Author: jitao.shi <jitao.shi@mediatek.com>
> >   */
> >
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  #define MIPITX_LANE_CON              0x000c
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > index 51b1b1d4ad38..6f7425b0bf5b 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > @@ -3,7 +3,14 @@
> >   * Copyright (c) 2015 MediaTek Inc.
> >   */
> >
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/phy/phy.h>
> >  #include "phy-mtk-mipi-dsi.h"
> >
> >  inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw
> > *hw)
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > index 8d32e9027a15..4eb5fc91e083 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
> > @@ -7,16 +7,10 @@
> >  #ifndef _MTK_MIPI_TX_H
> >  #define _MTK_MIPI_TX_H
> >
> > -#include <linux/clk.h>
> >  #include <linux/clk-provider.h>
> > -#include <linux/delay.h>
> > -#include <linux/io.h>
> > -#include <linux/module.h>
> > -#include <linux/nvmem-consumer.h>
> > -#include <linux/of_device.h>
> > -#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +#include <linux/regmap.h>
> >  #include <linux/phy/phy.h>
> > -#include <linux/slab.h>
> >
> I don't think it's good idea to move the common headers into .c files

Header files should be included directly by the file that uses facilities
provided by said header file. Required ones should not be transitively
included through other header files, as that introduces a subtle dependency.

Also, needlessly including header files in places that aren't using them
increases build time. See the 2000+ patch series from Ingo Molnar [1]
increasing build performance by cleaning up header files.

ChenYu

[1] https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/

> >  struct mtk_mipitx_data {
> >       const u32 mppll_preserve;
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
