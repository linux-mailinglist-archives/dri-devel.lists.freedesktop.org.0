Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0549DB3A9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 09:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCFA10E30A;
	Thu, 28 Nov 2024 08:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UG5rAmnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C827B10E30A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732782131; x=1764318131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NuOehCl11U9UMXWKQDabPjToPUoRIYznpGN/GDMhyPc=;
 b=UG5rAmntemm/BbJATMO/FSitKtEiI/HZQtLmruTntXVvuzZOt5MiXVIZ
 B+xhxZoOlaPZvBgDx8dXgqdLgFaJpK/ai0XMlDlv9Tacb3zBK7WdxMGkF
 ksVRBSNgJsnicyLl+Z3swMfRPO30aUkjyoIPi0KxUoC96C8/EB8R7uuMJ
 knIQcuE57srFTBHJtVT5VkT91nvsiobXKq4EMvuqwe09mg+0fs72r+s1b
 JwS93nJS5QebTB+zxB0Hj4iil3QpPpnGBThxl/0Hrdsay1r8d9nzYGqz1
 PAa7Q4DAjS9SYYxAxEmE3gEzOJKVj4LTSlJITfiKi6WFUi3ImDYzg2LGX g==;
X-CSE-ConnectionGUID: fEpZMdoATBieJqqz0TfsrQ==
X-CSE-MsgGUID: SWpKpPgITmKq9cjj4WoPlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32941178"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32941178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 00:22:10 -0800
X-CSE-ConnectionGUID: b59iKsT/RqW+n7PXf0etHA==
X-CSE-MsgGUID: 24j4zudxT/WPcl+yM2RC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="97261007"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 00:22:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tGZmo-0009L1-27;
 Thu, 28 Nov 2024 08:22:06 +0000
Date: Thu, 28 Nov 2024 16:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
Message-ID: <202411281615.esoi7OGQ-lkp@intel.com>
References: <20241127095308.3149411-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127095308.3149411-1-jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master sailus-media-tree/streams sailus-media-tree/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/media-cec-include-linux-debugfs-h-and-linux-seq_file-h-where-needed/20241128-120741
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20241127095308.3149411-1-jani.nikula%40intel.com
patch subject: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h where needed
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411281615.esoi7OGQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281615.esoi7OGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281615.esoi7OGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/cec/core/cec-pin-error-inj.c: In function 'cec_pin_show_cmd':
>> drivers/media/cec/core/cec-pin-error-inj.c:243:17: error: implicit declaration of function 'seq_puts' [-Wimplicit-function-declaration]
     243 |                 seq_puts(sf, "any,");
         |                 ^~~~~~~~
>> drivers/media/cec/core/cec-pin-error-inj.c:245:17: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Wimplicit-function-declaration]
     245 |                 seq_printf(sf, "0x%02x,", cmd);
         |                 ^~~~~~~~~~
         |                 bstr_printf


vim +/seq_puts +243 drivers/media/cec/core/cec-pin-error-inj.c

22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  239  
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  240  static void cec_pin_show_cmd(struct seq_file *sf, u32 cmd, u8 mode)
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  241  {
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  242  	if (cmd == CEC_ERROR_INJ_OP_ANY)
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31 @243  		seq_puts(sf, "any,");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  244  	else
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31 @245  		seq_printf(sf, "0x%02x,", cmd);
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  246  	switch (mode) {
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  247  	case CEC_ERROR_INJ_MODE_ONCE:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  248  		seq_puts(sf, "once ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  249  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  250  	case CEC_ERROR_INJ_MODE_ALWAYS:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  251  		seq_puts(sf, "always ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  252  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  253  	case CEC_ERROR_INJ_MODE_TOGGLE:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  254  		seq_puts(sf, "toggle ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  255  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  256  	default:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  257  		seq_puts(sf, "off ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  258  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  259  	}
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  260  }
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
