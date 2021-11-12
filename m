Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A543A44E209
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 07:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C576E902;
	Fri, 12 Nov 2021 06:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A146E978
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 06:47:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z21so33716069edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 22:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aGQaQIxHq2g844QfsGMPavrNU9PqYLl3F+sUaO/zs5c=;
 b=eNLQ0nGEfwSpK93Neyr1MG2AvFgsK1ofw7iRTeXDk2hoP9ixGveT8vTZ4pxsXnm+Uj
 ukXEZmp5qCnOq5cYzCp19Hy38gxsHOzXObHDjKtLPTvr47X1UjSGjnKCxKH2ahXLf6Ai
 r8Z/KgMU0J8YF+IMl6BdEg+WF6HWqaDRAD4kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGQaQIxHq2g844QfsGMPavrNU9PqYLl3F+sUaO/zs5c=;
 b=5DOFCCcEBY9BGKyC2X8vXtRBWj4fvhakD6qbLnBc+qnN6l9H+bBkqeJur7N0JJxElw
 wblK7rnnTbiiZynIPM0O7bc7XMk6ix9QCpdxmqaI+piIVuMXg8bqNBVKnEQ338JvAAQS
 uH+wj7vpamr+OvXsWUKvFHodLFagicoxMXBZkj3o+QY1ePDkAz0YXYSMQN8+7kth+zPH
 3QufE/mA49OOazcsU5j6WyfVkPTTRXHn8yv0aG9hupFJ3Qt47mVshmELsZXyR4XZOizD
 QBdbmVNrYEDjFsFwNNKPq7VcWD4WkR0M7tVQIeoX2Kz+w35REB5MvAHWiCxU192Igd3V
 q2dA==
X-Gm-Message-State: AOAM5338Y3MUrffjO0jZaXjAOA2jlujEtoFd1do8CkuhWWp1VzMxxRqW
 /+eINxKAXk35XHM768n4CuOGL4kQfmBaM8KCwIvdBg==
X-Google-Smtp-Source: ABdhPJz9/fDn32MBeFzWgqy88o0sb44J2qy+g4BDsAkX/ek6RjvHYOKtyHgt38zNHolVKYDrGqZfi1iA5OMReOxXDGk=
X-Received: by 2002:a17:907:6d28:: with SMTP id
 sa40mr16341369ejc.201.1636699673998; 
 Thu, 11 Nov 2021 22:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
 <CAJ+vNU2P3rosfJVEDsU4xZWCn40w-yEGrsZiD7YcJ0Z-snH6kA@mail.gmail.com>
In-Reply-To: <CAJ+vNU2P3rosfJVEDsU4xZWCn40w-yEGrsZiD7YcJ0Z-snH6kA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 12 Nov 2021 12:17:43 +0530
Message-ID: <CAMty3ZC+Xy7xQ0+M4BPXuhyNffcGfDO9S23dkkq-vMJptAkUVA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] arm64: imx8mm: Add MIPI DSI support
To: Tim Harvey <tharvey@gateworks.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dae <inki.dae@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 5:40 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Thu, Nov 11, 2021 at 2:15 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > This series support MIPI DSI on i.MX8MM.
> >
> > The DSIM bridge still need to work to make it compatible for
> > exynos drm dsi hardware block.
> >
> > This series work directly on to of linux-next with recent
> > dispmix-blk-ctrl changes.
> >
>
> Jagan,
>
> Thanks - I was able to get this series working using the set of
> exynos/drm patches from Michael submitted back in 2020-09-11:
> https://patchwork.kernel.org/project/dri-devel/list/?series=347439&archive=both&state=*
>
> > Tested on i.Core MX8M Mini SoM with EDIMM2.2 and CTOUCH2
> > Carrier boards.
> >
> > Required changes:
> > 1. DSIM driver
> > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210704090230.26489-1-jagan@amarulasolutions.com/
>
> This exynos/drm RFC series you posted back in July was where I
> recalled the discussion about if the exynos driver could be split up
> vs duplicating parts of it in a separate driver.

Not sure Laurent, Inki has some discussion about this [1], looks like
they are still looking for a common driver.

>
> There were also some comments about this series. Can you address those
> comments, rebase and resend?
>
> I have not been able to get my hardware to work with this series yet
> and am still debugging that (currently crashing in
> samsung_dsim_host_attach)

I've initially tried a separate driver instead of exynos.[2]

>
> > 2. DPHY change
> > https://www.spinics.net/lists/devicetree/msg381691.html
>
> This was originally from Marek submitted on Oct 3 2020: [PATCH] phy:
> exynos-mipi-video: Add support for NXP i.MX8MM

I'm thinking this may not be required, as dphy reset can now handle
via blk-ctrl like this [3]. I have tested the reset handling via
blk-ctrl and it works for me.

>
> This one seems to have been acked but never got picked up for some reason.
>
> Marek, can you add the tags and re-submit?
>
> > 3. Bus format fix
> > https://github.com/openedev/linux/commit/6ca9781ed53ea75e26341dd57250e63794638b20
> >
>
> Jagan, can you submit this?

This is indeed not required, drm handles the bridge state via atomic
API's. I did check that as well. I will link my latest series soon.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210704090230.26489-7-jagan@amarulasolutions.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210621072424.111733-1-jagan@amarulasolutions.com/
[3] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20211106155427.753197-1-aford173@gmail.com/

Jagan.
