Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD807AC744
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 11:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B210C10E0F5;
	Sun, 24 Sep 2023 09:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9AE10E002
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695546645; x=1727082645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qhGRDGNm74HMENeARfnpLwAzRCmbV4L9fDQ+20U0EQc=;
 b=TwmwiIRHWc4RY1G21/JUkTgVZIqyyoS0khCy03i039IyhNkBo5De9ciT
 XxPt59Jue9Np9qPEa7j9A4KvhZ5hCBZlEwlSDhGg09hfWEopJWuJqR+k7
 VHOwvCgDr8yXfl3PpoFi1aSmCQnhZK36xdbLu6g2Cz6Hb/hxiU/cZR5Cf
 hh6sEgO+h7U2S98QhTj6ixCwueqgNtPySnzp5sVC5Aw5mqYAciiSMSinW
 r3oMOMkDB1QqmesjW9KKqkRdI15EXNszjgVgnqrGp11+U8M32cCUFlEIX
 /Nl8ZJvuaFQc+k46rMnr6pLXy4JngwpL+vszA2p/jn88Pw4CmZFzdMash Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="379959017"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="379959017"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 02:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="995048020"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="995048020"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 02:10:42 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkL8S-0003QP-0R;
 Sun, 24 Sep 2023 09:10:40 +0000
Date: Sun, 24 Sep 2023 17:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: liuhaoran <liuhaoran14@163.com>, airlied@gmail.com
Subject: Re: [PATCH] drm/sun4i: Add error handling in sun4i_layer_init_one()
Message-ID: <202309241647.QEGaCh1E-lkp@intel.com>
References: <20230924074216.17390-1-liuhaoran14@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924074216.17390-1-liuhaoran14@163.com>
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
Cc: liuhaoran <liuhaoran14@163.com>, samuel@sholland.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi liuhaoran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuhaoran/drm-sun4i-Add-error-handling-in-sun4i_layer_init_one/20230924-154504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20230924074216.17390-1-liuhaoran14%40163.com
patch subject: [PATCH] drm/sun4i: Add error handling in sun4i_layer_init_one()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230924/202309241647.QEGaCh1E-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241647.QEGaCh1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241647.QEGaCh1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_layer.c: In function 'sun4i_layer_init_one':
>> drivers/gpu/drm/sun4i/sun4i_layer.c:230:35: warning: missing terminating " character
     230 |                 dev_err(drm->dev, "Failed to install alpha property,
         |                                   ^
   drivers/gpu/drm/sun4i/sun4i_layer.c:231:34: warning: missing terminating " character
     231 |                         rc = %d\n", ret);
         |                                  ^
   drivers/gpu/drm/sun4i/sun4i_layer.c:239:35: warning: missing terminating " character
     239 |                 dev_err(drm->dev, "Failed to install zpos property,
         |                                   ^
   drivers/gpu/drm/sun4i/sun4i_layer.c:240:34: warning: missing terminating " character
     240 |                         rc = %d\n", ret);
         |                                  ^
   drivers/gpu/drm/sun4i/sun4i_layer.c:275:2: error: unterminated argument list invoking macro "dev_err"
     275 | }
         |  ^
   drivers/gpu/drm/sun4i/sun4i_layer.c:230:17: error: 'dev_err' undeclared (first use in this function); did you mean '_dev_err'?
     230 |                 dev_err(drm->dev, "Failed to install alpha property,
         |                 ^~~~~~~
         |                 _dev_err
   drivers/gpu/drm/sun4i/sun4i_layer.c:230:17: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/sun4i/sun4i_layer.c:230:24: error: expected ';' at end of input
     230 |                 dev_err(drm->dev, "Failed to install alpha property,
         |                        ^
         |                        ;
   ......
   drivers/gpu/drm/sun4i/sun4i_layer.c:230:17: error: expected declaration or statement at end of input
     230 |                 dev_err(drm->dev, "Failed to install alpha property,
         |                 ^~~~~~~
   drivers/gpu/drm/sun4i/sun4i_layer.c:230:17: error: expected declaration or statement at end of input
   drivers/gpu/drm/sun4i/sun4i_layer.c: At top level:
>> drivers/gpu/drm/sun4i/sun4i_layer.c:190:28: warning: 'sun4i_layer_init_one' defined but not used [-Wunused-function]
     190 | static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
         |                            ^~~~~~~~~~~~~~~~~~~~


vim +230 drivers/gpu/drm/sun4i/sun4i_layer.c

   189	
 > 190	static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
   191							struct sun4i_backend *backend,
   192							enum drm_plane_type type,
   193							unsigned int id)
   194	{
   195		const uint64_t *modifiers = sun4i_layer_modifiers;
   196		const uint32_t *formats = sun4i_layer_formats;
   197		unsigned int formats_len = ARRAY_SIZE(sun4i_layer_formats);
   198		struct sun4i_layer *layer;
   199		int ret;
   200	
   201		layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
   202		if (!layer)
   203			return ERR_PTR(-ENOMEM);
   204	
   205		layer->id = id;
   206		layer->backend = backend;
   207	
   208		if (IS_ERR_OR_NULL(backend->frontend)) {
   209			formats = sun4i_backend_layer_formats;
   210			formats_len = ARRAY_SIZE(sun4i_backend_layer_formats);
   211			modifiers = NULL;
   212		}
   213	
   214		/* possible crtcs are set later */
   215		ret = drm_universal_plane_init(drm, &layer->plane, 0,
   216					       &sun4i_backend_layer_funcs,
   217					       formats, formats_len,
   218					       modifiers, type, NULL);
   219		if (ret) {
   220			dev_err(drm->dev, "Couldn't initialize layer\n");
   221			return ERR_PTR(ret);
   222		}
   223	
   224		drm_plane_helper_add(&layer->plane,
   225				     &sun4i_backend_layer_helper_funcs);
   226	
   227		ret = drm_plane_create_alpha_property(&layer->plane);
   228	
   229		if (ret) {
 > 230			dev_err(drm->dev, "Failed to install alpha property,
   231				rc = %d\n", ret);
   232			return ERR_PTR(ret);
   233		}
   234	
   235		ret = drm_plane_create_zpos_property(&layer->plane, layer->id, 0,
   236						     SUN4I_BACKEND_NUM_LAYERS - 1);
   237	
   238		if (ret) {
   239			dev_err(drm->dev, "Failed to install zpos property,
   240				rc = %d\n", ret);
   241			return ERR_PTR(ret);
   242		}
   243	
   244		return layer;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
