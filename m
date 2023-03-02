Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9DB6A7A28
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 04:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E96C10E042;
	Thu,  2 Mar 2023 03:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6A510E042
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677729061; x=1709265061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=toBA4mc3ny1aMwi4RV7M4RKtYQeEFpm2ZaTseCjz1HA=;
 b=Un9KSPZYfaN8vZfMoCRi11Qiodhe7yB2HQwOgYVdlhiAOidYQEzJcnYW
 skR67Mb2IAeb1vzHORmpBNYteavc70h3y/rMQ/53ymkQGA05GdQ3X5uVg
 R1yKGc6qWem8n6xwo9Rca+ucCXgxVbJAUJW4Bvxf1HaV9tufG5bU+JReN
 tWCE8z0yxDt1UVelIsDUKTVi1UfQNBGh7Mx6Z69PYe0ssGil6MdD9QWFJ
 jCD6u5hcrA0TlS9WkOaQbkkDWES9Kyjxws6pnHL/KabTjrKsTsH6vb1KE
 Cjl1sl4qnxlpIEHg88JTMn7ClR+qDzCSC6VTtZpymCB1cQ6C/akkx6RKk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399394452"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="399394452"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 19:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707263515"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="707263515"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 01 Mar 2023 19:50:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pXZy6-0000Ab-2O;
 Thu, 02 Mar 2023 03:50:58 +0000
Date: Thu, 2 Mar 2023 11:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 05/16] dma-buf/sync_file: Surface sync-file uABI
Message-ID: <202303021119.RAl7HvmC-lkp@intel.com>
References: <20230228225833.2920879-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228225833.2920879-6-robdclark@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.2 next-20230301]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230301-070358
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230228225833.2920879-6-robdclark%40gmail.com
patch subject: [PATCH v8 05/16] dma-buf/sync_file: Surface sync-file uABI
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/b13821931cc3898065e4264fad78bad23c7d2208
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230301-070358
        git checkout b13821931cc3898065e4264fad78bad23c7d2208
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021119.RAl7HvmC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/sync_file.h:82: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

vim +82 ./include/uapi/linux/sync_file.h

64907b94dab947 drivers/staging/android/uapi/sync.h Colin Cross     2014-02-17  80  
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  81  /**
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26 @82   * Opcodes  0, 1 and 2 were burned during a API change to avoid users of the
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  83   * old API to get weird errors when trying to handling sync_files. The API
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  84   * change happened during the de-stage of the Sync Framework when there was
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  85   * no upstream users available.
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  86   */
2d75c88fefb228 drivers/staging/android/uapi/sync.h Gustavo Padovan 2016-04-26  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
