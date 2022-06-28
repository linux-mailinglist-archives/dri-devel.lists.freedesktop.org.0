Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154655EA1E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 18:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901C0113CDC;
	Tue, 28 Jun 2022 16:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76D7113AA8;
 Tue, 28 Jun 2022 16:47:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r20so18579823wra.1;
 Tue, 28 Jun 2022 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n3HZDcdfLwNiQ/tf7zCGAV+A8ooVMIqgPIQ28MjTeog=;
 b=e3zeLjiXoUYC1IVaQKWrsc2qKrKVYQG+FiwqsRzNz/YxbDT0nHSgZ8eR2tVfrLi0Hs
 5GLXKpxS/5dpbABkwwBi+kl4n0khKod1v0GPWJ89X1h3TNUjfC7RS4740ITfxK5/nbrh
 SHkGrTqHNILhXqHROw320nvIeM2Nre2164Aj2miAgQcaKDnte8RFr2pkEHfcg3h7Vbln
 87QzWotvsNkfT2Db3zhU9670nwzLrALbqwb/9ZXx2DFpvoAA8Xva7TAYCeAEhYv0BfZt
 Gn6YjailqEcJJ+mqGAUnmO0/+pJ+0fHuqqBi12yhe5oQnxR7ZUa+HprAzGiPrKPmAQgn
 fCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n3HZDcdfLwNiQ/tf7zCGAV+A8ooVMIqgPIQ28MjTeog=;
 b=OjhiqD6bz/appPLq+E/jS9LG5GPv+9ciURQzPVYVn9xRX6ZtZ6WX1PmwRQF6U4ih2r
 2NZJQ3vw/anSLYHIh69jmvxrDeYyCyrv10p7cYDvW2mNWnloOv/ABV3Ex1MOS+QUDQ3u
 PZUydGCNrTRg+hPR4lpIl3yxrd8dhg9AG/78awDFUjugJQGp9ZqGSxoRdBt9dQgrK3N3
 XPxT7wIH6b+apcXTZdPcQMKEkbiGbzdLsIgaynNuoNUt4Rkg/czM/rwWUaQcRTaPR8tC
 XxZsvYfGQpdLDNMVqkPZiQgb9F2dDZZQdrEA23xeGPeaHsWYS5JyzZ5OpyuF4J59xLNH
 92kw==
X-Gm-Message-State: AJIora/49LLZOsApNHapDFqgnt+1jzB7N0ztQZHRXR7b3145c3OtcdUl
 ndKYDn6xM8eVtyQWJ6rdjsFX7OrZosnQCuJxmS0=
X-Google-Smtp-Source: AGRyM1shfbz2wZj9C+y4AJcD4Xp16+D3E3FTqL5mLWkwiHI8GjKt117H2EdLaDQl5pCDFAKa86OSOaxFM0gmoOv0egA=
X-Received: by 2002:a5d:6d8b:0:b0:21b:9814:793d with SMTP id
 l11-20020a5d6d8b000000b0021b9814793dmr18409107wrs.344.1656434876256; Tue, 28
 Jun 2022 09:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <49cc6f0c-e90e-8edd-52e7-4188620e2c28@arm.com>
 <f77c1c2d-d9f9-db00-906a-ec10b535621d@collabora.com>
