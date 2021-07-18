Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27E3CC73F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 04:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D3889E98;
	Sun, 18 Jul 2021 02:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974A289E98;
 Sun, 18 Jul 2021 02:57:02 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v189so21670125ybg.3;
 Sat, 17 Jul 2021 19:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W00iW7/aRwpr/fF4CZMcS7RN1Ej6rdo9JxILF1BhP5k=;
 b=dnMbb2hrbBthMM7r1v2LSNsNmeQtNG3nELaH2LlvIbaXZipIcT4Y/9kIE0LbKezQ+D
 FzuTVHtaPl3tXZ40ySFSxZ41XUX9N7a4OmO+S5vwSuRCn6gJy/FaztVBnZyL5cojBIZB
 tDA32eGPg7kwqVfZS5w3Hn4cpjlNMLYXN5Bi4VDV0pKjW7MFkkhoC2tBB4Pr+UXWXAw2
 tUU+fUrvFs6VgiZMkOV+B+9LZq3KdewRlpXuz14eYONZlvHcg4EhBb5e/DgfCUkxkNs2
 sMcTAU0pJoNEFdfQVEAqAtlip310VPS31J6F61Qs5VktqVIHOracjGf+KZ31bLbo8tKp
 Iqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W00iW7/aRwpr/fF4CZMcS7RN1Ej6rdo9JxILF1BhP5k=;
 b=UkVqrlZVJgnSLY/fjag3bm/vihUQ1SnHnwY2KUuIMjbJkvF+H2bUFrGrudkLUUusbs
 FoZmU3MhIbkSfReJ9XEj9f2MSus559qjIee+hcya51lXN2BoZVIVzMNTzJ19ldE+Wwtr
 Un4qZSPKVS1h3dd3ouwo0YSl6T/X4p4JsayY2jNn1lUd/GtnNaTzA40mahGpUErXaadz
 QmzFjM0YFCwFPWQEAuuUf/O3f15ISjc36gY7FjHRBe3yIjozI/+vAUCtB0wayokhJiIQ
 9b6dXoNPyjsH5ZV6muFXHXx1JDQFOHIrcnKhpkFnNqvqN6+r0Z+HbyNw91ZXwRSQbWT/
 msNg==
X-Gm-Message-State: AOAM530aRXdTtAy3DvyzebyD5n5HEy8BHo8zUTLgZzbXWu/cExiog0+h
 hDVYEqhb4q/S4IvNDGK3YqLs3XpJPN61Uk1T4A4=
X-Google-Smtp-Source: ABdhPJyOseyf1ytT2vxfnCG67AFqPadhMHlEt2XvX7PmxNijLMXdoof0zwCUG4WE32R0H83kkdSjNR1RRrA8IufxVNI=
X-Received: by 2002:a25:c78f:: with SMTP id
 w137mr22790367ybe.381.1626577021699; 
 Sat, 17 Jul 2021 19:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
 <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
 <CAKGbVbtRuVeUBD+m3J5U5AP_FM5S7i_qGXR-AHNeLnRogutVEQ@mail.gmail.com>
 <7462de54-5193-1606-7a93-390ad93c3b17@denx.de>
