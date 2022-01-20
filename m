Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E9494674
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 05:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF9510E64A;
	Thu, 20 Jan 2022 04:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4075E10E64A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642652993; x=1674188993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s6DMxphwFOwXmhCN4XHRDR4Bxs77Xs3onYfKo6dS9vU=;
 b=SyVN7ApUBXb3HcdACP7JaG39mFVekzPc7BxqNZ+JmV+6TXmugxQv9jDB
 dj7xG+CyQCKdm0MbdgBSeMjwo71TzFSMJomve4Dj7lA9MWuQFK6sxV7fK
 du6o0XtC5FxUHJ/YYhlikVhhhi2NJ5ynMuK00uEmvkKqG5hqPR193QIWF
 i8V+sGbB5Lx6gJOUa32S6t1BkVp+WE5ISqagUNTGPO2yYdMepalPEGPRI
 LPyzs1UfW8ABkcYrtcyt/pLLq9H/DURZSg+BGCS4MAl0nTJ0QYWrbspd/
 /vqB4fK5YetJVF13tVj5EwBK40QOjuk147623lNBnvJ3AA4GJ1UWvUSi0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="245061701"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="245061701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 20:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="493295633"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 19 Jan 2022 20:29:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAP52-000E09-R2; Thu, 20 Jan 2022 04:29:48 +0000
Date: Thu, 20 Jan 2022 12:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v5 3/4] drm/bridge: anx7625: Support reading edid through
 aux channel
Message-ID: <202201201223.sts9AtBC-lkp@intel.com>
References: <20220119151751.986185-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119151751.986185-3-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm/drm-next robh/for-next drm-intel/for-linux-next v5.16 next-20220118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220119-231952
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-r024-20220117 (https://download.01.org/0day-ci/archive/20220120/202201201223.sts9AtBC-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/61809df270082584886188b067ee19744f4b35e1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hsin-Yi-Wang/drm-bridge-anx7625-send-DPCD-command-to-downstream/20220119-231952
        git checkout 61809df270082584886188b067ee19744f4b35e1
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_i2c_probe':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2648: undefined reference to `devm_of_dp_aux_populate_ep_devices'


vim +2648 drivers/gpu/drm/bridge/analogix/anx7625.c

  2574	
  2575	static int anx7625_i2c_probe(struct i2c_client *client,
  2576				     const struct i2c_device_id *id)
  2577	{
  2578		struct anx7625_data *platform;
  2579		struct anx7625_platform_data *pdata;
  2580		int ret = 0;
  2581		struct device *dev = &client->dev;
  2582	
  2583		if (!i2c_check_functionality(client->adapter,
  2584					     I2C_FUNC_SMBUS_I2C_BLOCK)) {
  2585			DRM_DEV_ERROR(dev, "anx7625's i2c bus doesn't support\n");
  2586			return -ENODEV;
  2587		}
  2588	
  2589		platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
  2590		if (!platform) {
  2591			DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
  2592			return -ENOMEM;
  2593		}
  2594	
  2595		pdata = &platform->pdata;
  2596	
  2597		platform->client = client;
  2598		i2c_set_clientdata(client, platform);
  2599	
  2600		pdata->supplies[0].supply = "vdd10";
  2601		pdata->supplies[1].supply = "vdd18";
  2602		pdata->supplies[2].supply = "vdd33";
  2603		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pdata->supplies),
  2604					      pdata->supplies);
  2605		if (ret) {
  2606			DRM_DEV_ERROR(dev, "fail to get power supplies: %d\n", ret);
  2607			return ret;
  2608		}
  2609		anx7625_init_gpio(platform);
  2610	
  2611		mutex_init(&platform->lock);
  2612		mutex_init(&platform->hdcp_wq_lock);
  2613	
  2614		INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
  2615		platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
  2616		if (!platform->hdcp_workqueue) {
  2617			dev_err(dev, "fail to create work queue\n");
  2618			ret = -ENOMEM;
  2619			return ret;
  2620		}
  2621	
  2622		platform->pdata.intp_irq = client->irq;
  2623		if (platform->pdata.intp_irq) {
  2624			INIT_WORK(&platform->work, anx7625_work_func);
  2625			platform->workqueue = alloc_workqueue("anx7625_work",
  2626							      WQ_FREEZABLE | WQ_MEM_RECLAIM, 1);
  2627			if (!platform->workqueue) {
  2628				DRM_DEV_ERROR(dev, "fail to create work queue\n");
  2629				ret = -ENOMEM;
  2630				goto free_hdcp_wq;
  2631			}
  2632	
  2633			ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
  2634							NULL, anx7625_intr_hpd_isr,
  2635							IRQF_TRIGGER_FALLING |
  2636							IRQF_ONESHOT,
  2637							"anx7625-intp", platform);
  2638			if (ret) {
  2639				DRM_DEV_ERROR(dev, "fail to request irq\n");
  2640				goto free_wq;
  2641			}
  2642		}
  2643	
  2644		platform->aux.name = "anx7625-aux";
  2645		platform->aux.dev = dev;
  2646		platform->aux.transfer = anx7625_aux_transfer;
  2647		drm_dp_aux_init(&platform->aux);
