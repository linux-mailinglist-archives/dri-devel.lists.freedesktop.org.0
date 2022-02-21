Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0C4BEBAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C44910E487;
	Mon, 21 Feb 2022 20:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424710E446
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 20:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645474662; x=1677010662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lXUmNtmat6bpO54V1iRpce+UIykFDZhSV2ElkgLxb/U=;
 b=BXrLe9nrfXM0EYhKIpkmtwstCnr24rE0Y93gJjV6UQ9L+rW6XgzEdFVi
 uzPoeNguF2oEOjOrhotU6vb9xIgaRZDmib5ObN8gXlXc0fwcj2SV0s52a
 fMlxVk5X2Bg0TY7jB2qPnw55s+4LfILicwdMgEhKje4c08WKFVZabT8UK
 d2lNcqsPSnp3nkFzfKATyVvi+cCSFOgObIVfL8KTUNUZZRawKumqdd9Kv
 KrX15AHYzNgqf50KLN/xUEJXB/GOmRSh5fUs+81eYuhApDfGyAPUmBEVv
 J1D9VwjZa4ezCqCt4Ha45Rq+0prkA1ZX1noDS68EFvAxKwkA4FDQqhAAc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="276159327"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="276159327"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 12:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="490537105"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 21 Feb 2022 12:17:40 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMF7r-0001wy-6x; Mon, 21 Feb 2022 20:17:39 +0000
Date: Tue, 22 Feb 2022 04:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 tomba@kernel.org
Subject: Re: [PATCH] drm/omap: switch to drm_of_find_panel_or_bridge
Message-ID: <202202220451.VbtgFzSa-lkp@intel.com>
References: <20220220195212.1129437-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220220195212.1129437-1-jose.exposito89@gmail.com>
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
Cc: kbuild-all@lists.01.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/drm-omap-switch-to-drm_of_find_panel_or_bridge/20220221-035403
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20220222/202202220451.VbtgFzSa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9a465e2c1dba123efe08cf2f4a5ae11b07be4142
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/drm-omap-switch-to-drm_of_find_panel_or_bridge/20220221-035403
        git checkout 9a465e2c1dba123efe08cf2f4a5ae11b07be4142
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/omapdrm/dss/output.c: In function 'omapdss_device_init_output':
>> drivers/gpu/drm/omapdrm/dss/output.c:25:15: error: implicit declaration of function 'drm_of_find_panel_or_bridge' [-Werror=implicit-function-declaration]
      25 |         ret = drm_of_find_panel_or_bridge(out->dev->of_node, out->of_port, 0,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_of_find_panel_or_bridge +25 drivers/gpu/drm/omapdrm/dss/output.c

    19	
    20	int omapdss_device_init_output(struct omap_dss_device *out,
    21				       struct drm_bridge *local_bridge)
    22	{
    23		int ret;
    24	
  > 25		ret = drm_of_find_panel_or_bridge(out->dev->of_node, out->of_port, 0,
    26						  &out->panel, &out->bridge);
    27		if (ret) {
    28			if (ret == -ENODEV) {
    29				dev_dbg(out->dev, "failed to find video sink\n");
    30				return 0;
    31			}
    32			goto error;
    33		}
    34	
    35		if (out->panel) {
    36			struct drm_bridge *bridge;
    37	
    38			bridge = drm_panel_bridge_add(out->panel);
    39			if (IS_ERR(bridge)) {
    40				dev_err(out->dev,
    41					"unable to create panel bridge (%ld)\n",
    42					PTR_ERR(bridge));
    43				ret = PTR_ERR(bridge);
    44				goto error;
    45			}
    46	
    47			out->bridge = bridge;
    48		}
    49	
    50		if (local_bridge) {
    51			if (!out->bridge) {
    52				ret = -EPROBE_DEFER;
    53				goto error;
    54			}
    55	
    56			out->next_bridge = out->bridge;
    57			out->bridge = local_bridge;
    58		}
    59	
    60		if (!out->bridge) {
    61			ret = -EPROBE_DEFER;
    62			goto error;
    63		}
    64	
    65		return 0;
    66	
    67	error:
    68		omapdss_device_cleanup_output(out);
    69		return ret;
    70	}
    71	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
