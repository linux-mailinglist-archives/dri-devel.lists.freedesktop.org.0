Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D2472C50
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E453E10E8D8;
	Mon, 13 Dec 2021 12:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329D10E8D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 12:31:12 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l25so51915904eda.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 04:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2x80Okzjje68iwErMtQc4zOhbYbVOwWTkUHX95jMRc=;
 b=MI7i6MPm+RcHx2AasoEzEffzH5F0x7gOG4r8h/xCp6uxshIOsseRrViHCAAkpFMGjD
 cOyS9PCVU+dcPFyZHNxpsHl7pnY7+gAUOsPTakOmoVyEscYlwpi5RijoRVyW9gtDWh9l
 PPq9AobyY4gn7Y0TXqx5aGTbqoUfAzzCs0254=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2x80Okzjje68iwErMtQc4zOhbYbVOwWTkUHX95jMRc=;
 b=csRw0tMxEoY6QIPlS/vADdBltmU9IHJSIOdmI3+bu7dgDR283LtAQHkiolPdRgu1Wo
 ZeQ+hsLzu1vK4g/uvdHbfUAB4JUQ8ulqbRoucT1AQHVoy2dy+mlxMQ5hiVCtCiCHVDr1
 b5fprYRPIoJnX32M8TQOy1OvPUMMb8tucGRag60CXrTh6ZZveZKSfIRdKxzGuzZ+QMsO
 AZzjRb5dT3WE2WQ+7xecmKyGJs2y9qnQqauYFQHXWm2NkFlSHLRE4JKIgsyfhL0xzdWm
 FspTaXQqNRe2oMRD0gmLb+ky7n2Ipku7dWTO92B9JwNndRFqaSIcSQ5Zi7KfJmq2AMM4
 yMhA==
X-Gm-Message-State: AOAM53064GFnK88fQvCULC4iApmJ4cCqj4l7WoKwZf0iXz10DCXwOowU
 5U7xmti3FjM/2jU/KZ4bnSq2gNO2Tng2P8PwELP5WA==
X-Google-Smtp-Source: ABdhPJydpQ0Y69FvAkFBeYmDUW+zR0mF1OwfDJpJKKLD7qgi5wNxxmP8/Z7m4Vf+ntGtbC6O+2r0JxsYV/RoQWCG53k=
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr65275773edd.310.1639398670968; 
 Mon, 13 Dec 2021 04:31:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
 <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
 <2b5810d5-8af7-f960-94fb-bd08188a9ae8@samsung.com>
In-Reply-To: <2b5810d5-8af7-f960-94fb-bd08188a9ae8@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Dec 2021 18:01:00 +0530
Message-ID: <CAMty3ZAsmMd0Vou0GhM=PbHF7=bDztbR6TV8QfQ95WESum9QQQ@mail.gmail.com>
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

On Mon, Dec 13, 2021 at 5:42 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 13.12.2021 13:08, Jagan Teki wrote:
> > On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 12.12.2021 19:14, Jagan Teki wrote:
> >>> Updated series about drm bridge conversion of exynos dsi.
> >>>
> >>> Patch 1: panel checker
> >>>
> >>> Patch 2: panel_bridge API
> >>>
> >>> Patch 3: Bridge conversion
> >>>
> >>> Patch 4: pree_enable, post_disable
> >>>
> >>> Patch 5: Atomic functions
> >>>
> >>> Patch 6: atomic_set
> >>>
> >>> Patch 7: DSI init in enable
> >>>
> >>> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
> >>>
> >>> Any inputs?
> >> I've checked this patchset on Exynos based Trats2 board (the one with
> >> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
> >> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
> >> exynos: dsi: Use drm panel_bridge API"):
> >>
> >> # dmesg | grep drm
> >> [    2.511893] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> >> mapping operations
> >> [    2.518653] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> >> fimd_component_ops)
> >> [    2.535699] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> >> exynos_dsi_component_ops)
> >> [    2.543912] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> >> [    2.556107] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> >> minor 0
> >> [    2.573212] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach]
> >> *ERROR* failed to find the bridge: -19
> > Look like you have missed to apply the Child lookup patch. is it so?
> >
> > Let me send it, I will CC you as well. And I will also send tc358764
> > panel_bridge conversion.
>
> The above log is from Trats2 board, which uses only the s6e8aa0 DSI
> panel. I've also checked the Arndale board, which has tc358764 bridge
> and it also doesn't work. Which patches I have to apply for the tests?

[PATCH v2] drm: of: Lookup if child node has panel or bridge
[PATCH] drm: bridge: tc358764: Use drm panel_bridge API

Thanks,
Jagan.
