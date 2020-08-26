Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA954252FAB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 15:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D626E372;
	Wed, 26 Aug 2020 13:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE976E11F;
 Wed, 26 Aug 2020 13:27:20 +0000 (UTC)
IronPort-SDR: 0BEouPL05paQzACvUIL2r5lbUab8D53bAdPZnFZBSaudCTiDojEMRALnlLEEJ3KVostNaEoWkx
 mXImT1L7fL9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="153858938"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
 d="gz'50?scan'50,208,50";a="153858938"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 06:27:19 -0700
IronPort-SDR: QIEjcK/P7yuwVspU4N5K7gOq4r0yGgjP9OXU/um+XNJ5lt4OlPjWk+uZ82cevr7tUij0vWh9Zr
 MV6GVPWBcf7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
 d="gz'50?scan'50,208,50";a="336833444"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2020 06:27:15 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kAvSM-0001Rp-NE; Wed, 26 Aug 2020 13:27:14 +0000
Date: Wed, 26 Aug 2020 21:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/32] drm: msm: fix common struct sg_table related
 issues
Message-ID: <202008262120.ztXKGx3N%lkp@intel.com>
References: <20200826063316.23486-13-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <20200826063316.23486-13-m.szyprowski@samsung.com>
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
Cc: kbuild-all@lists.01.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, clang-built-linux@googlegroups.com,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on drm-intel/for-linux-next linus/master v5.9-rc2 next-20200826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/DRM-fix-struct-sg_table-nents-vs-orig_nents-misuse/20200826-143908
base:   git://linuxtv.org/media_tree.git master
config: arm64-randconfig-r002-20200826 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 7cfcecece0e0430937cf529ce74d3a071a4dedc6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: warning: -z norelro ignored
   aarch64-linux-gnu-ld: fs/orangefs/orangefs-debugfs.o: in function `orangefs_debug_read':
   fs/orangefs/orangefs-debugfs.c:375: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: security/apparmor/lsm.o: in function `param_get_mode':
   security/apparmor/lsm.c:1559: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: security/apparmor/lsm.o: in function `param_get_audit':
   security/apparmor/lsm.c:1530: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: crypto/async_tx/async_tx.o: in function `async_tx_channel_switch':
   crypto/async_tx/async_tx.c:118: undefined reference to `dma_wait_for_async_tx'
   aarch64-linux-gnu-ld: crypto/async_tx/async_tx.o: in function `async_tx_quiesce':
   crypto/async_tx/async_tx.c:270: undefined reference to `dma_wait_for_async_tx'
   aarch64-linux-gnu-ld: crypto/async_tx/async_tx.c:270: undefined reference to `dma_wait_for_async_tx'
   aarch64-linux-gnu-ld: crypto/async_tx/async_memcpy.o: in function `async_memcpy':
   crypto/async_tx/async_memcpy.c:43: undefined reference to `dmaengine_get_unmap_data'
   aarch64-linux-gnu-ld: crypto/async_tx/async_memcpy.c:89: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.o: in function `async_xor':
   crypto/async_tx/async_xor.c:172: undefined reference to `dmaengine_get_unmap_data'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.c:199: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.c:199: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.c:196: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.o: in function `async_xor_val':
   crypto/async_tx/async_xor.c:268: undefined reference to `dmaengine_get_unmap_data'
   aarch64-linux-gnu-ld: crypto/async_tx/async_xor.c:324: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_pq.o: in function `async_gen_syndrome':
   crypto/async_tx/async_pq.c:176: undefined reference to `dmaengine_get_unmap_data'
   aarch64-linux-gnu-ld: crypto/async_tx/async_pq.c:233: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_pq.c:229: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: crypto/async_tx/async_pq.o: in function `async_syndrome_val':
   crypto/async_tx/async_pq.c:295: undefined reference to `dmaengine_get_unmap_data'
   aarch64-linux-gnu-ld: crypto/async_tx/async_pq.c:412: undefined reference to `dmaengine_unmap_put'
   aarch64-linux-gnu-ld: drivers/xen/sys-hypervisor.o: in function `buildid_show':
   drivers/xen/sys-hypervisor.c:375: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/tty/tty_io.o: in function `tty_line_name':
   drivers/tty/tty_io.c:1139: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/tty/tty_io.c:1139: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/tty/tty_io.c:1139: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o: in function `dsi_dma_workaround_write':
   drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o: in function `vc4_dsi_host_transfer':
   drivers/gpu/drm/vc4/vc4_dsi.c:564: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o: in function `dsi_dma_workaround_write':
   drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o:drivers/gpu/drm/vc4/vc4_dsi.c:581: more undefined references to `dma_sync_wait' follow
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o: in function `vc4_dsi_bind':
   drivers/gpu/drm/vc4/vc4_dsi.c:1512: undefined reference to `dma_request_chan_by_mask'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o: in function `dsi_dma_workaround_write':
   drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.c:581: undefined reference to `dma_sync_wait'
   aarch64-linux-gnu-ld: drivers/gpu/drm/vc4/vc4_dsi.o:drivers/gpu/drm/vc4/vc4_dsi.c:581: more undefined references to `dma_sync_wait' follow
   aarch64-linux-gnu-ld: drivers/gpu/drm/msm/msm_gpummu.o: in function `msm_gpummu_map':
>> drivers/gpu/drm/msm/msm_gpummu.c:44: undefined reference to `__compiletime_assert_413'
   aarch64-linux-gnu-ld: drivers/gpu/drm/xlnx/zynqmp_disp.o: in function `zynqmp_disp_layer_release_dma':
   drivers/gpu/drm/xlnx/zynqmp_disp.c:1287: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/gpu/drm/xlnx/zynqmp_disp.c:1287: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.o: in function `get_sas_device_type_names':
   drivers/scsi/scsi_transport_sas.c:131: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.o: in function `get_sas_linkspeed_names':
   drivers/scsi/scsi_transport_sas.c:158: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.c:158: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.c:158: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.c:158: undefined reference to `stpcpy'
   aarch64-linux-gnu-ld: drivers/scsi/scsi_transport_sas.o:drivers/scsi/scsi_transport_sas.c:158: more undefined references to `stpcpy' follow
   aarch64-linux-gnu-ld: drivers/spi/spi-bcm2835.o: in function `bcm2835_dma_init':
   drivers/spi/spi-bcm2835.c:907: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-bcm2835.c:914: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-bcm2835.o: in function `dmaengine_desc_set_reuse':
   include/linux/dmaengine.h:1537: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1537: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1537: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1537: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1537: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: drivers/spi/spi-bcm2835.o: in function `bcm2835_dma_release':
   drivers/spi/spi-bcm2835.c:867: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-bcm2835.c:884: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.o: in function `dspi_request_dma':
   drivers/spi/spi-fsl-dspi.c:506: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.c:513: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.c:572: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.c:574: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.o: in function `dspi_release_dma':
   drivers/spi/spi-fsl-dspi.c:593: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-fsl-dspi.c:599: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-pxa2xx-dma.o: in function `dma_request_slave_channel_compat':
   include/linux/dmaengine.h:1587: undefined reference to `dma_request_slave_channel'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1587: undefined reference to `dma_request_slave_channel'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1594: undefined reference to `__dma_request_channel'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1594: undefined reference to `__dma_request_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-pxa2xx-dma.o: in function `pxa2xx_spi_dma_setup':
   drivers/spi/spi-pxa2xx-dma.c:209: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-pxa2xx-dma.o: in function `pxa2xx_spi_dma_release':
   drivers/spi/spi-pxa2xx-dma.c:223: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-pxa2xx-dma.c:228: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.o: in function `spi_qup_init_dma':
   drivers/spi/spi-qup.c:935: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.c:939: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.c:973: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.o: in function `spi_qup_release_dma':
   drivers/spi/spi-qup.c:921: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.c:923: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.o: in function `spi_qup_init_dma':
   drivers/spi/spi-qup.c:971: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.o: in function `spi_qup_release_dma':
   drivers/spi/spi-qup.c:921: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-qup.o:drivers/spi/spi-qup.c:923: more undefined references to `dma_release_channel' follow
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.o: in function `rockchip_spi_probe':
   drivers/spi/spi-rockchip.c:748: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.c:759: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.c:788: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.c:785: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.o: in function `rockchip_spi_remove':
   drivers/spi/spi-rockchip.c:816: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rockchip.c:818: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rspi.o: in function `rspi_request_dma':
   drivers/spi/spi-rspi.c:1135: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rspi.o:drivers/spi/spi-rspi.c:1148: more undefined references to `dma_release_channel' follow
   aarch64-linux-gnu-ld: drivers/spi/spi-rspi.o: in function `dma_request_slave_channel_compat':
   include/linux/dmaengine.h:1587: undefined reference to `dma_request_slave_channel'
   aarch64-linux-gnu-ld: include/linux/dmaengine.h:1594: undefined reference to `__dma_request_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-rspi.o: in function `rspi_request_dma_chan':
   drivers/spi/spi-rspi.c:1102: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.o: in function `uniphier_spi_probe':
   drivers/spi/spi-uniphier.c:716: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.c:725: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.c:734: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.c:743: undefined reference to `dma_get_slave_caps'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.o: in function `uniphier_spi_remove':
   drivers/spi/spi-uniphier.c:773: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/spi/spi-uniphier.c:775: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.o: in function `qcom_slim_ngd_exit_dma':
   drivers/slimbus/qcom-ngd-ctrl.c:1051: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.c:1056: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.o: in function `qcom_slim_ngd_init_rx_msgq':
   drivers/slimbus/qcom-ngd-ctrl.c:669: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.c:697: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.o: in function `qcom_slim_ngd_init_tx_msgq':
   drivers/slimbus/qcom-ngd-ctrl.c:708: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/slimbus/qcom-ngd-ctrl.c:732: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.o: in function `sh_mobile_i2c_release_dma':
   drivers/i2c/busses/i2c-sh_mobile.c:783: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:788: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:783: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:788: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.o: in function `sh_mobile_i2c_request_dma_chan':
   drivers/i2c/busses/i2c-sh_mobile.c:483: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:483: undefined reference to `dma_request_chan'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:503: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/i2c/busses/i2c-sh_mobile.c:503: undefined reference to `dma_release_channel'
   aarch64-linux-gnu-ld: drivers/md/raid5.o: in function `raid5d':
   drivers/md/raid5.c:6367: undefined reference to `dma_issue_pending_all'
   aarch64-linux-gnu-ld: drivers/md/raid5.o: in function `raid5_do_work':
   drivers/md/raid5.c:6280: undefined reference to `dma_issue_pending_all'

