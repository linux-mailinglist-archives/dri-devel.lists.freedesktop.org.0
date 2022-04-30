Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C000515FE5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 20:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817510E15C;
	Sat, 30 Apr 2022 18:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47410E06E;
 Sat, 30 Apr 2022 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651344215; x=1682880215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oWYIihokUaJM/i9/QmGaXX3gl+K8rlFxtNay5clvk0I=;
 b=VUtEWa0ssPUBeV3Jrub/2PePGnUp5LPRzfQj7JOg0Tfa77WlEZk//+vV
 gljgn/LouD+0aiyo7qLns4bSD8PGLDniXrUM8xnImoFK/UKQoyqhyOO/m
 1BPLI1yXIN3rQ97yeqob0OlRE4rxXHuTZgyU84PVHvVIFcLinDrb6nwmm
 u3tPyQumjBxKwWVR6aSD9d/dslwQh3DkKmTXMLF0+D0xiYheIZ7BAmm0q
 K+27FS0s+geHuOzyuLRhAPbs3r5Wb40aTSDWVBuZNiwpHpTVE+2DBxhwG
 Ql/9SLoejbPUHqYv7urofd6026TpK7JYfPS2PTS61Rl5TmKpxxFKNTNex A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="246826918"
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; d="scan'208";a="246826918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2022 11:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; d="scan'208";a="732688331"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 30 Apr 2022 11:43:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nks41-0007VT-Fq;
 Sat, 30 Apr 2022 18:43:29 +0000
Date: Sun, 1 May 2022 02:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v3 2/2] ALSA: hda - identify when audio is provided by a
 video driver
Message-ID: <202205010257.ZFhZYEG9-lkp@intel.com>
References: <6b5f1e2cec0137d5aab089a7e7497972ff5addb1.1651326000.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b5f1e2cec0137d5aab089a7e7497972ff5addb1.1651326000.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 mauro.chehab@linux.intel.com, David Airlie <airlied@linux.ie>,
 Greg KH <greg@kroah.com>, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

I love your patch! Yet something to improve:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v5.18-rc4 next-20220429]
[cannot apply to tiwai-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Let-userspace-know-when-snd-hda-intel-needs-i915/20220430-214332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
config: riscv-buildonly-randconfig-r003-20220428 (https://download.01.org/0day-ci/archive/20220501/202205010257.ZFhZYEG9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/32f6557b5cc77c3cc2fcf6e68f11d989e31c954d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/Let-userspace-know-when-snd-hda-intel-needs-i915/20220430-214332
        git checkout 32f6557b5cc77c3cc2fcf6e68f11d989e31c954d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/hda/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/hda/hdac_component.c:202:7: error: call to undeclared function '__try_module_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!__try_module_get(acomp->ops->owner, dev->driver->owner)) {
                ^
   sound/hda/hdac_component.c:202:7: note: did you mean 'try_module_get'?
   include/linux/module.h:759:20: note: 'try_module_get' declared here
   static inline bool try_module_get(struct module *module)
                      ^
   1 error generated.


vim +/__try_module_get +202 sound/hda/hdac_component.c

   183	
   184	static int hdac_component_master_bind(struct device *dev)
   185	{
   186		struct drm_audio_component *acomp = hdac_get_acomp(dev);
   187		int ret;
   188	
   189		if (WARN_ON(!acomp))
   190			return -EINVAL;
   191	
   192		ret = component_bind_all(dev, acomp);
   193		if (ret < 0)
   194			return ret;
   195	
   196		if (WARN_ON(!(acomp->dev && acomp->ops))) {
   197			ret = -EINVAL;
   198			goto out_unbind;
   199		}
   200	
   201		/* pin the module to avoid dynamic unbinding, but only if given */
 > 202		if (!__try_module_get(acomp->ops->owner, dev->driver->owner)) {
   203			ret = -ENODEV;
   204			goto out_unbind;
   205		}
   206	
   207		if (acomp->audio_ops && acomp->audio_ops->master_bind) {
   208			ret = acomp->audio_ops->master_bind(dev, acomp);
   209			if (ret < 0)
   210				goto module_put;
   211		}
   212	
   213		complete_all(&acomp->master_bind_complete);
   214		return 0;
   215	
   216	 module_put:
   217		module_put(acomp->ops->owner);
   218	out_unbind:
   219		component_unbind_all(dev, acomp);
   220		complete_all(&acomp->master_bind_complete);
   221	
   222		return ret;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