In-Reply-To: <f77c1c2d-d9f9-db00-906a-ec10b535621d@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jun 2022 09:48:09 -0700
Message-ID: <CAF6AEGsQBcHbU6Ps5fp5v6ANaZwMAtig-3i-ekQzwG=7BBDNwA@mail.gmail.com>
Subject: Re: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 5:51 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 6/28/22 15:31, Robin Murphy wrote:
> > ----->8-----
> > [   68.295951] ======================================================
> > [   68.295956] WARNING: possible circular locking dependency detected
> > [   68.295963] 5.19.0-rc3+ #400 Not tainted
> > [   68.295972] ------------------------------------------------------
> > [   68.295977] cc1/295 is trying to acquire lock:
> > [   68.295986] ffff000008d7f1a0
> > (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_shmem_free+0x7c/0x198
> > [   68.296036]
> > [   68.296036] but task is already holding lock:
> > [   68.296041] ffff80000c14b820 (fs_reclaim){+.+.}-{0:0}, at:
> > __alloc_pages_slowpath.constprop.0+0x4d8/0x1470
> > [   68.296080]
> > [   68.296080] which lock already depends on the new lock.
> > [   68.296080]
> > [   68.296085]
> > [   68.296085] the existing dependency chain (in reverse order) is:
> > [   68.296090]
> > [   68.296090] -> #1 (fs_reclaim){+.+.}-{0:0}:
> > [   68.296111]        fs_reclaim_acquire+0xb8/0x150
> > [   68.296130]        dma_resv_lockdep+0x298/0x3fc
> > [   68.296148]        do_one_initcall+0xe4/0x5f8
> > [   68.296163]        kernel_init_freeable+0x414/0x49c
> > [   68.296180]        kernel_init+0x2c/0x148
> > [   68.296195]        ret_from_fork+0x10/0x20
> > [   68.296207]
> > [   68.296207] -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
> > [   68.296229]        __lock_acquire+0x1724/0x2398
> > [   68.296246]        lock_acquire+0x218/0x5b0
> > [   68.296260]        __ww_mutex_lock.constprop.0+0x158/0x2378
> > [   68.296277]        ww_mutex_lock+0x7c/0x4d8
> > [   68.296291]        drm_gem_shmem_free+0x7c/0x198
> > [   68.296304]        panfrost_gem_free_object+0x118/0x138
> > [   68.296318]        drm_gem_object_free+0x40/0x68
> > [   68.296334]        drm_gem_shmem_shrinker_run_objects_scan+0x42c/0x5b8
> > [   68.296352]        drm_gem_shmem_shrinker_scan_objects+0xa4/0x170
> > [   68.296368]        do_shrink_slab+0x220/0x808
> > [   68.296381]        shrink_slab+0x11c/0x408
> > [   68.296392]        shrink_node+0x6ac/0xb90
> > [   68.296403]        do_try_to_free_pages+0x1dc/0x8d0
> > [   68.296416]        try_to_free_pages+0x1ec/0x5b0
> > [   68.296429]        __alloc_pages_slowpath.constprop.0+0x528/0x1470
> > [   68.296444]        __alloc_pages+0x4e0/0x5b8
> > [   68.296455]        __folio_alloc+0x24/0x60
> > [   68.296467]        vma_alloc_folio+0xb8/0x2f8
> > [   68.296483]        alloc_zeroed_user_highpage_movable+0x58/0x68
> > [   68.296498]        __handle_mm_fault+0x918/0x12a8
> > [   68.296513]        handle_mm_fault+0x130/0x300
> > [   68.296527]        do_page_fault+0x1d0/0x568
> > [   68.296539]        do_translation_fault+0xa0/0xb8
> > [   68.296551]        do_mem_abort+0x68/0xf8
> > [   68.296562]        el0_da+0x74/0x100
> > [   68.296572]        el0t_64_sync_handler+0x68/0xc0
> > [   68.296585]        el0t_64_sync+0x18c/0x190
> > [   68.296596]
> > [   68.296596] other info that might help us debug this:
> > [   68.296596]
> > [   68.296601]  Possible unsafe locking scenario:
> > [   68.296601]
> > [   68.296604]        CPU0                    CPU1
> > [   68.296608]        ----                    ----
> > [   68.296612]   lock(fs_reclaim);
> > [   68.296622] lock(reservation_ww_class_mutex);
> > [   68.296633]                                lock(fs_reclaim);
> > [   68.296644]   lock(reservation_ww_class_mutex);
> > [   68.296654]
> > [   68.296654]  *** DEADLOCK ***
>
> This splat could be ignored for now. I'm aware about it, although
> haven't looked closely at how to fix it since it's a kind of a lockdep
> misreporting.

The lockdep splat could be fixed with something similar to what I've
done in msm, ie. basically just not acquire the lock in the finalizer:

https://patchwork.freedesktop.org/patch/489364/

There is one gotcha to watch for, as danvet pointed out
(scan_objects() could still see the obj in the LRU before the
finalizer removes it), but if scan_objects() does the
kref_get_unless_zero() trick, it is safe.

BR,
-R
