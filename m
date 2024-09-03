Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6737969370
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1FF10E194;
	Tue,  3 Sep 2024 06:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYquRZgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61910E194
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725343847; x=1756879847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aYJh5fNp4QC9EhWbCRaM8ceBBTd5va9484C4zr8sDXo=;
 b=nYquRZgTawoKPhvbMvUTvRu0f6/YhbmAi/r2sK25yUc99YlFY99jxcUI
 V5LcxIpyvmekMajzzvYTSUS3atv5I/cjzj/WpZZ68yw1Z5RPD4oVPOQHi
 SKsuDtVm0CVuGzmKvIdIUNEclFUojIXhLWwGwHNuzD1t8Mu+j4fFw6jdn
 ynAPKH2CneW+BfzqPnxQl6fkpMpaf6ohiSB+nE+ubes2NW7pXVo2iIqYH
 3MmIcQwmuBatxYVZOMk2UhaqUuHaDBfDuc3+p2pAReaM8sVkEuAD+SdYO
 9MXjOIZRMICsLty1D38d1HcqhEdhkB7La1h0ihbEmzkI+htZNOJFDCqWW A==;
X-CSE-ConnectionGUID: 6VA3BEYWQPehFcIBar3c/A==
X-CSE-MsgGUID: ho05N5Z3RBezWqju0cs4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41393363"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="41393363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:10:47 -0700
X-CSE-ConnectionGUID: LvvKY5cPQbKgpYBZ6pW+Gg==
X-CSE-MsgGUID: hh1hu8qVQ1WqvWVQbylEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="95515310"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 02 Sep 2024 23:10:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1slMkT-0006IG-16;
 Tue, 03 Sep 2024 06:10:41 +0000
Date: Tue, 3 Sep 2024 14:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Message-ID: <202409031258.S4i2qVfW-lkp@intel.com>
References: <20240902125502.1844374-3-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902125502.1844374-3-cengjianeng@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jianeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc6 next-20240902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianeng-Ceng/dt-bindings-arm-mediatek-Add-MT8186-Ponyta-Chromebook/20240902-210651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240902125502.1844374-3-cengjianeng%40huaqin.corp-partner.google.com
patch subject: [PATCH v1 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
config: arm64-randconfig-002-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031258.S4i2qVfW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031258.S4i2qVfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031258.S4i2qVfW-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[4]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-rev2-sku1.dtb', needed by 'arch/arm64/boot/dts/mediatek/'.
>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-rev2-sku0.dtb', needed by 'arch/arm64/boot/dts/mediatek/dtbs-list'.
   make[4]: Target 'arch/arm64/boot/dts/mediatek/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
