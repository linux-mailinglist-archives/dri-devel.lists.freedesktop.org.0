Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C53AEC62
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81588E9B;
	Mon, 21 Jun 2021 15:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0AA88E9B;
 Mon, 21 Jun 2021 15:30:01 +0000 (UTC)
IronPort-SDR: 6j8rbMGYkkTYrq5Ok7S7kkumVgT2Xg6s/RKHy8FHW8NDcGIEnwTjVc+yDnawgol5o+Vjrhu2P/
 68igcjmoNnRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206813993"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="206813993"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 08:30:01 -0700
IronPort-SDR: DmfOhncdRAQBSCbNgWYdDJGHgyQJMwZ+3eDGpV6TC//5TbAAw2FrLBKqhYSC7Z9H5jBZCk25R6
 /uKPHIS9/+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="641354549"
Received: from pl-dbox.sh.intel.com (HELO pl-dbox) ([10.239.159.39])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2021 08:29:57 -0700
Date: Mon, 21 Jun 2021 23:22:30 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH] drm/radeon: Fix NULL dereference when
 updating memory stats
Message-ID: <20210621152230.GC158568@pl-dbox>
References: <20210621005950.24734-1-mikel@mikelr.com>
 <202106212201.hFOl2yUx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106212201.hFOl2yUx-lkp@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mikel Rychliski <mikel@mikelr.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 10:41:57PM +0800, kernel test robot wrote:
> Hi Mikel,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on next-20210618]
> [cannot apply to linus/master v5.13-rc7 v5.13-rc6 v5.13-rc5 v5.13-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Mikel-Rychliski/drm-radeon-Fix-NULL-dereference-when-updating-memory-stats/20210621-091140
> base:    e71e3a48a7e89fa71fb70bf4602367528864d2ff
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e5ec8682645a1ee2553fcb073d000802c11d2cb5
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Mikel-Rychliski/drm-radeon-Fix-NULL-dereference-when-updating-memory-stats/20210621-091140
>         git checkout e5ec8682645a1ee2553fcb073d000802c11d2cb5
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
Sorry for the broken report, kindly ignore this, we will fix
this asap.

> 
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/accessibility/speakup/speakup_decpc.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/base/test/test_async_driver_probe.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/i2c/i2c-stub.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_nandbiterrs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_nandecctest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_oobtest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_pagetest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_readtest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_speedtest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_stresstest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_subpagetest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/mtd/tests/mtd_torturetest.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/ntb/hw/epf/ntb_hw_epf.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/mpi3mr/mpi3mr.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/pcmcia/aha152x_cs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/pcmcia/fdomain_cs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/pcmcia/nsp_cs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/pcmcia/qlogic_cs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/pcmcia/sym53c500_cs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/scsi/qlogicfas408.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/spi/spi-loopback-test.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/gdm724x/gdmtty.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/gdm724x/gdmulte.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8188eu/r8188eu.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192e/rtllib.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192e/rtllib_crypt_ccmp.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192e/rtllib_crypt_tkip.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192e/rtllib_crypt_wep.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8192u/r8192u_usb.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/rtl8723bs/r8723bs.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/vt6655/vt6655_stage.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/drivers/staging/vt6656/vt6656_stage.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/kernel/trace/preemptirq_delay_test.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/percpu_test.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_bitops.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_blackhole_dev.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_bpf.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_kmod.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_lockup.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_module.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_static_key_base.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_static_keys.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_ubsan.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_user_copy.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/lib/test_vmalloc.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/configfs/configfs_sample.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/connector/cn_test.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/ftrace/sample-trace-array.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kdb/kdb_hello.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kfifo/bytestream-example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kfifo/dma-example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kfifo/inttype-example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kfifo/record-example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kmemleak/kmemleak-test.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kprobes/kprobe_example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/kprobes/kretprobe_example.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/rpmsg/rpmsg_client_sample.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/trace_events/trace-events-sample.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/trace_printk/trace-printk.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/vfio-mdev/mbochs.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/vfio-mdev/mdpy-fb.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/vfio-mdev/mdpy.ko', needed by '__modinst'.
>    make[2]: *** No rule to make target '/tmp/kernel/mips-allyesconfig/gcc-9.3.0/e5ec8682645a1ee2553fcb073d000802c11d2cb5/lib/modules/5.13.0-rc6-next-20210618+/kernel/samples/vfio-mdev/mtty.ko', needed by '__modinst'.
>    make[2]: Target '__modinst' not remade because of errors.
>    make[1]: *** [Makefile:1874: modules_install] Error 2
>    make: *** [Makefile:222: __sub-make] Error 2
>    make: Target 'modules_install' not remade because of errors.
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org

