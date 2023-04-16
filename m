Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975416E3A1B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A29D10E195;
	Sun, 16 Apr 2023 16:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2410E195;
 Sun, 16 Apr 2023 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681661173; x=1713197173;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=YgHd0PAEgEqAOK/8+KfG7jxJKYg9srgwKOQ1Y8HIhdQ=;
 b=FySqaUNLzqk+LTct1jfFtrru6QeOiOuqlo+p5stoVaZO23xOpXuj8EQM
 6mZuxXi8hCZJdfF+hviq/nwSCz271Y0GOkFF+PYSVzeaOpCdvxq53EkID
 epbMeR+GCvoVxenN8Yl9AnCX9uExWW9BljBxKSwdSzdCPIlDtox5qOQy8
 rkSDQn8JpVxiMUvTqjGatbsFjS/Sc9qi+AzmhIK5JXPRD/qyNZ7+56ZSC
 iIlXyH3YjNKqmLunfWLN3MeNG1NsWnMLmVbhFWO+elATlLeVYmFrCZG/w
 5kjfKytUHdM2vsVioQf+P7n05AAQkjUCVzVSyr4cdstpA6fwcp38xNIV8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342235778"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; d="scan'208";a="342235778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 09:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="1020151968"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; d="scan'208";a="1020151968"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2023 09:06:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1po4tG-000bkl-2j;
 Sun, 16 Apr 2023 16:06:10 +0000
Date: Mon, 17 Apr 2023 00:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-tip:drm-tip 4/8] drivers/gpu/drm/msm/msm_drv.c:458:15: error:
 too many arguments to function 'drm_aperture_remove_framebuffers'
