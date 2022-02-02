Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18C4A75B5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568AB10E33E;
	Wed,  2 Feb 2022 16:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05BB10E33E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:25:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id l5so43039938edv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOa5Rb2ZvC1dIedlvLZrATHZKl4AYv5UzwkQJUPeHpY=;
 b=otAufSPKHVCa+PACYDQejU/uvSrClRTRMQnPoQDVsUIJKwBE6sSh9GjJp3h4Dd8I/5
 Nj3lvrFg3KcL8gzOMqoqRKW6k/dLo+0c2QMilUlEHAYX4Tg1VxDWksxUV6DDWamP0gZX
 IX4ja/ZrQu4jXvOzdgIcjhBzmhyfd4wU8ktFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOa5Rb2ZvC1dIedlvLZrATHZKl4AYv5UzwkQJUPeHpY=;
 b=jejrhnlXRfP9EaL89SjVrv5A/C54D72UakyJNgPyO41J78hjJ4yAVXbSjkzwQexYKR
 d6OljscU6BI6NskN7CrR++VyvVMqS6xlXU3VbEp8sKfklOJAy8pDFuoN9aPPZtK62Z2S
 rU3NFBrQXngo3YdEHVP0oAf/47L5nkIPWORlFo/ChyiEFZOBeg+IWAH3RBnx9NF/PMqF
 FUJdPvX5ojf5olKjY274AdTVD7DDiy0H18qkKXrQjP4nx/QQAigw3j4AJRNnkHR/2dlX
 LDyPuzGvRWZeTO4B7qg/v2v1ere4NU8wWUjyiy+S9JeasrGCS7xL476CEFxLdBctFa9E
 2Ovw==
X-Gm-Message-State: AOAM533Fn+w5iMh8bEyPSaREz/+arPoop8iZ9jsqMspLOj1saXf2UZac
 PYPtb54eKQcp+kmiWf/m/fAm5SAKPJTw2w60hMEDJA==
X-Google-Smtp-Source: ABdhPJynADS1Ba9Znw78UYt3lWZkQV8wMbLemVptcv2mvLXX7uN063W4/oLbA3TWugMv58T+QR1fCk7hzUIseuXno+U=
X-Received: by 2002:a05:6402:40c8:: with SMTP id
 z8mr31421529edb.94.1643819109033; 
 Wed, 02 Feb 2022 08:25:09 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220117084237eucas1p10169f6fd49d0784db0cba4606fd5c6bb@eucas1p1.samsung.com>
 <20220117084225.125868-1-jagan@amarulasolutions.com>
 <ea77747c-3310-5460-316c-a88042083e98@samsung.com>
 <CAMty3ZCToKx_NrHDrtKqa35EkNAXiMU_AyeGy6703r6z4PXPYg@mail.gmail.com>
 <8fba6394-f849-54c5-7e27-7338f6ed3552@samsung.com>
In-Reply-To: <8fba6394-f849-54c5-7e27-7338f6ed3552@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 2 Feb 2022 21:54:57 +0530
Message-ID: <CAMty3ZCjqMoQjoNNzBTL1YSQoY8uDrd0OE+zFM0je-6eLLieEA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] drm: exynos: dsi: Convert drm bridge
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

