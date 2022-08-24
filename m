Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0159FD05
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55410E5C7;
	Wed, 24 Aug 2022 14:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD1410EFB6;
 Wed, 24 Aug 2022 14:15:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gb36so33767018ejc.10;
 Wed, 24 Aug 2022 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3RY0kXIvgqIVojhkrE4Zwlr7wJlH94oU+XFloUi3XjI=;
 b=k433WZpJORtGGgjLBRUCWg89Ct3eMmhhzzPwfTl6//mc8KZmXsfUkvjXK2CPv2G6j9
 FW4/JFsVFe8WZ8qXfiG0G2WUSXJhVho/22M2ZvYonWllG8JjwTj6MhS+/biMgV4nO5Zr
 llPWeve491++YksKYHfxR6w08hbYD3Jv+FtIHtqkeqoTfLN6sUfa2AlD62I2SrAPThJb
 x/pSysLoKr056pSqqIrDP4Zf5umrg7az72DW3OYvoPJOZdkczmoNmarSqM1+dim8Vhiv
 BxZj98y4ZeYDVEzsmdne2xhUZzSQUjC7gSpIH2W4w1Iq4MHPRdAGpb04pB6x8cp2I0OU
 nIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3RY0kXIvgqIVojhkrE4Zwlr7wJlH94oU+XFloUi3XjI=;
 b=ZWrHq9vlfbCSdP3nmUlmaNMB+Gh/mzuSxr8gCgu316qK5f+rSNNnvr5wWK3dU8pnMa
 KrLeDsPMLD/dhgs2T8Jq1qcDfWz+xcDMTwQDyKU1nq7G9RCu3dsl9IPwMI2xjoo/VTkm
 GJyqVLTOdzPxqv0sKFEeYuZYfdRsXt8xEL2sBB6pOwK6WhCATFYRMvxsFPZKYP+gtGtz
 7tzN8VjQjuV2jNKVwbDJ3C8ZNLs7AEq5O8wwCvJ4BMq9vbGakoWYftn8rsH8XmpK7fGE
 8OVn7U17IugnBtAaPzT8/JOZvp/jEAF/LmxD0P451mkwh3/4dPf/UKXRYi01N3FR1Hnh
 spZg==
X-Gm-Message-State: ACgBeo3DJ3H8V7WtuGYuBlgwFH9V4HEa+EtoFXifVHZ1WlR37XW3nx1z
 w1cNw7Alcw9kKflCU+aCgSE=
X-Google-Smtp-Source: AA6agR5vl7eAC3d146n4WFT7uLsC77WQL4B00T85StELI9JlyPgaC5TszQICKao2kaYSaa7iVSFw9A==
X-Received: by 2002:a17:907:7256:b0:73d:9c6b:35e2 with SMTP id
 ds22-20020a170907725600b0073d9c6b35e2mr2992627ejc.197.1661350503452; 
 Wed, 24 Aug 2022 07:15:03 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:62ca:57d9:b533:6057?
 ([2a02:908:1256:79a0:62ca:57d9:b533:6057])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056402051a00b004464c3de6dasm3147684edv.65.2022.08.24.07.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 07:15:02 -0700 (PDT)
