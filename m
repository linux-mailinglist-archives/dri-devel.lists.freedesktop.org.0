Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17729807C88
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 00:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8008710E109;
	Wed,  6 Dec 2023 23:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15510E032
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 23:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701906256; x=1733442256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eriwFjI3LNv4Js6dYZ339bbItfpw+p66ws9NjKsufBg=;
 b=LUWNCZTnmaclG4IToZI3BoNHkyxXu5+dIp51X/bKp8f5oIZ1cuvNfMhC
 1rKXopiglWLmSbTNyNUt3q547qqIdaMm3ISM7lzKWeAxzKKT8RuAqfEv8
 wU6j8VJgfzK3NAsXuaMYsAGtDpp/Ez9n13jijyrAAC6W8EdlR4DEs3WPv
 AZj3XzId1riyHglHCFjztlHM2iVTbOh3/G5dcTFd8taHQbT5PnQhx/NtP
 dVWBnJhVVnhKem3AvnI4L9IAjWBR16WofoMKuyGhYvgVrUmyvmyuI1O2N
 2XSeKve6P208y3NX6E45dNd/zvDDAGWNN6F+3enarmmANvQYb5VGNk02D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373634459"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373634459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018737712"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1018737712"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 15:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rB1Yk-000Bb4-30;
 Wed, 06 Dec 2023 23:44:06 +0000
