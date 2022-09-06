Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DF5AF1F9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA610E703;
	Tue,  6 Sep 2022 17:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D7310E079;
 Tue,  6 Sep 2022 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662484360; x=1694020360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=75dJLFsISrfadPGHvf56ormv/BfihZ67Pu3bV53ZeKM=;
 b=BnKqoomdw9bTuUW4cG91IKaBcaUdr5m76+P7h0F6cmhk3uEt/dg2LfW0
 OgkcWUtL5xFBaNFIkE1hihMcwji6F6fYQpqPETV/I/mOMjRHkM6WLTili
 txiPIJszjo4jsqWbwbtiWfqAVMeZtM1NpmTDcI32hgGpQQHVHNJGW7ZsG
 05wm/yB9DtwPf2lTMncR7mHKCM6Sr0l/TNxvsTJas8Mk/qNTGvXeUOCNP
 JSKawlCpmKQe6+X8SedFl3gcNFi/iI24X8KIALYTcfcc5qoeNI2eM3haH
 IyYzFkGTthPufK0viHoLLwG05betCdrUWPqdBGPmiz5X55FkgzNHockuF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="283649910"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="283649910"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 10:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="789749147"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2022 10:12:35 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oVc7m-0005NZ-2d;
 Tue, 06 Sep 2022 17:12:34 +0000
