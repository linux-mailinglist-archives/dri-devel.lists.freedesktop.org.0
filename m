Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C093FF941
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 06:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2C06E82D;
	Fri,  3 Sep 2021 04:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CB96E82D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 04:09:47 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s12so7585424ljg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 21:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joW/G6DY+txuyPmVNEIlO2p6pd362DkeC8kCVshvDTc=;
 b=ZIbvv2MoZCfOXe6LWEUxhC8fScArp+zt/1ot3m7EM6GACqj9dlCM7f5i4DhEqn8uYH
 d74b3ix3sflk7mxX6JPQVLBF7rgk4eCJy+wgpyUBhPBMnDB49i8UHC6Gxp//bkLuZ6OW
 8hfk1vHOiK1XmbwACEuRIqpduzex9euGg7Wkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joW/G6DY+txuyPmVNEIlO2p6pd362DkeC8kCVshvDTc=;
 b=IguYdaZ2IbNQ7c656PFJwQ3n9mton4tB92t+GQABqUv1n01D9B6HwvHVgO7ort+LcS
 81fw/PFO2BkakvciAezEznNl2dtjRA9+rU3QdMEkF0hWbco8f831y2N0v+lbDDPOT7tT
 Eer1ferVm74kWhmfckOmopL28kqLTSevx+wdog23XyTUhcZbTR9ocdGxdAf6V/OCjVgB
 c0YMAGTKpu3txa+bD+P+axEdUs8GFiwvCk1i+uJgf1ACG+GTEyoVX9JPBuSR0a4gteJ6
 OPZFtJNZKt01z4s+FEDH6ExiEQL4cVgO983E0P7JRQEQttAFS+aXASTnJuFj1A8ZsdXF
 fcSw==
X-Gm-Message-State: AOAM530ey7whq72AEFaZ4nlqArjpAm+fUvwa3rl+T2B3e4Uwq9IbpXux
 fqUoQPNvIlqLhJrQPbGpOt9tLgCnZ2O7v0LdJou8gw==
X-Google-Smtp-Source: ABdhPJx4XKG0lvFDetGV90273eSD7bOwt7ysolxtpaJkRUK9uLWj4p8fL3g2ooVhI35FhJ7mJLx4mBVrJkVVhWz8scM=
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1352765ljm.18.1630642185751; 
 Thu, 02 Sep 2021 21:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
In-Reply-To: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Sep 2021 12:09:34 +0800
Message-ID: <CAGXv+5Fr1gdeGFQnjjZ0JHf4sVanPb9QFqdYnrnmZ-ff8TrrdA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
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

On Fri, Sep 3, 2021 at 12:31 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was working
> > for both chips.
> >
> > Patches 1~3 rewrite get register bases and power on/off interface.
> >
> > Patch 4 add component framework to support multi hardware.
> >
> > Patch 5 separate video encoder and decoder document
> >
> > Patches 6-15 add interfaces to support core hardware.
> > ----
> > This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> > "Mediatek MT8192 clock support"[2].
> >
> > 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> > to add stateless decoder. Otherwise it will cause conflict. This patch will be
> > accepted in 5.15[1].
> >
> > 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
> >
> > [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> > [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> > ----
> > Changes compared with v5:
> > -Add decoder hardware block diagram for patch 13/15
> >
>
>
> The discussion on v5 was still on-going, so sending this v6
> is not helpful. The context for v5's discussion is now harder to find.
>
> Please avoid sending a new version without properly
> discussing all the feedback, and without reaching consensus.
> This is very important, please keep it in mind.
>
> Specifically, the feedback on v5 was NAK, with the request to avoid
> using any async framework, and instead try to find a simpler solution.
>
> For instance, you can model things with a bus-like pattern,
> which ties all the devices together, under a parent node.
> This pattern is common in the kernel, the parent
> node can use of_platform_populate or similar
> (git grep of_platform_populate, you will see plenty of examples).
>
> You will still have to do some work to have the proper
> regs resources, but this is doable. Each child is a device,
> so it can have its own resources (clocks, interrupts, iommus).

AFAIK of_platform_populate doesn't guarantee the drivers actually
probed (modules loaded late, missing modules, deferred probe, etc.),
only that the devices are created, so you still need some sort of
(async) mechanism to wait for the subdevices to be in operational
state. Most of the examples using of_platform_populate are there
to ensure that the parent device is operational before creating
the sub-devices, not the other way around.


ChenYu


> You don't need any async framework.
>
>     vcodec_dec: vcodec_dec@16000000 {
>         compatible = "mediatek,mt8192-vcodec-dec";
>         reg = <something>;
>         mediatek,scp = <&scp>;
>         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>
>         vcodec_lat@0x10000 {
>             compatible = "mediatek,mtk-vcodec-lat";
>             reg = <0x10000 0x800>;      /* VDEC_MISC */
>             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
>             // etc
>         };
>
>         vcodec_core@0x25000 {
>            compatible = "mediatek,mtk-vcodec-core";
>            reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
>            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
>            // etc
>         };
>     };
>
> Thanks,
> Ezequiel
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
