Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B35771BA
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DF4112EB5;
	Sat, 16 Jul 2022 22:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3E3112A57
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658009339; x=1689545339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=52XAcFaSB8b1bTx0ikzypbY9N8Pk47ccAXEKvvRSj+M=;
 b=Sv8tSTHcmuuO5+O19xKElr6TOyzt3uIBoXj3jPOkF7BbKnpj14EJxyLC
 rQgRIwfSRukp3OFRiJRz0Jl2wikbbsYQ5qPCsSPJzkm8ofs7VnznzBvbp
 wuaTfVmwH/JeBiqazt7r55SMDMWu7YZlOumdXsObN+2eDA+L3Xy9vsQp1
 evazlsFLhg14f2WOxwUNhOh7OVKiyLejoILv0Xpr0oL18FAKDsHLoEfPs
 ApYcUGa774OaznU8+EDUN4/V/FJ+V3P3nuV27gKArSgnJWyxJg6sHC7lI
 D/jXqgXGJxyjaNYMrTGKIm6hmSIoPG+DkEH4gIcb2SDjYxusnLOMzu8CN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="269031201"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="269031201"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 15:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="923900407"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2022 15:08:56 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCpy3-0002Dg-OM;
 Sat, 16 Jul 2022 22:08:55 +0000
Date: Sun, 17 Jul 2022 06:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 andrealmeid@igalia.com
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
Message-ID: <202207170521.UXrz8URh-lkp@intel.com>
References: <20220715092253.17529-1-matthieu.charette@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715092253.17529-1-matthieu.charette@gmail.com>
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthieu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc6]
[also build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
base:    32346491ddf24599decca06190ebca03ff9de7f8
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20220717/202207170521.UXrz8URh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e583aaf4f6464add35f2350c728d80a3fe790638
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
        git checkout e583aaf4f6464add35f2350c728d80a3fe790638
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: certs/system_keyring.o: in function `load_system_certificate_list':
   system_keyring.c:(.init.text+0x149): undefined reference to `x509_load_certificate_list'
   ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_init':
>> drm_connector.c:(.text+0x21ce): undefined reference to `drm_cache_edid_firmware'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
