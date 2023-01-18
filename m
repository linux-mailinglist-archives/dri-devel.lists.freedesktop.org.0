Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18484671E94
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0AB10E1EC;
	Wed, 18 Jan 2023 13:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA8B10E1EF;
 Wed, 18 Jan 2023 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674050153; x=1705586153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sCfZLcl+x3j/GrBFzuMLWae9nVeRi6rNSH79s5QCyuU=;
 b=iR6PKHr4xmS0hTWBP4zPuZjkvEJcv0ZMMYqj1dC62LTimNFi2snMt1Da
 DKK7scEuei+dFiTLlAwYLYyyDsby801Hz+jvITTjB2NgTpw4gKOjUSR9E
 H7OvAmF9D1clWQime20rJ/6TrQOthSO20O8arZc8/bd5xR1DFm3iw3dyd
 Nt8cf4DiGDx55zILaLnLYjCt9uviRmtDTjsmfeMReG09AcVcpm7pHwCCb
 Ae9PdkqXwIfTcjv8Pw5MithCwSDagfDOTNs0tgPcQqUmYsPQ5BgdSc4ph
 +Ku/ue26DajuKGc0aXOeZY+d1R/zpDPyegKCCUwMSXGPYPSyOUZpf0BnT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305358740"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="305358740"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="802202108"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="802202108"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 05:55:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pI8uq-0000NG-2M;
 Wed, 18 Jan 2023 13:55:48 +0000
Date: Wed, 18 Jan 2023 21:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch, airlied@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com, jason@jlekstrand.net,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net
Subject: Re: [PATCH drm-next 04/14] drm: debugfs: provide infrastructure to
 dump a DRM GPU VA space
Message-ID: <202301182112.RFiF6tDh-lkp@intel.com>
References: <20230118061256.2689-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118061256.2689-5-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 0b45ac1170ea6416bc1d36798414c04870cd356d]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230118-141552
base:   0b45ac1170ea6416bc1d36798414c04870cd356d
patch link:    https://lore.kernel.org/r/20230118061256.2689-5-dakr%40redhat.com
patch subject: [PATCH drm-next 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230118/202301182112.RFiF6tDh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e00f79934034ce7eb4e7fc0d722a3d28d75d44bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230118-141552
        git checkout e00f79934034ce7eb4e7fc0d722a3d28d75d44bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_debugfs.c: In function 'drm_debugfs_gpuva_info':
>> drivers/gpu/drm/drm_debugfs.c:228:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     228 |                            (u64)va->gem.obj, va->gem.offset);
         |                            ^


vim +228 drivers/gpu/drm/drm_debugfs.c

   178	
   179	/**
   180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
   181	 * @m: pointer to the &seq_file to write
   182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
   183	 *
   184	 * Dumps the GPU VA regions and mappings of a given DRM GPU VA manager.
   185	 *
   186	 * For each DRM GPU VA space drivers should call this function from their
   187	 * &drm_info_list's show callback.
   188	 *
   189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
   190	 */
   191	int drm_debugfs_gpuva_info(struct seq_file *m,
   192				   struct drm_gpuva_manager *mgr)
   193	{
   194		struct drm_gpuva_region *reg;
   195		struct drm_gpuva *va;
   196	
   197		if (!mgr->name)
   198			return -ENODEV;
   199	
   200		seq_printf(m, "DRM GPU VA space (%s)\n", mgr->name);
   201		seq_puts  (m, "\n");
   202		seq_puts  (m, " VA regions  | start              | range              | end                | sparse\n");
   203		seq_puts  (m, "------------------------------------------------------------------------------------\n");
   204		seq_printf(m, " VA space    | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
   205			   mgr->mm_start, mgr->mm_range, mgr->mm_start + mgr->mm_range);
   206		seq_puts  (m, "-----------------------------------------------------------------------------------\n");
   207		drm_gpuva_for_each_region(reg, mgr) {
   208			struct drm_mm_node *node = &reg->node;
   209	
   210			if (node == &mgr->kernel_alloc_node) {
   211				seq_printf(m, " kernel node | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
   212					   node->start, node->size, node->start + node->size);
   213				continue;
   214			}
   215	
   216			seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx | %s\n",
   217				   node->start, node->size, node->start + node->size,
   218				   reg->sparse ? "true" : "false");
   219		}
   220		seq_puts(m, "\n");
   221		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
   222		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
   223		drm_gpuva_for_each_va(va, mgr) {
   224			struct drm_mm_node *node = &va->node;
   225	
   226			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
   227				   node->start, node->size, node->start + node->size,
 > 228				   (u64)va->gem.obj, va->gem.offset);
   229		}
   230	
   231		return 0;
   232	}
   233	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
