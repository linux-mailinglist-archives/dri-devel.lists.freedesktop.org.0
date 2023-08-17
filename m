Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58329780132
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1D10E107;
	Thu, 17 Aug 2023 22:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE910E107
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:42:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe2a116565so15685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692312166; x=1692916966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzcSj5xSa2HnIj8TkoELKUz1zyBwA1RfZ48wiFaHLxw=;
 b=To7rZtbqi6X1LKQrWeH/xL37OIUiKGkFt0qr7f5bDYTDPJsXCLRDOoICL6/S6okLWf
 Nj2+n79bN11kecR3qKnhNiyXlFsqnwRX9EiJjhY5WztfotDu03td10to0mDmyzfX9+85
 vredO2kSks9c1XBjtX9pj35QXs7odxAB+99L5wtvbOV1HXdkGq6l2MA0j6zDgOHvOQ83
 vDA+alj4LjDwZ7chpzY9MgXum5hvZwaL6u0TBk2RoAe4nQIz5cPgVHfdvpHX7N26J4zf
 NtR1jPCPTk+kgC1VWBL1Z9asJdrLkMOrUiFWC9WOBbM70Gyvb229KsBRc55KjXlytUcu
 LN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692312166; x=1692916966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WzcSj5xSa2HnIj8TkoELKUz1zyBwA1RfZ48wiFaHLxw=;
 b=D4Y2nLuTx44gIUd7Daqogk5GIUtuzFoIQQduD3+Tm6SADv3uwGkgfy1MTEMvXP0PUd
 jhjLrg6KpNNQKm1anaJUWxApCNt3al6jkEEm5UaB4LiVqEkviI6LVTVsJsxg+0OcO8Zj
 1E1uPyZgZthz7XPCMW48w4vNjgnIoeh3AIPdbUpUikeu937RvVV5ba+fmnth+9eEDU1X
 Cz4rlxAXwrhgsmziQW7HvYFn4vFR1Q1QBmaZ/6ER+YSClj4W7r55aWegElWBnhOVcZ+3
 6aN56lNd6arIqoyFJKOKugaILFl7f+LL5Hb5tOGG7usZLJeSy1GR2sIxkOqlM8/dWpI9
 ukrA==
X-Gm-Message-State: AOJu0Yyd/57E7pYrTU+ZMKDiSi6VIoXdifUr73c2AYokAYW6PLqdhG8K
 SYuKrrE5myDRbzDYUa/3fAuo9hA9DtApyp+6RjR0hw==
X-Google-Smtp-Source: AGHT+IFeywcyGKVgQ/g9ur0ryCOmwJuDxh1c5d3oAchYY6/T4IEtc3TJZtgdmL4BGC6973HpP8gphHilOYw4pADH9T4=
X-Received: by 2002:a05:600c:420b:b0:3f7:e4d8:2569 with SMTP id
 x11-20020a05600c420b00b003f7e4d82569mr20379wmh.5.1692312166354; Thu, 17 Aug
 2023 15:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-9-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-9-sarah.walker@imgtec.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 18 Aug 2023 00:42:09 +0200
Message-ID: <CAG48ez3260jKM_ni=fi3fS3MnLq-Z_dVzT5KDqkVEhhEpvBV1g@mail.gmail.com>
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

Hi!

Thanks, I think it's great that Imagination is writing an upstream
driver for PowerVR. :)

