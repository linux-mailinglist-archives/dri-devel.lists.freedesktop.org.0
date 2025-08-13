Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E03B24730
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61A210E6E7;
	Wed, 13 Aug 2025 10:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpGjggQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADDA10E6E7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755081003; x=1786617003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j3Ij/D9ZpkmmRNFHLOaVAdlMNcqm5zU5MngdWRiz1Zc=;
 b=LpGjggQFQWdYev2RsqkinSBuzTWOfFWfwYCHXqv+9AOx3EoKzZRfjJ4f
 AseV150HnAsp4gFbkpGYM5gocY1oUTiX4lcgvvPDYBd838u8gqy/YBkcY
 2NPTDCgMyxFU6XgzXVQlnZjl/e3gJTvfvfxSXFhwkn6I7rKjKawxMgy9H
 aP/IlWlbrQ3TFm4a/+LTNFeBQV0aQPJIYyHyJKJkFv2b5xfobnDC66mo2
 OtHjXXVaYWbQaxGFEj6f0I+gLLLD48qLmk9vkAzwh8RuShz0gawOxzw5y
 5L6X9P1XC/eyVKfyzLQXPZ+5nLMnCLqWFTH2rHHizyjU/fPJkJ3rV0D4k g==;
X-CSE-ConnectionGUID: ZVtQPWUUTEuNhvLmGIuf7A==
X-CSE-MsgGUID: a4PK36gWQmqW2l9r6p7qRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44948023"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="44948023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:30:03 -0700
X-CSE-ConnectionGUID: SY7FOdOjQCKVJQ2/h+Ov7Q==
X-CSE-MsgGUID: wvNwCnpESqiqlOqkT7dtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166704386"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:29:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sidharth Seela <sidharthseela@gmail.com>, "dakr@redhat.com"
 <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code
 inside comment
In-Reply-To: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
Date: Wed, 13 Aug 2025 13:29:55 +0300
Message-ID: <854286215216fe5242f3232032625b4fbe62074e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 12 Aug 2025, Sidharth Seela <sidharthseela@gmail.com> wrote:
> Dear Maintainers,
> This is my first patch, please bear with me.
> I request you to suggest if it can be better.
> Your time is appreciated.

A simpler fix is already on the list [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.com

> ---------------------------------------------------------------------------
> commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
> Author:     Sidharth Seela <sid@y740.local>
> AuthorDate: Tue Aug 12 15:56:03 2025 +0530
> Commit:     Sidharth Seela <sid@y740.local>
> CommitDate: Tue Aug 12 15:56:03 2025 +0530
>
>     cleaned up errors stemming for multiline text
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..cf49dbfcec91 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops = {
>   *
>   * The expected usage is:
>   *
> - *    vm_bind {
> - *        struct drm_exec exec;
> - *
> - *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
> - *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
> - *
> - *        drm_exec_until_all_locked (&exec) {
> - *            for_each_vm_bind_operation {
> - *                switch (op->op) {
> - *                case DRIVER_OP_UNMAP:
> - *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> &exec, op->addr, op->range);
> - *                    break;
> - *                case DRIVER_OP_MAP:
> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
> num_fences,
> - *                                                     op->addr, op->range,
> - *                                                     obj, op->obj_offset);
> - *                    break;
> - *                }
> - *
> - *                drm_exec_retry_on_contention(&exec);
> - *                if (ret)
> - *                    return ret;
> - *            }
> - *        }
> - *    }
> + * *   vm_bind {
> + * *       struct drm_exec exec;
> + * *
> + * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
> + * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
> + * *
> + * *       drm_exec_until_all_locked (&exec) {
> + * *           for_each_vm_bind_operation {
> + * *               switch (op->op) {
> + * *               case DRIVER_OP_UNMAP:
> + * *                   ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> &exec, op->addr, op->range);
> + * *                   break;
> + * *               case DRIVER_OP_MAP:
> + * *                   ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
> num_fences,
> + * *                                                    op->addr, op->range,
> + * *                                                    obj, op->obj_offset);
> + * *                   break;
> + * *               }
> + * *
> + * *               drm_exec_retry_on_contention(&exec);
> + * *               if (ret)
> + * *                   return ret;
> + * *           }
> + * *       }
> + * *   }
>   *
>   * This enables all locking to be performed before the driver begins modifying
>   * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
> --
> 2.39.5
> signed-off-by:Sidharth Seela<sidharthseela@gmail.com>

-- 
Jani Nikula, Intel
