Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906E8C4C41
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 08:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678F310E1EA;
	Tue, 14 May 2024 06:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ktLhBs0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE4210E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 06:27:57 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-7f3faea0ce0so1297423241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 23:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715668076; x=1716272876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhIouYRda4xn/j4cKFbLumMg8gYymQBHY+M0ZcFcX50=;
 b=ktLhBs0IvjMMvQAwYTXh7J48+LJvfhEecJIY/Vc1PoLyiszY1mGqQd99ncrICZFjk3
 kgNDr9F5gahfZ2r+k8LEui7pMhTP6JAWBEgUmKJhzkQuZ5rx9a80mPEm/hiOIvWFAlaT
 2kwwCEcOepM0X6+b7SwBPv1B2ZNV8iPgPb2Snp6Zf5bJGi0mLeok6/DAPOzCwjxlN7dm
 avlc1bpb30hdH8k2cJ9F9dfdLK0R1GBrbKKpMcfCuN4uokZ1WhAfftECgmYwJFa/lDdw
 7M75NJvdvGSS19cGhuhgTJGMTdg68Un78fLjD/69PGQmxJKSaXN9Pxj3yecAvtEzN7GR
 zd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715668076; x=1716272876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhIouYRda4xn/j4cKFbLumMg8gYymQBHY+M0ZcFcX50=;
 b=PSETVhxAf6CeBXqSl0U5VV7H61E+GUiAW8haPZdWtpXdU+yG+xEXGn8zeWJJYSKUPk
 3PzvBMCeMEwqculInc4+xzScgpd4xQfyks/mJlYQCozgCrraM9hES5NlbAK5XMRNsAxP
 w5rYsxInQ7EJuq2/z2bd4B20bJLdxf6hgpSkZAtIr8Z/JDsnrbTh9WvJv4OjPdYQgCpG
 vgG7cKaLEYra7qQQAQo+iipa3LMtXYAzxod7PI6yMQoaJ3hovqvFxQXPyTl55FwOEzer
 jmBNZmnPRbqizNxj22DjNY2MepVrRu7CEBmOOqQMt4XBaMqKIpkSXa8jqwv7pROtigTW
 zNpg==
X-Gm-Message-State: AOJu0YybXTmX1VxEpeS4GTxpxn6B/x4wVaJ9vaWKxBSlVEb6akV/3fLL
 /a40vI8F2vYYlloz5dYgwbn2hI2vVCFAywYMwYhey/xHczU6aAmyZ2CAGf7ki0VbvDn3nOEkbw/
 7CvMwPiKJGx0W2ArY5+Jd4oOwxt8=
X-Google-Smtp-Source: AGHT+IGNFSwOrfQzHJ2L5VBUES2Agun4DroQZdbP1h03kx2PBnV2QHcMqlGbIu6c8Rh7JP3Wqe6OjRJxxZptv9tpVG0=
X-Received: by 2002:a05:6102:6d0:b0:47b:d3a9:e6ee with SMTP id
 ada2fe7eead31-48077de78b5mr11357701137.21.1715668074278; Mon, 13 May 2024
 23:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec@eucas1p1.samsung.com>
 <20240425094851.994055-1-m.szyprowski@samsung.com>
In-Reply-To: <20240425094851.994055-1-m.szyprowski@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 14 May 2024 15:27:18 +0900
Message-ID: <CAAQKjZMwAJrKfccC+2cB8pqGrdrgBToSkvEa0BRnfU+CO9n2Cg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: report safe 640x480 mode as a fallback
 when no EDID found
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

2024=EB=85=84 4=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:49, M=
arek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> When reading EDID fails and driver reports no modes available, the DRM
> core adds an artificial 1024x786 mode to the connector. Unfortunately
> some variants of the Exynos HDMI (like the one in Exynos4 SoCs) are not
> able to drive such mode, so report a safe 640x480 mode instead of nothing
> in case of the EDID reading failure.
>
> This fixes the following issue observed on Trats2 board since commit
> 13d5b040363c ("drm/exynos: do not return negative values from .get_modes(=
)"):

Applied.

Thanks,
Inki Dae

