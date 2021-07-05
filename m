Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3883BBCDF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D978973E;
	Mon,  5 Jul 2021 12:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE98F8973E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:34:28 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id he13so10206226ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYgCutTysFjToHhxhkTGe6Ke5bNipQU+7DP9IUElXsg=;
 b=LgB9rSVsdNUUYfdjJMCGmGNKxmE2UF/Kjqs128rNHr99DqjGJlyFRjf64qSh2fzVuu
 YhIcxtUz5+MsDVvCcsfObntGC/X3zaRGXeUgaeNxBWYGAzJc1ZdidX6ySdcEDFwTmicI
 nE2fEdvZ3kRBG+3HWteSHTEstabuNuHjgJo1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYgCutTysFjToHhxhkTGe6Ke5bNipQU+7DP9IUElXsg=;
 b=b3jdrE6X8xd7YwIrWxsvqr8dpK64Hf/2RKU2gDJYr2HsRzaMHrSEvkPogts4heq9pH
 jft1y/W0isXv2F6Pr5xjG8RjPL3u42AJJwigqO6G2WmR9KLxeFlCTB5Ghzxi8yRGoqR1
 Y16QKBFPqR5QL+Dner0k9J2cKQy73UmAECPtWZ8vREyIz/Uk2JEw6LvgcUOJZcslWT1Y
 ku5syg5H/4ozgZKFUE2tr0rktMW4b74AJhwnIFqAfG/3kgkPGKnZb0qYCpncci7iwUlM
 D8NH+89vF5bGn2f8lqKaS0H7AJjOmVujg6UYVyTQNAD2ihYdOzjt3YdXYoulQDg1vsWD
 zg8g==
X-Gm-Message-State: AOAM532kUT0rJju0FaQ9hZ8zVe0buxHeLQpqm/3LWiXTHJX/Ta783B05
 ZFGpnzLOjr4LDEP/alnfwLXXGjY3VUBCUDwM0ZZvKg==
X-Google-Smtp-Source: ABdhPJwGdD3qkRDbzHJZ7re9u/ZbvF8hk9l6hZz+QJMz7zwD2KihNnr1v6zzB8WCDMxiReKthjN3KTtJiypPnR6+HYA=
X-Received: by 2002:a17:906:bb10:: with SMTP id
 jz16mr13254166ejb.252.1625488467616; 
 Mon, 05 Jul 2021 05:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com>
 <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
 <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com>
 <03653aa2-ed43-88b3-213a-9ccc99587844@samsung.com>
In-Reply-To: <03653aa2-ed43-88b3-213a-9ccc99587844@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 5 Jul 2021 18:04:16 +0530
Message-ID: <CAMty3ZCd7DugDYbOfro3e5uRgtXviP9p-5nXp30mRPcoy5gG4g@mail.gmail.com>
Subject: Re: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
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

On Mon, Jul 5, 2021 at 5:43 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 05.07.2021 14:00, Jagan Teki wrote:
> > On Mon, Jul 5, 2021 at 5:18 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 04.07.2021 11:02, Jagan Teki wrote:
> >>> Use drm_panel_bridge to replace manual panel and
> >>> bridge_chain handling code.
> >>>
> >>> This makes the driver simpler to allow all components
> >>> in the display pipeline to be treated as bridges by
> >>> cleaning the way to generic connector handling.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> This breaks Exysos DSI driver operation (Trats board worked fine with
> >> only patches 1-2):
> >>
> >> [    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
> >> [    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
> >> [    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> >> mapping operations
> >> [    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> >> fimd_component_ops)
> >> [    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops
> >> exynos_dsi_component_ops): -22
> >> [    2.642263] exynos-drm exynos-drm: master bind failed: -22
> >> [    2.651017] exynos-drm: probe of exynos-drm failed with error -22
> > Thanks for testing it.
> >
> > Can you check Squash of 3,4 or 3,4,5 will work or not?
>
> I've check both sets: 1-4 and 1-5 and none of them works. The result is
> same as above. If I remember correctly, last time when I played with
> that code, there was a problem with DRM core calling bridge ops in
> different order than when they are used by the Exynos DSI driver.

Okay. Let me check with sun6i-mipi-dsi as it is component_ops based.

Jagan.