On Wed, Aug 16, 2023 at 10:25=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:
> Add a GEM implementation based on drm_gem_shmem, and support code for the
> PowerVR GPU MMU. The GPU VA manager is used for address space management.
[...]
> +/**
> + * DOC: Flags for DRM_IOCTL_PVR_CREATE_BO (kernel-only)
> + *
> + * Kernel-only values allowed in &pvr_gem_object->flags. The majority of=
 options
> + * for this field are specified in the UAPI header "pvr_drm.h" with a
> + * DRM_PVR_BO_ prefix. To distinguish these internal options (which must=
 exist
> + * in ranges marked as "reserved" in the UAPI header), we drop the DRM p=
refix.
> + * The public options should be used directly, DRM prefix and all.
> + *
> + * To avoid potentially confusing gaps in the UAPI options, these kernel=
-only
> + * options are specified "in reverse", starting at bit 63.
> + *
> + * We use "reserved" to refer to bits defined here and not exposed in th=
e UAPI.
> + * Bits not defined anywhere are "undefined".
> + *
> + * Creation options
> + *    These use the prefix PVR_BO_CREATE_.
> + *
> + *    *There are currently no kernel-only flags in this group.*
> + *
> + * Device mapping options
> + *    These use the prefix PVR_BO_DEVICE_.
> + *
> + *    *There are currently no kernel-only flags in this group.*
> + *
> + * CPU mapping options
> + *    These use the prefix PVR_BO_CPU_.
> + *
> + *    :CACHED: By default, all GEM objects are mapped write-combined on =
the
> + *       CPU. Set this flag to override this behaviour and map the objec=
t
> + *       cached.
> + */
> +#define PVR_BO_CPU_CACHED BIT_ULL(63)
> +
> +#define PVR_BO_FW_NO_CLEAR_ON_RESET BIT_ULL(62)
> +
> +/* Bits 62..3 are undefined. */
> +/* Bits 2..0 are defined in the UAPI. */
> +
> +/* Other utilities. */
> +#define PVR_BO_UNDEFINED_MASK GENMASK_ULL(61, 3)
> +#define PVR_BO_RESERVED_MASK (PVR_BO_UNDEFINED_MASK | GENMASK_ULL(63, 63=
))

