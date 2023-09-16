Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0D7A2D6F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 04:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24DC10E0B0;
	Sat, 16 Sep 2023 02:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F31310E0B0;
 Sat, 16 Sep 2023 02:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694831161; x=1726367161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cMCz8YOlJvcCu7rrubHX7fZ1YVeDMUI8POyQZIu4vSk=;
 b=ARwQty9tDJJCHtKulYbnYV+opMoZmdLi8/3pzLQp66xpFO71LJ3Uc6Mf
 xMkLBcdDO/eicdzfCUWVteXj61LhjNK+tFA8QZTk1rgHLsdoCEP1iGpmy
 HkrSQp80QMpsn24W/7JqzTbIvQByWvPeezIWNbc8SZxNKMprvtQ/hxnRa
 rMkDy6WJrU+hzaia6lRcqt2FOHqxOuLzEadA+F7FgynKqWyTn3vA28Tdh
 OUfILOOCiY6W+Q9qziUEbbEP1n3xu91K6r5XwyuorsEAcWz0+85q1x33F
 0U8waaJPGJpuNCcXdpQdAX/dTy2MeDuThEji5/TToDOH7NWxX+VSuM8mo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379291086"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="379291086"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 19:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810717915"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="810717915"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2023 19:25:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qhL0O-0003kG-0t;
 Sat, 16 Sep 2023 02:25:56 +0000
Date: Sat, 16 Sep 2023 10:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Message-ID: <202309161030.TcQkW66y-lkp@intel.com>
References: <20230915183051.1232026-2-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915183051.1232026-2-alan.previn.teres.alexis@intel.com>
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alan,

kernel test robot noticed the following build errors:

[auto build test ERROR on cf1e91e884bb1113c653e654e9de1754fc1d4488]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-mtl-Update-pxp-firmware-response-timeout/20230916-023150
base:   cf1e91e884bb1113c653e654e9de1754fc1d4488
patch link:    https://lore.kernel.org/r/20230915183051.1232026-2-alan.previn.teres.alexis%40intel.com
patch subject: [PATCH v6 1/3] drm/i915/pxp/mtl: Update pxp-firmware response timeout
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230916/202309161030.TcQkW66y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161030.TcQkW66y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161030.TcQkW66y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_send_message':
>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:115:52: error: 'GSC_REPLY_LATENCY_MS' undeclared (first use in this function); did you mean 'GSC_HECI_REPLY_LATENCY_MS'?
     115 |                                                    GSC_REPLY_LATENCY_MS);
         |                                                    ^~~~~~~~~~~~~~~~~~~~
         |                                                    GSC_HECI_REPLY_LATENCY_MS
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:115:52: note: each undeclared identifier is reported only once for each function it appears in


vim +115 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

