Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937674FC5C1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5610E009;
	Mon, 11 Apr 2022 20:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455ED10E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:27:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id i27so33225133ejd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtXeoECWCYtOuibBR1WD+NzkQ5jAdZNOzd5gP7v/F68=;
 b=FSdxalS/9rQr38UcuUFjy48IsJb33ncqAiZcPoKDWhw7aaMROIkBOZlhuZdDYhMTOI
 mTFVYr9Qo+Cuab1Bo1oOkWZA4N1yEoh5fPXK9VRBkP5Awlvkbi5HJHeTzUVnJJ4ZqdVx
 JFghkUb5BEW6qzEsRsQcBWvvlKk97g4BcbK+MOLnXdIgy08noKOt3jiyYe1ao79XxqFb
 xmaEUGEOZ4CdTI6jnG4PsAOcOMFr3DPJUTJKzfPz6zzYbIaDTQ4G/OGWMfgXxduPToTu
 f/9gUsc3YZA3AQ5uNeKfzd0VUTsMf0AQt2x2Mo4dFxE4e9i+cykGe6M7AeClMbXXVZZp
 EV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtXeoECWCYtOuibBR1WD+NzkQ5jAdZNOzd5gP7v/F68=;
 b=ktvIRUFVMUkDLQJO5yxcQZrZ2fXJnujtC1kNSb+DzCpd2TpUv2rQYnh4oDhebsJbmt
 odYpqhfq+4w0mvIgIZuGytITBfGBCVcrpH7l4FN/Q/pe3nVgSOACoAZhocf8ZNzhmcX5
 k1R4+n89jU1NU1/BsA2tUkO3C/rKeoBhR5Q17y3IAwZt8dUitw2ELONdkLR8uonT6SAK
 6q3Mv7mFAsKYJBzk4MmzRCpPnJdqLqH9LCjA04CTa9N0xE8lGtyquvXAyXUhfLZI+bIU
 Lrsobb2vL0OQmuSNEht852O4yi7A0i3KSKFxyszbdX03cRV543b7Ns7lQ0BE9esGFoX2
 0BCQ==
X-Gm-Message-State: AOAM532/Brjz7Tyqe8S71AGU0Z5ZXmFD+m3XwKmDNYLgy612LbTUEaEK
 VMeXwePBbeCw8ayW1q9qmN27ByCXJTfS+hA93K4=
X-Google-Smtp-Source: ABdhPJyvASstPUeUz9lGWA6v8FVDQ3IYNOsFIkQoMZ9P2t3/3626XRwt0koNl28e3mFYk9TFm1B8rA8hPRx1nXZhJbA=
X-Received: by 2002:a17:906:c145:b0:6da:aaaf:770c with SMTP id
 dp5-20020a170906c14500b006daaaaf770cmr31277025ejc.504.1649708822640; Mon, 11
 Apr 2022 13:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3@eucas1p1.samsung.com>
 <20220408162108.184583-1-jagan@amarulasolutions.com>
 <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
 <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
 <bde95ab4-38d8-5249-053c-57fb58d1a200@samsung.com>
In-Reply-To: <bde95ab4-38d8-5249-053c-57fb58d1a200@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 11 Apr 2022 15:26:51 -0500
Message-ID: <CAHCN7xJ+PhDE1ntk883c0vCux_impP88rF=GBQRQ+4tw9E-Guw@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 11:25 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 11.04.2022 16:39, Adam Ford wrote:
> > On Mon, Apr 11, 2022 at 8:56 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 08.04.2022 18:20, Jagan Teki wrote:
> >>> This series supports common bridge support for Samsung MIPI DSIM
> >>> which is used in Exynos and i.MX8MM SoC's.
> >>>
> >>> Previous RFC can be available here [1].
> >>>
> >>> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >>>
> >>> On, summary this patch-set break the entire DSIM driver into
> >>> - platform specific glue code for platform ops, component_ops.
> >>> - common bridge driver which handle platform glue init and invoke.
> >>>
> >>> Patch 0000:   Samsung DSIM bridge
> >>>
> >>> Patch 0001:   platform init flag via driver_data
> >>>
> >>> Patch 0002/9:   bridge fixes, atomic API's
> >>>
> >>> Patch 0010:   document fsl,imx8mm-mipi-dsim
> >>>
> >>> Patch 0011:   add i.MX8MM DSIM support
> >>>
> >>> Tested in Engicam i.Core MX8M Mini SoM.
> >>>
> >>> Anyone interested, please have a look on this repo [2]

I attempted to build your newer repo, but I get build errors:

~/src/linux-opendev$ make Image modules ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- -j8
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  MODPOST modules-only.symvers
ERROR: modpost: "dsi_driver" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
make[1]: *** Deleting file 'modules-only.symvers'
make: *** [Makefile:1746: modules] Error 2

I'm using gcc version 11.2.0 (Ubuntu 11.2.0-17ubuntu1) part of the
ubuntu 22.04 beta.  I know it's beta, so it might be buggy, but I
expect GCC 11.2 to be stable.

I'm going to keep investigating.  If I find a fix, I'll send you a
private message with the patch attached to avoid spamming everyone.

adam

