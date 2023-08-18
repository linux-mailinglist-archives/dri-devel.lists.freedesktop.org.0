Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C7781591
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 00:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6A10E0E8;
	Fri, 18 Aug 2023 22:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EB410E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 22:59:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe2d620d17so28225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692399577; x=1693004377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjc6W4qIElSDAB9zQnuCpuPFWXY0DCdIamfGSv7Opjw=;
 b=an23UipXmYEj0qZZGaAaQEEHtRF3XGcoW2M2fln8j/IUzsSr1c3mjhQtS5S3aplXwD
 RWQ98LHV1Wo8HGkzPIcEWADwjkQCjWc1s/q0A2dAAUR+YdeVZYSWjRqe6hOx4gqTqXjJ
 t0A1CGS5HRc152U8DAC3oN18vXvU5a6dasRvarFaDxeyhsF7/ScVc4zSURgox2taHV4R
 Q+HAvNVYQwH6Y0EMAGMyEGdx9arrhJHG1/plGQp5LJ0AjGDwb8rpn/2mrNPJwtkWpQeH
 /DEBXnewHr7mhTDro9+ExMwYxTh0xya2mLLXQFHitD0NOsQJToExK5hC4fhqYW5I/KuF
 W9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692399577; x=1693004377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjc6W4qIElSDAB9zQnuCpuPFWXY0DCdIamfGSv7Opjw=;
 b=R0UonlAirC8odcqsPlksuxyomsEjRxpUaH95pc8RB2Dir6UlDr29ONtFSrhFkLewvI
 9V/QRASJFtelv63WmPOm3TjtKeRYUTWkEBtoYsU2e+5w3r7dbX1/oFVZ9GGRDiu/m2vY
 vQbXXnZ2Nr9/P5Jh9PIFx9EpBUgmb7bew6//cJhEmaqjBA+j6bxnmPFZEK1dxzS2Swhc
 Td+50vvAzgMz75WRcmmbAcNc7qB6d61ysDwJa96nbeA3Bol/6HSs5wC0lbnBzD8Df9Qw
 dRv5zhqpPsTdB8L4Duwo9yBPyt9JS/ivkN7aMXCKnINXK7L1gY5rekg9YkdZiG1irSsX
 8lkQ==
X-Gm-Message-State: AOJu0Yzhk1EthRfvevIBbgv3By1hB366FsmKAOwgjK6Jm++7oAYtmBN2
 UOhY9f7WQsmCZgqpZ89P54An/x3G5FSa3YpOcXVliA==
X-Google-Smtp-Source: AGHT+IHtj2y1kPRRTz0BK2zSlxVaSfYYZ2YqYiY5rtCGuatU55XLHG+gKmEtJ3p/lGaxJ44Bk6Cse+yWONNQNdj+yRk=
X-Received: by 2002:a05:600c:2241:b0:3fe:d691:7d63 with SMTP id
 a1-20020a05600c224100b003fed6917d63mr85940wmm.6.1692399577383; Fri, 18 Aug
 2023 15:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-9-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-9-sarah.walker@imgtec.com>
From: Jann Horn <jannh@google.com>
Date: Sat, 19 Aug 2023 00:59:00 +0200
Message-ID: <CAG48ez3txsRAPUODJvAcEiW+Mrt3Y=2j=zxmH5OkEmX_6aSYig@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] drm/imagination: Add GEM and VM related code
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, Matt Coster <matt.coster@imgtec.com>,
 luben.tuikov@amd.com, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 10:25=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:
> Add a GEM implementation based on drm_gem_shmem, and support code for the
> PowerVR GPU MMU. The GPU VA manager is used for address space management.
[...]
> +/**
> + * pvr_mmu_flush() - Request flush of all MMU caches.
> + * @pvr_dev: Target PowerVR device.
> + *
> + * This function must be called following any possible change to the MMU=
 page
> + * tables.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * Any error encountered while submitting the flush command via the K=
CCB.
> + */
> +int
> +pvr_mmu_flush(struct pvr_device *pvr_dev)
> +{
> +       /* TODO: implement */
> +       return -ENODEV;
> +}

