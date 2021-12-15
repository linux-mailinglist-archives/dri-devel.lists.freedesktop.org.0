Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9794752F6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 07:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0685610E87C;
	Wed, 15 Dec 2021 06:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6954E10E871
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 06:28:25 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e3so71873228edu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 22:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+AnNSFvLJzSycmEnyO4VLHj6lIQq0EQd94E9Hve0BPE=;
 b=HprbkZgjQegWbrOjVbfSYDYFwZDkfqxyhczie9rJ//Ure5M7gmEZIExHayRn3uVIJZ
 +9LJsm1l0p45g0RvbAWys4On6wvkGwSX0aRIAIrWl/yy9k/DIvEiH4iVXyT/hyp7kFxh
 lRsEngRktEZIq226YnAPpUFJRn4XrT4HnrqWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AnNSFvLJzSycmEnyO4VLHj6lIQq0EQd94E9Hve0BPE=;
 b=RvCbBw5JEO+OUYsDvmcSbo9+EXtub1gpj5q4H7isrHR5oEZ5Ne519LzOO+Ly7q4QVn
 Ogg+5vkLmqssRhfCQFPqnLQds791OIbHqAGLbwheGEh1MlLWD2sqdtPaicJAweQPv2AY
 U1w+2mXaHvLHYGms15/7j+NK+0Wo7NLiwW+P3fB6s6t6dHKu+a5EnNRwOugKlIIkujQd
 +ladMjhsla2jqve/M+0dAXmuT0A5OV4aXSPmEsyGhatEFMZsVt6m3UDSHpIX4jSXh4BX
 WVAQXiiTIRdC1PE186NANEZZfjJrCi2GF+lePDtcTYhPdV1vfL7X9y82npycYg+tTDvu
 XkOQ==
X-Gm-Message-State: AOAM532W7ydtJo2kvJu2i2Ku2YsyQwwdHG6BkV3OWP2RmrpK+GL41a0Q
 evBoBi13kZtp/BmHq81bDkvLnvKVqI/pYVONmWipMw==
X-Google-Smtp-Source: ABdhPJw2yCQ+VkVxiY50MmtlV6WYQUxA76x0PPmVg0icXhbKNjxFsRJ34UyAxDS8Yr4piKtNMyEPzwJ4Avm/TjocsQ4=
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr13309121edd.310.1639549703844; 
 Tue, 14 Dec 2021 22:28:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
 <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
 <2b5810d5-8af7-f960-94fb-bd08188a9ae8@samsung.com>
 <CAMty3ZAsmMd0Vou0GhM=PbHF7=bDztbR6TV8QfQ95WESum9QQQ@mail.gmail.com>
 <bd410fb0-6594-e9ea-4163-0d0f2fcdfabe@samsung.com>
 <CAMty3ZBR-n0QS5DETYRmDFkcFv2QdOL8BfTmbduq7kHK=hBmAw@mail.gmail.com>
 <10780d37-76eb-23bd-48e5-809ff3cd465e@samsung.com>
 <CAMty3ZBDHs9JM9aZims97_Z213RWMUxcz_LUX_dZGeAYFE8Eew@mail.gmail.com>
 <018a4243-8815-120d-a151-09182e3ad486@samsung.com>
In-Reply-To: <018a4243-8815-120d-a151-09182e3ad486@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 15 Dec 2021 11:58:12 +0530
Message-ID: <CAMty3ZBQnUG6CgFh1eerUGacixCszJeA=DiVHwkg56SHaWOEQw@mail.gmail.com>
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

