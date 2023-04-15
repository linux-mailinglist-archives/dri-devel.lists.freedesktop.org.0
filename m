Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C686E31CD
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 16:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38B710E063;
	Sat, 15 Apr 2023 14:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7458E10E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681568639; x=1713104639;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OfnwQm6Bo6FWbilIKA1+eP5Y8qlhKGqRenzmVzOoc4E=;
 b=EMoqxrgHnPTZWqw5rHR6XLAwwTi4+YQZdiVUqfyxdw6XXKp+hpgAYYNY
 0DXtdjfEI01f+oBE5Z3Ka7D6Cxwx/sGJ7Lyj2721btpkohaBhtQLlHSXs
 sn7clfus1DF6rHahnXwAVn65iKWQw7/tJ58R4+yk08gA635GJ/jq5xVyf
 R0OLGCdUHjtmlXFSFwuiPrfjnKZTpxWJ9F0VhlGZvxnEGShZkuw/HkXP7
 1gezJoY2ValxRbwm5Ji9qJQXOVa6a89CAK1n7w0Bwo6SrsqvudO/Uz3Oe
 fZwxBobr+C77h7qGTX7JbBVWgBaR5VqS/feCiWt0i5uwbTFglKu8p72eb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="407538547"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="407538547"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2023 07:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="1019922219"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="1019922219"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 07:23:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pngoY-000b6h-2g;
 Sat, 15 Apr 2023 14:23:42 +0000
