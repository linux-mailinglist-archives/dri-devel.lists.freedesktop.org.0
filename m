Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345C45901F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8235489D86;
	Mon, 22 Nov 2021 14:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E04B89D86
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:21:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x6so65827079edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAJVcXyTbBWlJNP1UAyIHNBzS0QFYD3Ae2JEZDGDc9g=;
 b=TScnbYd6cHSgeynW7p/WbmrbSNhpg6djjWUKlQmnbnqiWU06dDfKCdj9Vh24/2zVPM
 FKPVV6LEFrTSYLvrXHw1+Tl6GQMrfkXRVAE7dzeMLLqPTVNe/cO/L0bohN7vhiJ84J6X
 PsE8J1Nm/F11V9+P1NDIYVNns4BiAeONrodzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAJVcXyTbBWlJNP1UAyIHNBzS0QFYD3Ae2JEZDGDc9g=;
 b=4Zu6ZXmnLa9/k4BiV9OXv278TpKU7UQhJwfePGb6hD5+ug5OM49YJWsh0nclp459m0
 aF4+QoQjw/p/+b8t7DN0zSAQuJ4g7zhY4Qe5GF2s+wLDKX38IStLzNkCWPB4YYWZuHpp
 //p1iWDOqpsne+FIJL046fTYrpqRvcV5IxI6PuyNVgdlB98DkP/Z2ztTvyCyZaYJ9oqo
 iVWrH9iNCeS4D64C+VtHqyk0YmpJV1XavpVsVJeAlFbhScn/FTO7ZEan5hPxL7nGX5dV
 UzujxSkaTEBrY8OyqvR8WQAKWoSw/BpHxkPyZdLiLndM69cA6NWiHpJ1iCGUFtjs9VKJ
 lkAw==
X-Gm-Message-State: AOAM530SoWWv9FE0YwaVLfVnEH0S72lPbnof0Oj/mt+NPTZNvpj4GCah
 HTKh/Ydx4npNXKes61HZkPqYqAU6QBiSIZOaIVTPVA==
X-Google-Smtp-Source: ABdhPJyxHOn5U9x4a78evUHOahZs75EH+ZgO+8vY5jPKQpHhPP/W919N1Z7OT9VwC+nEJrpR3EM0MsjcmWPCW3N9NTE=
X-Received: by 2002:a17:907:7f2a:: with SMTP id
 qf42mr42542615ejc.388.1637590898005; 
 Mon, 22 Nov 2021 06:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
In-Reply-To: <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 19:51:27 +0530
Message-ID: <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Nov 22, 2021 at 7:45 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 22.11.2021 08:06, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output, those
> > can have an option to connect the DSI host by means of interface
> > bridge converter.
> >
> > This DSI to non-DSI interface bridge converter would requires
> > DSI Host to handle drm bridge functionalities in order to DSI
> > Host to Interface bridge.
> >
> > This patch convert the existing to a drm bridge driver with a
> > built-in encoder support for compatibility with existing
> > component drivers.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Note:
> > Hi Marek Szyprowski,
> >
> > Please test this on Panel and Bridge hardware.
>
> I don't have good news, t crashes:
>
> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> /soc@0/dsi@13900000 to encoder TMDS-67: -22
> exynos-drm exynos-drm: failed to bind 13900000.dsi (ops
> exynos_dsi_component_ops): -22
> Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 2 PID: 74 Comm: kworker/u16:1 Not tainted 5.16.0-rc1+ #4141
> Hardware name: Samsung TM2E board (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : decon_atomic_disable+0x58/0xd4
> lr : decon_atomic_disable+0x28/0xd4
> sp : ffff80001390b940
> x29: ffff80001390b940 x28: ffff80001259a000 x27: ffff000027f39e80
> input: stmfts as
> /devices/platform/soc@0/14ed0000.hsi2c/i2c-3/3-0049/input/input0
> x26: 00000000ffffffea x25: ffff000025a40280 x24: 0000000000000001
> x23: ffff800011b55f98 x22: ffff0000315dc000 x21: ffff00002695d100
> x20: ffff000027e7a080 x19: ffff0000315e6000 x18: 0000000000000000
> x17: 645f736f6e797865 x16: 2073706f28206973 x15: 0000000000028ee0
> x14: 0000000000000028 x13: 0000000000000001 x12: 0000000000000040
> x11: ffff000023c18920 x10: ffff000023c18922 x9 : ffff8000126352f0
> x8 : ffff000023c00270 x7 : 0000000000000000 x6 : ffff000023c00268
> x5 : ffff000027e7a3a0 x4 : 0000000000000001 x3 : ffff000027e7a080
> x2 : 0000000000000024 x1 : ffff800013bc8024 x0 : ffff0000246117c0
> Call trace:
>   decon_atomic_disable+0x58/0xd4
>   decon_unbind+0x1c/0x3c
>   component_unbind+0x38/0x60
>   component_bind_all+0x16c/0x25c
>   exynos_drm_bind+0x104/0x1bc
>   try_to_bring_up_master+0x164/0x1d0
>   __component_add+0xa8/0x174
>   component_add+0x14/0x20
>   hdmi_probe+0x438/0x710
>   platform_probe+0x68/0xe0
>   really_probe.part.0+0x9c/0x31c
>   __driver_probe_device+0x98/0x144
>   driver_probe_device+0xc8/0x160
>   __device_attach_driver+0xb8/0x120
>   bus_for_each_drv+0x78/0xd0
>   __device_attach+0xd8/0x180
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0x9c/0xa4
>   deferred_probe_work_func+0x88/0xc4
>   process_one_work+0x288/0x6f0
>   worker_thread+0x74/0x470
>   kthread+0x188/0x194
>   ret_from_fork+0x10/0x20
> Code: 11002042 f9481c61 531e7442 8b020021 (88dffc21)
> ---[ end trace d73aff585b108954 ]---
> Kernel panic - not syncing: synchronous external abort: Fatal exception
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x2,300071c2,00000846
> Memory Limit: none
> ---[ end Kernel panic - not syncing: synchronous external abort: Fatal
> exception ]---

Is this with Bridge or normal DSI panel?

Jagan.
