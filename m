Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16FC4740C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 11:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB4210E40F;
	Tue, 14 Dec 2021 10:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306710E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 10:47:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z7so372549edc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7o5bv4+ytQMf2CBbn9EeffgphTSdKHECs7aa2G3u8KI=;
 b=a6NZDnwJUfLnq+h1kkf7VGm67sjhanEiAKBIKRCIIr0GcsNWjdtsvXRtHQSj5z56Ef
 +9yuc0tJMgbFT/4QQVsVew/dXF4Ecw6bwRpuR6IP8/4TLmUrIfanMFr5ADnrCgD3uywR
 3eAlTZdA+mC76sCjV1CZvl+6yKwZTZ6t/F7tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7o5bv4+ytQMf2CBbn9EeffgphTSdKHECs7aa2G3u8KI=;
 b=vpm8k202+qDOukM07ROlUcT4zOW7V0s+z205cgP4vB47ruTk5HY0VQJG3zAP6nWjlj
 6TrH4ikZxIXXaNkJjVfJwBDWLiv5M7ZNq4Z+VPHmpmZXNErbm9JwSlAa/0Cg3w+TlgEm
 Jhb2Qx5Sn8ZreIlfmce0oIo0VomAwgVsRADCz4zGV1H8mp9AYeneSfAV6h0T4sJ+V6Z6
 ROF1oIyjC0EbO+SS0n/2qPugjCJrNn8TJWs0Gn4rNIwnGSgDQa9nSCVcxStLkTvv4mDi
 /xgefGpJNq42pRY94EBU2+8DGOdDZJLorGF3WEkf/hghUlWFC11gz/TrEXvT/1PE8Be+
 AoAQ==
X-Gm-Message-State: AOAM530EK3Son5VFIIFSORPXC3Sae2J+jt8YYizXaTVpCk87vbzPWSWU
 xeMe8IbTDwzBrLnx81PfUay9UOKrZSTFMjkM+HWSRQ==
X-Google-Smtp-Source: ABdhPJwxNb/lAWuCSpPWVYdOGxltmDq5ohp1MtiWnEWh6V7JgIVJJeVRQmjjIZnfEte25gnnZ9+le+CYHSiKcU1WapY=
X-Received: by 2002:a17:906:c109:: with SMTP id
 do9mr4896004ejc.111.1639478872745; 
 Tue, 14 Dec 2021 02:47:52 -0800 (PST)
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
In-Reply-To: <10780d37-76eb-23bd-48e5-809ff3cd465e@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 14 Dec 2021 16:17:41 +0530
Message-ID: <CAMty3ZBDHs9JM9aZims97_Z213RWMUxcz_LUX_dZGeAYFE8Eew@mail.gmail.com>
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

