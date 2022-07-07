Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D035699C2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 07:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE29310E470;
	Thu,  7 Jul 2022 05:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838F1122A8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657171167; x=1688707167;
 h=subject:references:in-reply-to:to:cc:from:message-id:
 date:mime-version:content-transfer-encoding;
 bh=JnsdlBnemi3+nXZhtC2fFwNrIgLD1cmfnw2eTSz6klU=;
 b=Ju59EGDNta+sKzj7WGv2XQhPmDwZvYh/iz11e9mo/KCUxJ3ThkEgxRxf
 dQFFaYQ22Mm2PAZVrWurkimfwnxAJH6NB5M1a7o4tjRe3gzKCvuMejpDE
 g9NXqYYlm7JQaxv0BKk0h6UPiHIFGPY91boOQDRUu4eugIJhBZSZP3Vnn
 p0sWvZUjyARJEQRCTIItOBwtjruz7g02N6MLA+r8/sahK4pWn/1Q/zk5P
 vf6+pUyReX55p1SBmQ2uu42PX1r0rxIszNj67OdfzlmRurmCNNmLI6+iv
 HNSNhETcaVOJbc+gKPm8HmgT62duS4MaZaylindPQxG68PG4zr4qIoSF7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="309489876"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="309489876"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650975358"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.6])
 ([10.255.31.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 22:19:23 -0700
Subject: Re: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr
 => dma_addr}
References: <202207070426.Bj47lRp2-lkp@intel.com>
In-Reply-To: <202207070426.Bj47lRp2-lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, airlied@linux.ie, tzimmermann@suse.de
From: kernel test robot <rong.a.chen@intel.com>
X-Forwarded-Message-Id: <202207070426.Bj47lRp2-lkp@intel.com>
Message-ID: <75985d03-11aa-1c0a-d1c0-6a6cbd56cbce@intel.com>
Date: Thu, 7 Jul 2022 13:19:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Danilo Krummrich <dakr@redhat.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc5]
[also build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next anholt/for-next 
pinchartl-media/drm/du/next next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url: 
https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-rename-CMA-helpers-to-DMA-helpers/20220706-204716
base:    88084a3df1672e131ddc1b4e39eeacfd39864acf
config: arm-buildonly-randconfig-r003-20220706 
(https://download.01.org/0day-ci/archive/20220707/202207070426.Bj47lRp2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
         wget 
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
-O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # 
https://github.com/intel-lab-lkp/linux/commit/54853a66aeea45ecb99d39dec51a7018803174e6
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review 
Danilo-Krummrich/drm-rename-CMA-helpers-to-DMA-helpers/20220706-204716
         git checkout 54853a66aeea45ecb99d39dec51a7018803174e6
         # save the config file
         mkdir build_dir && cp config build_dir/.config
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross 
W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tilcdc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

    drivers/gpu/drm/tilcdc/tilcdc_crtc.c: In function 'set_scanout':
>> drivers/gpu/drm/tilcdc/tilcdc_crtc.c:72:22: error: 'struct drm_gem_dma_object' has no member named 'paddr'; did you mean 'vaddr'?
       72 |         start = gem->paddr + fb->offsets[0] +
          |                      ^~~~~
          |                      vaddr


vim +72 drivers/gpu/drm/tilcdc/tilcdc_crtc.c

16ea975eac671fa Rob Clark        2013-01-08  61  2b2080d7e9ae246 Tomi 
Valkeinen   2015-10-20  62  static void set_scanout(struct drm_crtc 
*crtc, struct drm_framebuffer *fb)
16ea975eac671fa Rob Clark        2013-01-08  63  {
16ea975eac671fa Rob Clark        2013-01-08  64  	struct drm_device *dev 
= crtc->dev;
4c268d635f8d4f5 Daniel Schultz   2016-10-28  65  	struct 
tilcdc_drm_private *priv = dev->dev_private;
efb5bf503f38a8d Danilo Krummrich 2022-07-06  66  	struct 
drm_gem_dma_object *gem;
2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  67  	dma_addr_t start, end;
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  68  	u64 dma_base_and_ceiling;
16ea975eac671fa Rob Clark        2013-01-08  69  d47caa3aaf3da1e Danilo 
Krummrich 2022-07-06  70  	gem = drm_fb_dma_get_gem_obj(fb, 0);
16ea975eac671fa Rob Clark        2013-01-08  71  2b2080d7e9ae246 Tomi 
Valkeinen   2015-10-20 @72  	start = gem->paddr + fb->offsets[0] +
2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  73  		crtc->y * 
fb->pitches[0] +
353c859899635ea Ville Syrjälä    2016-12-14  74  		crtc->x * 
fb->format->cpp[0];
16ea975eac671fa Rob Clark        2013-01-08  75  2b2080d7e9ae246 Tomi 
Valkeinen   2015-10-20  76  	end = start + (crtc->mode.vdisplay * 
fb->pitches[0]);
16ea975eac671fa Rob Clark        2013-01-08  77  7eb9f069ff5dd39 Jyri 
Sarha       2016-08-26  78  	/* Write LCDC_DMA_FB_BASE_ADDR_0_REG and 
LCDC_DMA_FB_CEILING_ADDR_0_REG
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  79  	 * with a single 
insruction, if available. This should make it more
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  80  	 * unlikely that LCDC 
would fetch the DMA addresses in the middle of
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  81  	 * an update.
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  82  	 */
4c268d635f8d4f5 Daniel Schultz   2016-10-28  83  	if (priv->rev == 1)
4c268d635f8d4f5 Daniel Schultz   2016-10-28  84  		end -= 1;
4c268d635f8d4f5 Daniel Schultz   2016-10-28  85  4c268d635f8d4f5 Daniel 
Schultz   2016-10-28  86  	dma_base_and_ceiling = (u64)end << 32 | start;
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  87  	tilcdc_write64(dev, 
LCDC_DMA_FB_BASE_ADDR_0_REG, dma_base_and_ceiling);
16ea975eac671fa Rob Clark        2013-01-08  88  }
16ea975eac671fa Rob Clark        2013-01-08  89
-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
