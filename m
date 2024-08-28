Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDB963073
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2016610E5B2;
	Wed, 28 Aug 2024 18:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CirkSoKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AE110E5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 18:50:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-371aa511609so3591232f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724871005; x=1725475805; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nVKYemgwb6INpvwI6IxvMRCEw4bEqUGg/5VUiOANfIs=;
 b=CirkSoKHJnvD7i/HPuTKj/gD0Y+kjCJlOCiMu/Bq4250KJlTcyPaCpIgQUAdgtfBpL
 aeh8IvDII84iKPCEgUctvK5tPa4Ihx71D/cqDRKAPTXPHwM77Nts3vXW2XB/7Uin939n
 OiRNqtPbhxxuThFHun8T0wgkfUgemnW6B0/8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724871005; x=1725475805;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVKYemgwb6INpvwI6IxvMRCEw4bEqUGg/5VUiOANfIs=;
 b=NaANsx8AxsfdFj+rCdp1/1AR9CIsXC2YuL1jL2pp14KpXPjspjH4ZZwU+7Ib1Jj/Vh
 2JhDFYGS6syQJl4v3SNcvi5BG0P+BSka7UckZgXF7Cmkiq/6Pn970C7yfFmZIxalk1ff
 +wUPoTEZMZEWewL0SYjvS6HGhV5vrtLk5NKqOAXV2aYeW5DL+KIZV76L//4NvyBWIDkw
 KmBI9XigGjR82mY3d5ip8nGxXKuFRso6tdfl8Lyy0XwojQyn0dZoUZI6lyHbyW5x+7JO
 eQkxtiT+pS+j3mO2YfqTbWZjBxwzQ7tp1X+g+Y7MKuSWPikjgnF2ios5QOASxl7sH1YB
 XSng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO2AOXWyKR2Ok8+0nTzgO9WeM8pcRlXjVwGjVxmZCTM4vbw4f+TMPv53/EWkGDJCT5ijYs8XjLouY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0ELr0BEevyNosBGeKK0W2eR6JkblksaN7QW6fzdhbsigSAiA+
 13fno9GMcM6iR/HBJ3iCveu2oulEVxHIc2HRNZNoP1cmmlh7vCOOOsLBQdWLfUI=
X-Google-Smtp-Source: AGHT+IHURxqn8XJx9FBx975pFBrxhmRZDsLdRSRAzHnMsMv7gTAgFs7x3QERAA78iW6jLIlHiikW2g==
X-Received: by 2002:adf:fe8b:0:b0:371:9366:6d90 with SMTP id
 ffacd0b85a97d-3749b5487e7mr301578f8f.18.1724871004774; 
 Wed, 28 Aug 2024 11:50:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b360495sm403949f8f.90.2024.08.28.11.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 11:50:04 -0700 (PDT)
Date: Wed, 28 Aug 2024 20:50:02 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Zs9xWiECsszs6nPR@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828024901.2582335-6-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	u64 start = range->va.start, end = range->va.end;
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	int err;
> +	bool retry = false;
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err = -EFAULT;
> +			goto err_out;
> +		}
> +		if (ctx->trylock_mmap) {
> +			if (!mmap_read_trylock(mm))  {
> +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> +				goto err_mmput;
> +			}
> +		} else {
> +			mmap_read_lock(mm);
> +		}
> +	}
> +
> +	mmap_assert_locked(mm);
> +
> +	/*
> +	 * Loop required to find all VMA area structs for the corner case when
> +	 * VRAM backing has been partially unmapped from MM's address space.
> +	 */
> +again:
> +	vas = find_vma(mm, start);

So a hiliarous case that amdkfd gets a bit better but still not entirely
is that the original vma might entirely gone. Even when you can still get
at the mm of that process. This happens with cow (or shared too I think)
mappings in forked child processes, or also if you play fun mremap games.

I think that outside of the ->migrate_to_ram callback migration/eviction
to sram cannot assume there's any reasonable vma around and has to
unconditionally go with the drm_gpusvm_evict_to_sram path.

Also in the migrate_to_ram case the vma is essentially nothing else that
informational about which ranges we might need if we prefault a bit (in
case the child changed the vma compared to the original one). So it's good
to as parameter for migrate_vma_setup, but absolutely nothing else.

amdkfd almost gets this right by being entirely based on their svm_range
structures, except they still have the lingering check that the orignal mm
is still alive. Of course you cannot ever use that memory on the gpu
anymore, but the child process could get very pissed if their memory is
suddenly gone. Also the eviction code has the same issue as yours and
limits itself to vma that still exist in the original mm, leaving anything
that's orphaned in children or remaps stuck in vram. At least that's my
understanding, I might very well be wrong.

So probably want a bunch of these testcases too to make sure that all
works, and we're not stuck with memory allocations in vram that we can't
move out.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
