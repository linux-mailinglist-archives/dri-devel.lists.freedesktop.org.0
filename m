Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7112D3A33
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 06:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE6E6E0EF;
	Wed,  9 Dec 2020 05:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD626E0EF;
 Wed,  9 Dec 2020 05:18:10 +0000 (UTC)
IronPort-SDR: YbiA/iaiWhcgPU59yJ0KwzYEm3hhndBXGcky1HTwEdF5YqRVjMF1umvjwbpVbSzxYZlNYyNcG3
 6XWRftZnvL9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="192320761"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="gz'50?scan'50,208,50";a="192320761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:18:09 -0800
IronPort-SDR: n00uveyzpmGV8hxcDIzIdZ3DcjrpHLrekzpe/PASnrUnQkB7Fu91qR48+oPd6k06AQ+yTIJ3LO
 0ox7V1Ka1Dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="gz'50?scan'50,208,50";a="407918400"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 08 Dec 2020 21:18:06 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kmrrA-00001Y-M9; Wed, 09 Dec 2020 05:17:40 +0000
Date: Wed, 9 Dec 2020 13:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs
 for imported BOs
Message-ID: <202012091348.NMUsGM4k-lkp@intel.com>
References: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com,
 kbuild-all@lists.01.org, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.10-rc7 next-20201208]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andrey-Grodzovsky/drm-amdgpu-Initialise-drm_gem_object_funcs-for-imported-BOs/20201209-041733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
config: xtensa-randconfig-r004-20201208 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a7b4d98b3660452b6787b39dc59980606b462ff3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andrey-Grodzovsky/drm-amdgpu-Initialise-drm_gem_object_funcs-for-imported-BOs/20201209-041733
        git checkout a7b4d98b3660452b6787b39dc59980606b462ff3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=xtensa 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_ttm_helper.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:36:
   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c: In function 'amdgpu_gem_create_ioctl':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:288:14: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
     288 |    DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     289 |       size, initial_domain, args->in.alignment, r);
         |       ~~~~    
         |       |
         |       uint64_t {aka long long unsigned int}
   include/drm/drm_print.h:504:25: note: in definition of macro 'DRM_DEBUG'
     504 |  __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |                         ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:288:48: note: format string is defined here
     288 |    DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
         |                                              ~~^
         |                                                |
         |                                                long int
         |                                              %lld
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_ttm_helper.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:36:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:288:14: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type '__u64' {aka 'long long unsigned int'} [-Wformat=]
     288 |    DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     289 |       size, initial_domain, args->in.alignment, r);
         |                             ~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     __u64 {aka long long unsigned int}
   include/drm/drm_print.h:504:25: note: in definition of macro 'DRM_DEBUG'
     504 |  __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |                         ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:288:56: note: format string is defined here
     288 |    DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
         |                                                       ~^
         |                                                        |
         |                                                        unsigned int
         |                                                       %llu
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:38:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     198 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     197 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:196:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     196 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:38:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~

vim +288 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

   213	
   214	/*
   215	 * GEM ioctls.
   216	 */
   217	int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
   218				    struct drm_file *filp)
   219	{
   220		struct amdgpu_device *adev = drm_to_adev(dev);
   221		struct amdgpu_fpriv *fpriv = filp->driver_priv;
   222		struct amdgpu_vm *vm = &fpriv->vm;
   223		union drm_amdgpu_gem_create *args = data;
   224		uint64_t flags = args->in.domain_flags;
   225		uint64_t size = args->in.bo_size;
   226		struct dma_resv *resv = NULL;
   227		struct drm_gem_object *gobj;
   228		uint32_t handle, initial_domain;
   229		int r;
   230	
   231		/* reject invalid gem flags */
   232		if (flags & ~(AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
   233			      AMDGPU_GEM_CREATE_NO_CPU_ACCESS |
   234			      AMDGPU_GEM_CREATE_CPU_GTT_USWC |
   235			      AMDGPU_GEM_CREATE_VRAM_CLEARED |
   236			      AMDGPU_GEM_CREATE_VM_ALWAYS_VALID |
   237			      AMDGPU_GEM_CREATE_EXPLICIT_SYNC |
   238			      AMDGPU_GEM_CREATE_ENCRYPTED))
   239	
   240			return -EINVAL;
   241	
   242		/* reject invalid gem domains */
   243		if (args->in.domains & ~AMDGPU_GEM_DOMAIN_MASK)
   244			return -EINVAL;
   245	
   246		if (!amdgpu_is_tmz(adev) && (flags & AMDGPU_GEM_CREATE_ENCRYPTED)) {
   247			DRM_NOTE_ONCE("Cannot allocate secure buffer since TMZ is disabled\n");
   248			return -EINVAL;
   249		}
   250	
   251		/* create a gem object to contain this object in */
   252		if (args->in.domains & (AMDGPU_GEM_DOMAIN_GDS |
   253		    AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
   254			if (flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
   255				/* if gds bo is created from user space, it must be
   256				 * passed to bo list
   257				 */
   258				DRM_ERROR("GDS bo cannot be per-vm-bo\n");
   259				return -EINVAL;
   260			}
   261			flags |= AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
   262		}
   263	
   264		if (flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
   265			r = amdgpu_bo_reserve(vm->root.base.bo, false);
   266			if (r)
   267				return r;
   268	
   269			resv = vm->root.base.bo->tbo.base.resv;
   270		}
   271	
   272	retry:
   273		initial_domain = (u32)(0xffffffff & args->in.domains);
   274		r = amdgpu_gem_object_create(adev, size, args->in.alignment,
   275					     initial_domain,
   276					     flags, ttm_bo_type_device, resv, &gobj);
   277		if (r) {
   278			if (r != -ERESTARTSYS) {
   279				if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
   280					flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
   281					goto retry;
   282				}
   283	
   284				if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
   285					initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
   286					goto retry;
   287				}
 > 288				DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
   289					  size, initial_domain, args->in.alignment, r);
   290			}
   291			return r;
   292		}
   293	
   294		if (flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
   295			if (!r) {
   296				struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
   297	
   298				abo->parent = amdgpu_bo_ref(vm->root.base.bo);
   299			}
   300			amdgpu_bo_unreserve(vm->root.base.bo);
   301		}
   302		if (r)
   303			return r;
   304	
   305		r = drm_gem_handle_create(filp, gobj, &handle);
   306		/* drop reference from allocate - handle holds it now */
   307		drm_gem_object_put(gobj);
   308		if (r)
   309			return r;
   310	
   311		memset(args, 0, sizeof(*args));
   312		args->out.handle = handle;
   313		return 0;
   314	}
   315	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--sdtB3X0nJg68CQEu--
