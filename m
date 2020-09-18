Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5A26F5BB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 08:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300B6E10B;
	Fri, 18 Sep 2020 06:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7646E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:07:02 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r24so4087545ljm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 23:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILLtYDh87Hnf9dA6vVS4B7psVL7r7MTKfeGqDa+SuKE=;
 b=xu+0pooH8LiZDIx8k+PJPkqxKyO32tFfHElOtANSYujXsHlpbt9GYPehidVtEWjXNc
 /xXXU+SiXhhV3tr4L3m+CIptvYV9Y1sWjYBj8WA56yU7s/7WSQGfMxqHUrXiCP+Vkwzc
 rbTTOwP/FDgWbP0pNGUrmSktbFVvHDWG3Tb39PWpXuO4WsbpvOhX7D0h7hEM9jAkTZkj
 f08exOXNYS1HY9+Aqc9CZYVTuH+vJ+A0XrHZ1ELPpXxNrAW6ZJuG3d/8KAZK9gBIeH98
 izVqAFItF/kqSVd5X+drWxPWZiRPQpKhEvFC80MCdY3cJMOzEPLjMLled+pEAcD3ztnl
 D6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILLtYDh87Hnf9dA6vVS4B7psVL7r7MTKfeGqDa+SuKE=;
 b=YUrXSCKH4cifM/NmgERN116YR/0NYNjaPEMntS3GqhkbOBRWarO88m9AhL+a2aQZY8
 KwhzmslBp5TyqyzFC8+bbi5V7D2eB5/prhOpsVk/q/IwyscV5n/f7MLJP34dqvMymFtj
 q5VPKM5X4YY71AhzH4hMF63berIJn3l6JixwSsT1r+7jD5r41xtgwWVd9jGRvznbKV+3
 SqxhuK1gjKtUImEZsASoHXwKZ6b4Tvp7AVntyELowRhnuGmXa+p5lJSwblS8JLy/kHUz
 JupOd7uKg78gi+o12SXLuQfmpmoIyAI4n9Whgzx7Jk5oey93Jitg3O0FSYW4EHGzJjnN
 4qcQ==
X-Gm-Message-State: AOAM5331k4pSkE9z/NA0P+M0lIGLtp0sAGIwZ9Gw8gdDiTobwvaMfUXQ
 yb79ah/PNDlJoeXyZTqCoo5qTzYRBkpIlH7fvMqfUA==
X-Google-Smtp-Source: ABdhPJyEXZuLz/9VD9TgkWSbpgqwjYtEuhse8iQmZ+kvD+VMvEh/eMgZha0C2GrZshLMMBrho/gEjAYIvq4mDVItvuo=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr10298851ljh.249.1600409220979; 
 Thu, 17 Sep 2020 23:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200914112521.1327-1-tzimmermann@suse.de>
In-Reply-To: <20200914112521.1327-1-tzimmermann@suse.de>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 18 Sep 2020 11:36:49 +0530
Message-ID: <CAO_48GGUiVbWBWdzDYWAH2N9Lp2AU+-78BcYyi-3+LXHM74JQA@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@linux.ie>,
 mark.cave-ayland@ilande.co.uk,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, jonathanh@nvidia.com,
 matthew.auld@intel.com, Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Pawel Osciak <pawel@osciak.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On Mon, 14 Sep 2020 at 16:55, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
> of dma-buf memory in kernel address space. The functions operate with plain
> addresses and the assumption is that the memory can be accessed with load
> and store operations. This is not the case on some architectures (e.g.,
> sparc64) where I/O memory can only be accessed with dedicated instructions.
>
> This patchset introduces struct dma_buf_map, which contains the address of
> a buffer and a flag that tells whether system- or I/O-memory instructions
> are required.

Thank you for the patchset - it is a really nice, clean bit to add!
>
> Some background: updating the DRM framebuffer console on sparc64 makes the
> kernel panic. This is because the framebuffer memory cannot be accessed with
> system-memory instructions. We currently employ a workaround in DRM to
> address this specific problem. [1]
>
> To resolve the problem, we'd like to address it at the most common point,
> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> instructions are required and exports this information to it's users. The
> new structure struct dma_buf_map stores the buffer address and a flag that
> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> can then access the memory accordingly.
>
> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> and it's interfaces. Further patches can update dma-buf users. For example,
> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
>
> Further work: TTM, one of DRM's memory managers, already exports an
> is_iomem flag of its own. It could later be switched over to exporting struct
> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> fbdev console to operate on I/O memory. These could possibly be switched over
> to the generic fbdev emulation, as soon as the generic code uses struct
> dma_buf_map.
>
> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
>
> Thomas Zimmermann (3):
>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces

FWIW, for the series, please feel free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
>  Documentation/driver-api/dma-buf.rst          |   3 +
>  drivers/dma-buf/dma-buf.c                     |  40 +++---
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
>  drivers/gpu/drm/drm_prime.c                   |  14 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
>  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
>  include/drm/drm_prime.h                       |   5 +-
>  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
>  include/linux/dma-buf.h                       |  11 +-
>  15 files changed, 274 insertions(+), 82 deletions(-)
>  create mode 100644 include/linux/dma-buf-map.h
>
> --
> 2.28.0
>

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
