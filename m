Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5315A3D85
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF510EE29;
	Sun, 28 Aug 2022 12:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352910EE29
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661689978; x=1693225978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ue7ZUWR+YEjBmUB+q633OAVUfBnabNRXuEZylx1L4+w=;
 b=keAclzHbxBG45CpUbnUtIOsGm/dbpWWipa8dZiZATE3djmlBbAlHRB4l
 bQgHNwYg0EKjXSrh8NeR16f11TWNxZvl9PlUuKF7pJyRZkXGhd+f8Y561
 6QM6LGKyU+YeVMHxXwOxL80J4glpgmA+wp0uiFKzLQD31eZduC3pt+779
 eq1O60FHB7jJ0w93YBZrWGoz/0KVtJoDgulJLd9Pe5AvzxipjmNmUS0S6
 +XZqSXF6zhGVvIXWd25TaV+ISQzkVWVfhoaEuyC7uTB+pKY2ovawY+BAi
 P9YAAKiaQmRnLSpJw7zXU47g+FOBhSBg/MfQIOP0N6Xx6YBzEmOkI/Pwr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="293480296"
X-IronPort-AV: E=Sophos;i="5.93,270,1654585200"; d="scan'208";a="293480296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2022 05:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,270,1654585200"; d="scan'208";a="753343699"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2022 05:32:55 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oSHTC-00014d-1Q;
 Sun, 28 Aug 2022 12:32:54 +0000
Date: Sun, 28 Aug 2022 20:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Subject: Re: [PATCH v2 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_xrgb2101010()
Message-ID: <202208282022.9682WEre-lkp@intel.com>
References: <20220828090121.13243-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220828090121.13243-3-jose.exposito89@gmail.com>
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
Cc: kbuild-all@lists.01.org, davidgow@google.com, magalilemes00@gmail.com,
 airlied@linux.ie, maira.canal@usp.br, dlatypov@google.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>, geert@linux-m68k.org,
 tzimmermann@suse.de, tales.aparecida@gmail.com,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 61a9fa154d217c13eea90aa5bc635bc4b1fcb66e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/KUnit-tests-for-RGB888-XRGB2101010-and-grayscale/20220828-170347
base:   61a9fa154d217c13eea90aa5bc635bc4b1fcb66e
config: hexagon-randconfig-r014-20220828 (https://download.01.org/0day-ci/archive/20220828/202208282022.9682WEre-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b513d5c5cc6ccf62c7b8d72f431079041ce69d7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jos-Exp-sito/KUnit-tests-for-RGB888-XRGB2101010-and-grayscale/20220828-170347
        git checkout 5b513d5c5cc6ccf62c7b8d72f431079041ce69d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_fb_xrgb8888_to_xrgb2101010" [drivers/gpu/drm/tests/drm_format_helper_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
