Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96372CB1A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 01:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CAC6E9A9;
	Wed,  2 Dec 2020 00:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D86E9A8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 00:46:40 +0000 (UTC)
IronPort-SDR: NhQY2+Lvjl5UaZuRbfbwpOZ2ik+V8IE7cjXnX/GVpXmLSTEcKKh9noD2wG5i5Rsej2LjcnTcB0
 deUkZsfLYgSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152188462"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
 d="gz'50?scan'50,208,50";a="152188462"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 16:46:39 -0800
IronPort-SDR: cV8x6Ir5wDW2RGIx0vV1so49sqHgpu0qHFUg3Vhy694Bi2oU/nXEk9zlJP7FJWwmbFCMgYcz+H
 waUMRQomKS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
 d="gz'50?scan'50,208,50";a="373264150"
Received: from lkp-server01.sh.intel.com (HELO eece8c761214) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2020 16:46:37 -0800
Received: from kbuild by eece8c761214 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkGI0-000015-HB; Wed, 02 Dec 2020 00:46:36 +0000
Date: Wed, 2 Dec 2020 08:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/8] drm/vmwgfx: Switch to a managed drm device
Message-ID: <202012020818.PcGERwCR-lkp@intel.com>
References: <20201201201828.808888-3-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20201201201828.808888-3-zackr@vmware.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zack,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on tegra-drm/drm/tegra/for-next linus/master v5.10-rc6]
[cannot apply to drm-exynos/exynos-drm-next drm-tip/drm-tip drm/drm-next next-20201201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-add-Zack-Rusin-as-maintainer/20201202-043705
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-rhel (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/29587b40449b0290424fbb9083dc47b1869ef7d5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-add-Zack-Rusin-as-maintainer/20201202-043705
        git checkout 29587b40449b0290424fbb9083dc47b1869ef7d5
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_load':
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:794:36: error: invalid type argument of '->' (have 'struct drm_device')
     794 |  dma_set_max_seg_size(dev_priv->drm->dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
         |                                    ^~
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:866:6: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     866 |      dev->anon_inode->i_mapping,
         |      ^~~
         |      cdev
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:866:6: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: In function 'vmw_ttm_populate':
>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:595:54: error: 'struct vmw_private' has no member named 'dev'; did you mean 'bdev'?
     595 |   ret = ttm_dma_populate(&vmw_tt->dma_ttm, dev_priv->dev->dev,
         |                                                      ^~~
         |                                                      bdev
   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: In function 'vmw_ttm_unpopulate':
   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c:624:50: error: 'struct vmw_private' has no member named 'dev'; did you mean 'bdev'?
     624 |   ttm_dma_unpopulate(&vmw_tt->dma_ttm, dev_priv->dev->dev);
         |                                                  ^~~
         |                                                  bdev

vim +794 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c

   651	
   652	static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
   653	{
   654		int ret;
   655		uint32_t svga_id;
   656		enum vmw_res_type i;
   657		bool refuse_dma = false;
   658		char host_log[100] = {0};
   659	
   660		pci_set_master(dev_priv->drm.pdev);
   661	
   662		dev_priv->vmw_chipset = chipset;
   663		dev_priv->last_read_seqno = (uint32_t) -100;
   664		mutex_init(&dev_priv->cmdbuf_mutex);
   665		mutex_init(&dev_priv->release_mutex);
   666		mutex_init(&dev_priv->binding_mutex);
   667		mutex_init(&dev_priv->global_kms_state_mutex);
   668		ttm_lock_init(&dev_priv->reservation_sem);
   669		spin_lock_init(&dev_priv->resource_lock);
   670		spin_lock_init(&dev_priv->hw_lock);
   671		spin_lock_init(&dev_priv->waiter_lock);
   672		spin_lock_init(&dev_priv->cap_lock);
   673		spin_lock_init(&dev_priv->svga_lock);
   674		spin_lock_init(&dev_priv->cursor_lock);
   675	
   676		for (i = vmw_res_context; i < vmw_res_max; ++i) {
   677			idr_init(&dev_priv->res_idr[i]);
   678			INIT_LIST_HEAD(&dev_priv->res_lru[i]);
   679		}
   680	
   681		init_waitqueue_head(&dev_priv->fence_queue);
   682		init_waitqueue_head(&dev_priv->fifo_queue);
   683		dev_priv->fence_queue_waiters = 0;
   684		dev_priv->fifo_queue_waiters = 0;
   685	
   686		dev_priv->used_memory_size = 0;
   687	
   688		dev_priv->io_start = pci_resource_start(dev_priv->drm.pdev, 0);
   689		dev_priv->vram_start = pci_resource_start(dev_priv->drm.pdev, 1);
   690		dev_priv->mmio_start = pci_resource_start(dev_priv->drm.pdev, 2);
   691	
   692		dev_priv->assume_16bpp = !!vmw_assume_16bpp;
   693	
   694		dev_priv->enable_fb = enable_fbdev;
   695	
   696		vmw_write(dev_priv, SVGA_REG_ID, SVGA_ID_2);
   697		svga_id = vmw_read(dev_priv, SVGA_REG_ID);
   698		if (svga_id != SVGA_ID_2) {
   699			ret = -ENOSYS;
   700			DRM_ERROR("Unsupported SVGA ID 0x%x\n", svga_id);
   701			goto out_err0;
   702		}
   703	
   704		dev_priv->capabilities = vmw_read(dev_priv, SVGA_REG_CAPABILITIES);
   705	
   706		if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER) {
   707			dev_priv->capabilities2 = vmw_read(dev_priv, SVGA_REG_CAP2);
   708		}
   709	
   710	
   711		ret = vmw_dma_select_mode(dev_priv);
   712		if (unlikely(ret != 0)) {
   713			DRM_INFO("Restricting capabilities since DMA not available.\n");
   714			refuse_dma = true;
   715			if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS)
   716				DRM_INFO("Disabling 3D acceleration.\n");
   717		}
   718	
   719		dev_priv->vram_size = vmw_read(dev_priv, SVGA_REG_VRAM_SIZE);
   720		dev_priv->mmio_size = vmw_read(dev_priv, SVGA_REG_MEM_SIZE);
   721		dev_priv->fb_max_width = vmw_read(dev_priv, SVGA_REG_MAX_WIDTH);
   722		dev_priv->fb_max_height = vmw_read(dev_priv, SVGA_REG_MAX_HEIGHT);
   723	
   724		vmw_get_initial_size(dev_priv);
   725	
   726		if (dev_priv->capabilities & SVGA_CAP_GMR2) {
   727			dev_priv->max_gmr_ids =
   728				vmw_read(dev_priv, SVGA_REG_GMR_MAX_IDS);
   729			dev_priv->max_gmr_pages =
   730				vmw_read(dev_priv, SVGA_REG_GMRS_MAX_PAGES);
   731			dev_priv->memory_size =
   732				vmw_read(dev_priv, SVGA_REG_MEMORY_SIZE);
   733			dev_priv->memory_size -= dev_priv->vram_size;
   734		} else {
   735			/*
   736			 * An arbitrary limit of 512MiB on surface
   737			 * memory. But all HWV8 hardware supports GMR2.
   738			 */
   739			dev_priv->memory_size = 512*1024*1024;
   740		}
   741		dev_priv->max_mob_pages = 0;
   742		dev_priv->max_mob_size = 0;
   743		if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS) {
   744			uint64_t mem_size;
   745	
   746			if (dev_priv->capabilities2 & SVGA_CAP2_GB_MEMSIZE_2)
   747				mem_size = vmw_read(dev_priv,
   748						    SVGA_REG_GBOBJECT_MEM_SIZE_KB);
   749			else
   750				mem_size =
   751					vmw_read(dev_priv,
   752						 SVGA_REG_SUGGESTED_GBOBJECT_MEM_SIZE_KB);
   753	
   754			/*
   755			 * Workaround for low memory 2D VMs to compensate for the
   756			 * allocation taken by fbdev
   757			 */
   758			if (!(dev_priv->capabilities & SVGA_CAP_3D))
   759				mem_size *= 3;
   760	
   761			dev_priv->max_mob_pages = mem_size * 1024 / PAGE_SIZE;
   762			dev_priv->prim_bb_mem =
   763				vmw_read(dev_priv,
   764					 SVGA_REG_MAX_PRIMARY_BOUNDING_BOX_MEM);
   765			dev_priv->max_mob_size =
   766				vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
   767			dev_priv->stdu_max_width =
   768				vmw_read(dev_priv, SVGA_REG_SCREENTARGET_MAX_WIDTH);
   769			dev_priv->stdu_max_height =
   770				vmw_read(dev_priv, SVGA_REG_SCREENTARGET_MAX_HEIGHT);
   771	
   772			vmw_write(dev_priv, SVGA_REG_DEV_CAP,
   773				  SVGA3D_DEVCAP_MAX_TEXTURE_WIDTH);
   774			dev_priv->texture_max_width = vmw_read(dev_priv,
   775							       SVGA_REG_DEV_CAP);
   776			vmw_write(dev_priv, SVGA_REG_DEV_CAP,
   777				  SVGA3D_DEVCAP_MAX_TEXTURE_HEIGHT);
   778			dev_priv->texture_max_height = vmw_read(dev_priv,
   779								SVGA_REG_DEV_CAP);
   780		} else {
   781			dev_priv->texture_max_width = 8192;
   782			dev_priv->texture_max_height = 8192;
   783			dev_priv->prim_bb_mem = dev_priv->vram_size;
   784		}
   785	
   786		vmw_print_capabilities(dev_priv->capabilities);
   787		if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER)
   788			vmw_print_capabilities2(dev_priv->capabilities2);
   789	
   790		ret = vmw_dma_masks(dev_priv);
   791		if (unlikely(ret != 0))
   792			goto out_err0;
   793	
 > 794		dma_set_max_seg_size(dev_priv->drm->dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
   795							       SCATTERLIST_MAX_SEGMENT));
   796	
   797		if (dev_priv->capabilities & SVGA_CAP_GMR2) {
   798			DRM_INFO("Max GMR ids is %u\n",
   799				 (unsigned)dev_priv->max_gmr_ids);
   800			DRM_INFO("Max number of GMR pages is %u\n",
   801				 (unsigned)dev_priv->max_gmr_pages);
   802			DRM_INFO("Max dedicated hypervisor surface memory is %u kiB\n",
   803				 (unsigned)dev_priv->memory_size / 1024);
   804		}
   805		DRM_INFO("Maximum display memory size is %u kiB\n",
   806			 dev_priv->prim_bb_mem / 1024);
   807		DRM_INFO("VRAM at 0x%08x size is %u kiB\n",
   808			 dev_priv->vram_start, dev_priv->vram_size / 1024);
   809		DRM_INFO("MMIO at 0x%08x size is %u kiB\n",
   810			 dev_priv->mmio_start, dev_priv->mmio_size / 1024);
   811	
   812		dev_priv->mmio_virt = memremap(dev_priv->mmio_start,
   813					       dev_priv->mmio_size, MEMREMAP_WB);
   814	
   815		if (unlikely(dev_priv->mmio_virt == NULL)) {
   816			ret = -ENOMEM;
   817			DRM_ERROR("Failed mapping MMIO.\n");
   818			goto out_err0;
   819		}
   820	
   821		/* Need mmio memory to check for fifo pitchlock cap. */
   822		if (!(dev_priv->capabilities & SVGA_CAP_DISPLAY_TOPOLOGY) &&
   823		    !(dev_priv->capabilities & SVGA_CAP_PITCHLOCK) &&
   824		    !vmw_fifo_have_pitchlock(dev_priv)) {
   825			ret = -ENOSYS;
   826			DRM_ERROR("Hardware has no pitchlock\n");
   827			goto out_err4;
   828		}
   829	
   830		dev_priv->tdev = ttm_object_device_init(&ttm_mem_glob, 12,
   831							&vmw_prime_dmabuf_ops);
   832	
   833		if (unlikely(dev_priv->tdev == NULL)) {
   834			DRM_ERROR("Unable to initialize TTM object management.\n");
   835			ret = -ENOMEM;
   836			goto out_err4;
   837		}
   838	
   839		dev_priv->drm.dev_private = dev_priv;
   840	
   841		ret = pci_request_regions(dev_priv->drm.pdev, "vmwgfx probe");
   842		if (ret) {
   843			DRM_ERROR("Failed reserving PCI regions.\n");
   844			goto out_no_device;
   845		}
   846	
   847		if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
   848			ret = vmw_irq_install(&dev_priv->drm, dev_priv->drm.pdev->irq);
   849			if (ret != 0) {
   850				DRM_ERROR("Failed installing irq: %d\n", ret);
   851				goto out_no_irq;
   852			}
   853		}
   854	
   855		dev_priv->fman = vmw_fence_manager_init(dev_priv);
   856		if (unlikely(dev_priv->fman == NULL)) {
   857			ret = -ENOMEM;
   858			goto out_no_fman;
   859		}
   860	
   861		drm_vma_offset_manager_init(&dev_priv->vma_manager,
   862					    DRM_FILE_PAGE_OFFSET_START,
   863					    DRM_FILE_PAGE_OFFSET_SIZE);
   864		ret = ttm_bo_device_init(&dev_priv->bdev,
   865					 &vmw_bo_driver,
 > 866					 dev->anon_inode->i_mapping,
   867					 &dev_priv->vma_manager,
   868					 false);
   869		if (unlikely(ret != 0)) {
   870			DRM_ERROR("Failed initializing TTM buffer object driver.\n");
   871			goto out_no_bdev;
   872		}
   873	
   874		/*
   875		 * Enable VRAM, but initially don't use it until SVGA is enabled and
   876		 * unhidden.
   877		 */
   878	
   879		ret = vmw_vram_manager_init(dev_priv);
   880		if (unlikely(ret != 0)) {
   881			DRM_ERROR("Failed initializing memory manager for VRAM.\n");
   882			goto out_no_vram;
   883		}
   884	
   885		/*
   886		 * "Guest Memory Regions" is an aperture like feature with
   887		 *  one slot per bo. There is an upper limit of the number of
   888		 *  slots as well as the bo size.
   889		 */
   890		dev_priv->has_gmr = true;
   891		/* TODO: This is most likely not correct */
   892		if (((dev_priv->capabilities & (SVGA_CAP_GMR | SVGA_CAP_GMR2)) == 0) ||
   893		    refuse_dma ||
   894		    vmw_gmrid_man_init(dev_priv, VMW_PL_GMR) != 0) {
   895			DRM_INFO("No GMR memory available. "
   896				 "Graphics memory resources are very limited.\n");
   897			dev_priv->has_gmr = false;
   898		}
   899	
   900		if (dev_priv->capabilities & SVGA_CAP_GBOBJECTS && !refuse_dma) {
   901			dev_priv->has_mob = true;
   902	
   903			if (vmw_gmrid_man_init(dev_priv, VMW_PL_MOB) != 0) {
   904				DRM_INFO("No MOB memory available. "
   905					 "3D will be disabled.\n");
   906				dev_priv->has_mob = false;
   907			}
   908		}
   909	
   910		if (dev_priv->has_mob && (dev_priv->capabilities & SVGA_CAP_DX)) {
   911			spin_lock(&dev_priv->cap_lock);
   912			vmw_write(dev_priv, SVGA_REG_DEV_CAP, SVGA3D_DEVCAP_DXCONTEXT);
   913			if (vmw_read(dev_priv, SVGA_REG_DEV_CAP))
   914				dev_priv->sm_type = VMW_SM_4;
   915			spin_unlock(&dev_priv->cap_lock);
   916		}
   917	
   918		vmw_validation_mem_init_ttm(dev_priv, VMWGFX_VALIDATION_MEM_GRAN);
   919	
   920		/* SVGA_CAP2_DX2 (DefineGBSurface_v3) is needed for SM4_1 support */
   921		if (has_sm4_context(dev_priv) &&
   922		    (dev_priv->capabilities2 & SVGA_CAP2_DX2)) {
   923			vmw_write(dev_priv, SVGA_REG_DEV_CAP, SVGA3D_DEVCAP_SM41);
   924	
   925			if (vmw_read(dev_priv, SVGA_REG_DEV_CAP))
   926				dev_priv->sm_type = VMW_SM_4_1;
   927	
   928			if (has_sm4_1_context(dev_priv) &&
   929			    (dev_priv->capabilities2 & SVGA_CAP2_DX3)) {
   930				vmw_write(dev_priv, SVGA_REG_DEV_CAP, SVGA3D_DEVCAP_SM5);
   931				if (vmw_read(dev_priv, SVGA_REG_DEV_CAP))
   932					dev_priv->sm_type = VMW_SM_5;
   933			}
   934		}
   935	
   936		ret = vmw_kms_init(dev_priv);
   937		if (unlikely(ret != 0))
   938			goto out_no_kms;
   939		vmw_overlay_init(dev_priv);
   940	
   941		ret = vmw_request_device(dev_priv);
   942		if (ret)
   943			goto out_no_fifo;
   944	
   945		DRM_INFO("Atomic: %s\n", (dev_priv->drm.driver->driver_features & DRIVER_ATOMIC)
   946			 ? "yes." : "no.");
   947		if (dev_priv->sm_type == VMW_SM_5)
   948			DRM_INFO("SM5 support available.\n");
   949		if (dev_priv->sm_type == VMW_SM_4_1)
   950			DRM_INFO("SM4_1 support available.\n");
   951		if (dev_priv->sm_type == VMW_SM_4)
   952			DRM_INFO("SM4 support available.\n");
   953	
   954		snprintf(host_log, sizeof(host_log), "vmwgfx: %s-%s",
   955			VMWGFX_REPO, VMWGFX_GIT_VERSION);
   956		vmw_host_log(host_log);
   957	
   958		memset(host_log, 0, sizeof(host_log));
   959		snprintf(host_log, sizeof(host_log), "vmwgfx: Module Version: %d.%d.%d",
   960			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
   961			VMWGFX_DRIVER_PATCHLEVEL);
   962		vmw_host_log(host_log);
   963	
   964		if (dev_priv->enable_fb) {
   965			vmw_fifo_resource_inc(dev_priv);
   966			vmw_svga_enable(dev_priv);
   967			vmw_fb_init(dev_priv);
   968		}
   969	
   970		dev_priv->pm_nb.notifier_call = vmwgfx_pm_notifier;
   971		register_pm_notifier(&dev_priv->pm_nb);
   972	
   973		return 0;
   974	
   975	out_no_fifo:
   976		vmw_overlay_close(dev_priv);
   977		vmw_kms_close(dev_priv);
   978	out_no_kms:
   979		if (dev_priv->has_mob)
   980			vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
   981		if (dev_priv->has_gmr)
   982			vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
   983		vmw_vram_manager_fini(dev_priv);
   984	out_no_vram:
   985		(void)ttm_bo_device_release(&dev_priv->bdev);
   986	out_no_bdev:
   987		vmw_fence_manager_takedown(dev_priv->fman);
   988	out_no_fman:
   989		if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
   990			vmw_irq_uninstall(&dev_priv->drm);
   991	out_no_irq:
   992		pci_release_regions(dev_priv->drm.pdev);
   993	out_no_device:
   994		ttm_object_device_release(&dev_priv->tdev);
   995	out_err4:
   996		memunmap(dev_priv->mmio_virt);
   997	out_err0:
   998		for (i = vmw_res_context; i < vmw_res_max; ++i)
   999			idr_destroy(&dev_priv->res_idr[i]);
  1000	
  1001		if (dev_priv->ctx.staged_bindings)
  1002			vmw_binding_state_free(dev_priv->ctx.staged_bindings);
  1003		kfree(dev_priv);
  1004		return ret;
  1005	}
  1006	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--zYM0uCDKw75PZbzx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--zYM0uCDKw75PZbzx--