Date: Thu, 7 Dec 2023 07:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Subject: Re: [PATCH] media: medkatek: vcodec: support tee decoder
Message-ID: <202312070717.a86rODYn-lkp@intel.com>
References: <20231206081538.17056-21-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206081538.17056-21-yunfei.dong@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 oe-kbuild-all@lists.linux.dev, John Stultz <jstultz@google.com>,
 linux-arm-kernel@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 "T . J . Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-medkatek-vcodec-support-tee-decoder/20231206-201843
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231206081538.17056-21-yunfei.dong%40mediatek.com
patch subject: [PATCH] media: medkatek: vcodec: support tee decoder
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231207/202312070717.a86rODYn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070717.a86rODYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070717.a86rODYn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c: In function 'fops_vcodec_release':
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:313:16: error: 'struct mtk_vcodec_dec_ctx' has no member named 'is_secure_playback'
     313 |         if (ctx->is_secure_playback)
         |                ^~
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:314:17: error: implicit declaration of function 'mtk_vcodec_dec_optee_release'; did you mean 'mtk_vcodec_dec_release'? [-Werror=implicit-function-declaration]
     314 |                 mtk_vcodec_dec_optee_release(dev->optee_private);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 mtk_vcodec_dec_release
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:314:49: error: 'struct mtk_vcodec_dec_dev' has no member named 'optee_private'
     314 |                 mtk_vcodec_dec_optee_release(dev->optee_private);
         |                                                 ^~
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c: In function 'mtk_vcodec_probe':
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:472:15: error: implicit declaration of function 'mtk_vcodec_dec_optee_private_init'; did you mean 'mtk_vcodec_dec_queue_init'? [-Werror=implicit-function-declaration]
     472 |         ret = mtk_vcodec_dec_optee_private_init(dev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               mtk_vcodec_dec_queue_init
   cc1: some warnings being treated as errors


vim +313 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c

   291	
   292	static int fops_vcodec_release(struct file *file)
   293	{
   294		struct mtk_vcodec_dec_dev *dev = video_drvdata(file);
   295		struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(file->private_data);
   296	
   297		mtk_v4l2_vdec_dbg(0, ctx, "[%d] decoder", ctx->id);
   298		mutex_lock(&dev->dev_mutex);
   299	
   300		/*
   301		 * Call v4l2_m2m_ctx_release before mtk_vcodec_dec_release. First, it
   302		 * makes sure the worker thread is not running after vdec_if_deinit.
   303		 * Second, the decoder will be flushed and all the buffers will be
   304		 * returned in stop_streaming.
   305		 */
   306		v4l2_m2m_ctx_release(ctx->m2m_ctx);
   307		mtk_vcodec_dec_release(ctx);
   308	
   309		v4l2_fh_del(&ctx->fh);
   310		v4l2_fh_exit(&ctx->fh);
   311		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
   312	
 > 313		if (ctx->is_secure_playback)
 > 314			mtk_vcodec_dec_optee_release(dev->optee_private);
   315	
   316		mtk_vcodec_dbgfs_remove(dev, ctx->id);
   317		list_del_init(&ctx->list);
   318		kfree(ctx);
   319		mutex_unlock(&dev->dev_mutex);
   320		return 0;
   321	}
   322	
   323	static const struct v4l2_file_operations mtk_vcodec_fops = {
   324		.owner		= THIS_MODULE,
   325		.open		= fops_vcodec_open,
   326		.release	= fops_vcodec_release,
   327		.poll		= v4l2_m2m_fop_poll,
   328		.unlocked_ioctl	= video_ioctl2,
   329		.mmap		= v4l2_m2m_fop_mmap,
   330	};
   331	
   332	static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
   333	{
   334		struct device *dev = &vdec_dev->plat_dev->dev;
   335	
   336		if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
   337			vdec_dev->chip_name = MTK_VDEC_MT8173;
   338		else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
   339			vdec_dev->chip_name = MTK_VDEC_MT8183;
   340		else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
   341			vdec_dev->chip_name = MTK_VDEC_MT8192;
   342		else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
   343			vdec_dev->chip_name = MTK_VDEC_MT8195;
   344		else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
   345			vdec_dev->chip_name = MTK_VDEC_MT8186;
   346		else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
   347			vdec_dev->chip_name = MTK_VDEC_MT8188;
   348		else
   349			vdec_dev->chip_name = MTK_VDEC_INVAL;
   350	}
   351	
   352	static int mtk_vcodec_probe(struct platform_device *pdev)
   353	{
   354		struct mtk_vcodec_dec_dev *dev;
   355		struct video_device *vfd_dec;
   356		phandle rproc_phandle;
   357		enum mtk_vcodec_fw_type fw_type;
   358		int i, ret;
   359	
   360		dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
   361		if (!dev)
   362			return -ENOMEM;
   363	
   364		INIT_LIST_HEAD(&dev->ctx_list);
   365		dev->plat_dev = pdev;
   366	
   367		mtk_vcodec_dec_get_chip_name(dev);
   368		if (dev->chip_name == MTK_VDEC_INVAL) {
   369			dev_err(&pdev->dev, "Failed to get decoder chip name");
   370			return -EINVAL;
   371		}
   372	
   373		dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
   374		if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
   375					  &rproc_phandle)) {
   376			fw_type = VPU;
   377		} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
   378						 &rproc_phandle)) {
   379			fw_type = SCP;
   380		} else {
   381			dev_dbg(&pdev->dev, "Could not get vdec IPI device");
   382			return -ENODEV;
   383		}
   384		dma_set_max_seg_size(&pdev->dev, UINT_MAX);
   385	
   386		dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, DECODER);
   387		if (IS_ERR(dev->fw_handler))
   388			return PTR_ERR(dev->fw_handler);
   389	
   390		ret = mtk_vcodec_init_dec_resources(dev);
   391		if (ret) {
   392			dev_err(&pdev->dev, "Failed to init dec resources");
   393			goto err_dec_pm;
   394		}
   395	
   396		if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
   397			dev->core_workqueue =
   398				alloc_ordered_workqueue("core-decoder",
   399							WQ_MEM_RECLAIM | WQ_FREEZABLE);
   400			if (!dev->core_workqueue) {
   401				dev_dbg(&pdev->dev, "Failed to create core workqueue");
   402				ret = -EINVAL;
   403				goto err_res;
   404			}
   405		}
   406	
   407		for (i = 0; i < MTK_VDEC_HW_MAX; i++)
   408			mutex_init(&dev->dec_mutex[i]);
   409		mutex_init(&dev->dev_mutex);
   410		spin_lock_init(&dev->irqlock);
   411	
   412		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
   413			"[/MTK_V4L2_VDEC]");
   414	
   415		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
   416		if (ret) {
   417			dev_err(&pdev->dev, "v4l2_device_register err=%d", ret);
   418			goto err_core_workq;
   419		}
   420	
   421		vfd_dec = video_device_alloc();
   422		if (!vfd_dec) {
   423			dev_err(&pdev->dev, "Failed to allocate video device");
   424			ret = -ENOMEM;
   425			goto err_dec_alloc;
   426		}
   427		vfd_dec->fops		= &mtk_vcodec_fops;
   428		vfd_dec->ioctl_ops	= &mtk_vdec_ioctl_ops;
   429		vfd_dec->release	= video_device_release;
   430		vfd_dec->lock		= &dev->dev_mutex;
   431		vfd_dec->v4l2_dev	= &dev->v4l2_dev;
   432		vfd_dec->vfl_dir	= VFL_DIR_M2M;
   433		vfd_dec->device_caps	= V4L2_CAP_VIDEO_M2M_MPLANE |
   434				V4L2_CAP_STREAMING;
   435	
   436		snprintf(vfd_dec->name, sizeof(vfd_dec->name), "%s",
   437			MTK_VCODEC_DEC_NAME);
   438		video_set_drvdata(vfd_dec, dev);
   439		dev->vfd_dec = vfd_dec;
   440		platform_set_drvdata(pdev, dev);
   441	
   442		dev->m2m_dev_dec = v4l2_m2m_init(&mtk_vdec_m2m_ops);
   443		if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
   444			dev_err(&pdev->dev, "Failed to init mem2mem dec device");
   445			ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
   446			goto err_dec_alloc;
   447		}
   448	
   449		dev->decode_workqueue =
   450			alloc_ordered_workqueue(MTK_VCODEC_DEC_NAME,
   451				WQ_MEM_RECLAIM | WQ_FREEZABLE);
   452		if (!dev->decode_workqueue) {
   453			dev_err(&pdev->dev, "Failed to create decode workqueue");
   454			ret = -EINVAL;
   455			goto err_event_workq;
   456		}
   457	
   458		if (dev->vdec_pdata->is_subdev_supported) {
   459			ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
   460						   &pdev->dev);
   461			if (ret) {
   462				dev_err(&pdev->dev, "Main device of_platform_populate failed.");
   463				goto err_reg_cont;
   464			}
   465		} else {
   466			set_bit(MTK_VDEC_CORE, dev->subdev_bitmap);
   467		}
   468	
   469		atomic_set(&dev->dec_active_cnt, 0);
   470		memset(dev->vdec_racing_info, 0, sizeof(dev->vdec_racing_info));
   471		mutex_init(&dev->dec_racing_info_mutex);
 > 472		ret = mtk_vcodec_dec_optee_private_init(dev);
   473		if (ret) {
   474			dev_err(&pdev->dev, "Failed to init svp private.");
   475			goto err_reg_cont;
   476		}
   477	
   478		ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
   479		if (ret) {
   480			dev_err(&pdev->dev, "Failed to register video device");
   481			goto err_reg_cont;
   482		}
   483	
   484		if (dev->vdec_pdata->uses_stateless_api) {
   485			v4l2_disable_ioctl(vfd_dec, VIDIOC_DECODER_CMD);
   486			v4l2_disable_ioctl(vfd_dec, VIDIOC_TRY_DECODER_CMD);
   487	
   488			dev->mdev_dec.dev = &pdev->dev;
   489			strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
   490				sizeof(dev->mdev_dec.model));
   491	
   492			media_device_init(&dev->mdev_dec);
   493			dev->mdev_dec.ops = &mtk_vcodec_media_ops;
   494			dev->v4l2_dev.mdev = &dev->mdev_dec;
   495	
   496			ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, dev->vfd_dec,
   497								 MEDIA_ENT_F_PROC_VIDEO_DECODER);
   498			if (ret) {
   499				dev_err(&pdev->dev, "Failed to register media controller");
   500				goto err_dec_mem_init;
   501			}
   502	
   503			ret = media_device_register(&dev->mdev_dec);
   504			if (ret) {
   505				dev_err(&pdev->dev, "Failed to register media device");
   506				goto err_media_reg;
   507			}
   508	
   509			dev_dbg(&pdev->dev, "media registered as /dev/media%d", vfd_dec->minor);
   510		}
   511	
   512		mtk_vcodec_dbgfs_init(dev, false);
   513		dev_dbg(&pdev->dev, "decoder registered as /dev/video%d", vfd_dec->minor);
   514	
   515		return 0;
   516	
   517	err_media_reg:
   518		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
   519	err_dec_mem_init:
   520		video_unregister_device(vfd_dec);
   521	err_reg_cont:
   522		if (dev->vdec_pdata->uses_stateless_api)
   523			media_device_cleanup(&dev->mdev_dec);
   524		destroy_workqueue(dev->decode_workqueue);
   525	err_event_workq:
   526		v4l2_m2m_release(dev->m2m_dev_dec);
   527	err_dec_alloc:
   528		v4l2_device_unregister(&dev->v4l2_dev);
   529	err_core_workq:
   530		if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
   531			destroy_workqueue(dev->core_workqueue);
   532	err_res:
   533		if (!dev->vdec_pdata->is_subdev_supported)
   534			pm_runtime_disable(dev->pm.dev);
   535	err_dec_pm:
   536		mtk_vcodec_fw_release(dev->fw_handler);
   537		return ret;
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
