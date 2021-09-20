Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D14128E1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8F36E896;
	Mon, 20 Sep 2021 22:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AB06E892;
 Mon, 20 Sep 2021 22:29:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0E16611ED;
 Mon, 20 Sep 2021 22:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632176994;
 bh=g15ySKXfBHHTkZ/UaRqtGCo+E9OuMJ799j+8NNfJwKI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rLCWDs+GGv/2oNpQOyRzHHsujHjsYivDCr8saULzG0DKoLpxsAMdh9Ad9Xmge6ULi
 uQPty1HzDSmlF/ylVlU7x1aIlUW/B9lqqSFki9IsErDfWq4ORqgabmYaKqbVCsHaEt
 98kNmdRAn8XsG6mzybiyY1u5tmC52CAKl4Mq3L+VZC+81e5SjPqblypM8941JZn7ML
 VI5TtS6I5HqsSe5hsnpih5w8LiK9aST1NIEPEzlbWhT+5BmpIjF9y6P30ZsDT/82+n
 MDXxJpnWhzNmNAWUcJVnUCU+AlZxZtlSw3X4MSyexyGh1jARf26eMiRQ9HSMyDjfb0
 RM8parf7Wds8A==
Received: by mail-ed1-f53.google.com with SMTP id h17so67102612edj.6;
 Mon, 20 Sep 2021 15:29:54 -0700 (PDT)
X-Gm-Message-State: AOAM533rWqVx+FKRnxxfrdMA4i9IIJ6Mv8NrVYMKHdNsgHWHHbsQnYp8
 CDJNYIWNyMnuVkyPjIMlHB/acdsoq8iRDIV4TA==
X-Google-Smtp-Source: ABdhPJzOCH0+kbKKP39muYA34RTbU2YXrew5qZ8NtZhH4Wr5vIscHIlOg92RUDHAuHx9XPmIB+4Tpip/3hvrxA4Sq/4=
X-Received: by 2002:a17:907:33ce:: with SMTP id
 zk14mr31139594ejb.84.1632176993353; 
 Mon, 20 Sep 2021 15:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210916073132.ptbbmjetm7v3ufq3@gilmour>
In-Reply-To: <20210916073132.ptbbmjetm7v3ufq3@gilmour>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Sep 2021 17:29:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKcTfgnXNYzGDSFhKS2udhw2Dvk04ODwTxUdDRQjKdT0Q@mail.gmail.com>
Message-ID: <CAL_JsqKcTfgnXNYzGDSFhKS2udhw2Dvk04ODwTxUdDRQjKdT0Q@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>
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

