Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44593CC3CB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 16:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CAD6EA82;
	Sat, 17 Jul 2021 14:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AAA6EA7C;
 Sat, 17 Jul 2021 14:21:37 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id r135so19733688ybc.0;
 Sat, 17 Jul 2021 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYmkuP5AQw2597PtpkTYHzTziGKMdBUGbEewWyTfXR0=;
 b=Z5d5OaQLi3DuXMKUTSC2QQrn0TFcC9ztVa2SplkRs7+OFItHFiKI6ZyfWt7iLKwXIp
 FbvvpxwQuVheVmW72X0Sdkf51OEUObVm9xSrQww0QsdWfMuH6hlGef1epfjLJHYgdnki
 q+T8QCB8saYFa4v390YiUYyY1Jouj+ka8+4rFFnvXDdsnR6oZcdrMvnN2ddzoNYRAG1O
 mAR2+IPLqRHBhVFEngW0KmQTNPwwO5ce52zfwkqL8Mw6HKGdZwIjFPxOh7XxZyWWHq22
 awHYAssktNX8vFuRs5Ll10SgQk4k0Qzqt4kiESQYYLDPHA6Mjznc7B89PWnCL5Vyl3Cw
 Mlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYmkuP5AQw2597PtpkTYHzTziGKMdBUGbEewWyTfXR0=;
 b=e6do4aq0DXjAbzoZSRIec1CYbqWXy+ud5BT2xraYJQ5xAW6goIn5/eORp/fJulKwGi
 IwSTlT61qa4ySMZJ+doLPtywK1RJeUFjGK3zi2uuJH7u9a5TkoT0UBIRvwJO+71tGncS
 iS85weUNjkb12ZiP8NV8TghRCEWbJgcA7Svi8BCuBN8LAU7dqOPjnWJZJaBHfJTuBho+
 N2mEiWvwA4f7JwSyYj7KBLrBCx3vQDq7FrY0qzMfLddxYNg0/LdndbNZ6RI2Jl7Q3Z3b
 J5hCrzKlmhb5jk2Gf1IoqlNhrgLyArAvOhvv52Gx33Cb8Uldr4/MlEbOnFgW4j0VrEeX
 I3Cg==
X-Gm-Message-State: AOAM530Suqs5VdPDCTRV3vHWUn0NWqZDZoUlNiYTz9iXY5wQTWqWV9vh
 qsLpayLTdscUcgv4kw03E9ju4pRJAmXhpHg2/Mo=
X-Google-Smtp-Source: ABdhPJztZCZsSayhAanrm6QD46jwUGY9DGfsqzylpf/ldLVgW4UgEidXcyWywXt974JvW+k1JNc7zVgfDu2KtCV6sZ8=
X-Received: by 2002:a25:a0c1:: with SMTP id i1mr19824172ybm.362.1626531696294; 
 Sat, 17 Jul 2021 07:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
 <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
In-Reply-To: <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 17 Jul 2021 22:21:25 +0800
Message-ID: <CAKGbVbtRuVeUBD+m3J5U5AP_FM5S7i_qGXR-AHNeLnRogutVEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
To: Marek Vasut <marex@denx.de>
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
Cc: lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 9:08 PM Marek Vasut <marex@denx.de> wrote:
>
> On 7/17/21 2:34 PM, Qiang Yu wrote:
> > On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> Instead of requesting two separate clock and then handling them
> >> separately in various places of the driver, use clk_bulk_*() API.
> >> This permits handling devices with more than "bus"/"core" clock,
> >> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
> >> clock.
> >
> > I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xilinx
> > which has mali GPU node with an upstream kernel, where is it?
>
> Posted here:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210716182544.219490-1-marex@denx.de/
>
> > So what's the relationship between "gpu" clk and "gpu_pp0"/"gpu_pp1"
> > clk? Do they need to be controlled separately or we can just control the
> > "gpu" clk? Because the devfreq code just controls a single module clk.
>
> Per the docs, they are separate enable bits and the zynqmp clock
> controller exports them as separate clock, see bits 24..26 here:
>
> https://www.xilinx.com/html_docs/registers/ug1087/crf_apb___gpu_ref_ctrl.html
>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Qiang Yu <yuq825@gmail.com>
> >> Cc: lima@lists.freedesktop.org
> >> ---
> >>   drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
> >>   drivers/gpu/drm/lima/lima_devfreq.h |  1 +
> >>   drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
> >>   drivers/gpu/drm/lima/lima_device.h  |  4 +--
> >>   4 files changed, 32 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> >> index 8989e215dfc9..533b36932f79 100644
> >> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> >> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> >> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
> >>          struct lima_devfreq *devfreq = &ldev->devfreq;
> >>          unsigned long irqflags;
> >>
> >> -       status->current_frequency = clk_get_rate(ldev->clk_gpu);
> >> +       status->current_frequency = clk_get_rate(devfreq->clk_gpu);
> >>
> >>          spin_lock_irqsave(&devfreq->lock, irqflags);
> >>
> >> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
> >>          struct lima_devfreq *ldevfreq = &ldev->devfreq;
> >>          struct dev_pm_opp *opp;
> >>          unsigned long cur_freq;
> >> -       int ret;
> >> +       int i, ret;
> >>
> >>          if (!device_property_present(dev, "operating-points-v2"))
> >>                  /* Optional, continue without devfreq */
> >>                  return 0;
> >>
> >> +       /* Find first clock which are not "bus" clock */
> >> +       for (i = 0; i < ldev->nr_clks; i++) {
> >> +               if (!strcmp(ldev->clks[i].id, "bus"))
> >> +                       continue;
> >> +               ldevfreq->clk_gpu = ldev->clks[i].clk;
> >> +               break;
> >> +       }
> >
> > I'd prefer an explicit name for the required clk name. If some DTS has different
> > name other than "core" for the module clk (ie. "gpu"), it should be changed to
> > "core".
>
> The problem here is, the zynqmp has no core clock, it has "gpu and both
> pixel pipes" super-clock-gate which controls everything, and then
> per-pixel-pipe sub-clock-gates.

So the "gpu" clk can gate both "gpu_pp0" and "gpu_pp1" clk, how about frequency?
Can we set clock rate for "gpu" then "gpu_pp0" and "gpu_pp1" pass
through the same
rate? If so, "gpu" works just like "core".
