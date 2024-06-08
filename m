Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE689011FD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 16:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDB310E0E0;
	Sat,  8 Jun 2024 14:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GJVi+W7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451D10E0E0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 14:24:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42155143cb0so34416145e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2024 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717856645; x=1718461445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXq5IQYSxR8LtrNHhrTpB623GXp7FxQS/ktZyaDLmN4=;
 b=GJVi+W7QpharEpuLtgkgo3cudcju0VRoskwOWmff1Fa9mVBNjcG9lwcgcSonaTHpMT
 8XBVHvZPMVLJpuUUpkpQEgMvKbRQqqnZsnHinu4L2tdv3g+ZkXusmgIIrZej0mUH8i7M
 E1ws3bNLDvWVdQ4Yec5kj6rCinNrpq1WK/GbArj3cK2nNLtsqw3XdU+PjRHqY5bjywvj
 bpInuZW4znLI3OdR578uY722c2hsQEmOSwp4F1cKa4q9GdV63BHf11LSS9yerWxQxadn
 5z7pnZ2BVJFknZmiNnq8B2uhbGcvrkjt4PtVkomhUiqTVhwJ97whuK4i6gt4rRA7ZRcj
 jNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717856645; x=1718461445;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXq5IQYSxR8LtrNHhrTpB623GXp7FxQS/ktZyaDLmN4=;
 b=dVCMfz0wwXpzrdGqBGGgf0x4T6H9CbQMnU5StpShajhIRzqTy5xKBaQr2xGPVF7JSu
 DfEvX/ZwIhqQ5A0N5B8DIQZwATg9iQLcZwmIzZHgQYPb7Zck0kRK7wp6FLwYDzBC69Z8
 CeZg6yvr0hoEiiFn3yVinnQpJx3FVuj0AW0aVcuXzzZYsYUzHqOrkyTSYBiNshx8NTR/
 78ox5LFD5TP60LaTb7zu6nuRtCTaQQoy04xLdHenIEDrxm89UMp3R55sC6JOYXhkY2TU
 piN/dpt8UsSfczxMLFK23MQVBJFMxoTmw11wyV+IKhW7vHgc/0VpD0/KPAgyiPJGP9PO
 mmAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcmJ8a7k9kjUOVdv5wzcygtvIH2SXHlkRiZhCCb/nAU9TDLDo4lPa4s+kud+TsONd4G6v0NUsyzqluWnN1n6RcCTVEvljyb2BcDc11JMIU
X-Gm-Message-State: AOJu0YxjX9ZeRL5IduFzFyjVb/kz/2Imgwks6Ih1a9vhtNhjOYWaQDud
 H84rR1Mv+Ne/k+9w6nlCjpOkzkSRbZsaKw3Np+p1aGTr8jSF3fgZE5o6kbugXJQ=
X-Google-Smtp-Source: AGHT+IH05VlOHqrKcxX/W7x8TfMJXa5EXchVmeabU8K+27+IfaMsAwyosPvpZVvyfWYK3MIe3McoaQ==
X-Received: by 2002:a05:600c:4e87:b0:421:7f30:7cfb with SMTP id
 5b1f17b1804b1-4217f308036mr7287155e9.40.1717856645303; 
 Sat, 08 Jun 2024 07:24:05 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d29508sm6564647f8f.4.2024.06.08.07.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 07:24:05 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:24:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/xe/bo: Simplify xe_bo_lock()
Message-ID: <479f756c-332e-42c5-b7fa-5457cb7eae09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas Hellström,

Commit 08a4f00e62bc ("drm/xe/bo: Simplify xe_bo_lock()") from Sep 8,
2023 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/xe/xe_vm.c:2095 vm_bind_ioctl_ops_create()
	error: we previously assumed 'bo' could be null (see line 2067)

drivers/gpu/drm/xe/xe_vm.c
    2061 static struct drm_gpuva_ops *
    2062 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
    2063                          u64 bo_offset_or_userptr, u64 addr, u64 range,
    2064                          u32 operation, u32 flags,
    2065                          u32 prefetch_region, u16 pat_index)
    2066 {
    2067         struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
                                              ^^
So far as I can see bo is always valid.  No need to check here.

    2068         struct drm_gpuva_ops *ops;
    2069         struct drm_gpuva_op *__op;
    2070         struct drm_gpuvm_bo *vm_bo;
    2071         int err;
    2072 
    2073         lockdep_assert_held_write(&vm->lock);
    2074 
    2075         vm_dbg(&vm->xe->drm,
    2076                "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
    2077                operation, (ULL)addr, (ULL)range,
    2078                (ULL)bo_offset_or_userptr);
    2079 
    2080         switch (operation) {
    2081         case DRM_XE_VM_BIND_OP_MAP:
    2082         case DRM_XE_VM_BIND_OP_MAP_USERPTR:
    2083                 ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
    2084                                                   obj, bo_offset_or_userptr);
    2085                 break;
    2086         case DRM_XE_VM_BIND_OP_UNMAP:
    2087                 ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
    2088                 break;
    2089         case DRM_XE_VM_BIND_OP_PREFETCH:
    2090                 ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
    2091                 break;
    2092         case DRM_XE_VM_BIND_OP_UNMAP_ALL:
    2093                 xe_assert(vm->xe, bo);
    2094 
--> 2095                 err = xe_bo_lock(bo, true);
                                          ^^
Unchecked dereference here.

    2096                 if (err)
    2097                         return ERR_PTR(err);
    2098 
    2099                 vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
    2100                 if (IS_ERR(vm_bo)) {
    2101                         xe_bo_unlock(bo);
    2102                         return ERR_CAST(vm_bo);
    2103                 }
    2104 
    2105                 ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
    2106                 drm_gpuvm_bo_put(vm_bo);
    2107                 xe_bo_unlock(bo);
    2108                 break;
    2109         default:
    2110                 drm_warn(&vm->xe->drm, "NOT POSSIBLE");
    2111                 ops = ERR_PTR(-EINVAL);
    2112         }
    2113         if (IS_ERR(ops))
    2114                 return ops;
    2115 
    2116         drm_gpuva_for_each_op(__op, ops) {
    2117                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
    2118 
    2119                 if (__op->op == DRM_GPUVA_OP_MAP) {
    2120                         op->map.immediate =
    2121                                 flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
    2122                         op->map.read_only =
    2123                                 flags & DRM_XE_VM_BIND_FLAG_READONLY;
    2124                         op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
    2125                         op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
    2126                         op->map.pat_index = pat_index;
    2127                 } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
    2128                         op->prefetch.region = prefetch_region;
    2129                 }
    2130 
    2131                 print_op(vm->xe, __op);
    2132         }
    2133 
    2134         return ops;
    2135 }

regards,
dan carpenter
