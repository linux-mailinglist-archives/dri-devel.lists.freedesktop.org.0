Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28C4185CB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 05:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686C6E4FF;
	Sun, 26 Sep 2021 03:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FED6E4FF
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 03:08:08 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id o204so5563756vko.9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 20:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqXuaStqzW2k6Y+KAwDOJKIdc7qvxlmEHiAvkJLv1lw=;
 b=p6X5uDXsCwnvw+UredCv8ToXFlg/Q+svmF+xilD58syDPnCaQMmsePbPV2+Gl6u57j
 H7bvMCuZ0pRNRGnNHw23V2WqTyyyoUFZjdazR/KvC4SvLOAxATB1clMxDyz+xbUcW95t
 wDQYHL6hLrQrvkQvr8HDWVzOHQEb2n56EIdCCUPzVOVpG7fvPJyQ/s5c7lqKAd1vB/3r
 +89iQsSnl8KtR1pj8xG0FrewUZMU2apnwbHRYbGFazYSFEzt0DrDKqWD90wvpCEnlJCe
 5nh+QV/sfNneL5pBqmilaRrzeC4aKjRMVqdfsH1k9/7U+3pSBehVT1HdEB1I/ypcdqf/
 4eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqXuaStqzW2k6Y+KAwDOJKIdc7qvxlmEHiAvkJLv1lw=;
 b=7UbEm93K5EFnG3RfrW+Enc8b90ukimR9chre1AHuCPzS3zk8VseXTk7BZjtt5ImiM/
 6AKOmQiunoITMr/XJOlvXuLIg3XdqWGrLFdl6I4/rGvhrVUCuxySSzKqfloG57StBpCe
 3mXYEmGIsU0hbgAsDN09Pm2sNZsAq79UH/2y0Si/wvepABaKzHnbh4wlWEuqVipf3eGn
 2+TQLuA6hBJIu1D4qjLey6XgEWu/ZQHKjzcrRuhfeMjLKF1BjJlnv1NItVEdhfgQXiTA
 pak828pL6S1Qm8P0jKoq5OdWlsrAMrDlE7bjzuUG0v+IYHt5Oa0L+rLTwuTKMHeQDcGq
 7h5Q==
X-Gm-Message-State: AOAM531mql4JDMLFrjYmUXMdIRBOS6liP+zGn+3PRKwM20DO7AuAD4WD
 OffPu5s4FpMUvUFQ/Zmqavho5WblaTE3FTXtlpA=
X-Google-Smtp-Source: ABdhPJy86U1AJnxzaAoVmtlkXN7RGuJ9JK+AMP0Cz73L1yzso3LXeO67IoPdTVCicGAcKq0rtUgXyJ8dJWHPBqXQ0qM=
X-Received: by 2002:a1f:1283:: with SMTP id 125mr13231359vks.2.1632625687202; 
 Sat, 25 Sep 2021 20:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210916082941.3421838-1-chenhuacai@loongson.cn>
 <20210916082941.3421838-13-chenhuacai@loongson.cn>
In-Reply-To: <20210916082941.3421838-13-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 26 Sep 2021 11:07:37 +0800
Message-ID: <CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU27KHWcyWKkMftEsA@mail.gmail.com>
Subject: Re: [PATCH V6 12/12] PCI/VGA: Move vgaarb to drivers/pci
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Xuefeng Li <lixuefeng@loongson.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Thu, Sep 16, 2021 at 4:39 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> The VGA arbiter is really PCI-specific and doesn't depend on any GPU
> things.  Move it to the PCI subsystem.
I found a new problem, after moving vgaarb.c to drivers/pci,
misc_register() in vga_arb_device_init() fails with -ENODEV, the root
cause is still initcall order. Both vga_arb_device_init() and
misc_init() are subsys_initcall(), and drivers/Makefile looks like
this:
obj-y                           += pci/
......
obj-y                           += char/
......
obj-y                           += gpu/

So vga_arb_device_init() in the pci directory runs before misc_init()
in the char directory, and misc_register() fails.

