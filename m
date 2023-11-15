Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01197EC96E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 18:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A910E0F6;
	Wed, 15 Nov 2023 17:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138EB10E102;
 Wed, 15 Nov 2023 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700068239; x=1731604239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qgux1RxgmOdTrZ+XM5YJR3vYYmq5dU/OrRR/xq6hqUc=;
 b=U1lbhbpwosTGJsLKh74fJAv4RSY5A13iV5ZqU/KK/f/m+3UKpfQcij7o
 qujXwQKqpFqkfZGlbu1LrktoXq0myWFDZZ0jAp7yqeiKAWa+EXjXPGZfk
 I5W6Ky3nkgor9q8ABKngdK1bWIQJsWmZqL35ad3qqNWG35ObubbkinbC4
 bexaGi/35wQnuT/5B7OJ4ywOq+68Oyxo/snMb76eEqlX6LdjjsN3nEBSF
 AidWYks0GAy7qwadbEZV3c5kvI9/AvM13ClohqeqWKvBPcndHP2AI3rkr
 jVOGecG5HmHF5MZca41jtj7anxWHSj9Eds8GV2p3C7g8CCKclliLwT1Vo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375955668"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="375955668"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 09:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012339208"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="1012339208"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2023 09:10:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r3JOo-0000dw-0k;
 Wed, 15 Nov 2023 17:09:58 +0000
Date: Thu, 16 Nov 2023 01:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gsc: Mark internal GSC engine with reserved
 uabi class
Message-ID: <202311160136.EtOH3ghf-lkp@intel.com>
References: <20231115110216.267138-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115110216.267138-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, llvm@lists.linux.dev,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 oe-kbuild-all@lists.linux.dev, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.7-rc1 next-20231115]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-i915-gsc-Mark-internal-GSC-engine-with-reserved-uabi-class/20231115-190507
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20231115110216.267138-1-tvrtko.ursulin%40linux.intel.com
patch subject: [PATCH] drm/i915/gsc: Mark internal GSC engine with reserved uabi class
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231116/202311160136.EtOH3ghf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160136.EtOH3ghf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160136.EtOH3ghf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_engine_user.c:225:26: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
                   if (engine->uabi_class == I915_NO_UABI_CLASS) {
                       ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_engine_user.c:243:26: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
                   if (engine->uabi_class == I915_NO_UABI_CLASS)
                       ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +225 drivers/gpu/drm/i915/gt/intel_engine_user.c

   203	
   204	void intel_engines_driver_register(struct drm_i915_private *i915)
   205	{
   206		u16 name_instance, other_instance = 0;
   207		struct legacy_ring ring = {};
   208		struct list_head *it, *next;
   209		struct rb_node **p, *prev;
   210		LIST_HEAD(engines);
   211	
   212		sort_engines(i915, &engines);
   213	
   214		prev = NULL;
   215		p = &i915->uabi_engines.rb_node;
   216		list_for_each_safe(it, next, &engines) {
   217			struct intel_engine_cs *engine =
   218				container_of(it, typeof(*engine), uabi_list);
   219	
   220			if (intel_gt_has_unrecoverable_error(engine->gt))
   221				continue; /* ignore incomplete engines */
   222	
   223			GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
   224			engine->uabi_class = uabi_classes[engine->class];
 > 225			if (engine->uabi_class == I915_NO_UABI_CLASS) {
   226				name_instance = other_instance++;
   227			} else {
   228				GEM_BUG_ON(engine->uabi_class >=
   229					   ARRAY_SIZE(i915->engine_uabi_class_count));
   230				name_instance =
   231					i915->engine_uabi_class_count[engine->uabi_class]++;
   232			}
   233			engine->uabi_instance = name_instance;
   234	
   235			/*
   236			 * Replace the internal name with the final user and log facing
   237			 * name.
   238			 */
   239			engine_rename(engine,
   240				      intel_engine_class_repr(engine->class),
   241				      name_instance);
   242	
   243			if (engine->uabi_class == I915_NO_UABI_CLASS)
   244				continue;
   245	
   246			rb_link_node(&engine->uabi_node, prev, p);
   247			rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
   248	
   249			GEM_BUG_ON(intel_engine_lookup_user(i915,
   250							    engine->uabi_class,
   251							    engine->uabi_instance) != engine);
   252	
   253			/* Fix up the mapping to match default execbuf::user_map[] */
   254			add_legacy_ring(&ring, engine);
   255	
   256			prev = &engine->uabi_node;
   257			p = &prev->rb_right;
   258		}
   259	
   260		if (IS_ENABLED(CONFIG_DRM_I915_SELFTESTS) &&
   261		    IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
   262			struct intel_engine_cs *engine;
   263			unsigned int isolation;
   264			int class, inst;
   265			int errors = 0;
   266	
   267			for (class = 0; class < ARRAY_SIZE(i915->engine_uabi_class_count); class++) {
   268				for (inst = 0; inst < i915->engine_uabi_class_count[class]; inst++) {
   269					engine = intel_engine_lookup_user(i915,
   270									  class, inst);
   271					if (!engine) {
   272						pr_err("UABI engine not found for { class:%d, instance:%d }\n",
   273						       class, inst);
   274						errors++;
   275						continue;
   276					}
   277	
   278					if (engine->uabi_class != class ||
   279					    engine->uabi_instance != inst) {
   280						pr_err("Wrong UABI engine:%s { class:%d, instance:%d } found for { class:%d, instance:%d }\n",
   281						       engine->name,
   282						       engine->uabi_class,
   283						       engine->uabi_instance,
   284						       class, inst);
   285						errors++;
   286						continue;
   287					}
   288				}
   289			}
   290	
   291			/*
   292			 * Make sure that classes with multiple engine instances all
   293			 * share the same basic configuration.
   294			 */
   295			isolation = intel_engines_has_context_isolation(i915);
   296			for_each_uabi_engine(engine, i915) {
   297				unsigned int bit = BIT(engine->uabi_class);
   298				unsigned int expected = engine->default_state ? bit : 0;
   299	
   300				if ((isolation & bit) != expected) {
   301					pr_err("mismatching default context state for class %d on engine %s\n",
   302					       engine->uabi_class, engine->name);
   303					errors++;
   304				}
   305			}
   306	
   307			if (drm_WARN(&i915->drm, errors,
   308				     "Invalid UABI engine mapping found"))
   309				i915->uabi_engines = RB_ROOT;
   310		}
   311	
   312		set_scheduler_caps(i915);
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
