Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0933F1B4F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2896E98F;
	Thu, 19 Aug 2021 14:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DF46E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:10:38 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cn28so9080613edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rb9V42rg0n45GVH3GY2bVeX0F+8SMJocuuGI1FyjcmM=;
 b=iJEPUU5oZEQ+HWwTgTCgLhFsbcZY/sN4h/IMNe1p8EeCOxcgf3JVciTGX87OqGRILz
 Urxhw5a2EAGgRMcidl2dwJCCCNjUGG+3Aq90qboKf6+1WMDC1oxL1rZspWV1ngDaYwsV
 SSO5y5R0ILHZz2TBbDnJjnbVGQnmK6+W9FW53lMoxbuOFnxeBiFz1jk3h8V4EIdyBR0y
 N+u/wHUfjMg9Ibs9phlJMeMO9p/VILY8p8K6VKTmAN7+7nOwCJw4kPu2KNOjA4HOElnP
 14V9a4ullK9qeLa87hC5WKNqfxQrOQAMCWlXZVYnTUrLieLB0auCQCaenqpPDW1tlikX
 tE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb9V42rg0n45GVH3GY2bVeX0F+8SMJocuuGI1FyjcmM=;
 b=amrPU5y6cMXfglVeWw3tWO/ra9RjofgHBbM6ZhWQIRD6sU4VlRJ2LGhBamq5W56aFy
 LWoF3W72KSfiDh+FpyKhnEu/BNW5m0cz6K/cBheSKdt7KLpp8EWswWKdcUMLVNsErLVT
 4u3sIpvzCwB9kWV+oDYAw5b1NZjPhYcyvo/u01juq1XSWcHGZOMu0yS3nlipxxEsn6T2
 MoLR6VLBiUQxyJD3vG2+BT7Ut8hhxW3ALZLpxiIw5E9d17oyy5VCDDHncqU+ZXdWl0eS
 NTppzaxGOvcFIygs3hf6C6fxSPECD79QJiC1jQhBwVp+mvbpYVykwTOy9L52+lT/p4NQ
 5r4w==
X-Gm-Message-State: AOAM533NXNuTxH0aQaC2a3owLZ+evKQt3HaULAcMAMoesRzQMmUAtC4d
 qafsNpzgvcqdLVMzK27f8rppuio3lttwPnARQHUJ7A==
X-Google-Smtp-Source: ABdhPJwsG2az69sF2C7NBuTLTqeCC9h1NnsP0/piYeVTCMnzsFbdwVTCtw/GXuxcx6yC4CKvqxzNAm07Sn6//4vK+aU=
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr16652377edw.17.1629382236918; 
 Thu, 19 Aug 2021 07:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
In-Reply-To: <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 19 Aug 2021 11:10:25 -0300
Message-ID: <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
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

On Thu, 19 Aug 2021 at 04:13, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your suggestion.
>
> On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> > +danvet
> >
> > Hi,
> >
> > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com>
> > wrote:
> > >
> > > This series adds support for multi hardware decode into mtk-vcodec,
> > > by first
> > > adding component framework to manage each hardware information:
> > > interrupt,
> > > clock, register bases and power. Secondly add core thread to deal
> > > with core
> > > hardware message, at the same time, add msg queue for different
> > > hardware
> > > share messages. Lastly, the architecture of different specs are not
> > > the same,
> > > using specs type to separate them.
> > >
> >
> > I don't think it's a good idea to introduce the component API in the
> > media subsystem. It doesn't seem to be maintained, IRC there's not
> > even
> > a maintainer for it, and it has some issues that were never
> > addressed.
> >
> > It would be really important to avoid it. Is it really needed in the
> > first place?
> >
> > Thanks,
> > Ezequiel
>
> For there are many hardware need to use, mt8192 is three and mt8195 is
> five. Maybe need more to be used in the feature.
>
> Each hardware has independent clk/power/iommu port/irq.
> Use component interface in prob to get each component's information.
> Just enable the hardware when need to use it, very convenient and
> simple.
>
> I found that there are many modules use component to manage hardware
> information, such as iommu and drm etc.
>

Many drivers support multiple hardware variants, where each variant
has a different number of clocks or interrupts, see for instance
struct hantro_variant which allows to expose different codec cores,
some having both decoder/encoder, and some having just a decoder.

The component API is mostly used by DRM to aggregate independent
subdevices (called components) into an aggregated driver.

For instance, a DRM driver needs to glue together the HDMI, MIPI,
and plany controller, or any other hardware arrangement where
devices can be described independently.

The component API may look simple but has some issues, it's not easy
to debug, and can cause troubles if not used as expected [1].
It's worth making sure you actually need a framework
to glue different devices together.

> Do you have any other suggestion for this architecture?
>

Looking at the different patchsets that are posted, it's not clear
to me what exactly are the different architectures that you intend
to support, can you some documentation which clarifies that?

Thanks,
Ezequiel

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/
