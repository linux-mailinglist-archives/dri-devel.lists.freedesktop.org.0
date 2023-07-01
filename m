Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BD7446D6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 07:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F810E033;
	Sat,  1 Jul 2023 05:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2370910E031;
 Sat,  1 Jul 2023 05:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688190662; x=1719726662;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=I5c4dz/QtDGrrFERiX2xTgeTFieB+46FLcHxcYqJnu4=;
 b=ENuC6tId3Z+9THwUF8GwpJMRgc4SaKLcQbutJ8cThni/zYLujmjLLqKF
 1uUOmoecsqZYKAaEMcZKm2EP31hhsbP24yGVvKJ1ynD956U1axgYhQsjF
 cQohHiwb/3dRP6Nl2mTwIacV27BicuqRS2oreb+ktCGcy7dlYs4ns2OCq
 kApOlXddHzlpzAG0txlM7klKPC+fkqp1TByQch3VYPcUgon/egNZvd7ks
 vzSUghroWuII1oYe07MUKYUPcEFoNLztbNqsFt3EtZk0KhDCJHVraSLpe
 sPPiv/7kkUYitHoXqXQNBYXAchhErSFglTNI5Pjmeor7Wbm20Xhhu4AQo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342142717"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="342142717"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 22:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="721189923"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="721189923"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 22:50:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qFTVa-000FkT-1S;
 Sat, 01 Jul 2023 05:50:58 +0000
Date: Sat, 1 Jul 2023 13:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: [drm-intel:drm-intel-next 1/2] htmldocs:
 Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive
 type "c:namespace-push".
Message-ID: <202307011340.vny1abul-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Luca Coelho <luciano.coelho@intel.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
head:   0c4f52bac4401dfd6f82984040bc0e163b0ccb9c
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 [1/2] drm/doc: fix duplicate declaration warning
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011340.vny1abul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011340.vny1abul-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +138 Documentation/gpu/rfc/i915_scheduler.rst

   137	
 > 138	.. c:namespace-push:: rfc
   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