On Wed, Dec 15, 2021 at 11:39 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 14.12.2021 11:47, Jagan Teki wrote:
> > On Mon, Dec 13, 2021 at 7:42 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 13.12.2021 14:56, Jagan Teki wrote:
> >>> On Mon, Dec 13, 2021 at 6:51 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 13.12.2021 13:31, Jagan Teki wrote:
> >>>>> On Mon, Dec 13, 2021 at 5:42 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 13.12.2021 13:08, Jagan Teki wrote:
> >>>>>>> On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
> >>>>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>>>> On 12.12.2021 19:14, Jagan Teki wrote:
> >>>>>>>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>>>>>>
> >>>>>>>>> Patch 1: panel checker
> >>>>>>>>>
> >>>>>>>>> Patch 2: panel_bridge API
> >>>>>>>>>
> >>>>>>>>> Patch 3: Bridge conversion
> >>>>>>>>>
> >>>>>>>>> Patch 4: pree_enable, post_disable
> >>>>>>>>>
> >>>>>>>>> Patch 5: Atomic functions
> >>>>>>>>>
> >>>>>>>>> Patch 6: atomic_set
> >>>>>>>>>
> >>>>>>>>> Patch 7: DSI init in enable
> >>>>>>>>>
> >>>>>>>>> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
> >>>>>>>>>
> >>>>>>>>> Any inputs?
> >>>>>>>> I've checked this patchset on Exynos based Trats2 board (the one with
> >>>>>>>> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
> >>>>>>>> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
> >>>>>>>> exynos: dsi: Use drm panel_bridge API"):
> >>>>>>>>
> >>>>>>>> > [...]
> >>> Thanks for testing it.
> >>>
> >>> Can you test it on the downstream bridge, tc358764 and post the result?
> >> There were 2 logs in my reply. One from trats2 board (just dsi panel)
> >> and one from arndale (tc bridge + simple panel).
> > Okay. Got it.
> >
> > Can you test this tc358764 panel_bridge patch on linux-next? don't
> > apply this series, apply only below patch and test.
> >
> Yes, sure. Sadly, it also breaks display operation:
>
> OF: graph: no port node found in /soc/hdmi@14530000
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
> OF: graph: no port node found in /soc/dsi@14500000
> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
> exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
> panfrost 11800000.gpu: clock rate = 533000000
> panfrost 11800000.gpu: mali-t600 id 0x600 major 0x0 minor 0x0 status 0x1
> panfrost 11800000.gpu: features: 00000000,10206000, issues:
> 00000000,31b4dfff
> panfrost 11800000.gpu: Features: L2:0x07110206 Shader:0x00000000
> Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xf JS:0x7
> panfrost 11800000.gpu: shader_present=0xf l2_present=0x1
> [drm] Initialized panfrost 1.2.0 20180908 for 11800000.gpu on minor 1
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 23 at drivers/gpu/drm/drm_atomic_state_helper.c:494
> drm_atomic_helper_connector_duplicate_state+0x60/0x68
> Modules linked in:
> CPU: 1 PID: 23 Comm: kworker/1:1 Not tainted
> 5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events output_poll_execute
> [<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
> [<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
> [<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
> [<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
> [<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>]
> (drm_atomic_helper_connector_duplicate_state+0x60/0x68)
> [<c064e844>] (drm_atomic_helper_connector_duplicate_state) from
> [<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
> [<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>]
> (__drm_atomic_helper_set_config+0x2a0/0x368)
> [<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>]
> (drm_client_modeset_commit_atomic+0x178/0x27c)
> [<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>]
> (drm_client_modeset_commit_locked+0x48/0x1d0)
> [<c0680be0>] (drm_client_modeset_commit_locked) from [<c0680d8c>]
> (drm_client_modeset_commit+0x24/0x40)
> [<c0680d8c>] (drm_client_modeset_commit) from [<c0652a94>]
> (__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
> [<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from
> [<c0652b60>] (drm_fb_helper_set_par+0x38/0x64)
> [<c0652b60>] (drm_fb_helper_set_par) from [<c0652c34>]
> (drm_fb_helper_hotplug_event.part.5+0xa8/0xc0)
> [<c0652c34>] (drm_fb_helper_hotplug_event.part.5) from [<c063dfbc>]
> (drm_kms_helper_hotplug_event+0x24/0x30)
> [<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c063e210>]
> (output_poll_execute+0x1ec/0x204)
> [<c063e210>] (output_poll_execute) from [<c0148990>]
> (process_one_work+0x2c8/0x7ec)
> [<c0148990>] (process_one_work) from [<c0148f04>] (worker_thread+0x50/0x584)
> [<c0148f04>] (worker_thread) from [<c0151300>] (kthread+0x13c/0x19c)
> [<c0151300>] (kthread) from [<c0100108>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xc1d35fb0 to 0xc1d35ff8)
> 5fa0:                                     00000000 00000000 00000000
> 00000000
> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> irq event stamp: 1287
> hardirqs last  enabled at (1293): [<c01a3b94>] vprintk_emit+0x270/0x2b4
> hardirqs last disabled at (1298): [<c01a3b50>] vprintk_emit+0x22c/0x2b4
> softirqs last  enabled at (1260): [<c01016fc>] __do_softirq+0x4cc/0x5ec
> softirqs last disabled at (1255): [<c01301c8>] irq_exit+0x1cc/0x200
> ---[ end trace 0fa33551718d667f ]---
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 7 at drivers/gpu/drm/drm_atomic_state_helper.c:494
> drm_atomic_helper_connector_duplicate_state+0x60/0x68
> Modules linked in:
> CPU: 0 PID: 7 Comm: kworker/u4:0 Tainted: G        W
> 5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events_unbound deferred_probe_work_func
> [<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
> [<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
> [<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
> [<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
> [<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>]
> (drm_atomic_helper_connector_duplicate_state+0x60/0x68)
> [<c064e844>] (drm_atomic_helper_connector_duplicate_state) from
> [<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
> [<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>]
> (__drm_atomic_helper_set_config+0x2a0/0x368)
> [<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>]
> (drm_client_modeset_commit_atomic+0x178/0x27c)
> [<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>]
> (drm_client_modeset_commit_locked+0x48/0x1d0)
> [<c0680be0>] (drm_client_modeset_commit_locked) from [<c0680d8c>]
> (drm_client_modeset_commit+0x24/0x40)
> [<c0680d8c>] (drm_client_modeset_commit) from [<c0652a94>]
> (__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
> [<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from
> [<c0652b60>] (drm_fb_helper_set_par+0x38/0x64)
> [<c0652b60>] (drm_fb_helper_set_par) from [<c05bbf28>]
> (fbcon_init+0x48c/0x510)
> [<c05bbf28>] (fbcon_init) from [<c0608b50>] (visual_init+0xc0/0x108)
> [<c0608b50>] (visual_init) from [<c0609d78>]
> (do_bind_con_driver+0x1ac/0x388)
> [<c0609d78>] (do_bind_con_driver) from [<c060a2b0>]
> (do_take_over_console+0x13c/0x1c8)
> [<c060a2b0>] (do_take_over_console) from [<c05b90e0>]
> (do_fbcon_takeover+0x74/0xcc)
> [<c05b90e0>] (do_fbcon_takeover) from [<c05b38f0>]
> (register_framebuffer+0x1c8/0x2d8)
> [<c05b38f0>] (register_framebuffer) from [<c06524a4>]
> (__drm_fb_helper_initial_config_and_unlock+0x440/0x65c)
> [<c06524a4>] (__drm_fb_helper_initial_config_and_unlock) from
> [<c063dfbc>] (drm_kms_helper_hotplug_event+0x24/0x30)
> [<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c0690fb8>]
> (exynos_dsi_host_attach+0x170/0x2a4)

I think I understand the issue. Please wait for next version patches.

Thanks,
Jagan.