Date: Wed, 7 Sep 2022 01:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyu Wang <jingyuwang_vip@163.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, van.quan@amd.com, guchun.chen@amd.com,
 lijo.lazar@amd.com, candice.li@amd.com, mdaenzer@redhat.com,
 Bokun.Zhang@amd.com
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_kms.c
Message-ID: <202209070101.LeRXI9ZR-lkp@intel.com>
References: <20220905184451.27815-1-jingyuwang_vip@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905184451.27815-1-jingyuwang_vip@163.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, kbuild-all@lists.01.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingyu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e47eb90a0a9ae20b82635b9b99a8d0979b757ad8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyu-Wang/drm-amdgpu-cleanup-coding-style-in-amdgpu_kms-c/20220906-104802
base:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
config: arm64-randconfig-r031-20220906 (https://download.01.org/0day-ci/archive/20220907/202209070101.LeRXI9ZR-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/778e4a57afd0db6a6a752487e1a1cda253cd9682
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingyu-Wang/drm-amdgpu-cleanup-coding-style-in-amdgpu_kms-c/20220906-104802
        git checkout 778e4a57afd0db6a6a752487e1a1cda253cd9682
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:554:62: error: too few arguments provided to function-like macro invocation
                   ret = copy_to_user(out, &ip, min_t((size_t)size, sizeof(ip)));
                                                                              ^
   include/linux/minmax.h:104:9: note: macro 'min_t' defined here
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
           ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:554:32: error: use of undeclared identifier 'min_t'; did you mean 'minfo'?
                   ret = copy_to_user(out, &ip, min_t((size_t)size, sizeof(ip)));
                                                ^~~~~
                                                minfo
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:514:27: note: 'minfo' declared here
           struct amdgpu_mode_info *minfo = &adev->mode_info;
                                    ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1385:3: error: expected expression
                   TA_FW_NAME(XGMI),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1386:3: error: expected expression
                   TA_FW_NAME(RAS),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1387:3: error: expected expression
                   TA_FW_NAME(HDCP),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1388:3: error: expected expression
                   TA_FW_NAME(DTM),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1389:3: error: expected expression
                   TA_FW_NAME(RAP),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1390:3: error: expected expression
                   TA_FW_NAME(SECUREDISPLAY),
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1384:27: note: expanded from macro 'TA_FW_NAME'
   #define TA_FW_NAME(type) ([TA_FW_TYPE_PSP_##type] = #type)
                             ^
   8 errors generated.


vim +554 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

   494	
   495	/*
   496	 * Userspace get information ioctl
   497	 */
   498	/**
   499	 * amdgpu_info_ioctl - answer a device specific request.
   500	 *
   501	 * @dev: drm device pointer
   502	 * @data: request object
   503	 * @filp: drm filp
   504	 *
   505	 * This function is used to pass device specific parameters to the userspace
   506	 * drivers.  Examples include: pci device id, pipeline parms, tiling params,
   507	 * etc. (all asics).
   508	 * Returns 0 on success, -EINVAL on failure.
   509	 */
   510	int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
   511	{
   512		struct amdgpu_device *adev = drm_to_adev(dev);
   513		struct drm_amdgpu_info *info = data;
   514		struct amdgpu_mode_info *minfo = &adev->mode_info;
   515		void __user *out = (void __user *)(uintptr_t)info->return_pointer;
   516		uint32_t size = info->return_size;
   517		struct drm_crtc *crtc;
   518		uint32_t ui32 = 0;
   519		uint64_t ui64 = 0;
   520		int i, found;
   521		int ui32_size = sizeof(ui32);
   522	
   523		if (!info->return_size || !info->return_pointer)
   524			return -EINVAL;
   525	
   526		switch (info->query) {
   527		case AMDGPU_INFO_ACCEL_WORKING:
   528			ui32 = adev->accel_working;
   529			return copy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
   530		case AMDGPU_INFO_CRTC_FROM_ID:
   531			for (i = 0, found = 0; i < adev->mode_info.num_crtc; i++) {
   532				crtc = (struct drm_crtc *)minfo->crtcs[i];
   533				if (crtc && crtc->base.id == info->mode_crtc.id) {
   534					struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
   535	
   536					ui32 = amdgpu_crtc->crtc_id;
   537					found = 1;
   538					break;
   539				}
   540			}
   541			if (!found) {
   542				DRM_DEBUG_KMS("unknown crtc id %d\n", info->mode_crtc.id);
   543				return -EINVAL;
   544			}
   545			return copy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
   546		case AMDGPU_INFO_HW_IP_INFO: {
   547			struct drm_amdgpu_info_hw_ip ip = {};
   548			int ret;
   549	
   550			ret = amdgpu_hw_ip_info(adev, info, &ip);
   551			if (ret)
   552				return ret;
   553	
 > 554			ret = copy_to_user(out, &ip, min_t((size_t)size, sizeof(ip)));
   555			return ret ? -EFAULT : 0;
   556		}
   557		case AMDGPU_INFO_HW_IP_COUNT: {
   558			enum amd_ip_block_type type;
   559			uint32_t count = 0;
   560	
   561			switch (info->query_hw_ip.type) {
   562			case AMDGPU_HW_IP_GFX:
   563				type = AMD_IP_BLOCK_TYPE_GFX;
   564				break;
   565			case AMDGPU_HW_IP_COMPUTE:
   566				type = AMD_IP_BLOCK_TYPE_GFX;
   567				break;
   568			case AMDGPU_HW_IP_DMA:
   569				type = AMD_IP_BLOCK_TYPE_SDMA;
   570				break;
   571			case AMDGPU_HW_IP_UVD:
   572				type = AMD_IP_BLOCK_TYPE_UVD;
   573				break;
   574			case AMDGPU_HW_IP_VCE:
   575				type = AMD_IP_BLOCK_TYPE_VCE;
   576				break;
   577			case AMDGPU_HW_IP_UVD_ENC:
   578				type = AMD_IP_BLOCK_TYPE_UVD;
   579				break;
   580			case AMDGPU_HW_IP_VCN_DEC:
   581			case AMDGPU_HW_IP_VCN_ENC:
   582				type = AMD_IP_BLOCK_TYPE_VCN;
   583				break;
   584			case AMDGPU_HW_IP_VCN_JPEG:
   585				type = (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_JPEG)) ?
   586					AMD_IP_BLOCK_TYPE_JPEG : AMD_IP_BLOCK_TYPE_VCN;
   587				break;
   588			default:
   589				return -EINVAL;
   590			}
   591	
   592			for (i = 0; i < adev->num_ip_blocks; i++)
   593				if (adev->ip_blocks[i].version->type == type &&
   594				    adev->ip_blocks[i].status.valid &&
   595				    count < AMDGPU_HW_IP_INSTANCE_MAX_COUNT)
   596					count++;
   597	
   598			return copy_to_user(out, &count, min(size, 4u)) ? -EFAULT : 0;
   599		}
   600		case AMDGPU_INFO_TIMESTAMP:
   601			ui64 = amdgpu_gfx_get_gpu_clock_counter(adev);
   602			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   603		case AMDGPU_INFO_FW_VERSION: {
   604			struct drm_amdgpu_info_firmware fw_info;
   605			int ret;
   606	
   607			/* We only support one instance of each IP block right now. */
   608			if (info->query_fw.ip_instance != 0)
   609				return -EINVAL;
   610	
   611			ret = amdgpu_firmware_info(&fw_info, &info->query_fw, adev);
   612			if (ret)
   613				return ret;
   614	
   615			return copy_to_user(out, &fw_info,
   616					    min((size_t)size, sizeof(fw_info))) ? -EFAULT : 0;
   617		}
   618		case AMDGPU_INFO_NUM_BYTES_MOVED:
   619			ui64 = atomic64_read(&adev->num_bytes_moved);
   620			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   621		case AMDGPU_INFO_NUM_EVICTIONS:
   622			ui64 = atomic64_read(&adev->num_evictions);
   623			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   624		case AMDGPU_INFO_NUM_VRAM_CPU_PAGE_FAULTS:
   625			ui64 = atomic64_read(&adev->num_vram_cpu_page_faults);
   626			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   627		case AMDGPU_INFO_VRAM_USAGE:
   628			ui64 = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
   629			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   630		case AMDGPU_INFO_VIS_VRAM_USAGE:
   631			ui64 = amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
   632			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   633		case AMDGPU_INFO_GTT_USAGE:
   634			ui64 = ttm_resource_manager_usage(&adev->mman.gtt_mgr.manager);
   635			return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
   636		case AMDGPU_INFO_GDS_CONFIG: {
   637			struct drm_amdgpu_info_gds gds_info;
   638	
   639			memset(&gds_info, 0, sizeof(gds_info));
   640			gds_info.compute_partition_size = adev->gds.gds_size;
   641			gds_info.gds_total_size = adev->gds.gds_size;
   642			gds_info.gws_per_compute_partition = adev->gds.gws_size;
   643			gds_info.oa_per_compute_partition = adev->gds.oa_size;
   644			return copy_to_user(out, &gds_info,
   645					    min((size_t)size, sizeof(gds_info))) ? -EFAULT : 0;
   646		}
   647		case AMDGPU_INFO_VRAM_GTT: {
   648			struct drm_amdgpu_info_vram_gtt vram_gtt;
   649	
   650			vram_gtt.vram_size = adev->gmc.real_vram_size -
   651				atomic64_read(&adev->vram_pin_size) -
   652				AMDGPU_VM_RESERVED_VRAM;
   653			vram_gtt.vram_cpu_accessible_size =
   654				min(adev->gmc.visible_vram_size -
   655				    atomic64_read(&adev->visible_pin_size),
   656				    vram_gtt.vram_size);
   657			vram_gtt.gtt_size = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
   658			vram_gtt.gtt_size -= atomic64_read(&adev->gart_pin_size);
   659			return copy_to_user(out, &vram_gtt,
   660					    min((size_t)size, sizeof(vram_gtt))) ? -EFAULT : 0;
   661		}
   662		case AMDGPU_INFO_MEMORY: {
   663			struct drm_amdgpu_memory_info mem;
   664			struct ttm_resource_manager *gtt_man =
   665				&adev->mman.gtt_mgr.manager;
   666			struct ttm_resource_manager *vram_man =
   667				&adev->mman.vram_mgr.manager;
   668	
   669			memset(&mem, 0, sizeof(mem));
   670			mem.vram.total_heap_size = adev->gmc.real_vram_size;
   671			mem.vram.usable_heap_size = adev->gmc.real_vram_size -
   672				atomic64_read(&adev->vram_pin_size) -
   673				AMDGPU_VM_RESERVED_VRAM;
   674			mem.vram.heap_usage =
   675				ttm_resource_manager_usage(vram_man);
   676			mem.vram.max_allocation = mem.vram.usable_heap_size * 3 / 4;
   677	
   678			mem.cpu_accessible_vram.total_heap_size =
   679				adev->gmc.visible_vram_size;
   680			mem.cpu_accessible_vram.usable_heap_size =
   681				min(adev->gmc.visible_vram_size -
   682				    atomic64_read(&adev->visible_pin_size),
   683				    mem.vram.usable_heap_size);
   684			mem.cpu_accessible_vram.heap_usage =
   685				amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
   686			mem.cpu_accessible_vram.max_allocation =
   687				mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
   688	
   689			mem.gtt.total_heap_size = gtt_man->size;
   690			mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
   691				atomic64_read(&adev->gart_pin_size);
   692			mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);
   693			mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
   694	
   695			return copy_to_user(out, &mem,
   696					    min((size_t)size, sizeof(mem)))
   697					    ? -EFAULT : 0;
   698		}
   699		case AMDGPU_INFO_READ_MMR_REG: {
   700			unsigned int n, alloc_size;
   701			uint32_t *regs;
   702			unsigned int se_num = (info->read_mmr_reg.instance >>
   703					   AMDGPU_INFO_MMR_SE_INDEX_SHIFT) &
   704					  AMDGPU_INFO_MMR_SE_INDEX_MASK;
   705			unsigned int sh_num = (info->read_mmr_reg.instance >>
   706					   AMDGPU_INFO_MMR_SH_INDEX_SHIFT) &
   707					  AMDGPU_INFO_MMR_SH_INDEX_MASK;
   708	
   709			/* set full masks if the userspace set all bits
   710			 * in the bitfields
   711			 */
   712			if (se_num == AMDGPU_INFO_MMR_SE_INDEX_MASK)
   713				se_num = 0xffffffff;
   714			else if (se_num >= AMDGPU_GFX_MAX_SE)
   715				return -EINVAL;
   716			if (sh_num == AMDGPU_INFO_MMR_SH_INDEX_MASK)
   717				sh_num = 0xffffffff;
   718			else if (sh_num >= AMDGPU_GFX_MAX_SH_PER_SE)
   719				return -EINVAL;
   720	
   721			if (info->read_mmr_reg.count > 128)
   722				return -EINVAL;
   723	
   724			regs = kmalloc_array(info->read_mmr_reg.count, sizeof(*regs), GFP_KERNEL);
   725			if (!regs)
   726				return -ENOMEM;
   727			alloc_size = info->read_mmr_reg.count * sizeof(*regs);
   728	
   729			amdgpu_gfx_off_ctrl(adev, false);
   730			for (i = 0; i < info->read_mmr_reg.count; i++) {
   731				if (amdgpu_asic_read_register(adev, se_num, sh_num,
   732							      info->read_mmr_reg.dword_offset + i,
   733							      &regs[i])) {
   734					DRM_DEBUG_KMS("unallowed offset %#x\n",
   735						      info->read_mmr_reg.dword_offset + i);
   736					kfree(regs);
   737					amdgpu_gfx_off_ctrl(adev, true);
   738					return -EFAULT;
   739				}
   740			}
   741			amdgpu_gfx_off_ctrl(adev, true);
   742			n = copy_to_user(out, regs, min(size, alloc_size));
   743			kfree(regs);
   744			return n ? -EFAULT : 0;
   745		}
   746		case AMDGPU_INFO_DEV_INFO: {
   747			struct drm_amdgpu_info_device *dev_info;
   748			uint64_t vm_size;
   749			int ret;
   750	
   751			dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
   752			if (!dev_info)
   753				return -ENOMEM;
   754	
   755			dev_info->device_id = adev->pdev->device;
   756			dev_info->chip_rev = adev->rev_id;
   757			dev_info->external_rev = adev->external_rev_id;
   758			dev_info->pci_rev = adev->pdev->revision;
   759			dev_info->family = adev->family;
   760			dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
   761			dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
   762			/* return all clocks in KHz */
   763			dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
   764			if (adev->pm.dpm_enabled) {
   765				dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
   766				dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
   767			} else {
   768				dev_info->max_engine_clock = adev->clock.default_sclk * 10;
   769				dev_info->max_memory_clock = adev->clock.default_mclk * 10;
   770			}
   771			dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
   772			dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
   773				adev->gfx.config.max_shader_engines;
   774			dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
   775			dev_info->_pad = 0;
   776			dev_info->ids_flags = 0;
   777			if (adev->flags & AMD_IS_APU)
   778				dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
   779			if (amdgpu_mcbp || amdgpu_sriov_vf(adev))
   780				dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
   781			if (amdgpu_is_tmz(adev))
   782				dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
   783	
   784			vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
   785			vm_size -= AMDGPU_VA_RESERVED_SIZE;
   786	
   787			/* Older VCE FW versions are buggy and can handle only 40bits */
   788			if (adev->vce.fw_version &&
   789			    adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
   790				vm_size = min(vm_size, 1ULL << 40);
   791	
   792			dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_SIZE;
   793			dev_info->virtual_address_max =
   794				min(vm_size, AMDGPU_GMC_HOLE_START);
   795	
   796			if (vm_size > AMDGPU_GMC_HOLE_START) {
   797				dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
   798				dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
   799			}
   800			dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
   801			dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
   802			dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
   803			dev_info->cu_active_number = adev->gfx.cu_info.number;
   804			dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
   805			dev_info->ce_ram_size = adev->gfx.ce_ram_size;
   806			memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
   807			       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
   808			memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
   809			       sizeof(adev->gfx.cu_info.bitmap));
   810			dev_info->vram_type = adev->gmc.vram_type;
   811			dev_info->vram_bit_width = adev->gmc.vram_width;
   812			dev_info->vce_harvest_config = adev->vce.harvest_config;
   813			dev_info->gc_double_offchip_lds_buf =
   814				adev->gfx.config.double_offchip_lds_buf;
   815			dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
   816			dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
   817			dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
   818			dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
   819			dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
   820			dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
   821			dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
   822	
   823			if (adev->family >= AMDGPU_FAMILY_NV)
   824				dev_info->pa_sc_tile_steering_override =
   825					adev->gfx.config.pa_sc_tile_steering_override;
   826	
   827			dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
   828	
   829			ret = copy_to_user(out, dev_info,
   830					   min((size_t)size, sizeof(*dev_info))) ? -EFAULT : 0;
   831			kfree(dev_info);
   832			return ret;
   833		}
   834		case AMDGPU_INFO_VCE_CLOCK_TABLE: {
   835			unsigned int i;
   836			struct drm_amdgpu_info_vce_clock_table vce_clk_table = {};
   837			struct amd_vce_state *vce_state;
   838	
   839			for (i = 0; i < AMDGPU_VCE_CLOCK_TABLE_ENTRIES; i++) {
   840				vce_state = amdgpu_dpm_get_vce_clock_state(adev, i);
   841				if (vce_state) {
   842					vce_clk_table.entries[i].sclk = vce_state->sclk;
   843					vce_clk_table.entries[i].mclk = vce_state->mclk;
   844					vce_clk_table.entries[i].eclk = vce_state->evclk;
   845					vce_clk_table.num_valid_entries++;
   846				}
   847			}
   848	
   849			return copy_to_user(out, &vce_clk_table,
   850					    min((size_t)size, sizeof(vce_clk_table))) ? -EFAULT : 0;
   851		}
   852		case AMDGPU_INFO_VBIOS: {
   853			uint32_t bios_size = adev->bios_size;
   854	
   855			switch (info->vbios_info.type) {
   856			case AMDGPU_INFO_VBIOS_SIZE:
   857				return copy_to_user(out, &bios_size,
   858						min((size_t)size, sizeof(bios_size)))
   859						? -EFAULT : 0;
   860			case AMDGPU_INFO_VBIOS_IMAGE: {
   861				uint8_t *bios;
   862				uint32_t bios_offset = info->vbios_info.offset;
   863	
   864				if (bios_offset >= bios_size)
   865					return -EINVAL;
   866	
   867				bios = adev->bios + bios_offset;
   868				return copy_to_user(out, bios,
   869						    min((size_t)size, (size_t)(bios_size - bios_offset)))
   870						? -EFAULT : 0;
   871			}
   872			case AMDGPU_INFO_VBIOS_INFO: {
   873				struct drm_amdgpu_info_vbios vbios_info = {};
   874				struct atom_context *atom_context;
   875	
   876				atom_context = adev->mode_info.atom_context;
   877				memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name));
   878				memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_context->vbios_pn));
   879				vbios_info.version = atom_context->version;
   880				memcpy(vbios_info.vbios_ver_str, atom_context->vbios_ver_str,
   881							sizeof(atom_context->vbios_ver_str));
   882				memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date));
   883	
   884				return copy_to_user(out, &vbios_info,
   885							min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
   886			}
   887			default:
   888				DRM_DEBUG_KMS("Invalid request %d\n",
   889						info->vbios_info.type);
   890				return -EINVAL;
   891			}
   892		}
   893		case AMDGPU_INFO_NUM_HANDLES: {
   894			struct drm_amdgpu_info_num_handles handle;
   895	
   896			switch (info->query_hw_ip.type) {
   897			case AMDGPU_HW_IP_UVD:
   898				/* Starting Polaris, we support unlimited UVD handles */
   899				if (adev->asic_type < CHIP_POLARIS10) {
   900					handle.uvd_max_handles = adev->uvd.max_handles;
   901					handle.uvd_used_handles = amdgpu_uvd_used_handles(adev);
   902	
   903					return copy_to_user(out, &handle,
   904						min((size_t)size, sizeof(handle))) ? -EFAULT : 0;
   905				} else {
   906					return -ENODATA;
   907				}
   908	
   909				break;
   910			default:
   911				return -EINVAL;
   912			}
   913		}
   914		case AMDGPU_INFO_SENSOR: {
   915			if (!adev->pm.dpm_enabled)
   916				return -ENOENT;
   917	
   918			switch (info->sensor_info.type) {
   919			case AMDGPU_INFO_SENSOR_GFX_SCLK:
   920				/* get sclk in Mhz */
   921				if (amdgpu_dpm_read_sensor(adev,
   922							   AMDGPU_PP_SENSOR_GFX_SCLK,
   923							   (void *)&ui32, &ui32_size)) {
   924					return -EINVAL;
   925				}
   926				ui32 /= 100;
   927				break;
   928			case AMDGPU_INFO_SENSOR_GFX_MCLK:
   929				/* get mclk in Mhz */
   930				if (amdgpu_dpm_read_sensor(adev,
   931							   AMDGPU_PP_SENSOR_GFX_MCLK,
   932							   (void *)&ui32, &ui32_size)) {
   933					return -EINVAL;
   934				}
   935				ui32 /= 100;
   936				break;
   937			case AMDGPU_INFO_SENSOR_GPU_TEMP:
   938				/* get temperature in millidegrees C */
   939				if (amdgpu_dpm_read_sensor(adev,
   940							   AMDGPU_PP_SENSOR_GPU_TEMP,
   941							   (void *)&ui32, &ui32_size)) {
   942					return -EINVAL;
   943				}
   944				break;
   945			case AMDGPU_INFO_SENSOR_GPU_LOAD:
   946				/* get GPU load */
   947				if (amdgpu_dpm_read_sensor(adev,
   948							   AMDGPU_PP_SENSOR_GPU_LOAD,
   949							   (void *)&ui32, &ui32_size)) {
   950					return -EINVAL;
   951				}
   952				break;
   953			case AMDGPU_INFO_SENSOR_GPU_AVG_POWER:
   954				/* get average GPU power */
   955				if (amdgpu_dpm_read_sensor(adev,
   956							   AMDGPU_PP_SENSOR_GPU_POWER,
   957							   (void *)&ui32, &ui32_size)) {
   958					return -EINVAL;
   959				}
   960				ui32 >>= 8;
   961				break;
   962			case AMDGPU_INFO_SENSOR_VDDNB:
   963				/* get VDDNB in millivolts */
   964				if (amdgpu_dpm_read_sensor(adev,
   965							   AMDGPU_PP_SENSOR_VDDNB,
   966							   (void *)&ui32, &ui32_size)) {
   967					return -EINVAL;
   968				}
   969				break;
   970			case AMDGPU_INFO_SENSOR_VDDGFX:
   971				/* get VDDGFX in millivolts */
   972				if (amdgpu_dpm_read_sensor(adev,
   973							   AMDGPU_PP_SENSOR_VDDGFX,
   974							   (void *)&ui32, &ui32_size)) {
   975					return -EINVAL;
   976				}
   977				break;
   978			case AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_SCLK:
   979				/* get stable pstate sclk in Mhz */
   980				if (amdgpu_dpm_read_sensor(adev,
   981							   AMDGPU_PP_SENSOR_STABLE_PSTATE_SCLK,
   982							   (void *)&ui32, &ui32_size)) {
   983					return -EINVAL;
   984				}
   985				ui32 /= 100;
   986				break;
   987			case AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_MCLK:
   988				/* get stable pstate mclk in Mhz */
   989				if (amdgpu_dpm_read_sensor(adev,
   990							   AMDGPU_PP_SENSOR_STABLE_PSTATE_MCLK,
   991							   (void *)&ui32, &ui32_size)) {
   992					return -EINVAL;
   993				}
   994				ui32 /= 100;
   995				break;
   996			default:
   997				DRM_DEBUG_KMS("Invalid request %d\n",
   998					      info->sensor_info.type);
   999				return -EINVAL;
  1000			}
  1001			return copy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
  1002		}
  1003		case AMDGPU_INFO_VRAM_LOST_COUNTER:
  1004			ui32 = atomic_read(&adev->vram_lost_counter);
  1005			return copy_to_user(out, &ui32, min(size, 4u)) ? -EFAULT : 0;
  1006		case AMDGPU_INFO_RAS_ENABLED_FEATURES: {
  1007			struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
  1008			uint64_t ras_mask;
  1009	
  1010			if (!ras)
  1011				return -EINVAL;
  1012			ras_mask = (uint64_t)adev->ras_enabled << 32 | ras->features;
  1013	
  1014			return copy_to_user(out, &ras_mask,
  1015					min_t(u64, size, sizeof(ras_mask))) ?
  1016				-EFAULT : 0;
  1017		}
  1018		case AMDGPU_INFO_VIDEO_CAPS: {
  1019			const struct amdgpu_video_codecs *codecs;
  1020			struct drm_amdgpu_info_video_caps *caps;
  1021			int r;
  1022	
  1023			switch (info->video_cap.type) {
  1024			case AMDGPU_INFO_VIDEO_CAPS_DECODE:
  1025				r = amdgpu_asic_query_video_codecs(adev, false, &codecs);
  1026				if (r)
  1027					return -EINVAL;
  1028				break;
  1029			case AMDGPU_INFO_VIDEO_CAPS_ENCODE:
  1030				r = amdgpu_asic_query_video_codecs(adev, true, &codecs);
  1031				if (r)
  1032					return -EINVAL;
  1033				break;
  1034			default:
  1035				DRM_DEBUG_KMS("Invalid request %d\n",
  1036					      info->video_cap.type);
  1037				return -EINVAL;
  1038			}
  1039	
  1040			caps = kzalloc(sizeof(*caps), GFP_KERNEL);
  1041			if (!caps)
  1042				return -ENOMEM;
  1043	
  1044			for (i = 0; i < codecs->codec_count; i++) {
  1045				int idx = codecs->codec_array[i].codec_type;
  1046	
  1047				switch (idx) {
  1048				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2:
  1049				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4:
  1050				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VC1:
  1051				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC:
  1052				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC:
  1053				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_JPEG:
  1054				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9:
  1055				case AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1:
  1056					caps->codec_info[idx].valid = 1;
  1057					caps->codec_info[idx].max_width =
  1058						codecs->codec_array[i].max_width;
  1059					caps->codec_info[idx].max_height =
  1060						codecs->codec_array[i].max_height;
  1061					caps->codec_info[idx].max_pixels_per_frame =
  1062						codecs->codec_array[i].max_pixels_per_frame;
  1063					caps->codec_info[idx].max_level =
  1064						codecs->codec_array[i].max_level;
  1065					break;
  1066				default:
  1067					break;
  1068				}
  1069			}
  1070			r = copy_to_user(out, caps,
  1071					 min((size_t)size, sizeof(*caps))) ? -EFAULT : 0;
  1072			kfree(caps);
  1073			return r;
  1074		}
  1075		default:
  1076			DRM_DEBUG_KMS("Invalid request %d\n", info->query);
  1077			return -EINVAL;
  1078		}
  1079		return 0;
  1080	}
  1081	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