On Thu, Sep 16, 2021 at 2:31 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave, Daniel,
>
> Here's the first drm-misc-next PR for 5.16
>
> Thanks!
> Maxime
>
> drm-misc-next-2021-09-16:
> drm-misc-next for $kernel-version:
>
> UAPI Changes:
>
> Cross-subsystem Changes:
>   - dma-buf: Avoid a warning with some allocations, Remove
>     DMA_FENCE_TRACE macros
>
> Core Changes:
>   - bridge: New helper to git rid of panels in drivers
>   - fence: Improve dma_fence_add_callback documentation, Improve
>     dma_fence_ops->wait documentation
>   - ioctl: Unexport drm_ioctl_permit
>   - lease: Documentation improvements
>   - fourcc: Add new macro to determine the modifier vendor
>   - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
>     Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
>   - resv: Improve the documentation
>   - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
>   - sched: Fix for a timer being canceled too soon, Avoid null pointer
>     derefence if the fence is null in drm_sched_fence_free, Convert
>     drivers to rely on its dependency tracking
>   - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
>     shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
>     unbinding on multiple drivers
>
> Driver Changes:
>   - bochs: New PCI IDs
>   - msm: Fence ordering impromevemnts
>   - stm: Add layer alpha support, zpos
>   - v3d: Fix for a Vulkan CTS failure
>   - vc4: Conversion to the new bridge helpers
>   - vgem: Use shmem helpers
>   - virtio: Support mapping exported vram
>   - zte: Remove obsolete driver
>
>   - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
>     errors propagation improvements for anx7625
>
>   - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-09-1=
6
>
> for you to fetch changes up to e4f868191138975f2fdf2f37c11318b47db4acc9:
>
>   drm/v3d: fix wait for TMU write combiner flush (2021-09-15 18:43:37 +01=
00)
>
> ----------------------------------------------------------------
> drm-misc-next for $kernel-version:
>
> UAPI Changes:
>
> Cross-subsystem Changes:
>   - dma-buf: Avoid a warning with some allocations, Remove
>     DMA_FENCE_TRACE macros
>
> Core Changes:
>   - bridge: New helper to git rid of panels in drivers
>   - fence: Improve dma_fence_add_callback documentation, Improve
>     dma_fence_ops->wait documentation
>   - ioctl: Unexport drm_ioctl_permit
>   - lease: Documentation improvements
>   - fourcc: Add new macro to determine the modifier vendor
>   - quirks: Add the Steam Deck, Chuwi HiBook, Chuwi Hi10 Pro, Samsung
>     Galaxy Book 10.6, KD Kurio Smart C15200 2-in-1, Lenovo Ideapad D330
>   - resv: Improve the documentation
>   - shmem-helpers: Allocate WC pages on x86, Switch to vmf_insert_pfn
>   - sched: Fix for a timer being canceled too soon, Avoid null pointer
>     derefence if the fence is null in drm_sched_fence_free, Convert
>     drivers to rely on its dependency tracking
>   - ttm: Switch to kerneldoc, new helper to clear all DMA mappings, pool
>     shrinker optitimization, Remove ttm_tt_destroy_common, Fix for
>     unbinding on multiple drivers
>
> Driver Changes:
>   - bochs: New PCI IDs
>   - msm: Fence ordering impromevemnts
>   - stm: Add layer alpha support, zpos
>   - v3d: Fix for a Vulkan CTS failure
>   - vc4: Conversion to the new bridge helpers
>   - vgem: Use shmem helpers
>   - virtio: Support mapping exported vram
>   - zte: Remove obsolete driver
>
>   - bridge: Probe improvements for it66121, enable DSI EOTP for anx7625,
>     errors propagation improvements for anx7625
>
>   - panels: 60fps mode for otm8009a, New driver for Samsung S6D27A1
>
> ----------------------------------------------------------------
> Alyssa Rosenzweig (2):
>       drm/panfrost: Use upper/lower_32_bits helpers
>       drm/plane: Fix comment typo
>
> Andrey Grodzovsky (2):
>       drm/ttm: Create pinned list
>       drm/ttm: Clear all DMA mappings on demand
>
> Boris Brezillon (2):
>       panfrost: Don't cleanup the job if it was successfully queued
>       drm/sched: Fix drm_sched_fence_free() so it can be passed an uninit=
ialized fence
>
> Cai Huoqing (7):
>       drm/bridge: cdns: Make use of the helper function devm_platform_ior=
emap_resource()
>       drm: adv7511: Convert to SPDX identifier
>       drm/vc4: Make use of the helper function devm_platform_ioremap_reso=
urce()
>       drm/sun4i: Make use of the helper function devm_platform_ioremap_re=
source()
>       drm/panfrost: Make use of the helper function devm_platform_ioremap=
_resource()
>       drm/mcde: Make use of the helper function devm_platform_ioremap_res=
ource()
>       drm/meson: Make use of the helper function devm_platform_ioremap_re=
sourcexxx()
>
> Charan Teja Reddy (1):
>       dma-buf: WARN on dmabuf release with pending attachments
>
> Christian K=C3=B6nig (21):
>       dma-buf: nuke seqno-fence
>       drm/vmwgfx: unbind in vmw_ttm_unpopulate
>       drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
>       drm/nouveau: unbind in nouveau_ttm_tt_unpopulate
>       drm/radeon: unbind in radeon_ttm_tt_unpopulate()
>       drm/ttm: remove ttm_tt_destroy_common v2
>       mm/vmscan: add sync_shrinkers function v3
>       drm/ttm: optimize the pool shrinker a bit v2
>       dma-buf: nuke DMA_FENCE_TRACE macros v2
>       dma-buf: cleanup kerneldoc of removed component
>       dma-buf: clarify dma_fence_ops->wait documentation
>       dma-buf: clarify dma_fence_add_callback documentation
>       drm/ttm: cleanup ttm_resource_compat
>       drm/ttm: remove the outdated kerneldoc section
>       drm/ttm: add some general module kerneldoc
>       drm/ttm: add kerneldoc for enum ttm_caching
>       drm/ttm: enable TTM device object kerneldoc v2
>       drm/ttm: enable TTM resource object kerneldoc v2
>       drm/ttm: enable TTM placement kerneldoc
>       drm/ttm: enable TTM TT object kerneldoc v2
>       drm/ttm: enable TTM page pool kerneldoc
>
> Christophe JAILLET (1):
>       drm/r128: switch from 'pci_' to 'dma_' API
>
> Daniel Vetter (16):
>       drm/shmem-helper: Switch to vmf_insert_pfn
>       drm/shmem-helpers: Allocate wc pages on x86
>       drm/vgem: use shmem helpers
>       drm/sched: Split drm_sched_job_init
>       drm/msm: Improve drm/sched point of no return rules
>       drm/sched: Barriers are needed for entity->last_scheduled
>       drm/sched: Add dependency tracking
>       drm/sched: drop entity parameter from drm_sched_push_job
>       drm/sched: improve docs around drm_sched_entity
>       drm/panfrost: use scheduler dependency tracking
>       drm/lima: use scheduler dependency tracking
>       drm/v3d: Move drm_sched_job_init to v3d_job_init
>       drm/v3d: Use scheduler dependency handling
>       drm/msm: Use scheduler dependency handling
>       drm/msm: Don't break exclusive fence ordering
>       dma-resv: Give the docs a do-over
>
> David Stevens (1):
>       drm/virtio: support mapping exported vram
>
> Desmond Cheong Zhi Xi (1):
>       drm: unexport drm_ioctl_permit
>
> Douglas Anderson (1):
>       drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
>
> F.A.Sulaiman (1):
>       GPU: drm: fix style errors
>
> H. Peter Anvin (Intel) (1):
>       drm/bochs: add Bochs PCI ID for Simics model
>
> Hans de Goede (11):
>       drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk=
 (v2)
