Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA834E87EE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 15:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4362110E3B4;
	Sun, 27 Mar 2022 13:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA2E10E3B4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648389193; x=1679925193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ftpBL5isBU6wAN2J5Wb1nf5ir7WISc6nuxwRuY7UEnQ=;
 b=DGvf/2hKymGa5z5GMsv/VxNDohoNybIKm2vn9LyooPYJPwO6lMEdbcZZ
 fM0ybJOmt+NzXE5+XCGPdsRD+Ty8F9cWLu+8Xy2Wv+ZWbZQD8Hs+sLG4+
 JJ0A865WFPL72+Je/Ro2dMIwzNSXXMOz4I5p0utSS5+vCdN0OCCtERdGj
 D93wOqSzWjO4N1U0KrxQeLXVByoQfZKvAn/i93SmzLSVQAq6m7atFnDYa
 E8cQMRXnlGTiBHFgChApLOq8jdtEPIh5OGItMLBEqytYxlVUEp0kNcj9s
 OkaKFgdZrdJbuqmOkq2oARPMhl0RV5QFuuC6lgl8WZ5dyJQwwIAecG0eW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="246340155"
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; d="scan'208";a="246340155"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2022 06:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; d="scan'208";a="617542612"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 27 Mar 2022 06:53:07 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nYTKM-00014v-Cw; Sun, 27 Mar 2022 13:53:06 +0000
Date: Sun, 27 Mar 2022 21:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <error27@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v12 5/6] drm/loongson: add drm driver for loongson
 display controller
Message-ID: <202203272117.q6tMwBFo-lkp@intel.com>
References: <20220327113846.2498146-6-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327113846.2498146-6-15330273260@189.cn>
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
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next linus/master v5.17 next-20220325]
[cannot apply to mripard/sunxi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-add-drm-driver-for-loongson-display-controller/20220327-194016
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: parisc-randconfig-r003-20220327 (https://download.01.org/0day-ci/archive/20220327/202203272117.q6tMwBFo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e90d831d05f2c1b5631fd706fb449e83e64f632c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-loongson-add-drm-driver-for-loongson-display-controller/20220327-194016
        git checkout e90d831d05f2c1b5631fd706fb449e83e64f632c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/lsdc_debugfs.c:149: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vram debugfs related ...


vim +149 drivers/gpu/drm/loongson/lsdc_debugfs.c

   147	
   148	/**
 > 149	 * vram debugfs related ...
   150	 */
   151	static int lsdc_vram_mm_show(struct seq_file *m, void *data)
   152	{
   153		struct drm_info_node *node = (struct drm_info_node *)m->private;
   154		struct drm_vram_mm *vmm = node->minor->dev->vram_mm;
   155		struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
   156		struct drm_printer p = drm_seq_file_printer(m);
   157	
   158		ttm_resource_manager_debug(man, &p);
   159		return 0;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