In-Reply-To: <7462de54-5193-1606-7a93-390ad93c3b17@denx.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 18 Jul 2021 10:56:50 +0800
Message-ID: <CAKGbVbt2nwcpf-H=gzR1-jEus7Dse36ikBt5Rg+QjmxKWLYOQw@mail.gmail.com>
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
Cc: Michal Simek <monstr@monstr.eu>, lima@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 10:52 PM Marek Vasut <marex@denx.de> wrote:
>
> On 7/17/21 4:21 PM, Qiang Yu wrote:
> > On Sat, Jul 17, 2021 at 9:08 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 7/17/21 2:34 PM, Qiang Yu wrote:
> >>> On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> Instead of requesting two separate clock and then handling them
> >>>> separately in various places of the driver, use clk_bulk_*() API.
> >>>> This permits handling devices with more than "bus"/"core" clock,
> >>>> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
> >>>> clock.
> >>>
> >>> I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xilinx
> >>> which has mali GPU node with an upstream kernel, where is it?
> >>
> >> Posted here:
> >> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210716182544.219490-1-marex@denx.de/
> >>
> >>> So what's the relationship between "gpu" clk and "gpu_pp0"/"gpu_pp1"
> >>> clk? Do they need to be controlled separately or we can just control the
> >>> "gpu" clk? Because the devfreq code just controls a single module clk.
> >>
> >> Per the docs, they are separate enable bits and the zynqmp clock
> >> controller exports them as separate clock, see bits 24..26 here:
> >>
> >> https://www.xilinx.com/html_docs/registers/ug1087/crf_apb___gpu_ref_ctrl.html
> >>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> Cc: Qiang Yu <yuq825@gmail.com>
> >>>> Cc: lima@lists.freedesktop.org
> >>>> ---
> >>>>    drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
> >>>>    drivers/gpu/drm/lima/lima_devfreq.h |  1 +
> >>>>    drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
> >>>>    drivers/gpu/drm/lima/lima_device.h  |  4 +--
> >>>>    4 files changed, 32 insertions(+), 32 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> >>>> index 8989e215dfc9..533b36932f79 100644
> >>>> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> >>>> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> >>>> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
> >>>>           struct lima_devfreq *devfreq = &ldev->devfreq;
> >>>>           unsigned long irqflags;
> >>>>
> >>>> -       status->current_frequency = clk_get_rate(ldev->clk_gpu);
> >>>> +       status->current_frequency = clk_get_rate(devfreq->clk_gpu);
> >>>>
> >>>>           spin_lock_irqsave(&devfreq->lock, irqflags);
> >>>>
> >>>> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
> >>>>           struct lima_devfreq *ldevfreq = &ldev->devfreq;
> >>>>           struct dev_pm_opp *opp;
> >>>>           unsigned long cur_freq;
> >>>> -       int ret;
> >>>> +       int i, ret;
> >>>>
> >>>>           if (!device_property_present(dev, "operating-points-v2"))
> >>>>                   /* Optional, continue without devfreq */
> >>>>                   return 0;
> >>>>
> >>>> +       /* Find first clock which are not "bus" clock */
> >>>> +       for (i = 0; i < ldev->nr_clks; i++) {
> >>>> +               if (!strcmp(ldev->clks[i].id, "bus"))
> >>>> +                       continue;
> >>>> +               ldevfreq->clk_gpu = ldev->clks[i].clk;
> >>>> +               break;
> >>>> +       }
> >>>
> >>> I'd prefer an explicit name for the required clk name. If some DTS has different
> >>> name other than "core" for the module clk (ie. "gpu"), it should be changed to
> >>> "core".
> >>
> >> The problem here is, the zynqmp has no core clock, it has "gpu and both
> >> pixel pipes" super-clock-gate which controls everything, and then
> >> per-pixel-pipe sub-clock-gates.
> >
> > So the "gpu" clk can gate both "gpu_pp0" and "gpu_pp1" clk, how about frequency?
>
> I don't think it is a good idea to just gate off the root clock while
> the sub-clock are still enabled. That might lead to latch ups (+CC
> Michal, he might know more).
>
> And who would enable the sub-clock anyway, it should be the GPU driver, no?
>
Right, I understand it's not proper either by HW or SW point of view to just
use root clk gate.

> > Can we set clock rate for "gpu" then "gpu_pp0" and "gpu_pp1" pass
> > through the same
> > rate? If so, "gpu" works just like "core".
>
> I don't think the zynqmp is capable of any DVFS on the GPU at all, it
> just runs at fixed frequency.

I see the GPU_REF_CTRL register 13:8 is a divisor, is this for all
"gpu"/"gpu_pp0"/"gpu_pp1" clk rating? If so, can we use it to dynamically
change the GPU clk freq because other SoC also use system clock
to do GPU DVFS, see sun8i-h3.dtsi. If we can't then zynqmp won't finish
lima_devfreq_init() and get here at all because it does not have
an OPP table.
