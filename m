Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7AF7407FF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 04:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C321E10E33F;
	Wed, 28 Jun 2023 02:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BBE10E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687917636; x=1719453636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kf4OUq5f8e7JmaiUhbLO6qC90pOxyi/ygia+z/UvdLA=;
 b=EXxteSgoq2ECGLhSoUD0S/aaTJd8aNVCEh1VvCfjCFqzlY+eWPaFqaFg
 Okn5c993qTpvya1ioV/X/+LFKHtEjL9uZrKFGu3vlMeEfss8+vGjGsOU6
 di9dls/rNnhSEHzuR16H3tAcYAxH0GbgqeMfreVWz1s9iksSlFlnbubwT
 73gRuiKo1YGLEB7A1oD52D0tPv+g6LgO7xbyMGl6p8bKlpPRoBXvwNiIk
 1GAOuXV/iXpBjYna2Qs4J1rPtyyYCVBP+IaTqS0Qm7lV49ckTtnsxhUAk
 S83H/MBeU2KndrVYfn8kmzA4YnNPQr9mAn2+ezb7x3aXZXZ0sKFfcUp43 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="346489023"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="346489023"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 19:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840895500"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="840895500"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 Jun 2023 19:00:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qEKTu-000CSt-2U;
 Wed, 28 Jun 2023 02:00:30 +0000
Date: Wed, 28 Jun 2023 10:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Shargo <jshargo@chromium.org>, mairacanal@riseup.net,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/6] drm/vkms: Add ConfigFS scaffolding to VKMS
Message-ID: <202306280759.b1BQCTXw-lkp@intel.com>
References: <20230623222353.97283-5-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623222353.97283-5-jshargo@chromium.org>
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next next-20230627]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Shargo/drm-vkms-Back-VKMS-with-DRM-memory-management-instead-of-static-objects/20230624-062659
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230623222353.97283-5-jshargo%40chromium.org
patch subject: [PATCH v2 4/6] drm/vkms: Add ConfigFS scaffolding to VKMS
config: xtensa-randconfig-r052-20230627 (https://download.01.org/0day-ci/archive/20230628/202306280759.b1BQCTXw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280759.b1BQCTXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280759.b1BQCTXw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/vkms_drv.c:266:9-16: WARNING: ERR_CAST can be used with pdev

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
