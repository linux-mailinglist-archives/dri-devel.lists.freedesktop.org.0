Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231C53474D
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 02:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05F10F6D1;
	Thu, 26 May 2022 00:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EBE10F698;
 Thu, 26 May 2022 00:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653523707; x=1685059707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tmwrit1dgQxdQl6Jk490SmR8Scnt8+kfrNYjj+boFjg=;
 b=MgT0EzAF+0mV26n1J5RcJ8kinbovJq5Di4OQEbMez+ZzjEymNy66yKbB
 xwAfuqez7wrYDe4G8mB3hlIvUlarYFNrB8538i4r3jR4yL6/zUvT+PWPi
 ciPyHKHi36dPRnM/01Vl086RfGw7uLzU8GFzO23x/IpSWEHD7b1bHQB2+
 MZqGzkISvH12CwVYnUfTYSknU1gZKv1tDyZeHuqBe6kuCIam6sNm/z6CE
 CZ2uiZMMl7Qrc9BttR6X41LOOXynvR3rgOvQJX2brBnm6WqXlwZTRiuH5
 j4D1BkDNOze7jTDi3IQROcjiIqG8dIAl6H/aybHnEDHRS8txj7yzgrBa3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273696458"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="273696458"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 17:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="642595075"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 25 May 2022 17:08:22 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nu137-0003R7-Pc;
 Thu, 26 May 2022 00:08:21 +0000
Date: Thu, 26 May 2022 08:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 08/10] drm/i915/uapi: disable capturing
 objects on recoverable contexts
Message-ID: <202205260728.itOPg4qx-lkp@intel.com>
References: <20220525184337.491763-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525184337.491763-9-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on v5.18 next-20220525]
[cannot apply to drm-intel/for-linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/small-BAR-uapi-bits/20220526-024641
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220526/202205260728.itOPg4qx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fdc3574e30bb0fdfdc9569fa42d369b1fae41e9e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/small-BAR-uapi-bits/20220526-024641
        git checkout fdc3574e30bb0fdfdc9569fa42d369b1fae41e9e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3429:6: error: assigning to 'int' from incompatible type 'void'
           err = eb_capture_stage(&eb);
               ^ ~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3429 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

  3384	
  3385		if (args->flags & I915_EXEC_FENCE_OUT) {
  3386			out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
  3387			if (out_fence_fd < 0) {
  3388				err = out_fence_fd;
  3389				goto err_in_fence;
  3390			}
  3391		}
  3392	
  3393		err = eb_create(&eb);
  3394		if (err)
  3395			goto err_out_fence;
  3396	
  3397		GEM_BUG_ON(!eb.lut_size);
  3398	
  3399		err = eb_select_context(&eb);
  3400		if (unlikely(err))
  3401			goto err_destroy;
  3402	
  3403		err = eb_select_engine(&eb);
  3404		if (unlikely(err))
  3405			goto err_context;
  3406	
  3407		err = eb_lookup_vmas(&eb);
  3408		if (err) {
  3409			eb_release_vmas(&eb, true);
  3410			goto err_engine;
  3411		}
  3412	
  3413		i915_gem_ww_ctx_init(&eb.ww, true);
  3414	
  3415		err = eb_relocate_parse(&eb);
  3416		if (err) {
  3417			/*
  3418			 * If the user expects the execobject.offset and
  3419			 * reloc.presumed_offset to be an exact match,
  3420			 * as for using NO_RELOC, then we cannot update
  3421			 * the execobject.offset until we have completed
  3422			 * relocation.
  3423			 */
  3424			args->flags &= ~__EXEC_HAS_RELOC;
  3425			goto err_vma;
  3426		}
  3427	
  3428		ww_acquire_done(&eb.ww.ctx);
> 3429		err = eb_capture_stage(&eb);
  3430		if (err)
  3431			goto err_vma;
  3432	
  3433		out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
  3434		if (IS_ERR(out_fence)) {
  3435			err = PTR_ERR(out_fence);
  3436			out_fence = NULL;
  3437			if (eb.requests[0])
  3438				goto err_request;
  3439			else
  3440				goto err_vma;
  3441		}
  3442	
  3443		err = eb_submit(&eb);
  3444	
  3445	err_request:
  3446		eb_requests_get(&eb);
  3447		err = eb_requests_add(&eb, err);
  3448	
  3449		if (eb.fences)
  3450			signal_fence_array(&eb, eb.composite_fence ?
  3451					   eb.composite_fence :
  3452					   &eb.requests[0]->fence);
  3453	
  3454		if (out_fence) {
  3455			if (err == 0) {
  3456				fd_install(out_fence_fd, out_fence->file);
  3457				args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
  3458				args->rsvd2 |= (u64)out_fence_fd << 32;
  3459				out_fence_fd = -1;
  3460			} else {
  3461				fput(out_fence->file);
  3462			}
  3463		}
  3464	
  3465		if (unlikely(eb.gem_context->syncobj)) {
  3466			drm_syncobj_replace_fence(eb.gem_context->syncobj,
  3467						  eb.composite_fence ?
  3468						  eb.composite_fence :
  3469						  &eb.requests[0]->fence);
  3470		}
  3471	
  3472		if (!out_fence && eb.composite_fence)
  3473			dma_fence_put(eb.composite_fence);
  3474	
  3475		eb_requests_put(&eb);
  3476	
  3477	err_vma:
  3478		eb_release_vmas(&eb, true);
  3479		WARN_ON(err == -EDEADLK);
  3480		i915_gem_ww_ctx_fini(&eb.ww);
  3481	
  3482		if (eb.batch_pool)
  3483			intel_gt_buffer_pool_put(eb.batch_pool);
  3484	err_engine:
  3485		eb_put_engine(&eb);
  3486	err_context:
  3487		i915_gem_context_put(eb.gem_context);
  3488	err_destroy:
  3489		eb_destroy(&eb);
  3490	err_out_fence:
  3491		if (out_fence_fd != -1)
  3492			put_unused_fd(out_fence_fd);
  3493	err_in_fence:
  3494		dma_fence_put(in_fence);
  3495	err_ext:
  3496		put_fence_array(eb.fences, eb.num_fences);
  3497		return err;
  3498	}
  3499	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