pvr_mmu_flush() being an operation that can fail looks dodgy to me.
Especially given that a later patch implements pvr_mmu_flush() such
that it looks like it can hit a transient failure on the path:

pvr_mmu_flush
  pvr_kccb_send_cmd
    pvr_kccb_send_cmd_powered
      pvr_kccb_reserve_slot_sync

pvr_kccb_reserve_slot_sync() even looks like it could transiently fail
without even once calling pvr_kccb_try_reserve_slot() if it gets
preempted until RESERVE_SLOT_TIMEOUT time has passed between the first
and the second read of "jiffies". (Which is probably not very likely
to happen by chance, but Android devices are typically configured with
full kernel preemption, so if an attacker causes pvr_mmu_flush() to
run in a process with a SCHED_IDLE scheduling policy and deliberately
preempts the process at the right point, they might be able to achieve
this.) A more robust retry pattern might be to do a fixed number of
retry iterations with sleeps in between instead of retrying until a
fixed amount of time has passed; though I still wouldn't want to rely
on that for making sure that a TLB flush happens.

In my opinion, any error path of pvr_mmu_flush() should guarantee that
by the time it returns, the address space is no longer used by the GPU
and can never be used by the GPU again.

[...]
> +/**
> + * struct pvr_mmu_op_context - context holding data for individual
> + * device-virtual mapping operations. Intended for use with a VM bind op=
eration.
> + */
> +struct pvr_mmu_op_context {
> +       /** @mmu_ctx: The MMU context associated with the owning VM conte=
xt. */
> +       struct pvr_mmu_context *mmu_ctx;
> +
> +       /** @map: Data specifically for map operations. */
> +       struct {
> +               /**
> +                * @sgt: Scatter gather table containing pages pinned for=
 use by
> +                * this context - these are currently pinned when initial=
ising
> +                * the VM bind operation.
> +                */
> +               struct sg_table *sgt;
> +
> +               /** @sgt_offset: Start address of the device-virtual mapp=
ing. */
> +               u64 sgt_offset;
> +       } map;
> +
> +       /**
> +        * @l1_free_tables: Preallocated l1 page table objects for use by=
 this
> +        * context when creating a page mapping. Linked list created duri=
ng
> +        * initialisation. Also used to collect page table objects freed =
by an
> +        * unmap.
> +        */
> +       struct pvr_page_table_l1 *l1_free_tables;
> +
> +       /**
> +        * @l0_free_tables: Preallocated l0 page table objects for use by=
 this
> +        * context when creating a page mapping. Linked list created duri=
ng
> +        * initialisation. Also used to collect page table objects freed =
by an
> +        * unmap.
> +        */
> +       struct pvr_page_table_l0 *l0_free_tables;

The free page table lists are shared between page table allocation and
freeing within one operation, and they have last-in-first-out (stack)
behavior, which means that when a pvr_vm_map() invocation does
pvr_vm_gpuva_unmap() invocations followed by pvr_vm_gpuva_map()
invocations, it can end up immediately reusing the freed page tables
within the same operation, right?
Since pvr_mmu_flush() only happens in pvr_mmu_op_context_destroy() at
the end of pvr_vm_map(), that means a concurrent GPU page table walk
could walk down to the old address where a page table used to be
mapped, and then observe the page table entries that were created at
the new address to which the page table was moved? Like:


GPU         AP
=3D=3D=3D         =3D=3D
load L2 PTE for VA A
load L1 PTE for VA A, it contains a reference to L0 table T1
            pvr_page_table_l1_remove() removes L0 table T1 for VA A
            pvr_page_table_l1_remove() removes L0 table T2 for VA B
            pvr_page_table_l1_insert() inserts L0 table T2 at VA A
            pvr_page_table_l1_insert() inserts L0 table T1 at VA B
            pvr_page_table_l0_insert() inserts PTE into T1 for VA B
load L0 PTE for VA A from L0 table T1


And since page tables also don't seem to be cache-flushed when they
are put on these freelists, this could maybe also happen the other way
around: The GPU walks down into a page table that was moved to a new
address, but observes PTEs from the old address at which the page
table was previously mapped?

> +
> +       /**
> +        * @curr_page - A reference to a single physical page as indexed =
by
> +        * the page table structure.
> +        */
> +       struct pvr_page_table_ptr curr_page;
> +
> +       /**
> +        * @sync_level_required: The maximum level of the page table tree
> +        * structure which has (possibly) been modified since it was last
> +        * flushed to the device.
> +        *
> +        * This field should only be set with pvr_mmu_op_context_require_=
sync()
> +        * or indirectly by pvr_mmu_op_context_sync_partial().
> +        */
> +       enum pvr_mmu_sync_level sync_level_required;
> +};
[...]
> +/**
> + * pvr_mmu_unmap() - Unmap pages from a memory context.
> + * @op_ctx: Target MMU op context.
> + * @device_addr: First device-virtual address to unmap.
> + * @size: Size in bytes to unmap.
> + *
> + * The total amount of device-virtual memory unmapped is
> + * @nr_pages * %PVR_DEVICE_PAGE_SIZE.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * Any error code returned by pvr_page_table_ptr_init(), or
> + *  * Any error code returned by pvr_page_table_ptr_unmap().
> + */
> +int pvr_mmu_unmap(struct pvr_mmu_op_context *op_ctx, u64 device_addr, u6=
4 size)
> +{
> +       int err =3D pvr_mmu_op_context_set_curr_page(op_ctx, device_addr,=
 false);
> +
> +       if (err)
> +               return err;
> +
> +       return pvr_mmu_op_context_unmap_curr_page(op_ctx,
> +                                                 size >> PVR_DEVICE_PAGE=
_SHIFT);
> +}

