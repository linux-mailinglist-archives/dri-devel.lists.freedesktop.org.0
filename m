Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90A591D6D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 03:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B47C09C4;
	Sun, 14 Aug 2022 01:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632DCC09A7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660439621; x=1691975621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dhKkSzBmVvUqQlk2H6PYP/DhZeE0cXbKpgag3Koj5YM=;
 b=OcN49iNYFMA1U+WO6fYvBa0ImFgrq/UHoKscvD3isd384PLhxCr15Is8
 xaSFfoGCMhIxdY32cM74vzMS9vCfTfVFXCRvU0mkIAxreLVVy7JQg+VJk
 gr+50hCACBtkcB4co4OfHWU2lSaMRTERWBSfFjnJME56y1114aGmyKwTD
 P6sSvaNrNVNcb1JGnfdtBpNVpq8qzeOkhtvNJttqmyx2mk05aZaO+ZJVN
 3bvNrnL3TwSjvr+QUdkFFWVGnhz4RfaAXCY0h5yFF2SCrUSmMnt9Ix8wq
 J7hmEsjnxA/bVjL+GtgFqIgmyQXyWUIU9VmAdcCR4dpSIucMiBBUhYlvx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291786949"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="291786949"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 18:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="934109122"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2022 18:13:36 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oN2C8-0002HT-0A;
 Sun, 14 Aug 2022 01:13:36 +0000
Date: Sun, 14 Aug 2022 09:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Masse <olivier.masse@nxp.com>, etienne.carriere@linaro.org,
 jens.wiklander@linaro.org, sumit.garg@linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 op-tee@lists.trustedfirmware.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
Message-ID: <202208140900.TNSQFBzy-lkp@intel.com>
References: <20220812143055.12938-2-olivier.masse@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812143055.12938-2-olivier.masse@nxp.com>
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
Cc: clement.faure@nxp.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Masse/tee-Add-tee_shm_register_fd/20220812-223302
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arm-randconfig-r026-20220814 (https://download.01.org/0day-ci/archive/20220814/202208140900.TNSQFBzy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/994ce362c3244904f79f1e7d4cb436ea162421d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Olivier-Masse/tee-Add-tee_shm_register_fd/20220812-223302
        git checkout 994ce362c3244904f79f1e7d4cb436ea162421d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__aeabi_uldivmod" [drivers/mtd/mtdswap.ko] undefined!
>> ERROR: modpost: module tee uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module tee uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
