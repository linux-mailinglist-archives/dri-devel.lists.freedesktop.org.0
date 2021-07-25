Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C03D4F04
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BD86E431;
	Sun, 25 Jul 2021 17:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ADD6E431
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:14:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gn26so6524606ejc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H3RPOWBRf2k2synG3wrZwitti/PedojQEmKKrIh2UUo=;
 b=TH2gxgFULV3Btg8IqnkRewzfEIxAXYMpVn2yzlu582rw3Tkd6LO0hyYodBGl+z3oOG
 FCCEjmdxW1A8AOt5F8w+i6QkbHU5HZJ6cl68r8LuL4Tj7K2bwik3XqCiX4ybx0XqDenN
 voy9QGTXoRAhRVXYCmsSBDR824M8vqCCNStoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3RPOWBRf2k2synG3wrZwitti/PedojQEmKKrIh2UUo=;
 b=kJ8jan53rj+MpAQ4azMWVZAlVrudB2Y39YKgkkwfUysTGkf0ulfh1rjlbQsj8n3yWN
 HuQaBEUk30rbJWUtPH4pQaiooEG+EL+Py68L+jT2hDjQfXbYegLg4guEWmCFmvyiKxqy
 S9ztLSgETaR92gvP/8iqwYkRqmMmgB+ElHwV2uXOqv98r55tfQInil3yillXmhKD+OWA
 CfKhoqQOPqWepHJoLQ4AxcPhm+RUt7yizOGz1O/dscCEvEhucedefz/QCJb8Vq9TcQZH
 RU/rb6u/4PpwtGZO3TGVfZq9gHt1GlXoe+z45ctMvy+zhtVFEIq1DIAYBi+UwGniNFup
 GpUA==
X-Gm-Message-State: AOAM531vOxfoRL/kTmPQH8POXsDNY/xaxCH0wQWe2CmK64nbzf9LEPXr
 YbtsomNF6YOyfO4yVErwnNqxtf+6CWCrO4XhD8mNTA==
X-Google-Smtp-Source: ABdhPJxHwHQXUhyRK5a5X9ubPP7qAlXX/q2WPa8HKt6EPPQlN1ZOYkiGslGAR5j+VSADs9ttExe8DXD7AN113IbTGAQ=
X-Received: by 2002:a17:906:368e:: with SMTP id
 a14mr14034879ejc.60.1627233247000; 
 Sun, 25 Jul 2021 10:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <YP2ZvoVQyvwTXP++@ravnborg.org>
In-Reply-To: <YP2ZvoVQyvwTXP++@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 25 Jul 2021 22:43:55 +0530
Message-ID: <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
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

Hi Sam,

On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan,
>
> On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Right now bridge offers two sets of implementations.
> >
> > A. With component_ops and exynos specific code exclusively for
> >    exynos dsi drivers and it's legacy bindings.
> >
> > B. Without componenet_ops for newly implemented bridges and its
> >    users like i.MX8MM.
> >
> > The future plan is to fix the implementation A) by dropping
> > component_ops and fixing exynos specific code in order to make
> > the bridge more mature to use and the same is mentioned in
> > drivers TODO.
> >
> > Patch 0001 - 0006: Bridge conversion
> > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Anyone interest, please have a look on this repo
> > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> >
> > Would appreciate anyone from the exynos team to test it on
> > the exynos platform?
> >
> > Any inputs?
>
> I really like where you are headign with this!
> No testing - sorry. But I will try to provide a bit of feedback on the
> individual patches.
>
> I hope you find a way to move forward with this.

Thanks for the response.

We have found some issues with Bridge conversion on existing exynos
drivers. The component based DSI drivers(like exynos) are difficult to
attach if it involves kms hotplug. kms hotplug would require drm
pointer and that pointer would only available after the bind call
finishes. But the bridge attach in bind call will defer till it find
the attached bridge.

Right now I'm trying to find the proper way to attach the bridges for
component based DSI drivers which involves kms hot-plug.

If you have any ideas on this, please let me know.

Thanks,
Jagan.