I think we can get here in the middle of this call path:

  pvr_ioctl_vm_unmap
    pvr_vm_unmap
      pvr_mmu_op_context_create
      mutex_lock(&vm_ctx->lock);
      drm_gpuva_sm_unmap
        __drm_gpuva_sm_unmap
          loop:
            op_unmap_cb [conditional]
              pvr_vm_gpuva_unmap
                pvr_mmu_unmap [WE ARE HERE]
                  pvr_mmu_op_context_set_curr_page
                    pvr_mmu_op_context_sync [CACHE FLUSH]
                    pvr_mmu_op_context_load_tables
                  pvr_mmu_op_context_unmap_curr_page
                    pvr_page_destroy [conditional]
                    loop:
                      pvr_mmu_op_context_next_page
                        pvr_mmu_op_context_sync_partial [CACHE FLUSH]
                        pvr_mmu_op_context_load_tables
                      pvr_page_destroy
                        pvr_page_table_l0_remove [REMOVES PTE]
                          pvr_page_table_l1_remove [conditional]
                        pvr_mmu_op_context_require_sync
                drm_gpuva_unmap
                drm_gpuva_unlink
                kfree(op->unmap.va)
                pvr_gem_object_put [FREES PAGES]
      mutex_unlock(&vm_ctx->lock);
      pvr_mmu_op_context_destroy
        pvr_mmu_op_context_sync [CACHE FLUSH]
        pvr_mmu_flush [FLUSHES MMU]
        loop:
          pvr_page_table_l0_free
        loop:
          pvr_page_table_l1_free

From what I can tell, we can get from `pvr_page_table_l0_remove`
(where the GPU PTE is cleared) to `pvr_gem_object_put` (where the page
referenced by the PTE can be freed) without going through a page table
cache flush or a MMU flush; I think we need both (unless the
pvr_gem_object_put() is somehow deferred until
pvr_mmu_op_context_destroy() is reached).