Message-ID: <202304162325.ylTNxYSY-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   c7b438b3ce89d13c67cade787768522b6cf9776b
commit: 6db3267139706e62b93b39fc37e9d0ca230d9b50 [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304162325.ylTNxYSY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 6db3267139706e62b93b39fc37e9d0ca230d9b50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162325.ylTNxYSY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_drm_init':
>> drivers/gpu/drm/msm/msm_drv.c:458:15: error: too many arguments to function 'drm_aperture_remove_framebuffers'
     458 |         ret = drm_aperture_remove_framebuffers(false, drv);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/msm_drv.c:16:
   include/drm/drm_aperture.h:32:1: note: declared here
      32 | drm_aperture_remove_framebuffers(const struct drm_driver *req_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_aperture_remove_framebuffers +458 drivers/gpu/drm/msm/msm_drv.c

60d476af960158 Johan Hovold               2023-03-06  404  
70a59dd82959f8 Daniel Vetter              2020-11-04  405  static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
5bf9c0b614542d Rob Clark                  2015-03-03  406  {
ec919e6e7146e0 AngeloGioacchino Del Regno 2021-12-01  407  	struct msm_drm_private *priv = dev_get_drvdata(dev);
2b669875332fbd Archit Taneja              2016-05-02  408  	struct drm_device *ddev;
5bf9c0b614542d Rob Clark                  2015-03-03  409  	struct msm_kms *kms;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  410  	int ret, i;
5bf9c0b614542d Rob Clark                  2015-03-03  411  
5d40a4b8d824e3 Javier Martinez Canillas   2021-12-17  412  	if (drm_firmware_drivers_only())
5d40a4b8d824e3 Javier Martinez Canillas   2021-12-17  413  		return -ENODEV;
5d40a4b8d824e3 Javier Martinez Canillas   2021-12-17  414  
2b669875332fbd Archit Taneja              2016-05-02  415  	ddev = drm_dev_alloc(drv, dev);
0f2886057be322 Tom Gundersen              2016-09-21  416  	if (IS_ERR(ddev)) {
6a41da17e87dee Mamta Shukla               2018-10-20  417  		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
0f2886057be322 Tom Gundersen              2016-09-21  418  		return PTR_ERR(ddev);
2b669875332fbd Archit Taneja              2016-05-02  419  	}
2b669875332fbd Archit Taneja              2016-05-02  420  	ddev->dev_private = priv;
68209390f11603 Rob Clark                  2016-05-17  421  	priv->dev = ddev;
5bf9c0b614542d Rob Clark                  2015-03-03  422  
5bf9c0b614542d Rob Clark                  2015-03-03  423  	priv->wq = alloc_ordered_workqueue("msm", 0);
ca090c837b4307 Johan Hovold               2023-03-06  424  	if (!priv->wq) {
ca090c837b4307 Johan Hovold               2023-03-06  425  		ret = -ENOMEM;
ca090c837b4307 Johan Hovold               2023-03-06  426  		goto err_put_dev;
ca090c837b4307 Johan Hovold               2023-03-06  427  	}
5bf9c0b614542d Rob Clark                  2015-03-03  428  
6ed0897cd800c3 Rob Clark                  2021-03-31  429  	INIT_LIST_HEAD(&priv->objects);
6ed0897cd800c3 Rob Clark                  2021-03-31  430  	mutex_init(&priv->obj_lock);
6ed0897cd800c3 Rob Clark                  2021-03-31  431  
b352ba54a82072 Rob Clark                  2022-08-02  432  	/*
b352ba54a82072 Rob Clark                  2022-08-02  433  	 * Initialize the LRUs:
b352ba54a82072 Rob Clark                  2022-08-02  434  	 */
b352ba54a82072 Rob Clark                  2022-08-02  435  	mutex_init(&priv->lru.lock);
b352ba54a82072 Rob Clark                  2022-08-02  436  	drm_gem_lru_init(&priv->lru.unbacked, &priv->lru.lock);
b352ba54a82072 Rob Clark                  2022-08-02  437  	drm_gem_lru_init(&priv->lru.pinned,   &priv->lru.lock);
b352ba54a82072 Rob Clark                  2022-08-02  438  	drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
b352ba54a82072 Rob Clark                  2022-08-02  439  	drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
48e7f18392c66f Kristian H. Kristensen     2019-03-20  440  
d984457b31c4c5 Rob Clark                  2020-10-23  441  	/* Teach lockdep about lock ordering wrt. shrinker: */
d984457b31c4c5 Rob Clark                  2020-10-23  442  	fs_reclaim_acquire(GFP_KERNEL);
b352ba54a82072 Rob Clark                  2022-08-02  443  	might_lock(&priv->lru.lock);
d984457b31c4c5 Rob Clark                  2020-10-23  444  	fs_reclaim_release(GFP_KERNEL);
5bf9c0b614542d Rob Clark                  2015-03-03  445  
2b669875332fbd Archit Taneja              2016-05-02  446  	drm_mode_config_init(ddev);
060530f1ea6740 Rob Clark                  2014-03-03  447  
d863f0c7b53628 Craig Tatlor               2020-12-30  448  	ret = msm_init_vram(ddev);
77050c3febb180 Jeykumar Sankaran          2018-06-27  449  	if (ret)
a75b49db6529b2 Johan Hovold               2023-03-06  450  		goto err_cleanup_mode_config;
060530f1ea6740 Rob Clark                  2014-03-03  451  
d863f0c7b53628 Craig Tatlor               2020-12-30  452  	/* Bind all our sub-components: */
d863f0c7b53628 Craig Tatlor               2020-12-30  453  	ret = component_bind_all(dev, ddev);
13f15565f7887a Rob Clark                  2015-05-07  454  	if (ret)
60d476af960158 Johan Hovold               2023-03-06  455  		goto err_deinit_vram;
13f15565f7887a Rob Clark                  2015-05-07  456  
3aa4e828be97b9 Thomas Zimmermann          2023-04-03  457  	/* the fw fb could be anywhere in memory */
3aa4e828be97b9 Thomas Zimmermann          2023-04-03 @458  	ret = drm_aperture_remove_framebuffers(false, drv);
3aa4e828be97b9 Thomas Zimmermann          2023-04-03  459  	if (ret)
3aa4e828be97b9 Thomas Zimmermann          2023-04-03  460  		goto err_msm_uninit;
3aa4e828be97b9 Thomas Zimmermann          2023-04-03  461  
d5653a994a665c Robin Murphy               2020-09-03  462  	dma_set_max_seg_size(dev, UINT_MAX);
db735fc4036bbe Sean Paul                  2020-01-21  463  
68209390f11603 Rob Clark                  2016-05-17  464  	msm_gem_shrinker_init(ddev);
68209390f11603 Rob Clark                  2016-05-17  465  
5d44531be0982d Dmitry Baryshkov           2022-04-19  466  	if (priv->kms_init) {
5d44531be0982d Dmitry Baryshkov           2022-04-19  467  		ret = priv->kms_init(ddev);
5d44531be0982d Dmitry Baryshkov           2022-04-19  468  		if (ret) {
6a41da17e87dee Mamta Shukla               2018-10-20  469  			DRM_DEV_ERROR(dev, "failed to load kms\n");
b2ccfdf1dde588 Jonathan Marek             2018-11-21  470  			priv->kms = NULL;
77050c3febb180 Jeykumar Sankaran          2018-06-27  471  			goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  472  		}
5d44531be0982d Dmitry Baryshkov           2022-04-19  473  		kms = priv->kms;
5d44531be0982d Dmitry Baryshkov           2022-04-19  474  	} else {
5d44531be0982d Dmitry Baryshkov           2022-04-19  475  		/* valid only for the dummy headless case, where of_node=NULL */
5d44531be0982d Dmitry Baryshkov           2022-04-19  476  		WARN_ON(dev->of_node);
5d44531be0982d Dmitry Baryshkov           2022-04-19  477  		kms = NULL;
5d44531be0982d Dmitry Baryshkov           2022-04-19  478  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  479  
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  480  	/* Enable normalization of plane zpos */
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  481  	ddev->mode_config.normalize_zpos = true;
bb676df12b5e81 Jeykumar Sankaran          2018-06-11  482  
c8afe684c95cd1 Rob Clark                  2013-06-26  483  	if (kms) {
2d99ced787e3d0 Rob Clark                  2019-08-29  484  		kms->dev = ddev;
c8afe684c95cd1 Rob Clark                  2013-06-26  485  		ret = kms->funcs->hw_init(kms);
c8afe684c95cd1 Rob Clark                  2013-06-26  486  		if (ret) {
6a41da17e87dee Mamta Shukla               2018-10-20  487  			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
77050c3febb180 Jeykumar Sankaran          2018-06-27  488  			goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  489  		}
c8afe684c95cd1 Rob Clark                  2013-06-26  490  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  491  
c51720a6d0b402 Kuogee Hsieh               2022-07-06  492  	drm_helper_move_panel_connectors_to_head(ddev);
c51720a6d0b402 Kuogee Hsieh               2022-07-06  493  
2b669875332fbd Archit Taneja              2016-05-02  494  	ddev->mode_config.funcs = &mode_config_funcs;
d14659f5de7d28 Sean Paul                  2018-02-28  495  	ddev->mode_config.helper_private = &mode_config_helper_funcs;
c8afe684c95cd1 Rob Clark                  2013-06-26  496  
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  497  	for (i = 0; i < priv->num_crtcs; i++) {
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  498  		/* initialize event thread */
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  499  		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  500  		priv->event_thread[i].dev = ddev;
1041dee2178ffd Bernard                    2020-07-21  501  		priv->event_thread[i].worker = kthread_create_worker(0,
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  502  			"crtc_event:%d", priv->event_thread[i].crtc_id);
1041dee2178ffd Bernard                    2020-07-21  503  		if (IS_ERR(priv->event_thread[i].worker)) {
a1c9b1e3bdd6d8 Zhen Lei                   2021-05-08  504  			ret = PTR_ERR(priv->event_thread[i].worker);
4971f090aa7f6c Linus Torvalds             2018-12-25  505  			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
c79bb6b92defdc Dmitry Baryshkov           2022-06-18  506  			priv->event_thread[i].worker = NULL;
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  507  			goto err_msm_uninit;
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  508  		}
7f9743abaa79d3 Jeykumar Sankaran          2018-10-10  509  
6d2b84a4e5b954 Linus Torvalds             2020-08-06  510  		sched_set_fifo(priv->event_thread[i].worker->task);
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  511  	}
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  512  
2b669875332fbd Archit Taneja              2016-05-02  513  	ret = drm_vblank_init(ddev, priv->num_crtcs);
c8afe684c95cd1 Rob Clark                  2013-06-26  514  	if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  515  		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  516  		goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  517  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  518  
a2b3a5571f386e Archit Taneja              2016-05-18  519  	if (kms) {
2b669875332fbd Archit Taneja              2016-05-02  520  		pm_runtime_get_sync(dev);
f026e431cf8611 Thomas Zimmermann          2021-08-03  521  		ret = msm_irq_install(ddev, kms->irq);
2b669875332fbd Archit Taneja              2016-05-02  522  		pm_runtime_put_sync(dev);
c8afe684c95cd1 Rob Clark                  2013-06-26  523  		if (ret < 0) {
6a41da17e87dee Mamta Shukla               2018-10-20  524  			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
77050c3febb180 Jeykumar Sankaran          2018-06-27  525  			goto err_msm_uninit;
c8afe684c95cd1 Rob Clark                  2013-06-26  526  		}
a2b3a5571f386e Archit Taneja              2016-05-18  527  	}
c8afe684c95cd1 Rob Clark                  2013-06-26  528  
2b669875332fbd Archit Taneja              2016-05-02  529  	ret = drm_dev_register(ddev, 0);
2b669875332fbd Archit Taneja              2016-05-02  530  	if (ret)
77050c3febb180 Jeykumar Sankaran          2018-06-27  531  		goto err_msm_uninit;
2b669875332fbd Archit Taneja              2016-05-02  532  
6a7e0b0e9fb839 Fabio Estevam              2021-09-14  533  	if (kms) {
98659487b845c0 Abhinav Kumar              2021-04-16  534  		ret = msm_disp_snapshot_init(ddev);
98659487b845c0 Abhinav Kumar              2021-04-16  535  		if (ret)
98659487b845c0 Abhinav Kumar              2021-04-16  536  			DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
6a7e0b0e9fb839 Fabio Estevam              2021-09-14  537  	}
2b669875332fbd Archit Taneja              2016-05-02  538  	drm_mode_config_reset(ddev);
cf3a7e4ce08e68 Rob Clark                  2014-11-08  539  
2b669875332fbd Archit Taneja              2016-05-02  540  	ret = msm_debugfs_late_init(ddev);
a7d3c9509b2fec Rob Clark                  2014-05-30  541  	if (ret)
77050c3febb180 Jeykumar Sankaran          2018-06-27  542  		goto err_msm_uninit;
a7d3c9509b2fec Rob Clark                  2014-05-30  543  
2b669875332fbd Archit Taneja              2016-05-02  544  	drm_kms_helper_poll_init(ddev);
c8afe684c95cd1 Rob Clark                  2013-06-26  545  
940b869c2f2fb7 Thomas Zimmermann          2023-04-03  546  	if (kms)
940b869c2f2fb7 Thomas Zimmermann          2023-04-03  547  		msm_fbdev_setup(ddev);
940b869c2f2fb7 Thomas Zimmermann          2023-04-03  548  
c8afe684c95cd1 Rob Clark                  2013-06-26  549  	return 0;
c8afe684c95cd1 Rob Clark                  2013-06-26  550  
77050c3febb180 Jeykumar Sankaran          2018-06-27  551  err_msm_uninit:
2b669875332fbd Archit Taneja              2016-05-02  552  	msm_drm_uninit(dev);
214b09db619784 Johan Hovold               2023-03-06  553  
214b09db619784 Johan Hovold               2023-03-06  554  	return ret;
214b09db619784 Johan Hovold               2023-03-06  555  
60d476af960158 Johan Hovold               2023-03-06  556  err_deinit_vram:
60d476af960158 Johan Hovold               2023-03-06  557  	msm_deinit_vram(ddev);
a75b49db6529b2 Johan Hovold               2023-03-06  558  err_cleanup_mode_config:
a75b49db6529b2 Johan Hovold               2023-03-06  559  	drm_mode_config_cleanup(ddev);
a75b49db6529b2 Johan Hovold               2023-03-06  560  	destroy_workqueue(priv->wq);
214b09db619784 Johan Hovold               2023-03-06  561  err_put_dev:
214b09db619784 Johan Hovold               2023-03-06  562  	drm_dev_put(ddev);
214b09db619784 Johan Hovold               2023-03-06  563  
c8afe684c95cd1 Rob Clark                  2013-06-26  564  	return ret;
c8afe684c95cd1 Rob Clark                  2013-06-26  565  }
c8afe684c95cd1 Rob Clark                  2013-06-26  566  

:::::: The code at line 458 was first introduced by commit
:::::: 3aa4e828be97b9bacad5679201e22796f15e763b drm/msm: Clear aperture ownership outside of fbdev code

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
