Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A65AB6D4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 18:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F67310E241;
	Fri,  2 Sep 2022 16:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605B510E241;
 Fri,  2 Sep 2022 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662137410; x=1693673410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/BGlPbehdL3jX8WOHrrKLMGH6akAUvgpFgVe70e9P54=;
 b=TAhLuA2fNqHk8EXSHVJYRip6JL4gQZ7AVr8T8J+XUec0cWfOWC5rYJXr
 elBaTlDWuicbBgchjGXwbSpqEfwLnTu5nqqeIa2nXjwl0Vudk6ngMd6GO
 NmBB30eCO6l3D4Fjgxm8NKBZKaQxF7/9k0fjvWUHuCQMSJKUwGtsthZXW
 wVx1kf7Vw4E4lbFIeVJ2TUBZn6dYznsgNdGF60CD7ZIrN2eaZ1ExXT93u
 ic3eeUr4h6UsIk2S3Chib0ZCtEzKvggKhEkaUTvEmbg9OZBqgG+osnks0
 e0ljVU5CprNpj4Cyt/bH48hC9I6jgpKmRht9tfIMsJO/UlXgjmUIvdo0g w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="275764637"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="275764637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 09:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="755315142"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2022 09:50:08 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oU9rr-0000K7-1q;
 Fri, 02 Sep 2022 16:50:07 +0000
Date: Sat, 3 Sep 2022 00:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 01/11] drm/i915: Move display and media IP version to
 runtime info