There are two methods to resolve: 1, keep vgaarb.c in drivers/gpu; 2,
make vga_arb_device_init() to be subsys_initcall_sync(). I prefer the
first one, but it seems you don't like both of them.

Huacai

>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/gpu/vga/Kconfig           | 19 -------------------
>  drivers/gpu/vga/Makefile          |  1 -
>  drivers/pci/Kconfig               | 19 +++++++++++++++++++
>  drivers/pci/Makefile              |  1 +
>  drivers/{gpu/vga => pci}/vgaarb.c |  0
>  5 files changed, 20 insertions(+), 20 deletions(-)
>  rename drivers/{gpu/vga => pci}/vgaarb.c (100%)
>
> diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
> index 1ad4c4ef0b5e..eb8b14ab22c3 100644
> --- a/drivers/gpu/vga/Kconfig
> +++ b/drivers/gpu/vga/Kconfig
> @@ -1,23 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -config VGA_ARB
> -       bool "VGA Arbitration" if EXPERT
> -       default y
> -       depends on (PCI && !S390)
> -       help
> -         Some "legacy" VGA devices implemented on PCI typically have the same
> -         hard-decoded addresses as they did on ISA. When multiple PCI devices
> -         are accessed at same time they need some kind of coordination. Please
> -         see Documentation/gpu/vgaarbiter.rst for more details. Select this to
> -         enable VGA arbiter.
> -
> -config VGA_ARB_MAX_GPUS
> -       int "Maximum number of GPUs"
> -       default 16
> -       depends on VGA_ARB
> -       help
> -         Reserves space in the kernel to maintain resource locking for
> -         multiple GPUS.  The overhead for each GPU is very small.
> -
>  config VGA_SWITCHEROO
>         bool "Laptop Hybrid Graphics - GPU switching support"
>         depends on X86
> diff --git a/drivers/gpu/vga/Makefile b/drivers/gpu/vga/Makefile
> index e92064442d60..9800620deda3 100644
> --- a/drivers/gpu/vga/Makefile
> +++ b/drivers/gpu/vga/Makefile
> @@ -1,3 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_VGA_ARB)  += vgaarb.o
>  obj-$(CONFIG_VGA_SWITCHEROO) += vga_switcheroo.o
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 0c473d75e625..7c9e56d7b857 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -252,6 +252,25 @@ config PCIE_BUS_PEER2PEER
>
>  endchoice
>
> +config VGA_ARB
> +       bool "VGA Arbitration" if EXPERT
> +       default y
> +       depends on (PCI && !S390)
> +       help
> +         Some "legacy" VGA devices implemented on PCI typically have the same
> +         hard-decoded addresses as they did on ISA. When multiple PCI devices
> +         are accessed at same time they need some kind of coordination. Please
> +         see Documentation/gpu/vgaarbiter.rst for more details. Select this to
> +         enable VGA arbiter.
> +
> +config VGA_ARB_MAX_GPUS
> +       int "Maximum number of GPUs"
> +       default 16
> +       depends on VGA_ARB
> +       help
> +         Reserves space in the kernel to maintain resource locking for
> +         multiple GPUS.  The overhead for each GPU is very small.
> +
>  source "drivers/pci/hotplug/Kconfig"
>  source "drivers/pci/controller/Kconfig"
>  source "drivers/pci/endpoint/Kconfig"
> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index d62c4ac4ae1b..ebe720f69b15 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_PCI_PF_STUB)     += pci-pf-stub.o
>  obj-$(CONFIG_PCI_ECAM)         += ecam.o
>  obj-$(CONFIG_PCI_P2PDMA)       += p2pdma.o
>  obj-$(CONFIG_XEN_PCIDEV_FRONTEND) += xen-pcifront.o
> +obj-$(CONFIG_VGA_ARB)          += vgaarb.o
>
>  # Endpoint library must be initialized before its users
>  obj-$(CONFIG_PCI_ENDPOINT)     += endpoint/
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/pci/vgaarb.c
> similarity index 100%
> rename from drivers/gpu/vga/vgaarb.c
> rename to drivers/pci/vgaarb.c
> --
> 2.27.0
>
