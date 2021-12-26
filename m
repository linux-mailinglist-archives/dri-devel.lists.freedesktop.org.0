Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F447F707
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 14:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79610E741;
	Sun, 26 Dec 2021 13:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6958610E741
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640526168; x=1672062168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BXSyAfPPKL+BNYyTWCrcjcEA6M7erOc92NWo0C5C1GI=;
 b=aKG2SaAL05S0G7PjZOT+aY7IVz/D46OsynSnrwDnHD3M05yOrYOKSr+m
 C9cc+Sa3jgyyUkrLX9CQGx9Qgvjs4du6p1kgzl2sVt8Gbj+/o3j8EZ8cL
 R7bFy5gCxYDETK3uJ4OgJKoSvnCYLxiUwNmxUfmI4VSlUr5riPcbuk8Dy
 dmw0315gA2+mhbnrhrniETECydA2Aq8+GfMe4qS2SnyzIuW55g7JM5gY6
 SudYworHjrqlplkHImGTgOhkxZxaznVKU5hnvI69WwAuSgwmjsmoR73C5
 esavhjAs1xIjVbMLbtFXWgavGO+28mkwH89AzCx2slKnAbXHicLZSD6u/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="227945615"
X-IronPort-AV: E=Sophos;i="5.88,237,1635231600"; d="scan'208";a="227945615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2021 05:42:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,237,1635231600"; d="scan'208";a="467636285"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 26 Dec 2021 05:42:44 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n1TnQ-0005Q1-4l; Sun, 26 Dec 2021 13:42:44 +0000
Date: Sun, 26 Dec 2021 21:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 melissa.srw@gmail.com
Subject: Re: [PATCH v2 1/1] drm/vkms: add zpos plane property
Message-ID: <202112262151.0Z5oNd2u-lkp@intel.com>
References: <20211226111219.27616-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211226111219.27616-2-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, kbuild-all@lists.01.org,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.16-rc6 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/drm-vkms-zpos/20211226-191434
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r041-20211226 (https://download.01.org/0day-ci/archive/20211226/202112262151.0Z5oNd2u-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553cc1af2e4c14100df6cf4a6fc91987e778e6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/48c96494b71972f4bf1769682e94e59724dba874
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/drm-vkms-zpos/20211226-191434
        git checkout 48c96494b71972f4bf1769682e94e59724dba874
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_plane.c:170:15: error: use of undeclared identifier 'NUM_OVERLAY_PLANES'
                                                        1, NUM_OVERLAY_PLANES);
                                                           ^
   1 error generated.


vim +/NUM_OVERLAY_PLANES +170 drivers/gpu/drm/vkms/vkms_plane.c

   162	
   163	static int vkms_plane_create_zpos_property(struct vkms_plane *plane)
   164	{
   165		int ret;
   166		unsigned int zpos = drm_plane_index(&plane->base);
   167	
   168		if (plane->base.type == DRM_PLANE_TYPE_OVERLAY) {
   169			ret = drm_plane_create_zpos_property(&plane->base, zpos,
 > 170							     1, NUM_OVERLAY_PLANES);
   171		} else {
   172			ret = drm_plane_create_zpos_immutable_property(&plane->base,
   173								       zpos);
   174		}
   175	
   176		return ret;
   177	}
   178	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