>       drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 =
2-in-1
>       drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Boo=
k 10.6
>       drm: panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro
>       drm/connector: Give connector sysfs devices there own device_type
>       drm/connector: Add a fwnode pointer to drm_connector and register w=
ith ACPI (v2)
>       drm/connector: Add drm_connector_find_by_fwnode() function (v3)
>       drm/connector: Add support for out-of-band hotplug notification (v3=
)
>       usb: typec: altmodes/displayport: Make dp_altmode_notify() more gen=
eric
>       usb: typec: altmodes/displayport: Notify drm subsys of hotplug even=
ts
>       drm: panel-orientation-quirks: Add quirk for the Chuwi HiBook
>
> Huang Rui (1):
>       drm/ttm: fix the type mismatch error on sparc64
>
> Iago Toral Quiroga (1):
>       drm/v3d: fix wait for TMU write combiner flush
>
> Javier Martinez Canillas (1):
>       drm: Remove unused code to load the non-existing fbcon.ko
>
> Jernej Skrabec (1):
>       drm/sun4i: Fix macros in sun8i_csc.h
>
> John Stultz (1):
>       dma-buf: system_heap: Avoid warning on mid-order allocations
>
> Krzysztof Kozlowski (1):
>       dt-bindings: panel: ili9341: correct indentation

I already mentioned this on the patch, but this is 5.15 material and
needs to go in drm-misc-next-fixes. Otherwise, we'll just keep getting
patches for this. 2 duplicates so far.

Rob