On Fri, Jan 21, 2022 at 6:14 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 21.01.2022 12:40, Jagan Teki wrote:
> > On Fri, Jan 21, 2022 at 5:06 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 17.01.2022 09:42, Jagan Teki wrote:
> >>> Updated series about drm bridge conversion of exynos dsi.
> >>>
> >>> Previous version can be accessible, here [1].
> >>>
> >>> Patch 1: connector reset
> >>>
> >>> Patch 2: panel_bridge API
> >>>
> >>> Patch 3: bridge conversion
> >>>
> >>> Patch 4: atomic functions
> >>>
> >>> Patch 5: DSI init in pre_enable
> >>>
> >>> Apply below patches to test on Exynos DSI:
> >>> - https://protect2.fireeye.com/v1/url?k=53bdf119-0c26c815-53bc7a56-000babff3563-792dc1a6b54db43e&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> >>> - https://protect2.fireeye.com/v1/url?k=cb269ea3-94bda7af-cb2715ec-000babff3563-e6f545b4a32558ba&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1838%2F
> >>>
> >>> [1] https://protect2.fireeye.com/v1/url?k=ee1dae12-b186971e-ee1c255d-000babff3563-83eaf8e86e67e0d9&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fcover%2F1826%2F
> >>>
> >>> Any inputs?
> >> I've tried a few times, but I am unable to find what is the base for
> >> this patchset. I always get a conflict around exynos_dsi_mode_set()
> >> function. I've tried current linux-next, drm-next, v5.16-rc1 and v5.16.
> >> It looks that I must have missed applying some patch before playing with
> >> this.
> >>
> >> I've also tried to apply only the last patch, as if I got it right, it
> >> is the only difference between v4 and v5 and updated 'drm: of: Lookup if
> >> child node has panel or bridge'. In such case the board freezes during
> >> the drm initialization.
> > Please use drm-misc/drm-misc-next with below patches and then apply this series.
>
> I don't have a good news. It doesn't work. The last patch even breaks
> DSI operation:
>
> [    4.520276] [drm] Exynos DRM: using 13800000.decon device for DMA
> mapping operations
> [    4.520578] exynos-drm exynos-drm: bound 13800000.decon (ops
> decon_component_ops)
> [    4.580473] exynos-drm exynos-drm: bound 13880000.decon (ops
> decon_component_ops)
> [    4.580726] exynos-drm exynos-drm: bound 13930000.mic (ops
> exynos_mic_component_ops)
> [    4.584304] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
> Attached s6e3hf2 device
> [    4.585141] exynos-drm exynos-drm: bound 13900000.dsi (ops
> exynos_dsi_component_ops)
> [    4.593189] rc_core: Couldn't load IR keymap rc-cec
> [    4.594133] Registered IR keymap rc-empty
> [    4.598760] rc rc0: sii8620 as /devices/virtual/rc/rc0
> [    4.605219] input: sii8620 as /devices/virtual/rc/rc0/input1
> [    4.610238] exynos-drm exynos-drm: bound 13970000.hdmi (ops
> hdmi_component_ops)
> [    4.920038] exynos-dsi 13900000.dsi: xfer timed out: 39 03 00 00 f0 5a 5a
> [    5.024033] ------------[ cut here ]------------
> [    5.024055] [CRTC:49:crtc-0] vblank wait timed out
> [    5.024129] WARNING: CPU: 4 PID: 151 at
> drivers/gpu/drm/drm_atomic_helper.c:1530
> drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [    5.024171] Modules linked in:
> [    5.024195] CPU: 4 PID: 151 Comm: kworker/4:7 Not tainted 5.16.0-rc5+
> #11232
> [    5.024219] Hardware name: Samsung TM2E board (DT)
> [    5.024232] Workqueue: events output_poll_execute
> [    5.024262] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [    5.024285] pc : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [    5.024308] lr : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [    5.024327] sp : ffff800013b5b970
> [    5.024340] x29: ffff800013b5b970 x28: 0000000000000000 x27:
> ffff00002437e400
> [    5.024391] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff800011aa0c60
> [    5.024437] x23: 0000000000000001 x22: ffff000025113000 x21:
> 0000000000000001
> [    5.024482] x20: ffff0000316fc800 x19: 0000000000000000 x18:
> ffffffffffffffff
> [    5.024526] x17: 0048000000000a11 x16: 0000000000000028 x15:
> ffff800011b66df8
> [    5.024571] x14: 0000000000000000 x13: 0a74756f2064656d x12:
> 6974207469617720
> [    5.024615] x11: 656820747563205b x10: 000000000000003a x9 :
> 000000007e82f035
> [    5.024661] x8 : ffff800011b66df8 x7 : ffff800013b5b740 x6 :
> 0000000000000001
> [    5.024704] x5 : 0000000000000001 x4 : 0000000000000000 x3 :
> 0000000000000007
> [    5.024747] x2 : ffff800012524ea0 x1 : 68a66f6a76622200 x0 :
> 0000000000000000
> [    5.024791] Call trace:
> [    5.024802] drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [    5.024825]  drm_atomic_helper_commit_tail_rpm+0x60/0x78
> [    5.024845]  commit_tail+0x9c/0x170
> [    5.024864]  drm_atomic_helper_commit+0x188/0x3a0
> [    5.024884]  drm_atomic_commit+0x54/0x68
> [    5.024906]  drm_client_modeset_commit_atomic+0x260/0x288
> [    5.024927]  drm_client_modeset_commit_locked+0x54/0x1c0
> [    5.024945]  drm_client_modeset_commit+0x2c/0x50
> [    5.024962] __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf8
> [    5.024983]  drm_fb_helper_set_par+0x38/0x70
> [    5.025000]  drm_fb_helper_hotplug_event.part.29+0xb0/0xe0
> [    5.025018]  drm_fb_helper_output_poll_changed+0x30/0x40
> [    5.025035]  drm_kms_helper_hotplug_event+0x28/0x40
> [    5.025053]  output_poll_execute+0xc4/0x1f0
> [    5.025071]  process_one_work+0x29c/0x6e8
> [    5.025090]  worker_thread+0x48/0x460
> [    5.025106]  kthread+0x154/0x188
> [    5.025128]  ret_from_fork+0x10/0x20
> [    5.025148] irq event stamp: 878
> [    5.025160] hardirqs last  enabled at (877): [<ffff80001010e9fc>]
> vprintk_emit+0x2bc/0x2f8
> [    5.025188] hardirqs last disabled at (878): [<ffff80001100fccc>]
> el1_dbg+0x24/0x88
> [    5.025214] softirqs last  enabled at (206): [<ffff800010010488>]
> _stext+0x488/0x5cc
> [    5.025233] softirqs last disabled at (201): [<ffff800010095718>]
> irq_exit_rcu+0x168/0x1a8
> [    5.025256] ---[ end trace 458e29685f12760b ]---
> [   15.240069] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   15.240131] exynos-drm exynos-drm: [drm] *ERROR* [CRTC:49:crtc-0]
> commit wait timed out
> [   25.480001] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   25.480031] exynos-drm exynos-drm: [drm] *ERROR* [CONNECTOR:68:DSI-1]
> commit wait timed out
> [   35.720001] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   35.720031] exynos-drm exynos-drm: [drm] *ERROR* [PLANE:37:plane-2]
> commit wait timed out
> [   35.824013] ------------[ cut here ]------------
> [   35.824037] [CRTC:49:crtc-0] vblank wait timed out
> [   35.824116] WARNING: CPU: 7 PID: 74 at
> drivers/gpu/drm/drm_atomic_helper.c:1530
> drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   35.824155] Modules linked in:
> [   35.824180] CPU: 7 PID: 74 Comm: kworker/u16:1 Tainted: G
> W         5.16.0-rc5+ #11232
> [   35.824205] Hardware name: Samsung TM2E board (DT)
> [   35.824221] Workqueue: events_unbound deferred_probe_work_func
> [   35.824255] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   35.824281] pc : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   35.824304] lr : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   35.824325] sp : ffff80001386b380
> [   35.824339] x29: ffff80001386b380 x28: 0000000000000000 x27:
> ffff000023c91c00
> [   35.824395] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff800011aa0c60
> [   35.824446] x23: 0000000000000001 x22: ffff000025113000 x21:
> 0000000000000001
> [   35.824495] x20: ffff0000316fc800 x19: 0000000000000000 x18:
> ffffffffffffffff
> [   35.824544] x17: 0048000000000a11 x16: 0000000000000028 x15:
> ffff800011b66df8
> [   35.824594] x14: 0000000000000000 x13: 0a74756f2064656d x12:
> 6974207469617720
> [   35.824643] x11: 656820747563205b x10: 000000000000003a x9 :
> 0000000088c3aa19
> [   35.824693] x8 : ffff800011b66df8 x7 : ffff80001386b150 x6 :
> 0000000000000001
> [   35.824741] x5 : 0000000000000001 x4 : 0000000000000000 x3 :
> 000000000000000c
> [   35.824788] x2 : ffff800012524ea0 x1 : 68a66f6a76622200 x0 :
> 0000000000000000
> [   35.824838] Call trace:
> [   35.824851] drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   35.824875]  drm_atomic_helper_commit_tail_rpm+0x60/0x78
> [   35.824898]  commit_tail+0x9c/0x170
> [   35.824918]  drm_atomic_helper_commit+0x188/0x3a0
> [   35.824939]  drm_atomic_commit+0x54/0x68
> [   35.824962]  drm_client_modeset_commit_atomic+0x260/0x288
> [   35.824983]  drm_client_modeset_commit_locked+0x54/0x1c0
> [   35.825003]  drm_client_modeset_commit+0x2c/0x50
> [   35.825023] __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf8
> [   35.825043]  drm_fb_helper_set_par+0x38/0x70
> [   35.825062]  fbcon_init+0x440/0x4e0
> [   35.825085]  visual_init+0xb0/0x108
> [   35.825107]  do_bind_con_driver+0x1cc/0x3c0
> [   35.825127]  do_take_over_console+0x148/0x1d8
> [   35.825148]  do_fbcon_takeover+0x70/0xe8
> [   35.825170]  fbcon_fb_registered+0x13c/0x150
> [   35.825192]  register_framebuffer+0x1c4/0x340
> [   35.825211] __drm_fb_helper_initial_config_and_unlock+0x360/0x548
> [   35.825239]  drm_fb_helper_initial_config+0x44/0x50
> [   35.825257]  exynos_drm_fbdev_init+0x90/0x100
> [   35.825282]  exynos_drm_bind+0x164/0x1a8
> [   35.825303]  try_to_bring_up_master+0x15c/0x1c8
> [   35.825326]  __component_add+0xa8/0x170
> [   35.825348]  component_add+0x10/0x18
> [   35.825370]  hdmi_probe+0x43c/0x6d0
> [   35.825389]  platform_probe+0x90/0xd8
> [   35.825412]  really_probe+0xb4/0x2e0
> [   35.825432]  __driver_probe_device+0x78/0xd8
> [   35.825452]  driver_probe_device+0x40/0x110
> [   35.825473]  __device_attach_driver+0x9c/0xd8
> [   35.825494]  bus_for_each_drv+0x70/0xc8
> [   35.825513]  __device_attach+0xec/0x150
> [   35.825533]  device_initial_probe+0x10/0x18
> [   35.825556]  bus_probe_device+0x94/0xa0
> [   35.825575]  deferred_probe_work_func+0x84/0xc0
> [   35.825595]  process_one_work+0x29c/0x6e8
> [   35.825614]  worker_thread+0x21c/0x460
> [   35.825631]  kthread+0x154/0x188
> [   35.825653]  ret_from_fork+0x10/0x20
> [   35.825673] irq event stamp: 162880
> [   35.825687] hardirqs last  enabled at (162879): [<ffff80001010e9fc>]
> vprintk_emit+0x2bc/0x2f8
> [   35.825716] hardirqs last disabled at (162880): [<ffff80001100fccc>]
> el1_dbg+0x24/0x88
> [   35.825742] softirqs last  enabled at (162726): [<ffff800010010488>]
> _stext+0x488/0x5cc
> [   35.825763] softirqs last disabled at (162721): [<ffff800010095718>]
> irq_exit_rcu+0x168/0x1a8
> [   35.825787] ---[ end trace 458e29685f12760c ]---
> [   45.960007] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   45.960039] exynos-drm exynos-drm: [drm] *ERROR* [CRTC:49:crtc-0]
> commit wait timed out
> [   56.200000] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   56.200030] exynos-drm exynos-drm: [drm] *ERROR* [CONNECTOR:68:DSI-1]
> commit wait timed out
> [   66.440000] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   66.440030] exynos-drm exynos-drm: [drm] *ERROR* [PLANE:37:plane-2]
> commit wait timed out
> [   66.544003] ------------[ cut here ]------------
> [   66.544027] [CRTC:49:crtc-0] vblank wait timed out
> [   66.544102] WARNING: CPU: 7 PID: 74 at
> drivers/gpu/drm/drm_atomic_helper.c:1530
> drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   66.544138] Modules linked in:
> [   66.544162] CPU: 7 PID: 74 Comm: kworker/u16:1 Tainted: G
> W         5.16.0-rc5+ #11232
> [   66.544186] Hardware name: Samsung TM2E board (DT)
> [   66.544200] Workqueue: events_unbound deferred_probe_work_func
> [   66.544233] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   66.544255] pc : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   66.544277] lr : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   66.544297] sp : ffff80001386b160
> [   66.544310] x29: ffff80001386b160 x28: 0000000000000000 x27:
> ffff000023d83500
> [   66.544363] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff800011aa0c60
> [   66.544412] x23: 0000000000000001 x22: ffff000025113000 x21:
> 0000000000000001
> [   66.544461] x20: ffff0000316fc800 x19: 0000000000000000 x18:
> ffffffffffffffff
> [   66.544509] x17: 0048000000000a11 x16: 0a020a010a110a00 x15:
> ffff800011b66df8
> [   66.544558] x14: 0000000000000000 x13: 0a74756f2064656d x12:
> 6974207469617720
> [   66.544606] x11: 656820747563205b x10: 000000000000003a x9 :
> 0000000088c3aa19
> [   66.544655] x8 : ffff800011b66df8 x7 : ffff80001386af30 x6 :
> 0000000000000001
> [   66.544702] x5 : 0000000000000001 x4 : 0000000000000000 x3 :
> 000000000000000c
> [   66.544749] x2 : ffff800012524ea0 x1 : 68a66f6a76622200 x0 :
> 0000000000000000
> [   66.544796] Call trace:
> [   66.544808] drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   66.544830]  drm_atomic_helper_commit_tail_rpm+0x60/0x78
> [   66.544852]  commit_tail+0x9c/0x170
> [   66.544871]  drm_atomic_helper_commit+0x188/0x3a0
> [   66.544892]  drm_atomic_commit+0x54/0x68
> [   66.544915]  drm_client_modeset_commit_atomic+0x260/0x288
> [   66.544935]  drm_client_modeset_commit_locked+0x54/0x1c0
> [   66.544954]  drm_fb_helper_pan_display+0xb0/0x1c0
> [   66.544973]  fb_pan_display+0xb8/0x158
> [   66.544990]  bit_update_start+0x1c/0x40
> [   66.545013]  fbcon_switch+0x308/0x458
> [   66.545034]  redraw_screen+0x158/0x238
> [   66.545056]  fbcon_prepare_logo+0x3cc/0x440
> [   66.545077]  fbcon_init+0x380/0x4e0
> [   66.545098]  visual_init+0xb0/0x108
> [   66.545118]  do_bind_con_driver+0x1cc/0x3c0
> [   66.545137]  do_take_over_console+0x148/0x1d8
> [   66.545158]  do_fbcon_takeover+0x70/0xe8
> [   66.545178]  fbcon_fb_registered+0x13c/0x150
> [   66.545199]  register_framebuffer+0x1c4/0x340
> [   66.545217] __drm_fb_helper_initial_config_and_unlock+0x360/0x548
> [   66.545244]  drm_fb_helper_initial_config+0x44/0x50
> [   66.545263]  exynos_drm_fbdev_init+0x90/0x100
> [   66.545286]  exynos_drm_bind+0x164/0x1a8
> [   66.545306]  try_to_bring_up_master+0x15c/0x1c8
> [   66.545329]  __component_add+0xa8/0x170
> [   66.545350]  component_add+0x10/0x18
> [   66.545371]  hdmi_probe+0x43c/0x6d0
> [   66.545389]  platform_probe+0x90/0xd8
> [   66.545411]  really_probe+0xb4/0x2e0
> [   66.545431]  __driver_probe_device+0x78/0xd8
> [   66.545452]  driver_probe_device+0x40/0x110
> [   66.545472]  __device_attach_driver+0x9c/0xd8
> [   66.545493]  bus_for_each_drv+0x70/0xc8
> [   66.545513]  __device_attach+0xec/0x150
> [   66.545532]  device_initial_probe+0x10/0x18
> [   66.545553]  bus_probe_device+0x94/0xa0
> [   66.545573]  deferred_probe_work_func+0x84/0xc0
> [   66.545592]  process_one_work+0x29c/0x6e8
> [   66.545612]  worker_thread+0x21c/0x460
> [   66.545628]  kthread+0x154/0x188
> [   66.545651]  ret_from_fork+0x10/0x20
> [   66.545671] irq event stamp: 163148
> [   66.545684] hardirqs last  enabled at (163147): [<ffff80001010e9fc>]
> vprintk_emit+0x2bc/0x2f8
> [   66.545712] hardirqs last disabled at (163148): [<ffff80001100fccc>]
> el1_dbg+0x24/0x88
> [   66.545735] softirqs last  enabled at (162726): [<ffff800010010488>]
> _stext+0x488/0x5cc
> [   66.545754] softirqs last disabled at (162721): [<ffff800010095718>]
> irq_exit_rcu+0x168/0x1a8
> [   66.545778] ---[ end trace 458e29685f12760d ]---
> [   66.589975] Console: switching to colour frame buffer device 200x160
> [   76.680050] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   76.680082] exynos-drm exynos-drm: [drm] *ERROR* [CRTC:49:crtc-0]
> commit wait timed out
> [   86.920001] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   86.920030] exynos-drm exynos-drm: [drm] *ERROR* [CONNECTOR:68:DSI-1]
> commit wait timed out
> [   97.160001] exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> [   97.160029] exynos-drm exynos-drm: [drm] *ERROR* [PLANE:37:plane-2]
> commit wait timed out
> [   97.264005] ------------[ cut here ]------------
> [   97.264029] [CRTC:49:crtc-0] vblank wait timed out
> [   97.264103] WARNING: CPU: 7 PID: 74 at
> drivers/gpu/drm/drm_atomic_helper.c:1530
> drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   97.264139] Modules linked in:
> [   97.264162] CPU: 7 PID: 74 Comm: kworker/u16:1 Tainted: G
> W         5.16.0-rc5+ #11232
> [   97.264185] Hardware name: Samsung TM2E board (DT)
> [   97.264199] Workqueue: events_unbound deferred_probe_work_func
> [   97.264231] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   97.264254] pc : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   97.264277] lr : drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   97.264298] sp : ffff80001386b290
> [   97.264310] x29: ffff80001386b290 x28: 0000000000000000 x27:
> ffff0000250a6a00
> [   97.264361] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff800011aa0c60
> [   97.264409] x23: 0000000000000001 x22: ffff000025113000 x21:
> 0000000000000001
> [   97.264457] x20: ffff0000316fc800 x19: 0000000000000000 x18:
> ffffffffffffffff
> [   97.264505] x17: 0048000000000a11 x16: 0a020a010a110a00 x15:
> ffff800011b66df8
> [   97.264554] x14: 0000000000000000 x13: 0a74756f2064656d x12:
> 6974207469617720
> [   97.264603] x11: 656820747563205b x10: 000000000000003a x9 :
> 0000000088c3aa19
> [   97.264652] x8 : ffff800011b66df8 x7 : ffff80001386b060 x6 :
> 0000000000000001
> [   97.264699] x5 : 0000000000000001 x4 : 0000000000000000 x3 :
> 000000000000000c
> [   97.264746] x2 : ffff800012524ea0 x1 : 68a66f6a76622200 x0 :
> 0000000000000000
> [   97.264794] Call trace:
> [   97.264806] drm_atomic_helper_wait_for_vblanks.part.24+0x298/0x2a8
> [   97.264829]  drm_atomic_helper_commit_tail_rpm+0x60/0x78
> [   97.264852]  commit_tail+0x9c/0x170
> [   97.264872]  drm_atomic_helper_commit+0x188/0x3a0
> [   97.264892]  drm_atomic_commit+0x54/0x68
> [   97.264915]  drm_client_modeset_commit_atomic+0x260/0x288
> [   97.264936]  drm_client_modeset_commit_locked+0x54/0x1c0
> [   97.264955]  drm_fb_helper_pan_display+0xb0/0x1c0
> [   97.264974]  fb_pan_display+0xb8/0x158
> [   97.264991]  bit_update_start+0x1c/0x40
> [   97.265014]  fbcon_switch+0x308/0x458
> [   97.265034]  redraw_screen+0x158/0x238
> [   97.265056]  do_bind_con_driver+0x2d0/0x3c0
> [   97.265075]  do_take_over_console+0x148/0x1d8
> [   97.265096]  do_fbcon_takeover+0x70/0xe8
> [   97.265117]  fbcon_fb_registered+0x13c/0x150
> [   97.265138]  register_framebuffer+0x1c4/0x340
> [   97.265156] __drm_fb_helper_initial_config_and_unlock+0x360/0x548
> [   97.265183]  drm_fb_helper_initial_config+0x44/0x50
> [   97.265202]  exynos_drm_fbdev_init+0x90/0x100
> [   97.265225]  exynos_drm_bind+0x164/0x1a8
> [   97.265246]  try_to_bring_up_master+0x15c/0x1c8
> [   97.265268]  __component_add+0xa8/0x170
> [   97.265289]  component_add+0x10/0x18
> [   97.265310]  hdmi_probe+0x43c/0x6d0
> [   97.265327]  platform_probe+0x90/0xd8
> [   97.265349]  really_probe+0xb4/0x2e0
> [   97.265368]  __driver_probe_device+0x78/0xd8
> [   97.265388]  driver_probe_device+0x40/0x110
> [   97.265408]  __device_attach_driver+0x9c/0xd8
> [   97.265428]  bus_for_each_drv+0x70/0xc8
> [   97.265446]  __device_attach+0xec/0x150
> [   97.265465]  device_initial_probe+0x10/0x18
> [   97.265485]  bus_probe_device+0x94/0xa0
> [   97.265505]  deferred_probe_work_func+0x84/0xc0
> [   97.265524]  process_one_work+0x29c/0x6e8
> [   97.265543]  worker_thread+0x21c/0x460
> [   97.265559]  kthread+0x154/0x188
> [   97.265580]  ret_from_fork+0x10/0x20
> [   97.265601] irq event stamp: 163438
> [   97.265613] hardirqs last  enabled at (163437): [<ffff80001010e9fc>]
> vprintk_emit+0x2bc/0x2f8
> [   97.265641] hardirqs last disabled at (163438): [<ffff80001100fccc>]
> el1_dbg+0x24/0x88
> [   97.265664] softirqs last  enabled at (163174): [<ffff800010010488>]
> _stext+0x488/0x5cc
> [   97.265684] softirqs last disabled at (163169): [<ffff800010095718>]
> irq_exit_rcu+0x168/0x1a8
> [   97.265706] ---[ end trace 458e29685f12760e ]---
> [   98.742702] exynos-drm exynos-drm: [drm] fb0: exynos frame buffer device
> [   98.752101] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> minor 0

So, MIC-based pipeline SoC's are not working? like

Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel

If so, we can attach the add attach in MIC bridge so that it can link
the downstream bridge ie DSI.

Thanks,
Jagan.
