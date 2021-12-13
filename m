Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941A472BFB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B2810E758;
	Mon, 13 Dec 2021 12:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94D610E758
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:08:45 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y13so50890179edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H5Ddw2Jn6dd3LrLXr8nP/Z9GyinGsK4E1VX7svagCgM=;
 b=GWJW+8jhtDK6lQ7JiXBgFgpPSFFBatE1JcGmiQUPYmyO1jsYyiJXGROfJbZZ0gRZnO
 +7f2AOxl6R//lK9gwg9JSbXAaqFl+DbI1tIiaSZDKArSSgxp6gjrHs39So1seO7HsLQm
 /GShmX0UCx9Srvr/s2d0rFgbX7QrPbgA/XxUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5Ddw2Jn6dd3LrLXr8nP/Z9GyinGsK4E1VX7svagCgM=;
 b=rivvA6qwJVJDvPnOUU2FfLOdt531XsdVUfEuffGHk/CENv4xwyCUoRKCcKpM8l9uEB
 hPzlOL6ov6Wq9AmRzEMcc8FRIw9tnx1opYhPr2QcQ3sD6uqfwWNWL9QHKfuEik/de7m+
 NeJtt0EObC878+E9hKcgTpvfigqmakaFJgM1ic9QW3j0TrDgAl5+9NuLBPVQqHYxJbmk
 y3PI4DsRPNPC8SgGGGUhC6AmowQT//u4VC6TtXwespGgcdayLkixfA55Ob9SZVT8r/UZ
 ldZL27zG21D5XLC6pLrwSXTaHiY9+MiORycE2sbSw8BtQ+daOC76R8q6ZOgItyjV7VQG
 3eCA==
X-Gm-Message-State: AOAM532rsHUyQmo6T4OSdWKyP6TRD1cTfIBx5OVmhhusWZvAZ88PU3Ij
 UfJjVPPE5d7G6wAAq4DuqKkjpPscCrxNym8Uzks4bA==
X-Google-Smtp-Source: ABdhPJwqC6lOVStusODlObc4BAotcAWfaX8mFXB0iCDiI/LwXRwuMDKrKTIND8KD0Q/5TOq9LvfYJoyDoMaQiOQ6Nr4=
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr63835314edc.229.1639397324392; 
 Mon, 13 Dec 2021 04:08:44 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
In-Reply-To: <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Dec 2021 17:38:33 +0530
Message-ID: <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm: exynos: dsi: Convert drm bridge
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Dear Jagan,
>
> On 12.12.2021 19:14, Jagan Teki wrote:
> > Updated series about drm bridge conversion of exynos dsi.
> >
> > Patch 1: panel checker
> >
> > Patch 2: panel_bridge API
> >
> > Patch 3: Bridge conversion
> >
> > Patch 4: pree_enable, post_disable
> >
> > Patch 5: Atomic functions
> >
> > Patch 6: atomic_set
> >
> > Patch 7: DSI init in enable
> >
> > [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
> >
> > Any inputs?
>
> I've checked this patchset on Exynos based Trats2 board (the one with
> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
> exynos: dsi: Use drm panel_bridge API"):
>
> # dmesg | grep drm
> [    2.511893] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> mapping operations
> [    2.518653] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> fimd_component_ops)
> [    2.535699] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> exynos_dsi_component_ops)
> [    2.543912] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> [    2.556107] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> minor 0
> [    2.573212] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach]
> *ERROR* failed to find the bridge: -19

Look like you have missed to apply the Child lookup patch. is it so?

Let me send it, I will CC you as well. And I will also send tc358764
panel_bridge conversion.

Thanks,
Jagan.
