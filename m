Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE4590B80
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 07:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851758AF84;
	Fri, 12 Aug 2022 05:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B34A6BBE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 05:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660282057; x=1691818057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aD66a3tlUSHNk9f+LMWfIXawj2d8pgOYlU8yPhvZhyU=;
 b=iXz5xrSVk4iOPeRa9kHKFYFN1ye9CqgS6mcMHGuD8M8BFVjUXBnH3LQU
 kSZJS9IMrBouZ26SbJAQjcWHDplQvApVy1AUnthSYOY5IiEZ/d29eTyK0
 15InJ1qEKKPDG3bM44lr+OC6o77OOUVmw0PW5p/7elIkQwxRC/2icslgB
 NUyn0lY9Om51+VzDIr0gUNWpW7tMFxwDr8crt4bSui/53InyO1w+E+u3g
 j8wWnY7OleZo+use5f8U6aX1acboX5GxgHYCQEqTclTeoAwhbkwKCBrvh
 lP9RPjYU5T2+h7Mu3y/KTHRILVDnsmRQmtzPRuhOn4fNb2nfAN/H2N5LB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="377817076"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="377817076"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 22:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="556407140"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 11 Aug 2022 22:27:33 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oMNCm-0000CU-2a;
 Fri, 12 Aug 2022 05:27:32 +0000
Date: Fri, 12 Aug 2022 13:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Masse <olivier.masse@nxp.com>, jens.wiklander@linaro.org,
 sumit.garg@linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, op-tee@lists.trustedfirmware.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf
 file descriptor
Message-ID: <202208121326.FWVAzlch-lkp@intel.com>
References: <20220811135637.6332-2-olivier.masse@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811135637.6332-2-olivier.masse@nxp.com>
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
Cc: clement.faure@nxp.com, kbuild-all@lists.01.org, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olivier,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v5.19 next-20220811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Masse/tee-Add-tee_shm_register_fd/20220811-220012
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220812/202208121326.FWVAzlch-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2e8827973f200fdfe64366bec5a57686086f4672
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Olivier-Masse/tee-Add-tee_shm_register_fd/20220811-220012
        git checkout 2e8827973f200fdfe64366bec5a57686086f4672
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/tee.h:136:13: error: expected declaration specifiers or '...' before numeric constant
     136 | } __aligned(8);
         |             ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
