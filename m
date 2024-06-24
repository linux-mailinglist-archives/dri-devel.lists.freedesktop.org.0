Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D769156A3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 20:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF33F894EA;
	Mon, 24 Jun 2024 18:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KvPrce1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ECF894EA;
 Mon, 24 Jun 2024 18:47:51 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-681bc7f50d0so4162538a12.0; 
 Mon, 24 Jun 2024 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719254871; x=1719859671; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X75dQKiSOlUCy9pmmHYzWRn/NUnCJh7U1nH+dGZQbWw=;
 b=KvPrce1SJHUqgmfmIl5dFH99KFXMvgKcMwbzgdPOc9klq13S5iUTC1JwC8nyHj5Rbq
 esGcQz62OeQPkIrzhuE1UG3iQdr2bcUHUgHeMKYMfBOBdn1TTSF3DKritr/YF3jB7Kjg
 eyIOvsuTBU+Fjw7cqHsTxTHLtZ+7uKQX77/OkwEhD5ubPvqmGw4zKWAj2r5SmxbhhCr7
 AqU71hc/mVOETagx89R7+KtsikT7W4WINuF5zRnuLQbNYiBMUB7eSKgNEccq/tn6eoO6
 h/QIRZk6uG5YSKWPjdEpiPgfXBZNkYqUa7fPbpoEk1z9j8hoOL5IHbmk5zHZ/0PMWo0G
 82Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719254871; x=1719859671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X75dQKiSOlUCy9pmmHYzWRn/NUnCJh7U1nH+dGZQbWw=;
 b=aLRGKIU8DgfCfDk06JGxDpO55YAZIAD1EEfH7IvjZQmbliMwhj1ej/UUJ4LjMEH73P
 B4Xr9LK5TmgggXWubuGULMtAUsZyEg+RtHcU3N3eb1X9xjX6k8QI5ZPbQE0PPAgoiu2H
 rKkHFtLN8dz739JJhlBNsyEVS4XllHuGMim9PZboVczlMc6/qi6vFchCP2/LxuRk5e/+
 oWKl7WJMJYYvfnM1M8rMn6hTM/PTDc5fjwUcAcm1X/JdhbGvY7w7M36D72eYz9BlkTj/
 vXMlPLqMUSv6au9+zFPMewvXIMKqzf7wGnhRUsqhFS9gVWLtrh1CIrkq+V/6+gzSRuMT
 iEhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr0Wxq29Gb5+81R2ovujziaSG9k5q6ADHylKETcU+p1Gi585KjN+FJJN4HKt17OqMqFfQ1WkRKGo5BKznf1pCb4fLdAOl5bZ+5BX9QfXNkEVxUusOuKk+pYOGZZZWH37UvhoS04AZ4/wnoEevAlg==
X-Gm-Message-State: AOJu0YyS/y0fiUV+6UyE6SsebIoWl2hU0JpEuR2ZcVMmvRcFyUMmCr7+
 5sxLjSSc9RA03XjOyDJLQXENlMFkDFgDqmIXoNCKpyO6cJH1h0O8KA0nf2B8s8NFCrsWW7o06zf
 G8GS3UpAX/2MH+3pR5DrKQT9G/TA=
X-Google-Smtp-Source: AGHT+IFgOFjVt4F9SvTNmHw1kNtIdzEuhWllPnK9yKggF6ZIlzq+iY+QwBn6jG/xblVw3e5Hd8NuC11DruE/SUilaI0=
X-Received: by 2002:a17:90b:3008:b0:2c8:7fad:b96c with SMTP id
 98e67ed59e1d1-2c8a2356842mr1895255a91.9.1719254870671; Mon, 24 Jun 2024
 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Jun 2024 20:47:39 +0200
Message-ID: <CAH9NwWeioHvvvK1SSJMzm3VAkRLtOSOQwys99ZO-mO3DvzYcyQ@mail.gmail.com>
Subject: Re: [etnaviv-next v14 0/8] drm/etnaviv: Add driver wrapper for
 vivante GPUs attached on PCI(e) device
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Hi