> >>>
> >>> [2] https://protect2.fireeye.com/v1/url?k=930e329a-f28527b5-930fb9d5-74fe485cbfe7-b0c53e2d688ddbc5&q=1&e=e6aa727d-5ae2-4ca5-bff3-7f62d8fae87e&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v1
> >>> [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
> >>>
> >>> Any inputs?
> >> I wanted to test this on the Exynos, but I wasn't able to find what base
> >> should I apply this patchset. I've tried linux-next as well as
> >> 95a2441e4347 ("drm: exynos: dsi: Switch to atomic funcs").
> >>
> >> Please note that pointing a proper base for the patchset is really
> >> essential if you really want others to test it.
> > Can you clone his repo and test that?  He posted it above.  I was
> > going to clone it at some point this week to give it a try.
>
> Okay, my fault. I've missed that.
>
> There is a trivial compilation issue,
> drivers/gpu/drm/exynos/exynos_drm_dsi.c lacks "#include
> <linux/gpio/consumer.h>" after conversion. Besides that, it simply nukes
> on the simplest Exynos setup (exynos4210-trats) during the initialization:
>
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000048
> [00000048] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.17.0-rc2-00577-g22e968113668-dirty #11635
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at exynos_dsi_bind+0x14/0x3c
> LR is at component_bind_all+0x130/0x290
> pc : [<c06924e0>]    lr : [<c06b0f6c>]    psr: 60000113
> sp : c1cafcb8  ip : 00000002  fp : c0f4a53c
> r10: c135e6a8  r9 : c1efd800  r8 : 00000000
> r7 : c26d2100  r6 : c2c69fc0  r5 : 00000018  r4 : 00000000
> r3 : c06924cc  r2 : 00000002  r1 : 00000000  r0 : c1efd800
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> Register r0 information: slab kmalloc-2k start c1efd800 pointer offset 0
> size 2048
> Register r1 information: NULL pointer
> Register r2 information: non-paged memory
> Register r3 information: non-slab/vmalloc memory
> Register r4 information: NULL pointer
> Register r5 information: non-paged memory
> Register r6 information: slab kmalloc-64 start c2c69fc0 pointer offset 0
> size 64
> Register r7 information: slab kmalloc-64 start c26d2100 pointer offset 0
> size 64
> Register r8 information: NULL pointer
> Register r9 information: slab kmalloc-2k start c1efd800 pointer offset 0
> size 2048
> Register r10 information: non-slab/vmalloc memory
> Register r11 information: non-slab/vmalloc memory
> Register r12 information: non-paged memory
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xc1cafcb8 to 0xc1cb0000)
> ...
>   exynos_dsi_bind from component_bind_all+0x130/0x290
>   component_bind_all from exynos_drm_bind+0xe8/0x194
>   exynos_drm_bind from try_to_bring_up_master+0x208/0x2d0
>   try_to_bring_up_master from component_master_add_with_match+0xd0/0x104
>   component_master_add_with_match from exynos_drm_platform_probe+0xe8/0x118
>   exynos_drm_platform_probe from platform_probe+0x80/0xc0
>   platform_probe from really_probe+0xfc/0x440
>   really_probe from __driver_probe_device+0xa4/0x204
>   __driver_probe_device from driver_probe_device+0x34/0xd4
>   driver_probe_device from __driver_attach+0x114/0x184
>   __driver_attach from bus_for_each_dev+0x64/0xb0
>   bus_for_each_dev from bus_add_driver+0x170/0x20c
>   bus_add_driver from driver_register+0x78/0x10c
>   driver_register from exynos_drm_init+0xe0/0x14c
>   exynos_drm_init from do_one_initcall+0x6c/0x3a4
>   do_one_initcall from kernel_init_freeable+0x1c4/0x214
>   kernel_init_freeable from kernel_init+0x18/0x12c
>   kernel_init from ret_from_fork+0x14/0x2c
> Exception stack(0xc1caffb0 to 0xc1cafff8)
> ffa0:                                     00000000 00000000 00000000
> 00000000
> ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: e5904040 e1a00002 e3a02002 e1a01004 (e5945048)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> CPU1: stopping
> CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D
> 5.17.0-rc2-00577-g22e968113668-dirty #11635
> Hardware name: Samsung Exynos (Flattened Device Tree)
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x58/0x70
>   dump_stack_lvl from do_handle_IPI+0x2ec/0x36c
>   do_handle_IPI from ipi_handler+0x18/0x20
>   ipi_handler from handle_percpu_devid_irq+0xd0/0x394
>   handle_percpu_devid_irq from generic_handle_domain_irq+0x44/0x88
>   generic_handle_domain_irq from gic_handle_irq+0x88/0xac
>   gic_handle_irq from generic_handle_arch_irq+0x58/0x78
>   generic_handle_arch_irq from __irq_svc+0x54/0x88
> Exception stack(0xc1cd1f48 to 0xc1cd1f90)
> 1f40:                   00000001 c0eff5a4 00000001 c011ca80 c1208f0c
> c1353420
> 1f60: 00000000 c1d8d000 00000000 c0f34234 c1d8d000 00000000 c0eeee98
> c1cd1f98
> 1f80: c0109144 c0109148 20000013 ffffffff
>   __irq_svc from arch_cpu_idle+0x40/0x44
>   arch_cpu_idle from default_idle_call+0x74/0x2c4
>   default_idle_call from do_idle+0x1cc/0x284
>   do_idle from cpu_startup_entry+0x18/0x1c
>   cpu_startup_entry from 0x401018b4
> ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
>
>
> I will try to take a look into this later in the evening.
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
