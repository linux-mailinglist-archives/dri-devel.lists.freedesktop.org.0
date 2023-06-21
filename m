Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0278A738C42
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4796C10E333;
	Wed, 21 Jun 2023 16:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EAF10E333
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687366214; x=1718902214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O2cYgDYfZq7uxx4j9ftKdOww9wTIdNHJIaNeOMcmb4k=;
 b=auVwX1px0W2og6o2EZ+zdHrTFhK6uT3OlmDjMmlq0XZwNNKFrcu9f7d4
 tSwTdl6/NkfrjqEp0RO0tT22AzJsrDvt07TWXExdlQw0aOGkimlzCDntv
 R9a4mPMMxLikW3o0aDkyEpOnaTNVR6qEIrre0D82U4plCbudRG5+a+c+U
 vECwqDVanXYAlZvZINhmcbZsw4WhX0ZfCMvaH+UKbBctvBdlnf+n5kPZU
 +ODmoWeyoorVVJW9xiwwL+HCzmNXW7cxjIERfgU/BKztFSdCbGjH9BHA9
 /BiukkF7napyB6YRklH+eTAd8ds5/3cGzdVTbx9dEuy2Jf4JtTnAI6KYO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363654039"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="363654039"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 09:48:15 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="748774225"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="748774225"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 21 Jun 2023 09:48:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qC108-0006xB-06;
 Wed, 21 Jun 2023 16:48:12 +0000
Date: Thu, 22 Jun 2023 00:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas_os@shipmail.org, boris.brezillon@collabora.com,
 arunpravin.paneerselvam@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm: add drm_exec selftests v4
Message-ID: <202306220036.YcdJJD0a-lkp@intel.com>
References: <20230621133700.7588-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621133700.7588-2-christian.koenig@amd.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests-v4/20230621-213827
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230621133700.7588-2-christian.koenig%40amd.com
patch subject: [PATCH 2/2] drm: add drm_exec selftests v4
config: arm-randconfig-r014-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220036.YcdJJD0a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220036.YcdJJD0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220036.YcdJJD0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tests/drm_exec_test.c:13:
   drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
>> include/drm/drm_exec.h:78:20: warning: variable '__drm_exec_retry_ptr' set but not used [-Wunused-but-set-variable]
      78 |         for (void *__drm_exec_retry_ptr; ({                     \
         |                    ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_exec_test.c:134:9: note: in expansion of macro 'drm_exec_until_all_locked'
     134 |         drm_exec_until_all_locked(&exec)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__drm_exec_retry_ptr +78 include/drm/drm_exec.h

5d87375e05b5f7 Christian König 2023-06-21  52  
5d87375e05b5f7 Christian König 2023-06-21  53  /**
5d87375e05b5f7 Christian König 2023-06-21  54   * drm_exec_for_each_locked_object - iterate over all the locked objects
5d87375e05b5f7 Christian König 2023-06-21  55   * @exec: drm_exec object
5d87375e05b5f7 Christian König 2023-06-21  56   * @index: unsigned long index for the iteration
5d87375e05b5f7 Christian König 2023-06-21  57   * @obj: the current GEM object
5d87375e05b5f7 Christian König 2023-06-21  58   *
5d87375e05b5f7 Christian König 2023-06-21  59   * Iterate over all the locked GEM objects inside the drm_exec object.
5d87375e05b5f7 Christian König 2023-06-21  60   */
5d87375e05b5f7 Christian König 2023-06-21  61  #define drm_exec_for_each_locked_object(exec, index, obj)	\
5d87375e05b5f7 Christian König 2023-06-21  62  	for (index = 0, obj = (exec)->objects[0];		\
5d87375e05b5f7 Christian König 2023-06-21  63  	     index < (exec)->num_objects;			\
5d87375e05b5f7 Christian König 2023-06-21  64  	     ++index, obj = (exec)->objects[index])
5d87375e05b5f7 Christian König 2023-06-21  65  
5d87375e05b5f7 Christian König 2023-06-21  66  /**
5d87375e05b5f7 Christian König 2023-06-21  67   * drm_exec_until_all_locked - loop until all GEM objects are locked
5d87375e05b5f7 Christian König 2023-06-21  68   * @exec: drm_exec object
5d87375e05b5f7 Christian König 2023-06-21  69   *
5d87375e05b5f7 Christian König 2023-06-21  70   * Core functionality of the drm_exec object. Loops until all GEM objects are
5d87375e05b5f7 Christian König 2023-06-21  71   * locked and no more contention exists. At the beginning of the loop it is
5d87375e05b5f7 Christian König 2023-06-21  72   * guaranteed that no GEM object is locked.
5d87375e05b5f7 Christian König 2023-06-21  73   *
5d87375e05b5f7 Christian König 2023-06-21  74   * Since labels can't be defined local to the loops body we use a jump pointer
5d87375e05b5f7 Christian König 2023-06-21  75   * to make sure that the retry is only used from within the loops body.
5d87375e05b5f7 Christian König 2023-06-21  76   */
5d87375e05b5f7 Christian König 2023-06-21  77  #define drm_exec_until_all_locked(exec)				\
5d87375e05b5f7 Christian König 2023-06-21 @78  	for (void *__drm_exec_retry_ptr; ({			\
5d87375e05b5f7 Christian König 2023-06-21  79  		__label__ __drm_exec_retry;			\
5d87375e05b5f7 Christian König 2023-06-21  80  __drm_exec_retry:						\
5d87375e05b5f7 Christian König 2023-06-21  81  		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
5d87375e05b5f7 Christian König 2023-06-21  82  		drm_exec_cleanup(exec);				\
5d87375e05b5f7 Christian König 2023-06-21  83  	});)
5d87375e05b5f7 Christian König 2023-06-21  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
