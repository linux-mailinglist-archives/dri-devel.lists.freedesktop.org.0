Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4353D4F17
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083316E438;
	Sun, 25 Jul 2021 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400BE6E438
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:31:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h8so7391519ede.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UkBtWhkl5JjlzgWjWjbI0oCul3smhswI+BT+jn3A+AY=;
 b=lBBlbVTgySrhfYF11i0DKiwn3+sSA7nyyo0yoTZTVFnYulOqwe3Wijrr0RpX8FDptS
 nDVJh/X1mD/yD8XHJOIaYurWvOcIO6GmVpnIcUqYI9L0pSi3Oq4H6TXmtA2Eu2EVDCt7
 ftUZ9aMRZdzcjyTEhRpFSadpe/L4hrOcUQ2fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkBtWhkl5JjlzgWjWjbI0oCul3smhswI+BT+jn3A+AY=;
 b=rE0BUYdAEC13jJfS8H7TTmxx0+oJIcIBkotFXJbmkKWJk7CSXJZOLs2Mi0v1pSpmRZ
 129DBqurwoeopa1J0mGPF2PjmnVI9gAPUzTL4oPaO1bCemB16WO12PFVSVPPCyX14Nch
 tEKn7kuxD1zZwGq8JheGXxbB8HU1D0GGYo7SPRRLC123bunnTgz3qQkX2V6pMwGXC+Cd
 jeNDHKLSgwUiRZ06PSBE5+21t68fvOrme8pcpDFQNUvjd2h94dea91kVRRUo61XuWiY4
 szhNjYgSEV+T6sM4/1xvsDb0gMUYgJ5Jl4al5fIXqvONCMfdkNrX27pv3yvNo4utiCdZ
 UtOg==
X-Gm-Message-State: AOAM533/wx1suL3vN5ixdaI4vCU8CtnV+TQcRgu3fAxrbYXdiuSwz6te
 Y61koI7qQsMF369HAETZ9GuR1n1pdZF0tlBEC7oRdQ==
X-Google-Smtp-Source: ABdhPJx151WxgS05DBXIbJnohD/dbKLDBEbx/smB09iPx/aNJsLqRY1rRPuWytgxhRRXNS+9iqhHYx5oieQg99TAJ7Q=
X-Received: by 2002:a05:6402:144f:: with SMTP id
 d15mr17294723edx.27.1627234271837; 
 Sun, 25 Jul 2021 10:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-7-jagan@amarulasolutions.com>
 <YP2el40V3K4R7ner@ravnborg.org>
In-Reply-To: <YP2el40V3K4R7ner@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 25 Jul 2021 23:01:00 +0530
Message-ID: <CAMty3ZAw9ZNYCm=LnETEoi8qHn3qc5_B2tewhOKw-TTPrU0xog@mail.gmail.com>
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 10:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
> > Exynos DSI driver is actually a Samsung MIPI DSIM bridge
> > IP which is also used in i.MX8MM platforms.
> >
> > Right now the existing driver has some exynos drm specific
> > code bases like te_irq, crtc and component_ops.
> >
> > In order to switch this driver into a common bridge driver
> > We can see 2 options to handle the exynos specific code.
> >
> > A. Drop the component_ops, and rework other specifics.
> >    This may lead to more foundation work as it requires
> >    more changes in exynos drm drivers stack.
> >
> > B. Handle the exynos specifics via driver data, and make
> >    the common bridge work in different platforms and plan
> >    for option A in future.
> >
> > So, this patch is trying to add option B) changes to handle
> > exynos specifics via driver_data.
>
> We really should find someone that has the time, energy, knowledge and
> hardware that can include device_link support once anf for all for
> bridges.
> Then we would avoid hacks like this.
>
> I see no other options at the moment, but look forward for a better
> solution.

The real key problem here is hardware, unfortunately I'm unable to
find any proper exynos DSI hardware for myself to proceed atleast.

Thanks,
Jagan.
