Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395F47F70F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 15:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD0E89C82;
	Sun, 26 Dec 2021 14:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D9E89C82
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640527429; x=1672063429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JyQw84yzbD12QRN6tQ+pCU23brqQBHbn04H85KS1W0c=;
 b=iG5lPDjYNKMtPOSdwj0YjtNGuVkp7Me4RsZxWeGA2C+WmdjmRqQp5Gd/
 pP+g2U48qePWfR2eKYhiG2Rw1bNhwQescRYOCC83gBE00uNGhXMp+Wzg0
 rKygi8nzbpqZ4WYnghErpze3Am3zCvfsrISJ/KbfRtLqncwADy/icVmiU
 Ew0+bnz/ulmPQfY0EvLuSvW/Evcd81GkeTuqvKasS/13e322nTx/r1jv5
 KsCACJhB5x+pofcrf/79nfaBnAK1fDz+oT8ejdJjRJYJIZU85XBAnKtcS
 Df/jlkvYUD+azLSs1NRYQkkVwSz6mA/rgephJ+C2ary0mP2P0bf4NiJ2i g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="238647360"
X-IronPort-AV: E=Sophos;i="5.88,237,1635231600"; d="scan'208";a="238647360"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2021 06:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,237,1635231600"; d="scan'208";a="618175259"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Dec 2021 06:03:45 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n1U7l-0005Qp-56; Sun, 26 Dec 2021 14:03:45 +0000
Date: Sun, 26 Dec 2021 22:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 melissa.srw@gmail.com
Subject: Re: [PATCH v2 1/1] drm/vkms: add zpos plane property
Message-ID: <202112262122.WMEshF8D-lkp@intel.com>
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
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
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
config: arc-randconfig-r043-20211226 (https://download.01.org/0day-ci/archive/20211226/202112262122.WMEshF8D-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/48c96494b71972f4bf1769682e94e59724dba874
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/drm-vkms-zpos/20211226-191434
        git checkout 48c96494b71972f4bf1769682e94e59724dba874
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_plane.c: In function 'vkms_plane_create_zpos_property':
>> drivers/gpu/drm/vkms/vkms_plane.c:170:57: error: 'NUM_OVERLAY_PLANES' undeclared (first use in this function)
     170 |                                                      1, NUM_OVERLAY_PLANES);
         |                                                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_plane.c:170:57: note: each undeclared identifier is reported only once for each function it appears in


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
