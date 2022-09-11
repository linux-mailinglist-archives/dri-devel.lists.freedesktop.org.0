Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D555B513A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656E10E1A2;
	Sun, 11 Sep 2022 21:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7366B10E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662930613; x=1694466613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RG8YfmgizY8f30fuvwod0ufH2YNJPSaaJvaqBsrhjZk=;
 b=etDn2sbUenANFH6fmsyVt5S6aJJI50ojtHKKKG+FBY6f602T7HpyVpO3
 CP6lqVqBkNEUlenmOmJFwsoYLxi/aO0CYAWqqpQBw1c29cy26eAdlfie2
 MUuWN04eG8ptua9HMQl5qvD3ROpn6AvM2zwQbw3p1g1aiisT6zx8UawGN
 iHNK4MIG5i9AOTHLHxPm4ba/K9KT8pKOK6jg3uMAtB6wm6mNeIJBc2SeY
 QZTHKhsTDh3TIJBYH7LCtQGKzAp4TMP4ecr6Ncv9nJe2v3rI3qxHuDcsA
 RR3G0ywaUQXdx9KULRN8/jUFtXluiMYFbzO3l+T2cUhYt1KW82KtSYF1g A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="297753791"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="297753791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="649045973"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 11 Sep 2022 14:10:09 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oXUDQ-0001pv-1l;
 Sun, 11 Sep 2022 21:10:08 +0000
Date: Mon, 12 Sep 2022 05:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
Message-ID: <202209120412.a3tFZuO9-lkp@intel.com>
References: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
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
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason-JH.Lin",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220909]
[also build test WARNING on v6.0-rc4]
[cannot apply to drm-misc/drm-misc-next robh/for-next drm/drm-next linus/master v6.0-rc4 v6.0-rc3 v6.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/Add-gamma-lut-support-for-mt8195/20220911-233949
base:    9a82ccda91ed2b40619cb3c10d446ae1f97bab6e
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220912/202209120412.a3tFZuO9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d5b909c49fd62f1e6055fd3d077b9c5fae53e00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-JH-Lin/Add-gamma-lut-support-for-mt8195/20220911-233949
        git checkout 1d5b909c49fd62f1e6055fd3d077b9c5fae53e00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:59:14: warning: no previous prototype for 'mtk_gamma_get_size' [-Wmissing-prototypes]
      59 | unsigned int mtk_gamma_get_size(struct device *dev)
         |              ^~~~~~~~~~~~~~~~~~


vim +/mtk_gamma_get_size +59 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    58	
  > 59	unsigned int mtk_gamma_get_size(struct device *dev)
    60	{
    61		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
    62		unsigned int lut_size = LUT_SIZE_DEFAULT;
    63	
    64		if (gamma && gamma->data)
    65			lut_size = gamma->data->lut_size;
    66	
    67		return lut_size;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