>
> drm/etnaviv use the component framework to bind multiple GPU cores to a
> virtual master, the virtual master is manually create during driver load
> time. This works well for various SoCs, yet there are some PCIe card has
> the vivante GPU cores integrated. The driver lacks the support for PCIe
> devices currently.
>
> Adds PCIe driver wrapper on the top of what drm/etnaviv already has, the
> component framework is still being used to bind subdevices, even though
> there is only one GPU core. But the process is going to be reversed, we
> create virtual platform device for each of the vivante GPU IP core shipped
> by the PCIe master. The PCIe master is real, bind all the virtual child
> to the master with component framework.
>
>
> v6:
>         * Fix build issue on system without CONFIG_PCI enabled
> v7:
>         * Add a separate patch for the platform driver rearrangement (Bjorn)
>         * Switch to runtime check if the GPU is dma coherent or not (Lucas)
>         * Add ETNAVIV_PARAM_GPU_COHERENT to allow userspace to query (Lucas)
>         * Remove etnaviv_gpu.no_clk member (Lucas)
>         * Fix Various typos and coding style fixed (Bjorn)
> v8:
>         * Fix typos and remove unnecessary header included (Bjorn).
>         * Add a dedicated function to create the virtual master platform
>           device.
> v9:
>         * Use PCI_VDEVICE() macro (Bjorn)
>         * Add trivial stubs for the PCI driver (Bjorn)
>         * Remove a redundant dev_err() usage (Bjorn)
>         * Clean up etnaviv_pdev_probe() with etnaviv_of_first_available_node()
> v10:
>         * Add one more cleanup patch
>         * Resolve the conflict with a patch from Rob
>         * Make the dummy PCI stub inlined
>         * Print only if the platform is dma-coherrent
> V11:
>         * Drop unnecessary changes (Lucas)
>         * Tweak according to other reviews of v10.
>
> V12:
>         * Create a virtual platform device for the subcomponent GPU cores
>         * Bind all subordinate GPU cores to the real PCI master via component.
>
> V13:
>         * Drop the non-component code path, always use the component framework
>           to bind subcomponent GPU core. Even though there is only one core.
>         * Defer the irq handler register.
>         * Rebase and improve the commit message
>
> V14:
>         * Rebase onto etnaviv-next and improve commit message.
>
> Tested with JD9230P GPU and LingJiu GP102 GPU.
>

I was able to test this series and will do a review in the next few
days. Hopefully this series will land anytime.

[    6.783267] etnaviv 0000:0c:00.0: enabling device (0000 -> 0003)
[    6.783324] etnaviv 0000:0c:00.0: JingJia Micro JM9100 has 1 GPU cores
[    6.783459] etnaviv 0000:0c:00.0: bound etnaviv-gpu,3d.0 (ops
gpu_ops [etnaviv])
[    6.783502] etnaviv-gpu etnaviv-gpu,3d.0: model: GC9200, revision: 6304
[    6.783635] [drm] Initialized etnaviv 1.4.0 20151214 for
0000:0c:00.0 on minor 1

Tested-by: Christian Gmeiner <cgmeiner@igalia.com>


> Sui Jingfeng (8):
>   drm/etnaviv: Add a dedicated helper function to get various clocks
>   drm/etnaviv: Add constructor and destructor for the
>     etnaviv_drm_private structure
>   drm/etnaviv: Embed struct drm_device into struct etnaviv_drm_private
>   drm/etnaviv: Fix wrong cache property being used for vmap()
>   drm/etnaviv: Add support for cached coherent caching mode
>   drm/etnaviv: Replace the '&pdev->dev' with 'dev'
>   drm/etnaviv: Allow creating subdevices and pass platform specific data
>   drm/etnaviv: Add support for vivante GPU cores attached via PCIe
>     device
>
>  drivers/gpu/drm/etnaviv/Kconfig              |   8 +
>  drivers/gpu/drm/etnaviv/Makefile             |   2 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 159 ++++++++++------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  27 +++
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c        |  22 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 144 +++++++++-----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |   4 +
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |   4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c    | 187 +++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h    |  18 ++
>  include/uapi/drm/etnaviv_drm.h               |   1 +
>  12 files changed, 468 insertions(+), 110 deletions(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
>
>
> base-commit: 52272bfff15ee70c7bd5be9368f175948fb8ecfd
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