Message-ID: <79cf9887-64ad-9cfd-035a-4b6e41b864e0@gmail.com>
Date: Wed, 24 Aug 2022 16:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/9] Move all drivers to a common dma-buf locking
 convention
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Christian König <christian.koenig@amd.com> to patches #2-#4

Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
> Hello,
>
> This series moves all drivers to a dynamic dma-buf locking specification.
>  From now on all dma-buf importers are made responsible for holding
> dma-buf's reservation lock around all operations performed over dma-bufs
> in accordance to the locking specification. This allows us to utilize
> reservation lock more broadly around kernel without fearing of a potential
> deadlocks.
>
> This patchset passes all i915 selftests. It was also tested using VirtIO,
> Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
> of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
> which covers majority of kernel drivers since rest of the drivers share
> same or similar code paths.
>
> Changelog:
>
> v3: - Factored out dma_buf_mmap_unlocked() and attachment functions
>        into aseparate patches, like was suggested by Christian König.
>
>      - Corrected and factored out dma-buf locking documentation into
>        a separate patch, like was suggested by Christian König.
>
>      - Intel driver dropped the reservation locking fews days ago from
>        its BO-release code path, but we need that locking for the imported
>        GEMs because in the end that code path unmaps the imported GEM.
>        So I added back the locking needed by the imported GEMs, updating
>        the "dma-buf attachment locking specification" patch appropriately.
>
>      - Tested Nouveau+Intel dma-buf import/export combo.
>
>      - Tested udmabuf import to i915/Nouveau/AMDGPU.
>
>      - Fixed few places in Etnaviv, Panfrost and Lima drivers that I missed
>        to switch to locked dma-buf vmapping in the drm/gem: Take reservation
>        lock for vmap/vunmap operations" patch. In a result invalidated the
>        Christian's r-b that he gave to v2.
>
>      - Added locked dma-buf vmap/vunmap functions that are needed for fixing
>        vmappping of Etnaviv, Panfrost and Lima drivers mentioned above.
>        I actually had this change stashed for the drm-shmem shrinker patchset,
>        but then realized that it's already needed by the dma-buf patches.
>        Also improved my tests to better cover these code paths.
>
> v2: - Changed locking specification to avoid problems with a cross-driver
>        ww locking, like was suggested by Christian König. Now the attach/detach
>        callbacks are invoked without the held lock and exporter should take the
>        lock.
>
>      - Added "locking convention" documentation that explains which dma-buf
>        functions and callbacks are locked/unlocked for importers and exporters,
>        which was requested by Christian König.
>
>      - Added ack from Tomasz Figa to the V4L patches that he gave to v1.
>
> Dmitry Osipenko (9):
>    dma-buf: Add _unlocked postfix to function names
>    dma-buf: Add locked variant of dma_buf_vmap/vunmap()
>    drm/gem: Take reservation lock for vmap/vunmap operations
>    dma-buf: Move dma_buf_vmap/vunmap_unlocked() to dynamic locking
>      specification
>    dma-buf: Move dma_buf_mmap_unlocked() to dynamic locking specification
>    dma-buf: Move dma-buf attachment to dynamic locking specification
>    dma-buf: Document dynamic locking convention
>    media: videobuf2: Stop using internal dma-buf lock
>    dma-buf: Remove internal lock
>
>   Documentation/driver-api/dma-buf.rst          |   6 +
>   drivers/dma-buf/dma-buf.c                     | 276 ++++++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +-
>   drivers/gpu/drm/armada/armada_gem.c           |  14 +-
>   drivers/gpu/drm/drm_client.c                  |   4 +-
>   drivers/gpu/drm/drm_gem.c                     |  24 ++
>   drivers/gpu/drm/drm_gem_dma_helper.c          |   6 +-
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
>   drivers/gpu/drm/drm_gem_ttm_helper.c          |   9 +-
>   drivers/gpu/drm/drm_prime.c                   |  12 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   4 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 +
>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  20 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   8 +-
>   drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>   drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>   drivers/gpu/drm/tegra/gem.c                   |  27 +-
>   drivers/infiniband/core/umem_dmabuf.c         |  11 +-
>   .../common/videobuf2/videobuf2-dma-contig.c   |  26 +-
>   .../media/common/videobuf2/videobuf2-dma-sg.c |  23 +-
>   .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
>   .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  12 +-
>   drivers/misc/fastrpc.c                        |  12 +-
>   drivers/xen/gntdev-dmabuf.c                   |  14 +-
>   include/drm/drm_gem.h                         |   3 +
>   include/linux/dma-buf.h                       |  57 ++--
>   32 files changed, 410 insertions(+), 242 deletions(-)
>

