Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FD8268DD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 08:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E47C10E192;
	Mon,  8 Jan 2024 07:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3610E192
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704700011; x=1736236011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AvhfDm2j+qVAzbx7SoLzumEYgb5qaDh8X5waSOXgjnA=;
 b=Ie44G/gX3ljgXhNEcoPq3wuan6MPwUftE3p7qP+B2Rr/AUmr0KICBlJh
 oOTXQWc3oEjrAyrD45J78tt+kRGtw17zk7ymZFdtUUnLm723/SFwUEUTK
 RWgn3PKXHhUGY8VbHMest8iK/RP44wpQAlSqt4F7KWMsz5ywof+yt0MRl
 Mf0sifOfPz/pzJJYAQ077SP24NlTQmazdJhGXq4BpI//OyL+0V+NutJcP
 S6+3wTnDEFAFwo3UcgkxTUIMwYff/JQWU2TXk3uCqc2BTMCLOWiCqa7j3
 MUGuEH4B6CJqbVchepMY7o+vZT+pWnnMGZjnu8ryHrflF2Ft/HT2LN3qg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="19316779"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="19316779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 23:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="23091188"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 07 Jan 2024 23:46:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rMkLJ-0004Wy-2z;
 Mon, 08 Jan 2024 07:46:41 +0000
Date: Mon, 8 Jan 2024 15:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, David Gow <davidgow@google.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] platform_device: add devres function region-reqs
Message-ID: <202401081547.VBj4FKaw-lkp@intel.com>
References: <20240105172218.42457-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105172218.42457-3-pstanner@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.7 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/platform_device-add-devres-function-region-reqs/20240106-012526
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240105172218.42457-3-pstanner%40redhat.com
patch subject: [PATCH 1/2] platform_device: add devres function region-reqs
config: x86_64-randconfig-101-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081547.VBj4FKaw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081547.VBj4FKaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081547.VBj4FKaw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/platform.c:101: warning: expecting prototype for devm_platform_get_and_resource(). Prototype was for devm_platform_get_resource() instead


vim +101 drivers/base/platform.c

    84	
    85	/**
    86	 * devm_platform_get_and_resource - get and request a resource
    87	 *
    88	 * @pdev: the platform device to get the resource from
    89	 * @type: resource type (either IORESOURCE_MEM or IORESOURCE_IO)
    90	 * @num: resource index
    91	 * @name: name to be associated with the request
    92	 *
    93	 * Return: a pointer to the resource on success, an ERR_PTR on failure.
    94	 *
    95	 * Gets a resource and requests it. Use this instead of
    96	 * devm_platform_ioremap_resource() only if you have to create several single
    97	 * mappings with devm_ioremap().
    98	 */
    99	struct resource *devm_platform_get_resource(struct platform_device *pdev,
   100			unsigned int type, unsigned int num, const char *name)
 > 101	{
   102		struct resource *res;
   103	
   104		res = platform_get_resource(pdev, type, num);
   105		if (!res)
   106			return ERR_PTR(-EINVAL);
   107	
   108		if (type & IORESOURCE_MEM)
   109			res = devm_request_mem_region(&pdev->dev, res->start, res->end, name);
   110		else if (type & IORESOURCE_IO)
   111			res = devm_request_region(&pdev->dev, res->start, res->end, name);
   112		else
   113			return ERR_PTR(-EINVAL);
   114	
   115		if (!res)
   116			return ERR_PTR(-EBUSY);
   117	
   118		return res;
   119	}
   120	EXPORT_SYMBOL_GPL(devm_platform_get_resource);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
