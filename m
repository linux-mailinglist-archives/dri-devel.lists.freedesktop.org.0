Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB164716346
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 16:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0D10E160;
	Tue, 30 May 2023 14:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4E110E159;
 Tue, 30 May 2023 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685455891; x=1716991891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ZSjvmRsPahZ8Twh6++RSb7rZmPdH3pP2QZxrCkFm9U=;
 b=Akc8v5lBcTq6Apf1aRd8oXaAzH8M8aPZqJM3EkVdiHSRkRRTK0CBIV1y
 +Y3O4DqOLG5pcUWMcgWPx0gIQqKYKjO2NOQtyFwilh49VoVZnhZzAnAN+
 lShebfpCKO1i37mVkqT+cLXVn3j7JuxPBdOcogvG3nStVIn3hsLTlrQvG
 mmVotu9XEapF77rSm9Cpb75+Ftoq6K/SMBacWWHR9oL8ZXTuqUyd6gAG8
 +kLTapyRkjelHhRRupiMZVlJwRdGdofUdOq2DyLbMByMAPgTamwmaORcL
 WwsQlf1lTsYBDFmV96lNp18RGCkQSqpjdDf9NWEhqgPDXmbM0SC3bBEfC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441282308"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="441282308"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="830768672"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="830768672"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 30 May 2023 07:11:23 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q404J-0000ap-0k;
 Tue, 30 May 2023 14:11:23 +0000
Date: Tue, 30 May 2023 22:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 kvalo@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Mario.Limonciello@amd.com,
 Lijo.Lazar@amd.com
Subject: Re: [PATCH 8/9] drm/amd/pm: enable Wifi RFI mitigation feature
 support for SMU13.0.0
Message-ID: <202305302142.rrUt4NJV-lkp@intel.com>
References: <20230530024227.2139632-9-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530024227.2139632-9-evan.quan@amd.com>
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Evan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on kvalo-ath/ath-next wireless-next/main wireless/main linus/master v6.4-rc4]
[cannot apply to next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230530024227.2139632-9-evan.quan%40amd.com
patch subject: [PATCH 8/9] drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305302142.rrUt4NJV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ecc361da81a0915bb626156b47403a91b678de1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Quan/drivers-acpi-Add-support-for-Wifi-band-RF-mitigations/20230530-104541
        git checkout 8ecc361da81a0915bb626156b47403a91b678de1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302142.rrUt4NJV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.o: in function `smu_v13_0_0_set_wbrf_exclusion_ranges':
>> smu_v13_0_0_ppt.c:(.text+0x1384): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0x139c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: smu_v13_0_0_ppt.c:(.text+0x13b0): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