In commit 1a9c568fb559 ("drm/imagination: Rework firmware object
initialisation") in powervr-next, PVR_BO_FW_NO_CLEAR_ON_RESET (bit 62)
was added in the kernel-only flags group, but the mask
PVR_BO_RESERVED_MASK (which is used in pvr_ioctl_create_bo to detect
kernel-only and reserved flags) looks like it wasn't changed to
include bit 62. I think that means it becomes possible for userspace
to pass this bit in via pvr_ioctl_create_bo()?
If my understanding is correct and that was unintentional, it might be
a good idea to change these defines:

#define PVR_BO_UNDEFINED_MASK GENMASK_ULL(61, 3)
#define PVR_BO_RESERVED_MASK (PVR_BO_UNDEFINED_MASK | GENMASK_ULL(63, 63))

into something like this to avoid future mishaps like this:

/* first bit that is not used for UAPI BO options */
#define PVR_BO_FIRST_RESERVED_BIT 3
#define PVR_BO_UNDEFINED_MASK GENMASK_ULL(61, PVR_BO_FIRST_RESERVED_BIT)
#define PVR_BO_RESERVED_MASK GENMASK_ULL(63, PVR_BO_FIRST_RESERVED_BIT)

> +
> +/*
> + * All firmware-mapped memory uses (mostly) the same flags. Specifically=
,
> + * firmware-mapped memory should be:
> + *  * Read/write on the device,
> + *  * Read/write on the CPU, and
> + *  * Write-combined on the CPU.
> + *
> + * The only variation is in caching on the device.
> + */
> +#define PVR_BO_FW_FLAGS_DEVICE_CACHED (ULL(0))
> +#define PVR_BO_FW_FLAGS_DEVICE_UNCACHED DRM_PVR_BO_DEVICE_BYPASS_CACHE
[...]
> +/**
> + * pvr_page_table_l2_entry_raw_set() - Write a valid entry into a raw le=
vel 2
> + *                                     page table.
> + * @entry: Target raw level 2 page table entry.
> + * @child_table_dma_addr: DMA address of the level 1 page table to be
> + *                        associated with @entry.
> + *
> + * When calling this function, @child_table_dma_addr must be a valid DMA
> + * address and a multiple of %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE.
> + */
> +static void
> +pvr_page_table_l2_entry_raw_set(struct pvr_page_table_l2_entry_raw *entr=
y,
> +                               dma_addr_t child_table_dma_addr)
> +{
> +       child_table_dma_addr >>=3D ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSHI=
FT;
> +
> +       entry->val =3D
> +               PVR_PAGE_TABLE_FIELD_PREP(2, PC, VALID, true) |
> +               PVR_PAGE_TABLE_FIELD_PREP(2, PC, ENTRY_PENDING, false) |
> +               PVR_PAGE_TABLE_FIELD_PREP(2, PC, PD_BASE, child_table_dma=
_addr);
> +}

For this function and others that manipulate page table entries,
please use some kernel helper that ensures that the store can't tear
(at least WRITE_ONCE() - that can still tear on 32-bit, but I see the
driver depends on ARM64, so that's not a problem).

[...]
> +/**
> + * pvr_page_table_l2_insert() - Insert an entry referring to a level 1 p=
age
> + * table into a level 2 page table.
> + * @op_ctx: Target MMU op context pointing at the entry to insert the L1=
 page
> + * table into.
> + * @child_table: Target level 1 page table to be referenced by the new e=
ntry.
> + *
> + * It is the caller's responsibility to ensure @op_ctx.curr_page points =
to a
> + * valid L2 entry.
> + */
> +static void
> +pvr_page_table_l2_insert(struct pvr_mmu_op_context *op_ctx,
> +                        struct pvr_page_table_l1 *child_table)
> +{
> +       struct pvr_page_table_l2 *l2_table =3D
> +               &op_ctx->mmu_ctx->page_table_l2;
> +       struct pvr_page_table_l2_entry_raw *entry_raw =3D
> +               pvr_page_table_l2_get_entry_raw(l2_table,
> +                                               op_ctx->curr_page.l2_idx)=
;
> +
> +       pvr_page_table_l2_entry_raw_set(entry_raw,
> +                                       child_table->backing_page.dma_add=
r);

Can you maybe add comments in functions that set page table entries to
document who is responsible for using a memory barrier (like wmb()) to
ensure that the creation of a page table entry is ordered after the
thing it points to is fully initialized, so that the GPU can't end up
concurrently walking into a page table and observe its old contents
from before it was zero-initialized?

> +
> +       child_table->parent =3D l2_table;
> +       child_table->parent_idx =3D op_ctx->curr_page.l2_idx;
> +       l2_table->entries[op_ctx->curr_page.l2_idx] =3D child_table;
> +       ++l2_table->entry_count;
> +       op_ctx->curr_page.l1_table =3D child_table;
> +}
[...]
> +/**
> + * pvr_page_table_l1_get_or_insert() - Retrieves (optionally inserting i=
f
> + * necessary) a level 1 page table from the specified level 2 page table=
 entry.
> + * @op_ctx: Target MMU op context.
> + * @should_insert: [IN] Specifies whether new page tables should be inse=
rted
> + * when empty page table entries are encountered during traversal.
> + *
> + * Return:
> + *  * 0 on success, or
> + *
> + *    If @should_insert is %false:
> + *     * -%ENXIO if a level 1 page table would have been inserted.
> + *
> + *    If @should_insert is %true:
> + *     * Any error encountered while inserting the level 1 page table.
> + */
> +static int
> +pvr_page_table_l1_get_or_insert(struct pvr_mmu_op_context *op_ctx,
> +                               bool should_insert)
> +{
> +       struct pvr_page_table_l2 *l2_table =3D
> +               &op_ctx->mmu_ctx->page_table_l2;
> +       struct pvr_page_table_l1 *table;
> +       int err;
> +
> +       if (pvr_page_table_l2_entry_is_valid(l2_table,
> +                                            op_ctx->curr_page.l2_idx)) {
> +               op_ctx->curr_page.l1_table =3D
> +                       l2_table->entries[op_ctx->curr_page.l2_idx];
> +               return 0;
> +       }
> +
> +       if (!should_insert)
> +               return -ENXIO;
> +
> +       /* Take a prealloced table. */
> +       table =3D op_ctx->l1_free_tables;
> +       if (!table)
> +               return -ENOMEM;
> +
> +       err =3D pvr_page_table_l1_init(table, op_ctx->mmu_ctx->pvr_dev);

I think when we have a preallocated table here, it was allocated in
pvr_page_table_l1_alloc(), which already called
pvr_page_table_l1_init()? So it looks to me like this second
pvr_page_table_l1_init() call will allocate another page and leak the
old allocation.

> +       if (err)
> +               return err;
> +
> +       /* Pop */
> +       op_ctx->l1_free_tables =3D table->next_free;
> +       table->next_free =3D NULL;
> +
> +       pvr_page_table_l2_insert(op_ctx, table);
> +
> +       return 0;
> +}
[...]
> +/**
> + * pvr_mmu_op_context_create() - Create an MMU op context.
> + * @ctx: MMU context associated with owning VM context.
> + * @sgt: Scatter gather table containing pages pinned for use by this co=
ntext.
> + * @sgt_offset: Start offset of the requested device-virtual memory mapp=
ing.
> + * @size: Size in bytes of the requested device-virtual memory mapping. =
For an
> + * unmapping, this should be zero so that no page tables are allocated.
> + *
> + * Returns:
> + *  * Newly created MMU op context object on success, or
> + *  * -%ENOMEM if no memory is available,
> + *  * Any error code returned by pvr_page_table_l2_init().
> + */
> +struct pvr_mmu_op_context *
> +pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *=
sgt,
> +                         u64 sgt_offset, u64 size)
> +{
> +       int err;
> +
> +       struct pvr_mmu_op_context *op_ctx =3D
> +               kzalloc(sizeof(*op_ctx), GFP_KERNEL);
> +
> +       if (!op_ctx)
> +               return ERR_PTR(-ENOMEM);
> +
> +       op_ctx->mmu_ctx =3D ctx;
> +       op_ctx->map.sgt =3D sgt;
> +       op_ctx->map.sgt_offset =3D sgt_offset;
> +       op_ctx->sync_level_required =3D PVR_MMU_SYNC_LEVEL_NONE;
> +
> +       if (size) {
> +               const u32 l1_start_idx =3D pvr_page_table_l2_idx(sgt_offs=
et);
> +               const u32 l1_end_idx =3D pvr_page_table_l2_idx(sgt_offset=
 + size);
> +               const u32 l1_count =3D l1_end_idx - l1_start_idx + 1;
> +               const u32 l0_start_idx =3D pvr_page_table_l1_idx(sgt_offs=
et);
> +               const u32 l0_end_idx =3D pvr_page_table_l1_idx(sgt_offset=
 + size);
> +               const u32 l0_count =3D l0_end_idx - l0_start_idx + 1;

Shouldn't the page table indices be calculated from the device_addr
(which is not currently passed in by pvr_vm_map())? As far as I can
tell, sgt_offset doesn't have anything to do with the device address
at which this mapping will be inserted in the page tables?

> +
> +               /*
> +                * Alloc and push page table entries until we have enough=
 of
> +                * each type, ending with linked lists of l0 and l1 entri=
es in
> +                * reverse order.
> +                */
> +               for (int i =3D 0; i < l1_count; i++) {
> +                       struct pvr_page_table_l1 *l1_tmp =3D
> +                               pvr_page_table_l1_alloc(ctx);
> +
> +                       err =3D PTR_ERR_OR_ZERO(l1_tmp);
> +                       if (err)
> +                               goto err_cleanup;
> +
> +                       l1_tmp->next_free =3D op_ctx->l1_free_tables;
> +                       op_ctx->l1_free_tables =3D l1_tmp;
> +               }
> +
> +               for (int i =3D 0; i < l0_count; i++) {
> +                       struct pvr_page_table_l0 *l0_tmp =3D
> +                               pvr_page_table_l0_alloc(ctx);
> +
> +                       err =3D PTR_ERR_OR_ZERO(l0_tmp);
> +                       if (err)
> +                               goto err_cleanup;
> +
> +                       l0_tmp->next_free =3D op_ctx->l0_free_tables;
> +                       op_ctx->l0_free_tables =3D l0_tmp;
> +               }
> +       }
> +
> +       return op_ctx;
> +
> +err_cleanup:
> +       pvr_mmu_op_context_destroy(op_ctx);

> +
> +       return ERR_PTR(err);
> +}