99afb7cc8c4457 Alan Previn       2023-05-11   51  
dc9ac125d81faf Alan Previn       2023-05-11   52  static int
dc9ac125d81faf Alan Previn       2023-05-11   53  gsccs_send_message(struct intel_pxp *pxp,
dc9ac125d81faf Alan Previn       2023-05-11   54  		   void *msg_in, size_t msg_in_size,
dc9ac125d81faf Alan Previn       2023-05-11   55  		   void *msg_out, size_t msg_out_size_max,
dc9ac125d81faf Alan Previn       2023-05-11   56  		   size_t *msg_out_len,
dc9ac125d81faf Alan Previn       2023-05-11   57  		   u64 *gsc_msg_handle_retry)
dc9ac125d81faf Alan Previn       2023-05-11   58  {
dc9ac125d81faf Alan Previn       2023-05-11   59  	struct intel_gt *gt = pxp->ctrl_gt;
dc9ac125d81faf Alan Previn       2023-05-11   60  	struct drm_i915_private *i915 = gt->i915;
dc9ac125d81faf Alan Previn       2023-05-11   61  	struct gsccs_session_resources *exec_res =  &pxp->gsccs_res;
dc9ac125d81faf Alan Previn       2023-05-11   62  	struct intel_gsc_mtl_header *header = exec_res->pkt_vaddr;
dc9ac125d81faf Alan Previn       2023-05-11   63  	struct intel_gsc_heci_non_priv_pkt pkt;
dc9ac125d81faf Alan Previn       2023-05-11   64  	size_t max_msg_size;
dc9ac125d81faf Alan Previn       2023-05-11   65  	u32 reply_size;
dc9ac125d81faf Alan Previn       2023-05-11   66  	int ret;
dc9ac125d81faf Alan Previn       2023-05-11   67  
dc9ac125d81faf Alan Previn       2023-05-11   68  	if (!exec_res->ce)
dc9ac125d81faf Alan Previn       2023-05-11   69  		return -ENODEV;
dc9ac125d81faf Alan Previn       2023-05-11   70  
dc9ac125d81faf Alan Previn       2023-05-11   71  	max_msg_size = PXP43_MAX_HECI_INOUT_SIZE - sizeof(*header);
dc9ac125d81faf Alan Previn       2023-05-11   72  
dc9ac125d81faf Alan Previn       2023-05-11   73  	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
dc9ac125d81faf Alan Previn       2023-05-11   74  		return -ENOSPC;
dc9ac125d81faf Alan Previn       2023-05-11   75  
dc9ac125d81faf Alan Previn       2023-05-11   76  	if (!exec_res->pkt_vma || !exec_res->bb_vma)
dc9ac125d81faf Alan Previn       2023-05-11   77  		return -ENOENT;
dc9ac125d81faf Alan Previn       2023-05-11   78  
dc9ac125d81faf Alan Previn       2023-05-11   79  	GEM_BUG_ON(exec_res->pkt_vma->size < (2 * PXP43_MAX_HECI_INOUT_SIZE));
dc9ac125d81faf Alan Previn       2023-05-11   80  
dc9ac125d81faf Alan Previn       2023-05-11   81  	mutex_lock(&pxp->tee_mutex);
dc9ac125d81faf Alan Previn       2023-05-11   82  
dc9ac125d81faf Alan Previn       2023-05-11   83  	memset(header, 0, sizeof(*header));
dc9ac125d81faf Alan Previn       2023-05-11   84  	intel_gsc_uc_heci_cmd_emit_mtl_header(header, HECI_MEADDRESS_PXP,
dc9ac125d81faf Alan Previn       2023-05-11   85  					      msg_in_size + sizeof(*header),
dc9ac125d81faf Alan Previn       2023-05-11   86  					      exec_res->host_session_handle);
dc9ac125d81faf Alan Previn       2023-05-11   87  
dc9ac125d81faf Alan Previn       2023-05-11   88  	/* check if this is a host-session-handle cleanup call (empty packet) */
dc9ac125d81faf Alan Previn       2023-05-11   89  	if (!msg_in && !msg_out)
dc9ac125d81faf Alan Previn       2023-05-11   90  		header->flags |= GSC_INFLAG_MSG_CLEANUP;
dc9ac125d81faf Alan Previn       2023-05-11   91  
dc9ac125d81faf Alan Previn       2023-05-11   92  	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
dc9ac125d81faf Alan Previn       2023-05-11   93  	header->gsc_message_handle = *gsc_msg_handle_retry;
dc9ac125d81faf Alan Previn       2023-05-11   94  
dc9ac125d81faf Alan Previn       2023-05-11   95  	/* NOTE: zero size packets are used for session-cleanups */
dc9ac125d81faf Alan Previn       2023-05-11   96  	if (msg_in && msg_in_size)
dc9ac125d81faf Alan Previn       2023-05-11   97  		memcpy(exec_res->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
dc9ac125d81faf Alan Previn       2023-05-11   98  
dc9ac125d81faf Alan Previn       2023-05-11   99  	pkt.addr_in = i915_vma_offset(exec_res->pkt_vma);
dc9ac125d81faf Alan Previn       2023-05-11  100  	pkt.size_in = header->message_size;
dc9ac125d81faf Alan Previn       2023-05-11  101  	pkt.addr_out = pkt.addr_in + PXP43_MAX_HECI_INOUT_SIZE;
dc9ac125d81faf Alan Previn       2023-05-11  102  	pkt.size_out = msg_out_size_max + sizeof(*header);
dc9ac125d81faf Alan Previn       2023-05-11  103  	pkt.heci_pkt_vma = exec_res->pkt_vma;
dc9ac125d81faf Alan Previn       2023-05-11  104  	pkt.bb_vma = exec_res->bb_vma;
dc9ac125d81faf Alan Previn       2023-05-11  105  
dc9ac125d81faf Alan Previn       2023-05-11  106  	/*
dc9ac125d81faf Alan Previn       2023-05-11  107  	 * Before submitting, let's clear-out the validity marker on the reply offset.
dc9ac125d81faf Alan Previn       2023-05-11  108  	 * We use offset PXP43_MAX_HECI_INOUT_SIZE for reply location so point header there.
dc9ac125d81faf Alan Previn       2023-05-11  109  	 */
dc9ac125d81faf Alan Previn       2023-05-11  110  	header = exec_res->pkt_vaddr + PXP43_MAX_HECI_INOUT_SIZE;
dc9ac125d81faf Alan Previn       2023-05-11  111  	header->validity_marker = 0;
dc9ac125d81faf Alan Previn       2023-05-11  112  
dc9ac125d81faf Alan Previn       2023-05-11  113  	ret = intel_gsc_uc_heci_cmd_submit_nonpriv(&gt->uc.gsc,
dc9ac125d81faf Alan Previn       2023-05-11  114  						   exec_res->ce, &pkt, exec_res->bb_vaddr,
dc9ac125d81faf Alan Previn       2023-05-11 @115  						   GSC_REPLY_LATENCY_MS);
dc9ac125d81faf Alan Previn       2023-05-11  116  	if (ret) {
dc9ac125d81faf Alan Previn       2023-05-11  117  		drm_err(&i915->drm, "failed to send gsc PXP msg (%d)\n", ret);
dc9ac125d81faf Alan Previn       2023-05-11  118  		goto unlock;
dc9ac125d81faf Alan Previn       2023-05-11  119  	}
dc9ac125d81faf Alan Previn       2023-05-11  120  
dc9ac125d81faf Alan Previn       2023-05-11  121  	/* Response validity marker, status and busyness */
dc9ac125d81faf Alan Previn       2023-05-11  122  	if (header->validity_marker != GSC_HECI_VALIDITY_MARKER) {
dc9ac125d81faf Alan Previn       2023-05-11  123  		drm_err(&i915->drm, "gsc PXP reply with invalid validity marker\n");
dc9ac125d81faf Alan Previn       2023-05-11  124  		ret = -EINVAL;
dc9ac125d81faf Alan Previn       2023-05-11  125  		goto unlock;
dc9ac125d81faf Alan Previn       2023-05-11  126  	}
dc9ac125d81faf Alan Previn       2023-05-11  127  	if (header->status != 0) {
dc9ac125d81faf Alan Previn       2023-05-11  128  		drm_dbg(&i915->drm, "gsc PXP reply status has error = 0x%08x\n",
dc9ac125d81faf Alan Previn       2023-05-11  129  			header->status);
dc9ac125d81faf Alan Previn       2023-05-11  130  		ret = -EINVAL;
dc9ac125d81faf Alan Previn       2023-05-11  131  		goto unlock;
dc9ac125d81faf Alan Previn       2023-05-11  132  	}
dc9ac125d81faf Alan Previn       2023-05-11  133  	if (header->flags & GSC_OUTFLAG_MSG_PENDING) {
dc9ac125d81faf Alan Previn       2023-05-11  134  		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
dc9ac125d81faf Alan Previn       2023-05-11  135  		/*
dc9ac125d81faf Alan Previn       2023-05-11  136  		 * When the GSC firmware replies with pending bit, it means that the requested
dc9ac125d81faf Alan Previn       2023-05-11  137  		 * operation has begun but the completion is pending and the caller needs
dc9ac125d81faf Alan Previn       2023-05-11  138  		 * to re-request with the gsc_message_handle that was returned by the firmware.
dc9ac125d81faf Alan Previn       2023-05-11  139  		 * until the pending bit is turned off.
dc9ac125d81faf Alan Previn       2023-05-11  140  		 */
dc9ac125d81faf Alan Previn       2023-05-11  141  		*gsc_msg_handle_retry = header->gsc_message_handle;
dc9ac125d81faf Alan Previn       2023-05-11  142  		ret = -EAGAIN;
dc9ac125d81faf Alan Previn       2023-05-11  143  		goto unlock;
dc9ac125d81faf Alan Previn       2023-05-11  144  	}
dc9ac125d81faf Alan Previn       2023-05-11  145  
dc9ac125d81faf Alan Previn       2023-05-11  146  	reply_size = header->message_size - sizeof(*header);
dc9ac125d81faf Alan Previn       2023-05-11  147  	if (reply_size > msg_out_size_max) {
5c315434fdb6ab Nathan Chancellor 2023-05-30  148  		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%zu)\n",
dc9ac125d81faf Alan Previn       2023-05-11  149  			 reply_size, msg_out_size_max);
dc9ac125d81faf Alan Previn       2023-05-11  150  		reply_size = msg_out_size_max;
dc9ac125d81faf Alan Previn       2023-05-11  151  	}
dc9ac125d81faf Alan Previn       2023-05-11  152  
dc9ac125d81faf Alan Previn       2023-05-11  153  	if (msg_out)
dc9ac125d81faf Alan Previn       2023-05-11  154  		memcpy(msg_out, exec_res->pkt_vaddr + PXP43_MAX_HECI_INOUT_SIZE + sizeof(*header),
dc9ac125d81faf Alan Previn       2023-05-11  155  		       reply_size);
dc9ac125d81faf Alan Previn       2023-05-11  156  	if (msg_out_len)
dc9ac125d81faf Alan Previn       2023-05-11  157  		*msg_out_len = reply_size;
dc9ac125d81faf Alan Previn       2023-05-11  158  
dc9ac125d81faf Alan Previn       2023-05-11  159  unlock:
dc9ac125d81faf Alan Previn       2023-05-11  160  	mutex_unlock(&pxp->tee_mutex);
dc9ac125d81faf Alan Previn       2023-05-11  161  	return ret;
dc9ac125d81faf Alan Previn       2023-05-11  162  }
dc9ac125d81faf Alan Previn       2023-05-11  163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