Date: Sat, 15 Apr 2023 22:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, mani@kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: Add quirk framework and initial quirk
Message-ID: <202304152256.QzCwI9iu-lkp@intel.com>
References: <1681502239-3781-2-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681502239-3781-2-git-send-email-quic_jhugo@quicinc.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/bus-mhi-host-Add-quirk-framework-and-initial-quirk/20230415-035846
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1681502239-3781-2-git-send-email-quic_jhugo%40quicinc.com
patch subject: [PATCH 1/2] bus: mhi: host: Add quirk framework and initial quirk
config: i386-randconfig-r036-20230410 (https://download.01.org/0day-ci/archive/20230415/202304152256.QzCwI9iu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/678cad31c3c8f1b6d772150b98d25e40240e4e14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeffrey-Hugo/bus-mhi-host-Add-quirk-framework-and-initial-quirk/20230415-035846
        git checkout 678cad31c3c8f1b6d772150b98d25e40240e4e14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152256.QzCwI9iu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/mhi/host/init.c:977:2: error: expected expression
           else {
           ^
>> drivers/bus/mhi/host/init.c:1043:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1072:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1082:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1088:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1170:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1189:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1208:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1236:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1312:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1382:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1398:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1404:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1412:1: error: function definition is not allowed here
   {
   ^
>> drivers/bus/mhi/host/init.c:1436:11: error: use of undeclared identifier 'mhi_match'
           .match = mhi_match,
                    ^
>> drivers/bus/mhi/host/init.c:1437:12: error: use of undeclared identifier 'mhi_uevent'; did you mean 'mhi_event'?
           .uevent = mhi_uevent,
                     ^~~~~~~~~~
                     mhi_event
   drivers/bus/mhi/host/init.c:895:20: note: 'mhi_event' declared here
           struct mhi_event *mhi_event;
                             ^
   drivers/bus/mhi/host/init.c:1442:1: error: function definition is not allowed here
   {
   ^
   drivers/bus/mhi/host/init.c:1448:1: error: function definition is not allowed here
   {
   ^
>> drivers/bus/mhi/host/init.c:1453:19: error: use of undeclared identifier 'mhi_init'
   postcore_initcall(mhi_init);
                     ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +977 drivers/bus/mhi/host/init.c

   891	
   892	int mhi_register_controller(struct mhi_controller *mhi_cntrl,
   893				    const struct mhi_controller_config *config)
   894	{
   895		struct mhi_event *mhi_event;
   896		struct mhi_chan *mhi_chan;
   897		struct mhi_cmd *mhi_cmd;
   898		struct mhi_device *mhi_dev;
   899		u32 soc_info;
   900		int ret, i;
   901	
   902		if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
   903		    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
   904		    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
   905		    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
   906		    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
   907			return -EINVAL;
   908	
   909		ret = parse_config(mhi_cntrl, config);
   910		if (ret)
   911			return -EINVAL;
   912	
   913		mhi_cntrl->mhi_cmd = kcalloc(NR_OF_CMD_RINGS,
   914					     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
   915		if (!mhi_cntrl->mhi_cmd) {
   916			ret = -ENOMEM;
   917			goto err_free_event;
   918		}
   919	
   920		INIT_LIST_HEAD(&mhi_cntrl->transition_list);
   921		mutex_init(&mhi_cntrl->pm_mutex);
   922		rwlock_init(&mhi_cntrl->pm_lock);
   923		spin_lock_init(&mhi_cntrl->transition_lock);
   924		spin_lock_init(&mhi_cntrl->wlock);
   925		INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
   926		init_waitqueue_head(&mhi_cntrl->state_event);
   927	
   928		mhi_cntrl->hiprio_wq = alloc_ordered_workqueue("mhi_hiprio_wq", WQ_HIGHPRI);
   929		if (!mhi_cntrl->hiprio_wq) {
   930			dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
   931			ret = -ENOMEM;
   932			goto err_free_cmd;
   933		}
   934	
   935		mhi_cmd = mhi_cntrl->mhi_cmd;
   936		for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
   937			spin_lock_init(&mhi_cmd->lock);
   938	
   939		mhi_event = mhi_cntrl->mhi_event;
   940		for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
   941			/* Skip for offload events */
   942			if (mhi_event->offload_ev)
   943				continue;
   944	
   945			mhi_event->mhi_cntrl = mhi_cntrl;
   946			spin_lock_init(&mhi_event->lock);
   947			if (mhi_event->data_type == MHI_ER_CTRL)
   948				tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
   949					     (ulong)mhi_event);
   950			else
   951				tasklet_init(&mhi_event->task, mhi_ev_task,
   952					     (ulong)mhi_event);
   953		}
   954	
   955		mhi_chan = mhi_cntrl->mhi_chan;
   956		for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
   957			mutex_init(&mhi_chan->mutex);
   958			init_completion(&mhi_chan->completion);
   959			rwlock_init(&mhi_chan->lock);
   960	
   961			/* used in setting bei field of TRE */
   962			mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
   963			mhi_chan->intmod = mhi_event->intmod;
   964		}
   965	
   966		if (mhi_cntrl->bounce_buf) {
   967			mhi_cntrl->map_single = mhi_map_single_use_bb;
   968			mhi_cntrl->unmap_single = mhi_unmap_single_use_bb;
   969		} else {
   970			mhi_cntrl->map_single = mhi_map_single_no_bb;
   971			mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
   972		}
   973	
   974		/* Read the MHI device info */
   975		if (mhi_cntrl->quirks & MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE) {
   976			soc_info = 0;
 > 977		else {
   978			ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, SOC_HW_VERSION_OFFS, &soc_info);
   979			if (ret)
   980				goto err_destroy_wq;
   981		}
   982	
   983		mhi_cntrl->family_number = FIELD_GET(SOC_HW_VERSION_FAM_NUM_BMSK, soc_info);
   984		mhi_cntrl->device_number = FIELD_GET(SOC_HW_VERSION_DEV_NUM_BMSK, soc_info);
   985		mhi_cntrl->major_version = FIELD_GET(SOC_HW_VERSION_MAJOR_VER_BMSK, soc_info);
   986		mhi_cntrl->minor_version = FIELD_GET(SOC_HW_VERSION_MINOR_VER_BMSK, soc_info);
   987	
   988		mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
   989		if (mhi_cntrl->index < 0) {
   990			ret = mhi_cntrl->index;
   991			goto err_destroy_wq;
   992		}
   993	
   994		ret = mhi_init_irq_setup(mhi_cntrl);
   995		if (ret)
   996			goto err_ida_free;
   997	
   998		/* Register controller with MHI bus */
   999		mhi_dev = mhi_alloc_device(mhi_cntrl);
  1000		if (IS_ERR(mhi_dev)) {
  1001			dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate MHI device\n");
  1002			ret = PTR_ERR(mhi_dev);
  1003			goto error_setup_irq;
  1004		}
  1005	
  1006		mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
  1007		mhi_dev->mhi_cntrl = mhi_cntrl;
  1008		dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
  1009		mhi_dev->name = dev_name(&mhi_dev->dev);
  1010	
  1011		/* Init wakeup source */
  1012		device_init_wakeup(&mhi_dev->dev, true);
  1013	
  1014		ret = device_add(&mhi_dev->dev);
  1015		if (ret)
  1016			goto err_release_dev;
  1017	
  1018		mhi_cntrl->mhi_dev = mhi_dev;
  1019	
  1020		mhi_create_debugfs(mhi_cntrl);
  1021	
  1022		return 0;
  1023	
  1024	err_release_dev:
  1025		put_device(&mhi_dev->dev);
  1026	error_setup_irq:
  1027		mhi_deinit_free_irq(mhi_cntrl);
  1028	err_ida_free:
  1029		ida_free(&mhi_controller_ida, mhi_cntrl->index);
  1030	err_destroy_wq:
  1031		destroy_workqueue(mhi_cntrl->hiprio_wq);
  1032	err_free_cmd:
  1033		kfree(mhi_cntrl->mhi_cmd);
  1034	err_free_event:
  1035		kfree(mhi_cntrl->mhi_event);
  1036		vfree(mhi_cntrl->mhi_chan);
  1037	
  1038		return ret;
  1039	}
  1040	EXPORT_SYMBOL_GPL(mhi_register_controller);
  1041	
  1042	void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
> 1043	{
  1044		struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
  1045		struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
  1046		unsigned int i;
  1047	
  1048		mhi_deinit_free_irq(mhi_cntrl);
  1049		mhi_destroy_debugfs(mhi_cntrl);
  1050	
  1051		destroy_workqueue(mhi_cntrl->hiprio_wq);
  1052		kfree(mhi_cntrl->mhi_cmd);
  1053		kfree(mhi_cntrl->mhi_event);
  1054	
  1055		/* Drop the references to MHI devices created for channels */
  1056		for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
  1057			if (!mhi_chan->mhi_dev)
  1058				continue;
  1059	
  1060			put_device(&mhi_chan->mhi_dev->dev);
  1061		}
  1062		vfree(mhi_cntrl->mhi_chan);
  1063	
  1064		device_del(&mhi_dev->dev);
  1065		put_device(&mhi_dev->dev);
  1066	
  1067		ida_free(&mhi_controller_ida, mhi_cntrl->index);
  1068	}
  1069	EXPORT_SYMBOL_GPL(mhi_unregister_controller);
  1070	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
