Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A64CD344A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 18:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DCA10E241;
	Sat, 20 Dec 2025 17:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ar1IZ9oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD65C10E241
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766250934; x=1797786934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hcqx9K9e2DdZM+fc4kG1hUDJm+AVPCZc+SF3IRp/b7A=;
 b=Ar1IZ9oosIkjf9zXWs530UDURTyZ8JdB3/nqNJmhI3rYo1ResbZcMrRf
 2a7KgQRwvGKOIjxq0DGP3h4Cjfxv9Dfrbq7VNCJS/4d0I7JcrXtemf990
 HZalWeY+dCXorxtXGldr88FE5/BtETog2FJGNbRicKId0bD+QLqxX9jpC
 D0y0US3YUibSpeW9W4FMwiNpCRAz/HEpcmC0KtiCKrzZhZEo/6oURBIC1
 s4Ht/A/Jcbylu3KbBm0eMZ4eAzMKTYS7Rb61cHxecsOeAocY18/6ZON66
 Sf1siF9fiDXJj1PuThGnZMMsQQmLl8HIj6tnGvBA1mj9afvsnhM+YNkpo g==;
X-CSE-ConnectionGUID: Gt4ywSNDTZWF18we0SN3vw==
X-CSE-MsgGUID: h1K3FepeQO+SVaM3IkHjMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67931019"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="67931019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 09:15:34 -0800
X-CSE-ConnectionGUID: xj9DdeaKSq6vz1gN+HADYg==
X-CSE-MsgGUID: upGwtnYiSQCeULUBwleOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="199046442"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:15:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vX0YB-000000004vl-3lXj;
 Sat, 20 Dec 2025 17:15:27 +0000
Date: Sun, 21 Dec 2025 01:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to
 pm_sleep_ptr()
Message-ID: <202512210044.xNNW6QJZ-lkp@intel.com>
References: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmi-Switch-from-__maybe_unused-to-pm_sleep_ptr/20251219-024836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6%40foss.st.com
patch subject: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to pm_sleep_ptr()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210044.xNNW6QJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmi.c:2127:12: warning: 'dcmi_resume' defined but not used [-Wunused-function]
    2127 | static int dcmi_resume(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:2116:12: warning: 'dcmi_suspend' defined but not used [-Wunused-function]
    2116 | static int dcmi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/dcmi_resume +2127 drivers/media/platform/st/stm32/stm32-dcmi.c

  2115	
> 2116	static int dcmi_suspend(struct device *dev)
  2117	{
  2118		/* disable clock */
  2119		pm_runtime_force_suspend(dev);
  2120	
  2121		/* change pinctrl state */
  2122		pinctrl_pm_select_sleep_state(dev);
  2123	
  2124		return 0;
  2125	}
  2126	
> 2127	static int dcmi_resume(struct device *dev)
  2128	{
  2129		/* restore pinctl default state */
  2130		pinctrl_pm_select_default_state(dev);
  2131	
  2132		/* clock enable */
  2133		pm_runtime_force_resume(dev);
  2134	
  2135		return 0;
  2136	}
  2137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