# https://github.com/0day-ci/linux/commit/ea1faf41c87f65cbbd61c902b1c773a681347a34
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Marek-Szyprowski/DRM-fix-struct-sg_table-nents-vs-orig_nents-misuse/20200826-143908
git checkout ea1faf41c87f65cbbd61c902b1c773a681347a34
vim +44 drivers/gpu/drm/msm/msm_gpummu.c

    27	
    28	static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
    29			struct sg_table *sgt, size_t len, int prot)
    30	{
    31		struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
    32		unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
    33		struct sg_dma_page_iter dma_iter;
    34		unsigned prot_bits = 0;
    35	
    36		if (prot & IOMMU_WRITE)
    37			prot_bits |= 1;
    38		if (prot & IOMMU_READ)
    39			prot_bits |= 2;
    40	
    41		for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
    42			dma_addr_t addr = sg_page_iter_dma_address(&dma_iter);
    43	
  > 44			BUILD_BUG_ON(GPUMMU_PAGE_SIZE != PAGE_SIZE);
    45			gpummu->table[idx++] = addr | prot_bits;
    46		}
    47	
    48		/* we can improve by deferring flush for multiple map() */
    49		gpu_write(gpummu->gpu, REG_A2XX_MH_MMU_INVALIDATE,
    50			A2XX_MH_MMU_INVALIDATE_INVALIDATE_ALL |
    51			A2XX_MH_MMU_INVALIDATE_INVALIDATE_TC);
    52		return 0;
    53	}
    54	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ikeVEW9yuYc//A+q
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ikeVEW9yuYc//A+q--
