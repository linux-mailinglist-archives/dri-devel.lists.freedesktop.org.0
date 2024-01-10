Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B169829183
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 01:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128C10E541;
	Wed, 10 Jan 2024 00:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56510E541
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704847164; x=1736383164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6VSUhxHcVKYf8XcSqAKay5YGN0ehzbjWp+67JrBDyYY=;
 b=XSmYSHEaEYojVJCiXOtjaiPIpl1hgb0Ut326nAAFqEWF7QXIhqoXf7yp
 4TFw0c8waPLwrtv9Y9nsp70n66H+8x0Ye2Hd7C3m23/AFLXxLbZxFC2gR
 sSA+rS/0Wx77q2kafBb7lvmBTmtcFij+QEvrdeCePucHOu8cFDfsHuun9
 TkBBxVO0GgW8a/EteIhtfT4fprmBgv1Ez2s2LlWvdGSW5a7SoEU7s8PNg
 RKQhnrHqHxDTnLq3cvORF88vT5TWXpSFjNkPvKqO44C7LSNzOZpRwRd0C
 5/+xPMRzcwE1MIw2hsgMc5kcfO/ma8l2w1Pc/2s15dzrgIKGL4zcqVnPp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="398059703"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="398059703"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 16:39:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113257196"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1113257196"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2024 16:39:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rNMcn-0006Qw-07;
 Wed, 10 Jan 2024 00:39:17 +0000
Date: Wed, 10 Jan 2024 08:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/dcss: request memory region
Message-ID: <202401100801.1Wiy3ZEd-lkp@intel.com>
References: <20240109102032.16165-2-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109102032.16165-2-pstanner@redhat.com>
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
Cc: Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7]
[also build test ERROR on linus/master next-20240109]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-dcss-request-memory-region/20240109-182239
base:   v6.7
patch link:    https://lore.kernel.org/r/20240109102032.16165-2-pstanner%40redhat.com
patch subject: [PATCH v2 1/2] drm/dcss: request memory region
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240110/202401100801.1Wiy3ZEd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100801.1Wiy3ZEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100801.1Wiy3ZEd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:17,
                    from include/linux/platform_device.h:13,
                    from drivers/gpu/drm/imx/dcss/dcss-dev.c:9:
   drivers/gpu/drm/imx/dcss/dcss-dev.c: In function 'dcss_dev_create':
>> drivers/gpu/drm/imx/dcss/dcss-dev.c:188:42: error: incompatible type for argument 1 of '__devm_request_region'
     188 |         if (!devm_request_mem_region(pdev->dev, res->start, res_len, "dcss")) {
         |                                      ~~~~^~~~~
         |                                          |
         |                                          struct device
   include/linux/ioport.h:306:31: note: in definition of macro 'devm_request_mem_region'
     306 |         __devm_request_region(dev, &iomem_resource, (start), (n), (name))
         |                               ^~~
   include/linux/ioport.h:308:63: note: expected 'struct device *' but argument is of type 'struct device'
     308 | extern struct resource * __devm_request_region(struct device *dev,
         |                                                ~~~~~~~~~~~~~~~^~~


vim +/__devm_request_region +188 drivers/gpu/drm/imx/dcss/dcss-dev.c

   165	
   166	struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
   167	{
   168		struct platform_device *pdev = to_platform_device(dev);
   169		int ret;
   170		struct resource *res;
   171		struct dcss_dev *dcss;
   172		const struct dcss_type_data *devtype;
   173		resource_size_t res_len;
   174	
   175		devtype = of_device_get_match_data(dev);
   176		if (!devtype) {
   177			dev_err(dev, "no device match found\n");
   178			return ERR_PTR(-ENODEV);
   179		}
   180	
   181		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   182		if (!res) {
   183			dev_err(dev, "cannot get memory resource\n");
   184			return ERR_PTR(-EINVAL);
   185		}
   186	
   187		res_len = res->end - res->start;
 > 188		if (!devm_request_mem_region(pdev->dev, res->start, res_len, "dcss")) {
   189			dev_err(dev, "cannot request memory region\n");
   190			return ERR_PTR(-EBUSY);
   191		}
   192	
   193		dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
   194		if (!dcss)
   195			return ERR_PTR(-ENOMEM);
   196	
   197		dcss->dev = dev;
   198		dcss->devtype = devtype;
   199		dcss->hdmi_output = hdmi_output;
   200	
   201		ret = dcss_clks_init(dcss);
   202		if (ret) {
   203			dev_err(dev, "clocks initialization failed\n");
   204			goto err;
   205		}
   206	
   207		dcss->of_port = of_graph_get_port_by_id(dev->of_node, 0);
   208		if (!dcss->of_port) {
   209			dev_err(dev, "no port@0 node in %pOF\n", dev->of_node);
   210			ret = -ENODEV;
   211			goto clks_err;
   212		}
   213	
   214		dcss->start_addr = res->start;
   215	
   216		ret = dcss_submodules_init(dcss);
   217		if (ret) {
   218			of_node_put(dcss->of_port);
   219			dev_err(dev, "submodules initialization failed\n");
   220			goto clks_err;
   221		}
   222	
   223		init_completion(&dcss->disable_completion);
   224	
   225		pm_runtime_set_autosuspend_delay(dev, 100);
   226		pm_runtime_use_autosuspend(dev);
   227		pm_runtime_set_suspended(dev);
   228		pm_runtime_allow(dev);
   229		pm_runtime_enable(dev);
   230	
   231		return dcss;
   232	
   233	clks_err:
   234		dcss_clks_release(dcss);
   235	
   236	err:
   237		kfree(dcss);
   238	
   239		return ERR_PTR(ret);
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
