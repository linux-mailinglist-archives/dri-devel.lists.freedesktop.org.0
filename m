Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D517B68AB08
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 17:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E5C10E220;
	Sat,  4 Feb 2023 16:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E110E20F;
 Sat,  4 Feb 2023 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675526817; x=1707062817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DJc0Kv1Vbl707vvGKV9anSubFAjspXEBh2+TkxEX7wI=;
 b=RQNYx0GBsN23+7u/0k0p4mOP9E/KeZbBSqEkfrIPzmcdhYl7DlU5Tkm6
 y3MdemxQk58DvzNmssHyEmOBDlvpkBigM4nGX9JnVz0emczkhkUx+P0tb
 ON5xaKjrTPHhpXg1yz7RRLCilijfTxB4VBvkgpwN8oysQTLFbKU5kn+LA
 X1uASf3y22WXUbburEuJ70UGIZ0+MnkZgdaoebQg/pxgErw8VbUs0yeML
 tIbmDeZdrVRNW4eKQcOrJUuYzprrPaWgUI9kvjor2Edr8ku+8G7oaV9xL
 W3qXqv6eUQKxcwuOrlLnn8khpX+52SxwYP/cJ6MmXybqQr0DsT8se+slt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415170760"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="415170760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2023 08:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="696437839"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="696437839"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 08:06:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pOL3w-0001Pq-2F;
 Sat, 04 Feb 2023 16:06:48 +0000
Date: Sun, 5 Feb 2023 00:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <202302042311.2hOSoYKi-lkp@intel.com>
References: <20230203020744.30745-3-joshua@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203020744.30745-3-joshua@froggi.es>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, oe-kbuild-all@lists.linux.dev,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joshua,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230203020744.30745-3-joshua%40froggi.es
patch subject: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in drm_colorspace enum
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/14174503e23d2174ba6089fb4090778513cd202b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joshua-Ashton/drm-connector-Add-enum-documentation-to-drm_colorspace/20230203-100927
        git checkout 14174503e23d2174ba6089fb4090778513cd202b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-kms:417: ./include/drm/drm_connector.h:479: WARNING: Definition list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
