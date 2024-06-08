Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5CA9011FC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2007910E0AE;
	Sat,  8 Jun 2024 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="agJrCo6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD9510E0AE
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 14:23:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52bc121fb1eso1534149e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2024 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717856612; x=1718461412; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/t5UMd8/NaA5oqs2HKj0O1Wy44IX5nvKVkn9RccOi6Y=;
 b=agJrCo6xfyLj6H88JUngOMtGQxYMqmtJewQMEGdRe5plG65LnOX9GCLLn79CRuaJDa
 L9LIfH9dUK3t3fv3gQrLI8LlxafL6RVEypGGiHA/ignXc+Q8NScrNvOKxl574prHabQj
 pAI4BTUeENQodiPk088isywd4bjYXCFJQRQ4tMJ5zDPtSVP9v7lEV/0TDOI/QnXTIAqe
 QdlqaVXjiEi7eu/5zYCGSTJkBwHo/iG3lberIwLVrW6Unzlw5KNsLpb9+8t8Xdq/VGnV
 cEu+LCs6TL3mTDwe4asZf/qBT8Wk1XUiKjRbmEXv0PDGOPZWyjAu8g4JAdegQIkEB3DO
 ec+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717856612; x=1718461412;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/t5UMd8/NaA5oqs2HKj0O1Wy44IX5nvKVkn9RccOi6Y=;
 b=J5UxuPxdXCY6t29THnWlOAwEGMpy8VP4JD5ousj6ebqL5c2nFgU7tVPY1+sONTy5NR
 ddzIM9/cciM/qGkA6JtdxzBIJLJbzD2fr/vuVGfSAjqdMdtE55DEBX0eA3Qed4CeQNFV
 NGohWHwmbV1+5jf7P9DWVGXkFXEDc3qYoxsomIuXG2wsNe+AUGon/NQSsBM9nn+igFPb
 fkZOzFieeEClt6kwC42YsjwaUNxvzanAqjjQXqoh7RDz+IntuZV+cE1lSvS9/vICTwxH
 hatLowRCuOcnfF2sji0LtigXa1UER4nCXC7UcQ39DHcj8JxG2Tei5JZN3h31sp7r7AiE
 zfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9e6fmYVCd8ZqTWK1GIjm/U/CFldUB3ohWXVh6NitIlsg7ZKNVYjWX+tdNr/cF0MIr15qnp5Px7vU03tVFSNN9hO+skx0GjjgAHvDWyiHQ
X-Gm-Message-State: AOJu0Yxf8WbfdjsRpaNDErScruJ0bKT7vhixyJqWkB0njEc57zGkBu2w
 uTctQmmaxz2SCSOdwvInMGZzg7bKiO66T4IP5tbhfEVgK0QHm7qdy6E6FG0m3NobnRmBCbP2/9t
 +
X-Google-Smtp-Source: AGHT+IHM1EJj4nhlDhYQ1Ik6Ne3nzP2jB5BMaR2OJxkwhBCYd2g9m1IMAjuX25lEn34FNIltA20ubA==
X-Received: by 2002:a05:6512:31d3:b0:52c:8341:7f03 with SMTP id
 2adb3069b0e04-52c83417ff7mr597091e87.56.1717856612330; 
 Sat, 08 Jun 2024 07:23:32 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c364bcdsm84990555e9.19.2024.06.08.07.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 07:23:32 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:23:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <8c376f45-def3-4c4c-9d4a-e1f69f9f2a70@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Matthew Brost,

Commit dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
GPUs") from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_pt.c:671 xe_pt_stage_bind()
	error: we previously assumed 'bo' could be null (see line 602)

drivers/gpu/drm/xe/xe_pt.c
    596 static int
    597 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
    598                  struct xe_vm_pgtable_update *entries, u32 *num_entries)
    599 {
    600         struct xe_device *xe = tile_to_xe(tile);
    601         struct xe_bo *bo = xe_vma_bo(vma);
    602         bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
    603                 (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
    604         struct xe_res_cursor curs;
    605         struct xe_pt_stage_bind_walk xe_walk = {
    606                 .base = {
    607                         .ops = &xe_pt_stage_bind_ops,
    608                         .shifts = xe_normal_pt_shifts,
    609                         .max_level = XE_PT_HIGHEST_LEVEL,
    610                 },
    611                 .vm = xe_vma_vm(vma),
    612                 .tile = tile,
    613                 .curs = &curs,
    614                 .va_curs_start = xe_vma_start(vma),
    615                 .vma = vma,
    616                 .wupd.entries = entries,
    617                 .needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
    618         };
    619         struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
    620         int ret;
    621 
    622         /**
    623          * Default atomic expectations for different allocation scenarios are as follows:
    624          *
    625          * 1. Traditional API: When the VM is not in LR mode:
    626          *    - Device atomics are expected to function with all allocations.
    627          *
    628          * 2. Compute/SVM API: When the VM is in LR mode:
    629          *    - Device atomics are the default behavior when the bo is placed in a single region.
    630          *    - In all other cases device atomics will be disabled with AE=0 until an application
    631          *      request differently using a ioctl like madvise.
    632          */
    633         if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
    634                 if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
    635                         if (bo && xe_bo_has_single_placement(bo))
                                    ^^
Checks for NULL

    636                                 xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
    637                         /**
    638                          * If a SMEM+LMEM allocation is backed by SMEM, a device
    639                          * atomics will cause a gpu page fault and which then
    640                          * gets migrated to LMEM, bind such allocations with
    641                          * device atomics enabled.
    642                          */
    643                         else if (is_devmem && !xe_bo_has_single_placement(bo))
                                                                                  ^^

is_devmem ca only be true when bo is valid so it's ok that
xe_bo_has_single_placement() doesn't check.

    644                                 xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
    645                 } else {
    646                         xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
    647                 }
    648 
    649                 /**
    650                  * Unset AE if the platform(PVC) doesn't support it on an
    651                  * allocation
    652                  */
    653                 if (!xe->info.has_device_atomics_on_smem && !is_devmem)
    654                         xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
    655         }
    656 
    657         if (is_devmem) {
    658                 xe_walk.default_pte |= XE_PPGTT_PTE_DM;
    659                 xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
    660         }
    661 
    662         if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
    663                 xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
    664 
    665         xe_bo_assert_held(bo);
                                  ^^
These asserts have a check for NULL

    666 
    667         if (!xe_vma_is_null(vma)) {
    668                 if (xe_vma_is_userptr(vma))
    669                         xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
    670                                         xe_vma_size(vma), &curs);
--> 671                 else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
                                               ^^                     ^^
Dereferenced

    672                         xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
    673                                      xe_vma_size(vma), &curs);
    674                 else
    675                         xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
                                                         ^^
More unchecked dereferences

    676                                         xe_vma_size(vma), &curs);
    677         } else {
    678                 curs.size = xe_vma_size(vma);
    679         }
    680 
    681         ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
    682                                xe_vma_end(vma), &xe_walk.base);
    683 
    684         *num_entries = xe_walk.wupd.num_used_entries;
    685         return ret;
    686 }

regards,
dan carpenter
