Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B34FC0B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976BD10E463;
	Mon, 11 Apr 2022 15:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4537810E338
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:29:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g20so18895210edw.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzIfVfFUOODRjLdS14PpvkG0S0GbVnViYVnZ49D8qA0=;
 b=GBafK7+JAVNForJ4ptnul61FCr66yI4Smn4eNC0ynAHf6wqxrTNyFdD/pcZuGIFtCG
 5vYfE7Fk938DLVBUmlcX/xX/3nF7hg1ay4kScO80jH2V0g1R/F1U0w2R0O/1UHRImTbY
 ge1vwLQwIZ5lwQRAasDWsQvA9p9r5PmsjAXIrFZml++liIvTGlsdHaXEbEALMCAQvn9w
 zAlSfpYreWr3yzlyPr7zsfEOXWwD9StL10JoG+bNp3YGxmhAYgBBmis6/ReM4FuYiuEj
 dWNbA3nia+6dWpBk9k3lP0z44CmYmaXKieBeg29ydMpuKEk2y4uF7P7RI4bPEnon5dlA
 1rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzIfVfFUOODRjLdS14PpvkG0S0GbVnViYVnZ49D8qA0=;
 b=pKb98bzPnnzM2IdsYMeVdZz10WlE0G83YUW+J8VCkCkFVzsEHb/lWMKVMZjiZWaQ90
 J2WLZIBgFTeuXZJoq43V6CXQdhMhaXQx+MbqQ6WyaGgw96N4jiLiKvuCELZ9lT6f512I
 0vELoWkB0OjNsosrhPLUxMbzwvcfXbRJ6G/xl2I4jNuGyZZ+Vnbd1eAGceomwO18HxFT
 POwpc+0cq05tkBfo8yHhjLzO3xE6xjwfppecrDKxyrkYOAp6ltcZm11TtiIZ3g867612
 f1WUzHwnSbekSoeaYQKxFIzDmR8CqgqCKzcAJQP0ZKkINlqh/iYpcvfg3vIB9gl7iE4A
 8k4g==
X-Gm-Message-State: AOAM53054s48Jcsv4kN5Pj54UzL/uhhbAn0dQD3itZP350SGwicevAeO
 S+/PfafUcl1biXPyJZgVo+TX2LFpPmqUPDoE7XY=
X-Google-Smtp-Source: ABdhPJzgVW17R1KDDFRpyF9QFb1z4pjCDGITJBWmNH4/PLP2cVb+cM1aoNqDBlE3e8twNNi8WizL8HsXgo9p4y02T1s=
X-Received: by 2002:a50:d4d9:0:b0:41d:6ee0:80d with SMTP id
 e25-20020a50d4d9000000b0041d6ee0080dmr11392500edj.254.1649690966382; Mon, 11
 Apr 2022 08:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3@eucas1p1.samsung.com>
 <20220408162108.184583-1-jagan@amarulasolutions.com>
 <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
 <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
In-Reply-To: <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 11 Apr 2022 10:29:15 -0500
Message-ID: <CAHCN7xKFr3cjLRPMFMzOyeTe5CG2vzK_ewUg73zsexKVCLW0tw@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 9:39 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Apr 11, 2022 at 8:56 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > On 08.04.2022 18:20, Jagan Teki wrote:
> > > This series supports common bridge support for Samsung MIPI DSIM
> > > which is used in Exynos and i.MX8MM SoC's.
> > >
> > > Previous RFC can be available here [1].
> > >
> > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > >
> > > On, summary this patch-set break the entire DSIM driver into
> > > - platform specific glue code for platform ops, component_ops.
> > > - common bridge driver which handle platform glue init and invoke.
> > >
> > > Patch 0000:   Samsung DSIM bridge
> > >
> > > Patch 0001:   platform init flag via driver_data
> > >
> > > Patch 0002/9:   bridge fixes, atomic API's
> > >
> > > Patch 0010:   document fsl,imx8mm-mipi-dsim
> > >
> > > Patch 0011:   add i.MX8MM DSIM support
> > >
> > > Tested in Engicam i.Core MX8M Mini SoM.
> > >
> > > Anyone interested, please have a look on this repo [2]
> > >
> > > [2] https://protect2.fireeye.com/v1/url?k=930e329a-f28527b5-930fb9d5-74fe485cbfe7-b0c53e2d688ddbc5&q=1&e=e6aa727d-5ae2-4ca5-bff3-7f62d8fae87e&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v1
> > > [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
> > >
> > > Any inputs?
> >
> > I wanted to test this on the Exynos, but I wasn't able to find what base
> > should I apply this patchset. I've tried linux-next as well as
> > 95a2441e4347 ("drm: exynos: dsi: Switch to atomic funcs").
> >
> > Please note that pointing a proper base for the patchset is really
> > essential if you really want others to test it.
>
> Can you clone his repo and test that?  He posted it above.  I was
> going to clone it at some point this week to give it a try.

Jagan,

Is there anyway you could rebase this onto 5.18-rc1? Marek was having
issues applying patches to a known branch, and it looks like I cannot
enable stuff on Nano without applying a bunch of patches, because this
base lacks the power-domain features on Nano that are present in the
5.18-rc1.

thanks,

adam

>
> adam
> >
> >
> > > Jagan.
> > >
> > > Jagan Teki (11):
> > >    drm: bridge: Add Samsung DSIM bridge driver
> > >    drm: bridge: samsung-dsim: Handle platform init via driver_data
> > >    drm: bridge: samsung-dsim: Mark PHY as optional
> > >    drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
> > >    drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
> > >    drm: bridge: samsung-dsim: Add module init, exit
> > >    drm: bridge: samsung-dsim: Add atomic_check
> > >    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
> > >    drm: bridge: samsung-dsim: Add input_bus_flags
> > >    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
> > >    drm: bridge: samsung-dsim: Add i.MX8MM support
> > >
> > >   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
> > >   MAINTAINERS                                   |   12 +
> > >   drivers/gpu/drm/bridge/Kconfig                |   12 +
> > >   drivers/gpu/drm/bridge/Makefile               |    1 +
> > >   drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
> > >   drivers/gpu/drm/exynos/Kconfig                |    1 +
> > >   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
> > >   include/drm/bridge/samsung-dsim.h             |   97 +
> > >   8 files changed, 1982 insertions(+), 1649 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> > >   create mode 100644 include/drm/bridge/samsung-dsim.h
> > >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