Message-ID: <202209030003.YLxzpG2i-lkp@intel.com>
References: <20220902060342.151824-2-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902060342.151824-2-radhakrishna.sripada@intel.com>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Radhakrishna,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20220901]
[cannot apply to drm-intel/for-linux-next drm/drm-next drm-misc/drm-misc-next linus/master v6.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhakrishna-Sripada/Initial-Meteorlake-Support/20220902-140730
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220903/202209030003.YLxzpG2i-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/159b13997e25c824f0404a44fd47e559eb56b97d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Radhakrishna-Sripada/Initial-Meteorlake-Support/20220902-140730
        git checkout 159b13997e25c824f0404a44fd47e559eb56b97d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_gem.c:1267:
   drivers/gpu/drm/i915/selftests/mock_gem_device.c: In function 'mock_gem_device':
>> drivers/gpu/drm/i915/selftests/mock_gem_device.c:175:37: error: 'struct <anonymous>' has no member named 'ver'
     175 |         RUNTIME_INFO(i915)->graphics.ver = -1;
         |                                     ^


vim +175 drivers/gpu/drm/i915/selftests/mock_gem_device.c

bec68cc9ea42d8 Tvrtko Ursulin         2022-03-19  119  
66d9cb5d805af7 Chris Wilson           2017-02-13  120  struct drm_i915_private *mock_gem_device(void)
66d9cb5d805af7 Chris Wilson           2017-02-13  121  {
01b9d4e21148c8 Joerg Roedel           2020-06-25  122  #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
9f9f4101fc98db Chris Wilson           2020-09-16  123  	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
01b9d4e21148c8 Joerg Roedel           2020-06-25  124  #endif
9f9f4101fc98db Chris Wilson           2020-09-16  125  	struct drm_i915_private *i915;
9f9f4101fc98db Chris Wilson           2020-09-16  126  	struct pci_dev *pdev;
d148738923fdb5 Thomas Hellström       2021-06-02  127  	int ret;
66d9cb5d805af7 Chris Wilson           2017-02-13  128  
7fb81e9d80738e Daniel Vetter          2020-03-23  129  	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
66d9cb5d805af7 Chris Wilson           2017-02-13  130  	if (!pdev)
7fb81e9d80738e Daniel Vetter          2020-03-23  131  		return NULL;
66d9cb5d805af7 Chris Wilson           2017-02-13  132  	device_initialize(&pdev->dev);
29f31623d7a830 Chris Wilson           2017-05-18  133  	pdev->class = PCI_BASE_CLASS_DISPLAY << 16;
66d9cb5d805af7 Chris Wilson           2017-02-13  134  	pdev->dev.release = release_dev;
66d9cb5d805af7 Chris Wilson           2017-02-13  135  	dev_set_name(&pdev->dev, "mock");
d58f0083d39a17 Chris Wilson           2019-01-07  136  	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
66d9cb5d805af7 Chris Wilson           2017-02-13  137  
764d2997ec0edb Arnd Bergmann          2017-10-05  138  #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
9f9f4101fc98db Chris Wilson           2020-09-16  139  	/* HACK to disable iommu for the fake device; force identity mapping */
9f9f4101fc98db Chris Wilson           2020-09-16  140  	pdev->dev.iommu = &fake_iommu;
f46f156ea7704a Chris Wilson           2017-09-18  141  #endif
cd01269d11a352 Daniel Vetter          2020-09-19  142  	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
cd01269d11a352 Daniel Vetter          2020-09-19  143  		put_device(&pdev->dev);
cd01269d11a352 Daniel Vetter          2020-09-19  144  		return NULL;
cd01269d11a352 Daniel Vetter          2020-09-19  145  	}
cd01269d11a352 Daniel Vetter          2020-09-19  146  
cd01269d11a352 Daniel Vetter          2020-09-19  147  	i915 = devm_drm_dev_alloc(&pdev->dev, &mock_driver,
cd01269d11a352 Daniel Vetter          2020-09-19  148  				  struct drm_i915_private, drm);
cd01269d11a352 Daniel Vetter          2020-09-19  149  	if (IS_ERR(i915)) {
cd01269d11a352 Daniel Vetter          2020-09-19  150  		pr_err("Failed to allocate mock GEM device: err=%ld\n", PTR_ERR(i915));
cd01269d11a352 Daniel Vetter          2020-09-19  151  		devres_release_group(&pdev->dev, NULL);
cd01269d11a352 Daniel Vetter          2020-09-19  152  		put_device(&pdev->dev);
cd01269d11a352 Daniel Vetter          2020-09-19  153  
cd01269d11a352 Daniel Vetter          2020-09-19  154  		return NULL;
cd01269d11a352 Daniel Vetter          2020-09-19  155  	}
b5891fb520f742 Chris Wilson           2017-09-14  156  
bd780f37a3617d Chris Wilson           2019-01-14  157  	pci_set_drvdata(pdev, i915);
bd780f37a3617d Chris Wilson           2019-01-14  158  
1a0c19248a2f69 Chris Wilson           2017-07-18  159  	dev_pm_domain_set(&pdev->dev, &pm_domain);
1a0c19248a2f69 Chris Wilson           2017-07-18  160  	pm_runtime_enable(&pdev->dev);
66d9cb5d805af7 Chris Wilson           2017-02-13  161  	pm_runtime_dont_use_autosuspend(&pdev->dev);
07e070e1e3b24e Chris Wilson           2018-07-06  162  	if (pm_runtime_enabled(&pdev->dev))
1a0c19248a2f69 Chris Wilson           2017-07-18  163  		WARN_ON(pm_runtime_get_sync(&pdev->dev));
66d9cb5d805af7 Chris Wilson           2017-02-13  164  
66d9cb5d805af7 Chris Wilson           2017-02-13  165  
c499f6cb5ea470 Chris Wilson           2020-07-28  166  	i915_params_copy(&i915->params, &i915_modparams);
c499f6cb5ea470 Chris Wilson           2020-07-28  167  
69c663554452e6 Daniele Ceraolo Spurio 2019-06-13  168  	intel_runtime_pm_init_early(&i915->runtime_pm);
985a0256df3290 Ville Syrjälä          2022-02-04  169  	/* wakeref tracking has significant overhead */
985a0256df3290 Ville Syrjälä          2022-02-04  170  	i915->runtime_pm.no_wakeref_tracking = true;
d5b6c275d04aac Daniele Ceraolo Spurio 2019-06-13  171  
3b5bb0a37665ce Chris Wilson           2017-02-13  172  	/* Using the global GTT may ask questions about KMS users, so prepare */
3b5bb0a37665ce Chris Wilson           2017-02-13  173  	drm_mode_config_init(&i915->drm);
3b5bb0a37665ce Chris Wilson           2017-02-13  174  
43ba44a176a420 Jani Nikula            2022-08-19 @175  	RUNTIME_INFO(i915)->graphics.ver = -1;
66d9cb5d805af7 Chris Wilson           2017-02-13  176  
9d0bad177af9fd Jani Nikula            2022-08-19  177  	RUNTIME_INFO(i915)->page_sizes =
f1f3f98272b9bb Matthew Auld           2017-10-06  178  		I915_GTT_PAGE_SIZE_4K |
a883241c392200 Matthew Auld           2017-10-06  179  		I915_GTT_PAGE_SIZE_64K |
a883241c392200 Matthew Auld           2017-10-06  180  		I915_GTT_PAGE_SIZE_2M;
2a9654b2cdd8f9 Matthew Auld           2017-10-06  181  
f81f30b305d2c7 Jani Nikula            2022-08-19  182  	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
3fc794f27fec8f Chris Wilson           2019-10-26  183  	intel_memory_regions_hw_probe(i915);
da1184cd41d4c6 Matthew Auld           2019-10-18  184  
9a7fc952717ea6 Tvrtko Ursulin         2021-11-11  185  	spin_lock_init(&i915->gpu_error.lock);
9a7fc952717ea6 Tvrtko Ursulin         2021-11-11  186  
9c52d1c816baa5 Chris Wilson           2017-11-10  187  	i915_gem_init__mm(i915);
bec68cc9ea42d8 Tvrtko Ursulin         2022-03-19  188  	intel_root_gt_init_early(i915);
030def2cc91f51 Michał Winiarski       2021-12-14  189  	mock_uncore_init(&i915->uncore, i915);
8c2699fad60e3f Andi Shyti             2021-12-14  190  	atomic_inc(&to_gt(i915)->wakeref.count); /* disable; no hw support */
8c2699fad60e3f Andi Shyti             2021-12-14  191  	to_gt(i915)->awake = -ENODEV;
bec68cc9ea42d8 Tvrtko Ursulin         2022-03-19  192  	mock_gt_probe(i915);
66d9cb5d805af7 Chris Wilson           2017-02-13  193  
d148738923fdb5 Thomas Hellström       2021-06-02  194  	ret = intel_region_ttm_device_init(i915);
d148738923fdb5 Thomas Hellström       2021-06-02  195  	if (ret)
d148738923fdb5 Thomas Hellström       2021-06-02  196  		goto err_ttm;
d148738923fdb5 Thomas Hellström       2021-06-02  197  
0daf0113cff688 Chris Wilson           2017-02-13  198  	i915->wq = alloc_ordered_workqueue("mock", 0);
0daf0113cff688 Chris Wilson           2017-02-13  199  	if (!i915->wq)
19553d57dcddf6 Chris Wilson           2017-12-09  200  		goto err_drv;
0daf0113cff688 Chris Wilson           2017-02-13  201  
5f09a9c8ab6b16 Chris Wilson           2017-06-20  202  	mock_init_contexts(i915);
0daf0113cff688 Chris Wilson           2017-02-13  203  
cdeea858d8df98 Andi Shyti             2021-12-19  204  	/* allocate the ggtt */
cdeea858d8df98 Andi Shyti             2021-12-19  205  	ret = intel_gt_assign_ggtt(to_gt(i915));
cdeea858d8df98 Andi Shyti             2021-12-19  206  	if (ret)
cdeea858d8df98 Andi Shyti             2021-12-19  207  		goto err_unlock;
cdeea858d8df98 Andi Shyti             2021-12-19  208  
cdeea858d8df98 Andi Shyti             2021-12-19  209  	mock_init_ggtt(to_gt(i915));
cdeea858d8df98 Andi Shyti             2021-12-19  210  	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt->vm);
3b5bb0a37665ce Chris Wilson           2017-02-13  211  
488e29fedc1f2b Jani Nikula            2022-08-19  212  	RUNTIME_INFO(i915)->platform_engine_mask = BIT(0);
8c2699fad60e3f Andi Shyti             2021-12-14  213  	to_gt(i915)->info.engine_mask = BIT(0);
4a774ee35c9f57 Chris Wilson           2018-05-23  214  
8c2699fad60e3f Andi Shyti             2021-12-14  215  	to_gt(i915)->engine[RCS0] = mock_engine(i915, "mock", RCS0);
8c2699fad60e3f Andi Shyti             2021-12-14  216  	if (!to_gt(i915)->engine[RCS0])
11334c6aad9500 Chris Wilson           2019-04-26  217  		goto err_unlock;
11334c6aad9500 Chris Wilson           2019-04-26  218  
8c2699fad60e3f Andi Shyti             2021-12-14  219  	if (mock_engine_init(to_gt(i915)->engine[RCS0]))
4a774ee35c9f57 Chris Wilson           2018-05-23  220  		goto err_context;
0daf0113cff688 Chris Wilson           2017-02-13  221  
8c2699fad60e3f Andi Shyti             2021-12-14  222  	__clear_bit(I915_WEDGED, &to_gt(i915)->reset.flags);
cbb153c50ebe4f Chris Wilson           2019-08-08  223  	intel_engines_driver_register(i915);
1d7a99f5148fdc Chris Wilson           2018-05-08  224  
7fb81e9d80738e Daniel Vetter          2020-03-23  225  	i915->do_release = true;
d148738923fdb5 Thomas Hellström       2021-06-02  226  	ida_init(&i915->selftest.mock_region_instances);
7fb81e9d80738e Daniel Vetter          2020-03-23  227  
66d9cb5d805af7 Chris Wilson           2017-02-13  228  	return i915;
66d9cb5d805af7 Chris Wilson           2017-02-13  229  
4a774ee35c9f57 Chris Wilson           2018-05-23  230  err_context:
8c2699fad60e3f Andi Shyti             2021-12-14  231  	intel_gt_driver_remove(to_gt(i915));
1d7a99f5148fdc Chris Wilson           2018-05-08  232  err_unlock:
0daf0113cff688 Chris Wilson           2017-02-13  233  	destroy_workqueue(i915->wq);
19553d57dcddf6 Chris Wilson           2017-12-09  234  err_drv:
d148738923fdb5 Thomas Hellström       2021-06-02  235  	intel_region_ttm_device_fini(i915);
d148738923fdb5 Thomas Hellström       2021-06-02  236  err_ttm:
bec68cc9ea42d8 Tvrtko Ursulin         2022-03-19  237  	intel_gt_driver_late_release_all(i915);
3fc794f27fec8f Chris Wilson           2019-10-26  238  	intel_memory_regions_driver_release(i915);
19553d57dcddf6 Chris Wilson           2017-12-09  239  	drm_mode_config_cleanup(&i915->drm);
82be0d7540b104 Daniel Vetter          2020-09-18  240  	mock_destroy_device(i915);
7fb81e9d80738e Daniel Vetter          2020-03-23  241  
66d9cb5d805af7 Chris Wilson           2017-02-13  242  	return NULL;
66d9cb5d805af7 Chris Wilson           2017-02-13  243  }
82be0d7540b104 Daniel Vetter          2020-09-18  244  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