>
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> exynos-drm exynos-drm: bound 12c10000.mixer (ops mixer_component_ops)
> exynos-dsi 11c80000.dsi: [drm:samsung_dsim_host_attach] Attached s6e8aa0 =
device (lanes:4 bpp:24 mode-flags:0x10b)
> exynos-drm exynos-drm: bound 11c80000.dsi (ops exynos_dsi_component_ops)
> exynos-drm exynos-drm: bound 12d00000.hdmi (ops hdmi_component_ops)
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
> exynos-hdmi 12d00000.hdmi: [drm:hdmiphy_enable.part.0] *ERROR* PLL could =
not reach steady state
> panel-samsung-s6e8aa0 11c80000.dsi.0: ID: 0xa2, 0x20, 0x8c
> exynos-mixer 12c10000.mixer: timeout waiting for VSYNC
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 11 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_a=
tomic_helper_wait_for_vblanks.part.0+0x2b0/0x2b8
> [CRTC:70:crtc-1] vblank wait timed out
> Modules linked in:
> CPU: 1 PID: 11 Comm: kworker/u16:0 Not tainted 6.9.0-rc5-next-20240424 #1=
4913
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x68/0x88
>  dump_stack_lvl from __warn+0x7c/0x1c4
>  __warn from warn_slowpath_fmt+0x11c/0x1a8
>  warn_slowpath_fmt from drm_atomic_helper_wait_for_vblanks.part.0+0x2b0/0=
x2b8
>  drm_atomic_helper_wait_for_vblanks.part.0 from drm_atomic_helper_commit_=
tail_rpm+0x7c/0x8c
>  drm_atomic_helper_commit_tail_rpm from commit_tail+0x9c/0x184
>  commit_tail from drm_atomic_helper_commit+0x168/0x190
>  drm_atomic_helper_commit from drm_atomic_commit+0xb4/0xe0
>  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x27c
>  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0=
x60/0x1cc
>  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x4=
0
>  drm_client_modeset_commit from __drm_fb_helper_restore_fbdev_mode_unlock=
ed+0x9c/0xc4
>  __drm_fb_helper_restore_fbdev_mode_unlocked from drm_fb_helper_set_par+0=
x2c/0x3c
>  drm_fb_helper_set_par from fbcon_init+0x3d8/0x550
>  fbcon_init from visual_init+0xc0/0x108
>  visual_init from do_bind_con_driver+0x1b8/0x3a4
>  do_bind_con_driver from do_take_over_console+0x140/0x1ec
>  do_take_over_console from do_fbcon_takeover+0x70/0xd0
>  do_fbcon_takeover from fbcon_fb_registered+0x19c/0x1ac
>  fbcon_fb_registered from register_framebuffer+0x190/0x21c
>  register_framebuffer from __drm_fb_helper_initial_config_and_unlock+0x35=
0/0x574
>  __drm_fb_helper_initial_config_and_unlock from exynos_drm_fbdev_client_h=
otplug+0x6c/0xb0
>  exynos_drm_fbdev_client_hotplug from drm_client_register+0x58/0x94
>  drm_client_register from exynos_drm_bind+0x160/0x190
>  exynos_drm_bind from try_to_bring_up_aggregate_device+0x200/0x2d8
>  try_to_bring_up_aggregate_device from __component_add+0xb0/0x170
>  __component_add from mixer_probe+0x74/0xcc
>  mixer_probe from platform_probe+0x5c/0xb8
>  platform_probe from really_probe+0xe0/0x3d8
>  really_probe from __driver_probe_device+0x9c/0x1e4
>  __driver_probe_device from driver_probe_device+0x30/0xc0
>  driver_probe_device from __device_attach_driver+0xa8/0x120
>  __device_attach_driver from bus_for_each_drv+0x80/0xcc
>  bus_for_each_drv from __device_attach+0xac/0x1fc
>  __device_attach from bus_probe_device+0x8c/0x90
>  bus_probe_device from deferred_probe_work_func+0x98/0xe0
>  deferred_probe_work_func from process_one_work+0x240/0x6d0
>  process_one_work from worker_thread+0x1a0/0x3f4
>  worker_thread from kthread+0x104/0x138
>  kthread from ret_from_fork+0x14/0x28
> Exception stack(0xf0895fb0 to 0xf0895ff8)
> ...
> irq event stamp: 82357
> hardirqs last  enabled at (82363): [<c01a96e8>] vprintk_emit+0x308/0x33c
> hardirqs last disabled at (82368): [<c01a969c>] vprintk_emit+0x2bc/0x33c
> softirqs last  enabled at (81614): [<c0101644>] __do_softirq+0x320/0x500
> softirqs last disabled at (81609): [<c012dfe0>] __irq_exit_rcu+0x130/0x18=
4
> ---[ end trace 0000000000000000 ]---
> exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> exynos-drm exynos-drm: [drm] *ERROR* [CRTC:70:crtc-1] commit wait timed o=
ut
> exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> exynos-drm exynos-drm: [drm] *ERROR* [CONNECTOR:74:HDMI-A-1] commit wait =
timed out
> exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
> exynos-drm exynos-drm: [drm] *ERROR* [PLANE:56:plane-5] commit wait timed=
 out
> exynos-mixer 12c10000.mixer: timeout waiting for VSYNC
>
> Cc: stable@vger.kernel.org
> Fixes: 13d5b040363c ("drm/exynos: do not return negative values from .get=
_modes()")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index 5fdeec8a3875..9d246db6ef2b 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -887,11 +887,11 @@ static int hdmi_get_modes(struct drm_connector *con=
nector)
>         int ret;
>
>         if (!hdata->ddc_adpt)
> -               return 0;
> +               goto no_edid;
>
>         edid =3D drm_get_edid(connector, hdata->ddc_adpt);
>         if (!edid)
> -               return 0;
> +               goto no_edid;
>
>         hdata->dvi_mode =3D !connector->display_info.is_hdmi;
>         DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
> @@ -906,6 +906,9 @@ static int hdmi_get_modes(struct drm_connector *conne=
ctor)
>         kfree(edid);
>
>         return ret;
> +
> +no_edid:
> +       return drm_add_modes_noedid(connector, 640, 480);
>  }
>
>  static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_cloc=
k)
> --
> 2.34.1
>
>