On Mon, Dec 13, 2021 at 7:42 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 13.12.2021 14:56, Jagan Teki wrote:
> > On Mon, Dec 13, 2021 at 6:51 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 13.12.2021 13:31, Jagan Teki wrote:
> >>> On Mon, Dec 13, 2021 at 5:42 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 13.12.2021 13:08, Jagan Teki wrote:
> >>>>> On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 12.12.2021 19:14, Jagan Teki wrote:
> >>>>>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>>>>
> >>>>>>> Patch 1: panel checker
> >>>>>>>
> >>>>>>> Patch 2: panel_bridge API
> >>>>>>>
> >>>>>>> Patch 3: Bridge conversion
> >>>>>>>
> >>>>>>> Patch 4: pree_enable, post_disable
> >>>>>>>
> >>>>>>> Patch 5: Atomic functions
> >>>>>>>
> >>>>>>> Patch 6: atomic_set
> >>>>>>>
> >>>>>>> Patch 7: DSI init in enable
> >>>>>>>
> >>>>>>> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
> >>>>>>>
> >>>>>>> Any inputs?
> >>>>>> I've checked this patchset on Exynos based Trats2 board (the one with
> >>>>>> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
> >>>>>> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
> >>>>>> exynos: dsi: Use drm panel_bridge API"):
> >>>>>>
> >>>>>> # dmesg | grep drm
> >>>>>> [    2.511893] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> >>>>>> mapping operations
> >>>>>> [    2.518653] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> >>>>>> fimd_component_ops)
> >>>>>> [    2.535699] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> >>>>>> exynos_dsi_component_ops)
> >>>>>> [    2.543912] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> >>>>>> [    2.556107] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> >>>>>> minor 0
> >>>>>> [    2.573212] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach]
> >>>>>> *ERROR* failed to find the bridge: -19
> >>>>> Look like you have missed to apply the Child lookup patch. is it so?
> >>>>>
> >>>>> Let me send it, I will CC you as well. And I will also send tc358764
> >>>>> panel_bridge conversion.
> >>>> The above log is from Trats2 board, which uses only the s6e8aa0 DSI
> >>>> panel. I've also checked the Arndale board, which has tc358764 bridge
> >>>> and it also doesn't work. Which patches I have to apply for the tests?
> >>> [PATCH v2] drm: of: Lookup if child node has panel or bridge
> >>> [PATCH] drm: bridge: tc358764: Use drm panel_bridge API
> >> Ok, I've applied both. Still no success on Trats:
> >>
> >> [    2.451632] exynos4-fb 11c00000.fimd: Adding to iommu group 0
> >> [    2.458137] OF: graph: no port node found in /soc/fimd@11c00000
> >> [    2.476903] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> >> mapping operations
> >> [    2.483905] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> >> fimd_component_ops)
> >> [    2.490858] OF: graph: no port node found in /soc/dsi@11c80000
> >> [    2.500283] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> >> exynos_dsi_component_ops)
> >> [    2.508490] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> >> [    2.520121] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> >> minor 0
> >> [    2.537231] exynos-dsi 11c80000.dsi: [drm:exynos_dsi_host_attach]
> >> Attached s6e8aa0 device
> >> [    2.566358] ------------[ cut here ]------------
> >> [    2.569894] WARNING: CPU: 1 PID: 29 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    2.586123] Modules linked in:
> >> [    2.586171] CPU: 1 PID: 29 Comm: kworker/1:2 Not tainted
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    2.586190] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    2.586203] Workqueue: events output_poll_execute
> >> [    2.586235] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    2.586267] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    2.586299] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    2.586324] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    2.586346] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    2.586371] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    2.586398] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    2.586421] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    2.586453] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    2.586479] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> >> [    2.586505] [<c067e98c>] (drm_client_modeset_commit) from
> >> [<c06509c0>] (drm_fb_helper_set_par+0xb8/0xf8)
> >> [    2.586535] [<c06509c0>] (drm_fb_helper_set_par) from [<c0650aa8>]
> >> (drm_fb_helper_hotplug_event.part.0+0xa8/0xc0)
> >> [    2.586560] [<c0650aa8>] (drm_fb_helper_hotplug_event.part.0) from
> >> [<c063ab40>] (output_poll_execute+0xac/0x21c)
> >> [    2.586585] [<c063ab40>] (output_poll_execute) from [<c01470ec>]
> >> (process_one_work+0x288/0x7a4)
> >> [    2.586611] [<c01470ec>] (process_one_work) from [<c014764c>]
> >> (worker_thread+0x44/0x534)
> >> [    2.586633] [<c014764c>] (worker_thread) from [<c01500ac>]
> >> (kthread+0x158/0x190)
> >> [    2.586655] [<c01500ac>] (kthread) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    2.586675] Exception stack(0xc1f6ffb0 to 0xc1f6fff8)
> >> [    2.586690] ffa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    2.586705] ffc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    2.586720] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    2.586734] irq event stamp: 449
> >> [    2.586749] hardirqs last  enabled at (455): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    2.586780] hardirqs last disabled at (460): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    2.586804] softirqs last  enabled at (430): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    2.586829] softirqs last disabled at (425): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    2.586902] ---[ end trace e6002ef7c126805b ]---
> >> [    2.587418] ------------[ cut here ]------------
> >> [    2.587452] WARNING: CPU: 1 PID: 1 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    2.587485] Modules linked in:
> >> [    2.587518] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G W
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    2.587535] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    2.587548] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    2.587576] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    2.587605] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    2.587628] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    2.587650] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    2.587676] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    2.587700] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    2.587724] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    2.587751] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    2.587778] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> >> [    2.587804] [<c067e98c>] (drm_client_modeset_commit) from
> >> [<c06509c0>] (drm_fb_helper_set_par+0xb8/0xf8)
> >> [    2.587831] [<c06509c0>] (drm_fb_helper_set_par) from [<c05b86d0>]
> >> (fbcon_init+0x2c0/0x518)
> >> [    2.587858] [<c05b86d0>] (fbcon_init) from [<c060636c>]
> >> (visual_init+0xc0/0x108)
> >> [    2.587888] [<c060636c>] (visual_init) from [<c06085e4>]
> >> (do_bind_con_driver+0x1b8/0x3a4)
> >> [    2.587915] [<c06085e4>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    2.587942] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    2.587968] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    2.588001] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    2.588028] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    2.588053] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    2.588088] [<c068f668>] (exynos_dsi_host_attach) from [<c0699354>]
> >> (s6e8aa0_probe+0x1b4/0x218)
> >> [    2.588117] [<c0699354>] (s6e8aa0_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    2.588147] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    2.588172] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    2.588197] [<c06b79f8>] (driver_probe_device) from [<c06b819c>]
> >> (__driver_attach+0xf0/0x1d4)
> >> [    2.588222] [<c06b819c>] (__driver_attach) from [<c06b5164>]
> >> (bus_for_each_dev+0x70/0xb0)
> >> [    2.588246] [<c06b5164>] (bus_for_each_dev) from [<c06b65ec>]
> >> (bus_add_driver+0x170/0x20c)
> >> [    2.588270] [<c06b65ec>] (bus_add_driver) from [<c06b8c08>]
> >> (driver_register+0x88/0x118)
> >> [    2.588294] [<c06b8c08>] (driver_register) from [<c01021e8>]
> >> (do_one_initcall+0x64/0x380)
> >> [    2.588320] [<c01021e8>] (do_one_initcall) from [<c110123c>]
> >> (kernel_init_freeable+0x1c0/0x224)
> >> [    2.588353] [<c110123c>] (kernel_init_freeable) from [<c0b6ba54>]
> >> (kernel_init+0x18/0x12c)
> >> [    2.588380] [<c0b6ba54>] (kernel_init) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    2.588401] Exception stack(0xc1cb5fb0 to 0xc1cb5ff8)
> >> [    2.588416] 5fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    2.588432] 5fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    2.588446] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    2.588460] irq event stamp: 175387
> >> [    2.588477] hardirqs last  enabled at (175393): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    2.588506] hardirqs last disabled at (175398): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    2.588531] softirqs last  enabled at (171796): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    2.588555] softirqs last disabled at (171781): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    2.588581] ---[ end trace e6002ef7c126805c ]---
> >> [    2.588971] ------------[ cut here ]------------
> >> [    2.588989] WARNING: CPU: 1 PID: 1 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    2.589022] Modules linked in:
> >> [    2.589053] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G W
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    2.589072] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    2.589085] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    2.589113] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    2.589140] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    2.589165] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    2.589187] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    2.589212] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    2.589237] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    2.589260] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    2.589288] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    2.589314] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c064fe38>] (drm_fb_helper_pan_display+0x98/0x1c0)
> >> [    2.589342] [<c064fe38>] (drm_fb_helper_pan_display) from
> >> [<c05b024c>] (fb_pan_display+0x9c/0x114)
> >> [    2.589372] [<c05b024c>] (fb_pan_display) from [<c05bac24>]
> >> (bit_update_start+0x14/0x30)
> >> [    2.589398] [<c05bac24>] (bit_update_start) from [<c05b9e58>]
> >> (fbcon_switch+0x2ec/0x454)
> >> [    2.589422] [<c05b9e58>] (fbcon_switch) from [<c0606fe0>]
> >> (redraw_screen+0xdc/0x230)
> >> [    2.589448] [<c0606fe0>] (redraw_screen) from [<c05b795c>]
> >> (fbcon_prepare_logo+0x38c/0x450)
> >> [    2.589472] [<c05b795c>] (fbcon_prepare_logo) from [<c05b883c>]
> >> (fbcon_init+0x42c/0x518)
> >> [    2.589495] [<c05b883c>] (fbcon_init) from [<c060636c>]
> >> (visual_init+0xc0/0x108)
> >> [    2.589518] [<c060636c>] (visual_init) from [<c06085e4>]
> >> (do_bind_con_driver+0x1b8/0x3a4)
> >> [    2.589544] [<c06085e4>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    2.589571] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    2.589596] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    2.589622] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    2.589649] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    2.589675] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    2.589704] [<c068f668>] (exynos_dsi_host_attach) from [<c0699354>]
> >> (s6e8aa0_probe+0x1b4/0x218)
> >> [    2.589731] [<c0699354>] (s6e8aa0_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    2.589758] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    2.589783] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    2.589808] [<c06b79f8>] (driver_probe_device) from [<c06b819c>]
> >> (__driver_attach+0xf0/0x1d4)
> >> [    2.589832] [<c06b819c>] (__driver_attach) from [<c06b5164>]
> >> (bus_for_each_dev+0x70/0xb0)
> >> [    2.589856] [<c06b5164>] (bus_for_each_dev) from [<c06b65ec>]
> >> (bus_add_driver+0x170/0x20c)
> >> [    2.589879] [<c06b65ec>] (bus_add_driver) from [<c06b8c08>]
> >> (driver_register+0x88/0x118)
> >> [    2.589904] [<c06b8c08>] (driver_register) from [<c01021e8>]
> >> (do_one_initcall+0x64/0x380)
> >> [    2.589929] [<c01021e8>] (do_one_initcall) from [<c110123c>]
> >> (kernel_init_freeable+0x1c0/0x224)
> >> [    2.589956] [<c110123c>] (kernel_init_freeable) from [<c0b6ba54>]
> >> (kernel_init+0x18/0x12c)
> >> [    2.589982] [<c0b6ba54>] (kernel_init) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    2.590002] Exception stack(0xc1cb5fb0 to 0xc1cb5ff8)
> >> [    2.590017] 5fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    2.590033] 5fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    2.590047] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    2.590061] irq event stamp: 175453
> >> [    2.590079] hardirqs last  enabled at (175459): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    2.590107] hardirqs last disabled at (175464): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    2.590132] softirqs last  enabled at (171796): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    2.590156] softirqs last disabled at (171781): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    2.590183] ---[ end trace e6002ef7c126805d ]---
> >> [    2.609799] Console: switching to colour frame buffer device 102x91
> >> [    2.610039] ------------[ cut here ]------------
> >> [    2.610057] WARNING: CPU: 1 PID: 1 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    2.610090] Modules linked in:
> >> [    2.610122] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G W
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    2.610140] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    2.610153] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    2.610180] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    2.610208] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    2.610231] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    2.610254] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    2.610279] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    2.610305] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    2.610327] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    2.610355] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    2.610382] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c064fe38>] (drm_fb_helper_pan_display+0x98/0x1c0)
> >> [    2.610410] [<c064fe38>] (drm_fb_helper_pan_display) from
> >> [<c05b024c>] (fb_pan_display+0x9c/0x114)
> >> [    2.610439] [<c05b024c>] (fb_pan_display) from [<c05bac24>]
> >> (bit_update_start+0x14/0x30)
> >> [    2.610465] [<c05bac24>] (bit_update_start) from [<c05b9e58>]
> >> (fbcon_switch+0x2ec/0x454)
> >> [    2.610489] [<c05b9e58>] (fbcon_switch) from [<c0606fe0>]
> >> (redraw_screen+0xdc/0x230)
> >> [    2.610515] [<c0606fe0>] (redraw_screen) from [<c0608708>]
> >> (do_bind_con_driver+0x2dc/0x3a4)
> >> [    2.610543] [<c0608708>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    2.610570] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    2.610595] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    2.610621] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    2.610649] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    2.610674] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    2.610703] [<c068f668>] (exynos_dsi_host_attach) from [<c0699354>]
> >> (s6e8aa0_probe+0x1b4/0x218)
> >> [    2.610730] [<c0699354>] (s6e8aa0_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    2.610756] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    2.610782] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    2.610807] [<c06b79f8>] (driver_probe_device) from [<c06b819c>]
> >> (__driver_attach+0xf0/0x1d4)
> >> [    2.610832] [<c06b819c>] (__driver_attach) from [<c06b5164>]
> >> (bus_for_each_dev+0x70/0xb0)
> >> [    2.610856] [<c06b5164>] (bus_for_each_dev) from [<c06b65ec>]
> >> (bus_add_driver+0x170/0x20c)
> >> [    2.610880] [<c06b65ec>] (bus_add_driver) from [<c06b8c08>]
> >> (driver_register+0x88/0x118)
> >> [    2.610904] [<c06b8c08>] (driver_register) from [<c01021e8>]
> >> (do_one_initcall+0x64/0x380)
> >> [    2.610929] [<c01021e8>] (do_one_initcall) from [<c110123c>]
> >> (kernel_init_freeable+0x1c0/0x224)
> >> [    2.610956] [<c110123c>] (kernel_init_freeable) from [<c0b6ba54>]
> >> (kernel_init+0x18/0x12c)
> >> [    2.610982] [<c0b6ba54>] (kernel_init) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    2.611002] Exception stack(0xc1cb5fb0 to 0xc1cb5ff8)
> >> [    2.611017] 5fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    2.611033] 5fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    2.611047] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    2.611062] irq event stamp: 175539
> >> [    2.611079] hardirqs last  enabled at (175545): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    2.611108] hardirqs last disabled at (175550): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    2.611134] softirqs last  enabled at (171796): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    2.611158] softirqs last disabled at (171781): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    2.611185] ---[ end trace e6002ef7c126805e ]---
> >> [    6.173152] exynos-drm exynos-drm: [drm] fb0: exynos frame buffer device
> >>
> >> After the 2nd patch ("[PATCH v3 2/7] drm: exynos: dsi: Use drm
> >> panel_bridge API") the display stops working.
> >>
> >> Here is the log from Arndale board (which also doesn't work after the
> >> 2nd path):
> >>
> >> [    3.739197] OF: graph: no port node found in /soc/hdmi@14530000
> >> [    3.747930] [drm] Exynos DRM: using 14400000.fimd device for DMA
> >> mapping operations
> >> [    3.754385] exynos-drm exynos-drm: bound 14400000.fimd (ops
> >> fimd_component_ops)
> >> [    3.762985] exynos-drm exynos-drm: bound 14450000.mixer (ops
> >> mixer_component_ops)
> >> [    3.769332] OF: graph: no port node found in /soc/dsi@14500000
> >> [    3.779055] exynos-drm exynos-drm: bound 14500000.dsi (ops
> >> exynos_dsi_component_ops)
> >> [    3.785997] exynos-drm exynos-drm: bound 14530000.hdmi (ops
> >> hdmi_component_ops)
> >> [    3.795431] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> >> [    3.801975] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> >> [    3.811501] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> >> minor 0
> >> [    3.818349] usb 1-3: New USB device found, idVendor=0424,
> >> idProduct=3503, bcdDevice=a1.a0
> >> [    3.825602] usb 1-3: New USB device strings: Mfr=0, Product=0,
> >> SerialNumber=0
> >> [    3.833782] panfrost 11800000.gpu: clock rate = 533000000
> >> [    3.835556] hub 1-3:1.0: USB hub found
> >> [    3.842054] hub 1-3:1.0: 3 ports detected
> >> [    3.861628] panfrost 11800000.gpu: mali-t600 id 0x600 major 0x0 minor
> >> 0x0 status 0x1
> >> [    3.868077] panfrost 11800000.gpu: features: 00000000,10206000,
> >> issues: 00000000,31b4dfff
> >> [    3.876202] panfrost 11800000.gpu: Features: L2:0x07110206
> >> Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xf JS:0x7
> >> [    3.887853] panfrost 11800000.gpu: shader_present=0xf l2_present=0x1
> >> [    3.897532] [drm] Initialized panfrost 1.2.0 20180908 for
> >> 11800000.gpu on minor 1
> >> [    3.919339] wm8994 3-001a: WM1811 revision D CUST_ID 00
> >> [    3.933753] wm8994 3-001a: No interrupt specified, no interrupts
> >> [    4.111656] exynos-dsi 14500000.dsi: [drm:exynos_dsi_host_attach]
> >> Attached tc358764 device
> >> [    4.125346] ------------[ cut here ]------------
> >> [    4.125392] WARNING: CPU: 1 PID: 7 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    4.125412] Modules linked in:
> >> [    4.125428] CPU: 1 PID: 7 Comm: kworker/u4:0 Not tainted
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    4.125438] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    4.125444] Workqueue: events_unbound deferred_probe_work_func
> >> [    4.125461] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    4.125477] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    4.125492] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    4.125505] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    4.125515] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    4.125527] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    4.125538] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    4.125549] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    4.125562] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    4.125575] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> >> [    4.125588] [<c067e98c>] (drm_client_modeset_commit) from
> >> [<c06509c0>] (drm_fb_helper_set_par+0xb8/0xf8)
> >> [    4.125603] [<c06509c0>] (drm_fb_helper_set_par) from [<c05b86d0>]
> >> (fbcon_init+0x2c0/0x518)
> >> [    4.125615] [<c05b86d0>] (fbcon_init) from [<c060636c>]
> >> (visual_init+0xc0/0x108)
> >> [    4.125628] [<c060636c>] (visual_init) from [<c06085e4>]
> >> (do_bind_con_driver+0x1b8/0x3a4)
> >> [    4.125641] [<c06085e4>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    4.125654] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    4.125666] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    4.125682] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    4.125695] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    4.125708] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    4.125722] [<c068f668>] (exynos_dsi_host_attach) from [<c069cef8>]
> >> (tc358764_probe+0xe8/0x15c)
> >> [    4.125736] [<c069cef8>] (tc358764_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    4.125747] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    4.125759] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    4.125771] [<c06b79f8>] (driver_probe_device) from [<c06b8034>]
> >> (__device_attach_driver+0xa4/0x11c)
> >> [    4.125784] [<c06b8034>] (__device_attach_driver) from [<c06b5220>]
> >> (bus_for_each_drv+0x7c/0xc0)
> >> [    4.125796] [<c06b5220>] (bus_for_each_drv) from [<c06b7cd8>]
> >> (__device_attach+0xc8/0x1d0)
> >> [    4.125807] [<c06b7cd8>] (__device_attach) from [<c06b6338>]
> >> (bus_probe_device+0x88/0x90)
> >> [    4.125818] [<c06b6338>] (bus_probe_device) from [<c06b6834>]
> >> (deferred_probe_work_func+0x98/0xe0)
> >> [    4.125830] [<c06b6834>] (deferred_probe_work_func) from [<c01470ec>]
> >> (process_one_work+0x288/0x7a4)
> >> [    4.125843] [<c01470ec>] (process_one_work) from [<c014764c>]
> >> (worker_thread+0x44/0x534)
> >> [    4.125853] [<c014764c>] (worker_thread) from [<c01500ac>]
> >> (kthread+0x158/0x190)
> >> [    4.125863] [<c01500ac>] (kthread) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    4.125872] Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
> >> [    4.125879] 1fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    4.125886] 1fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    4.125893] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    4.125900] irq event stamp: 18917
> >> [    4.125908] hardirqs last  enabled at (18923): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    4.125922] hardirqs last disabled at (18928): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    4.125934] softirqs last  enabled at (18882): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    4.125945] softirqs last disabled at (18877): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    4.125957] ---[ end trace ab5bb577f0c45837 ]---
> >> [    4.126167] ------------[ cut here ]------------
> >> [    4.126175] WARNING: CPU: 1 PID: 7 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    4.126190] Modules linked in:
> >> [    4.126205] CPU: 1 PID: 7 Comm: kworker/u4:0 Tainted: G W
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    4.126213] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    4.126219] Workqueue: events_unbound deferred_probe_work_func
> >> [    4.126232] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    4.126245] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    4.126258] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    4.126269] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    4.126279] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    4.126290] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    4.126301] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    4.126310] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    4.126323] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    4.126336] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c064fe38>] (drm_fb_helper_pan_display+0x98/0x1c0)
> >> [    4.126349] [<c064fe38>] (drm_fb_helper_pan_display) from
> >> [<c05b024c>] (fb_pan_display+0x9c/0x114)
> >> [    4.126362] [<c05b024c>] (fb_pan_display) from [<c05bac24>]
> >> (bit_update_start+0x14/0x30)
> >> [    4.126375] [<c05bac24>] (bit_update_start) from [<c05b9e58>]
> >> (fbcon_switch+0x2ec/0x454)
> >> [    4.126385] [<c05b9e58>] (fbcon_switch) from [<c0606fe0>]
> >> (redraw_screen+0xdc/0x230)
> >> [    4.126397] [<c0606fe0>] (redraw_screen) from [<c05b795c>]
> >> (fbcon_prepare_logo+0x38c/0x450)
> >> [    4.126408] [<c05b795c>] (fbcon_prepare_logo) from [<c05b883c>]
> >> (fbcon_init+0x42c/0x518)
> >> [    4.126419] [<c05b883c>] (fbcon_init) from [<c060636c>]
> >> (visual_init+0xc0/0x108)
> >> [    4.126430] [<c060636c>] (visual_init) from [<c06085e4>]
> >> (do_bind_con_driver+0x1b8/0x3a4)
> >> [    4.126442] [<c06085e4>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    4.126455] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    4.126466] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    4.126478] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    4.126491] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    4.126503] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    4.126516] [<c068f668>] (exynos_dsi_host_attach) from [<c069cef8>]
> >> (tc358764_probe+0xe8/0x15c)
> >> [    4.126528] [<c069cef8>] (tc358764_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    4.126540] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    4.126552] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    4.126564] [<c06b79f8>] (driver_probe_device) from [<c06b8034>]
> >> (__device_attach_driver+0xa4/0x11c)
> >> [    4.126577] [<c06b8034>] (__device_attach_driver) from [<c06b5220>]
> >> (bus_for_each_drv+0x7c/0xc0)
> >> [    4.126589] [<c06b5220>] (bus_for_each_drv) from [<c06b7cd8>]
> >> (__device_attach+0xc8/0x1d0)
> >> [    4.126600] [<c06b7cd8>] (__device_attach) from [<c06b6338>]
> >> (bus_probe_device+0x88/0x90)
> >> [    4.126611] [<c06b6338>] (bus_probe_device) from [<c06b6834>]
> >> (deferred_probe_work_func+0x98/0xe0)
> >> [    4.126623] [<c06b6834>] (deferred_probe_work_func) from [<c01470ec>]
> >> (process_one_work+0x288/0x7a4)
> >> [    4.126634] [<c01470ec>] (process_one_work) from [<c014764c>]
> >> (worker_thread+0x44/0x534)
> >> [    4.126644] [<c014764c>] (worker_thread) from [<c01500ac>]
> >> (kthread+0x158/0x190)
> >> [    4.126654] [<c01500ac>] (kthread) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    4.126663] Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
> >> [    4.126670] 1fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    4.126676] 1fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    4.126683] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    4.126689] irq event stamp: 19009
> >> [    4.126697] hardirqs last  enabled at (19015): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    4.126709] hardirqs last disabled at (19020): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    4.126721] softirqs last  enabled at (18882): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    4.126731] softirqs last disabled at (18877): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    4.126743] ---[ end trace ab5bb577f0c45838 ]---
> >> [    4.129425] Console: switching to colour frame buffer device 146x42
> >> [    4.129562] ------------[ cut here ]------------
> >> [    4.129570] WARNING: CPU: 1 PID: 7 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [    4.129585] Modules linked in:
> >> [    4.129599] CPU: 1 PID: 7 Comm: kworker/u4:0 Tainted: G W
> >> 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> >> [    4.129607] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [    4.129613] Workqueue: events_unbound deferred_probe_work_func
> >> [    4.129626] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [    4.129639] [<c010c618>] (show_stack) from [<c0b657d4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [    4.129651] [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [    4.129663] [<c01261dc>] (__warn) from [<c0b5f628>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [    4.129673] [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [    4.129684] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [    4.129695] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [    4.129704] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [    4.129716] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [    4.129729] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c064fe38>] (drm_fb_helper_pan_display+0x98/0x1c0)
> >> [    4.129742] [<c064fe38>] (drm_fb_helper_pan_display) from
> >> [<c05b024c>] (fb_pan_display+0x9c/0x114)
> >> [    4.129755] [<c05b024c>] (fb_pan_display) from [<c05bac24>]
> >> (bit_update_start+0x14/0x30)
> >> [    4.129767] [<c05bac24>] (bit_update_start) from [<c05b9e58>]
> >> (fbcon_switch+0x2ec/0x454)
> >> [    4.129778] [<c05b9e58>] (fbcon_switch) from [<c0606fe0>]
> >> (redraw_screen+0xdc/0x230)
> >> [    4.129790] [<c0606fe0>] (redraw_screen) from [<c0608708>]
> >> (do_bind_con_driver+0x2dc/0x3a4)
> >> [    4.129802] [<c0608708>] (do_bind_con_driver) from [<c0608b40>]
> >> (do_take_over_console+0x13c/0x1e8)
> >> [    4.129815] [<c0608b40>] (do_take_over_console) from [<c05b6854>]
> >> (do_fbcon_takeover+0x78/0xd8)
> >> [    4.129827] [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>]
> >> (register_framebuffer+0x208/0x2e0)
> >> [    4.129839] [<c05b1154>] (register_framebuffer) from [<c064ead0>]
> >> (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> >> [    4.129852] [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock)
> >> from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> >> [    4.129863] [<c063a718>] (drm_kms_helper_hotplug_event) from
> >> [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> >> [    4.129876] [<c068f668>] (exynos_dsi_host_attach) from [<c069cef8>]
> >> (tc358764_probe+0xe8/0x15c)
> >> [    4.129888] [<c069cef8>] (tc358764_probe) from [<c06b7414>]
> >> (really_probe+0xd8/0x484)
> >> [    4.129900] [<c06b7414>] (really_probe) from [<c06b7860>]
> >> (__driver_probe_device+0xa0/0x204)
> >> [    4.129912] [<c06b7860>] (__driver_probe_device) from [<c06b79f8>]
> >> (driver_probe_device+0x34/0xc4)
> >> [    4.129924] [<c06b79f8>] (driver_probe_device) from [<c06b8034>]
> >> (__device_attach_driver+0xa4/0x11c)
> >> [    4.129936] [<c06b8034>] (__device_attach_driver) from [<c06b5220>]
> >> (bus_for_each_drv+0x7c/0xc0)
> >> [    4.129948] [<c06b5220>] (bus_for_each_drv) from [<c06b7cd8>]
> >> (__device_attach+0xc8/0x1d0)
> >> [    4.129960] [<c06b7cd8>] (__device_attach) from [<c06b6338>]
> >> (bus_probe_device+0x88/0x90)
> >> [    4.129971] [<c06b6338>] (bus_probe_device) from [<c06b6834>]
> >> (deferred_probe_work_func+0x98/0xe0)
> >> [    4.129983] [<c06b6834>] (deferred_probe_work_func) from [<c01470ec>]
> >> (process_one_work+0x288/0x7a4)
> >> [    4.129995] [<c01470ec>] (process_one_work) from [<c014764c>]
> >> (worker_thread+0x44/0x534)
> >> [    4.130005] [<c014764c>] (worker_thread) from [<c01500ac>]
> >> (kthread+0x158/0x190)
> >> [    4.130014] [<c01500ac>] (kthread) from [<c0100108>]
> >> (ret_from_fork+0x14/0x2c)
> >> [    4.130023] Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
> >> [    4.130030] 1fa0:                                     00000000
> >> 00000000 00000000 00000000
> >> [    4.130037] 1fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000000 00000000
> >> [    4.130043] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [    4.130049] irq event stamp: 19103
> >> [    4.130057] hardirqs last  enabled at (19109): [<c01a0acc>]
> >> vprintk_emit+0x2ac/0x2d0
> >> [    4.130069] hardirqs last disabled at (19114): [<c01a0a88>]
> >> vprintk_emit+0x268/0x2d0
> >> [    4.130081] softirqs last  enabled at (18882): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [    4.130091] softirqs last disabled at (18877): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [    4.130103] ---[ end trace ab5bb577f0c45839 ]---
> >> [    4.175229] usb 1-3.2: new high-speed USB device number 3 using
> >> exynos-ehci
> >> [    4.179270] exynos-drm exynos-drm: [drm] fb0: exynos frame buffer device
> >>
> >> There is something seriously broken with connector setup (Arndale board):
> >>
> >> # ./modetest -C -Mexynos
> >> [   37.803987] ------------[ cut here ]------------
> >> [   37.807883] WARNING: CPU: 1 PID: 1296 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [   37.819952] Modules linked in: s5p_mfc exynos_gsc v4l2_mem2mem
> >> videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
> >> videodev mc
> >> [   37.832906] CPU: 1 PID: 1296 Comm: modetest Tainted: G W
> >> 5.16.0-rc1-00004-gd0885f6a52ee #11059
> >> [   37.842588] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [   37.848667] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [   37.856390] [<c010c618>] (show_stack) from [<c0b658a4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [   37.863942] [<c0b658a4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [   37.871233] [<c01261dc>] (__warn) from [<c0b5f6f8>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [   37.878697] [<c0b5f6f8>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [   37.889374] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [   37.901265] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [   37.912115] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [   37.923139] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [   37.934248] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> >> [   37.944665] [<c067e98c>] (drm_client_modeset_commit) from
> >> [<c0650c00>] (drm_fb_helper_lastclose+0x4c/0x84)
> >> [   37.954300] [<c0650c00>] (drm_fb_helper_lastclose) from [<c0652b7c>]
> >> (drm_release+0x114/0x14c)
> >> [   37.962893] [<c0652b7c>] (drm_release) from [<c02dc400>]
> >> (__fput+0x88/0x258)
> >> [   37.969924] [<c02dc400>] (__fput) from [<c014cd44>]
> >> (task_work_run+0x8c/0xc8)
> >> [   37.977041] [<c014cd44>] (task_work_run) from [<c010c08c>]
> >> (do_work_pending+0x4a4/0x598)
> >> [   37.985114] [<c010c08c>] (do_work_pending) from [<c0100088>]
> >> (slow_work_pending+0xc/0x20)
> >> [   37.993272] Exception stack(0xc3577fb0 to 0xc3577ff8)
> >> [   37.998309] 7fa0:                                     00000000
> >> 0000001f 85024200 00000000
> >> [   38.006469] 7fc0: 00000001 00000003 00000000 00000006 00022188
> >> 00000000 b6f6c000 00000000
> >> [   38.014628] 7fe0: b6e6daa0 bec90a98 0000e7c4 b6e6dac0 60000010 00000003
> >> [   38.021474] irq event stamp: 3541
> >> [   38.024718] hardirqs last  enabled at (3553): [<c01598ec>]
> >> finish_task_switch+0x110/0x368
> >> [   38.032840] hardirqs last disabled at (3564): [<c0b6cc7c>]
> >> __schedule+0x4e4/0xa6c
> >> [   38.040321] softirqs last  enabled at (3580): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [   38.048072] softirqs last disabled at (3573): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [   38.055797] ---[ end trace cfeb2d6c6e65009a ]---
> >> could not get connector 62: N[   38.062741] ------------[ cut here
> >> ]------------
> >> [   38.067551] WARNING: CPU: 0 PID: 1296 at
> >> drivers/gpu/drm/drm_atomic_state_helper.c:494
> >> drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> >> [   38.080014] Modules linked in: s5p_mfc exynos_gsc v4l2_mem2mem
> >> videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
> >> videodev mc
> >> [   38.092947] CPU: 0 PID: 1296 Comm: modetest Tainted: G W
> >> 5.16.0-rc1-00004-gd0885f6a52ee #11059
> >> [   38.102727] Hardware name: Samsung Exynos (Flattened Device Tree)
> >> [   38.108806] [<c0110b30>] (unwind_backtrace) from [<c010c618>]
> >> (show_stack+0x10/0x14)
> >> [   38.116529] [<c010c618>] (show_stack) from [<c0b658a4>]
> >> (dump_stack_lvl+0x58/0x70)
> >> [   38.124081] [<c0b658a4>] (dump_stack_lvl) from [<c01261dc>]
> >> (__warn+0xd0/0x134)
> >> [   38.131373] [<c01261dc>] (__warn) from [<c0b5f6f8>]
> >> (warn_slowpath_fmt+0x5c/0xb4)
> >> [   38.138837] [<c0b5f6f8>] (warn_slowpath_fmt) from [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> >> [   38.149514] [<c064bce4>]
> >> (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>]
> >> (drm_atomic_get_connector_state+0xd4/0x190)
> >> [   38.161405] [<c0666b64>] (drm_atomic_get_connector_state) from
> >> [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> >> [   38.172255] [<c0667928>] (__drm_atomic_helper_set_config) from
> >> [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> >> [   38.183279] [<c067e628>] (drm_client_modeset_commit_atomic) from
> >> [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> >> [   38.194388] [<c067e800>] (drm_client_modeset_commit_locked) from
> >> [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> >> [   38.204804] [<c067e98c>] (drm_client_modeset_commit) from
> >> [<c0650c00>] (drm_fb_helper_lastclose+0x4c/0x84)
> >> [   38.214439] [<c0650c00>] (drm_fb_helper_lastclose) from [<c0652b7c>]
> >> (drm_release+0x114/0x14c)
> >> [   38.223032] [<c0652b7c>] (drm_release) from [<c02dc400>]
> >> (__fput+0x88/0x258)
> >> [   38.230063] [<c02dc400>] (__fput) from [<c014cd44>]
> >> (task_work_run+0x8c/0xc8)
> >> [   38.234727] dwmmc_exynos 12200000.mmc: Unexpected interrupt latency
> >> [   38.237178] [<c014cd44>] (task_work_run) from [<c012b5ac>]
> >> (do_exit+0x390/0xaf0)
> >> [   38.250809] [<c012b5ac>] (do_exit) from [<c012d040>]
> >> (do_group_exit+0x2c/0xa0)
> >> [   38.258013] [<c012d040>] (do_group_exit) from [<c013b8f4>]
> >> (get_signal+0x140/0xab8)
> >> [   38.265651] [<c013b8f4>] (get_signal) from [<c010bd0c>]
> >> (do_work_pending+0x124/0x598)
> >> [   38.273463] [<c010bd0c>] (do_work_pending) from [<c0100088>]
> >> (slow_work_pending+0xc/0x20)
> >> [   38.281622] Exception stack(0xc3577fb0 to 0xc3577ff8)
> >> [   38.286659] 7fa0:                                     00000008
> >> 0000005f 00000002 00023388
> >> [   38.294819] 7fc0: 00000001 000232a8 00000000 00023398 0000003e
> >> 00000000 00023360 00000000
> >> [   38.302978] 7fe0: 00023590 bec90ae8 00009ec0 00009e9c 80000010 ffffffff
> >> [   38.310025] irq event stamp: 4059
> >> [   38.312910] hardirqs last  enabled at (4069): [<c019d7f4>]
> >> __up_console_sem+0x50/0x60
> >> [   38.320780] hardirqs last disabled at (4078): [<c019d7e0>]
> >> __up_console_sem+0x3c/0x60
> >> [   38.328617] softirqs last  enabled at (4054): [<c0101578>]
> >> __do_softirq+0x348/0x610
> >> [   38.336222] softirqs last disabled at (4013): [<c012e7a4>]
> >> __irq_exit_rcu+0x144/0x1ec
> >> [   38.343942] ---[ end trace cfeb2d6c6e65009b ]---
> >> o such file or directory
> >> Segmentation fault
> > Thanks for testing it.
> >
> > Can you test it on the downstream bridge, tc358764 and post the result?
>
> There were 2 logs in my reply. One from trats2 board (just dsi panel)
> and one from arndale (tc bridge + simple panel).

Okay. Got it.

Can you test this tc358764 panel_bridge patch on linux-next? don't
apply this series, apply only below patch and test.

https://patchwork.amarulasolutions.com/patch/1824/

Thanks,
Jagan.