> 2648		devm_of_dp_aux_populate_ep_devices(&platform->aux);
  2649	
  2650		ret = anx7625_parse_dt(dev, pdata);
  2651		if (ret) {
  2652			if (ret != -EPROBE_DEFER)
  2653				DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
  2654			return ret;
  2655		}
  2656	
  2657		if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
  2658			ret = -ENOMEM;
  2659			DRM_DEV_ERROR(dev, "fail to reserve I2C bus.\n");
  2660			goto free_wq;
  2661		}
  2662	
  2663		pm_runtime_enable(dev);
  2664		pm_runtime_set_autosuspend_delay(dev, 1000);
  2665		pm_runtime_use_autosuspend(dev);
  2666		pm_suspend_ignore_children(dev, true);
  2667		ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
  2668		if (ret)
  2669			return ret;
  2670	
  2671		if (!platform->pdata.low_power_mode) {
  2672			anx7625_disable_pd_protocol(platform);
  2673			pm_runtime_get_sync(dev);
  2674		}
  2675	
  2676		/* Add work function */
  2677		if (platform->pdata.intp_irq)
  2678			queue_work(platform->workqueue, &platform->work);
  2679	
  2680		platform->bridge.funcs = &anx7625_bridge_funcs;
  2681		platform->bridge.of_node = client->dev.of_node;
  2682		if (!anx7625_of_panel_on_aux_bus(&client->dev))
  2683			platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
  2684		if (!platform->pdata.panel_bridge)
  2685			platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
  2686						DRM_BRIDGE_OP_DETECT;
  2687		platform->bridge.type = platform->pdata.panel_bridge ?
  2688					    DRM_MODE_CONNECTOR_eDP :
  2689					    DRM_MODE_CONNECTOR_DisplayPort;
  2690	
  2691		drm_bridge_add(&platform->bridge);
  2692	
  2693		if (!platform->pdata.is_dpi) {
  2694			ret = anx7625_attach_dsi(platform);
  2695			if (ret) {
  2696				DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
  2697				goto unregister_bridge;
  2698			}
  2699		}
  2700	
  2701		if (platform->pdata.audio_en)
  2702			anx7625_register_audio(dev, platform);
  2703	
  2704		DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
  2705	
  2706		return 0;
  2707	
  2708	unregister_bridge:
  2709		drm_bridge_remove(&platform->bridge);
  2710	
  2711		if (!platform->pdata.low_power_mode)
  2712			pm_runtime_put_sync_suspend(&client->dev);
  2713	
  2714		anx7625_unregister_i2c_dummy_clients(platform);
  2715	
  2716	free_wq:
  2717		if (platform->workqueue)
  2718			destroy_workqueue(platform->workqueue);
  2719	
  2720	free_hdcp_wq:
  2721		if (platform->hdcp_workqueue)
  2722			destroy_workqueue(platform->hdcp_workqueue);
  2723	
  2724		return ret;
  2725	}
  2726	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
