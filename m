Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061087761B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 11:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8410E04B;
	Sun, 10 Mar 2024 10:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TndKQ6y3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535D810E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710067093; x=1741603093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8/J5Jwa+0rLFUZyeqG/2hEgXFAgXb6jr08TRztCGnd4=;
 b=TndKQ6y33QvHqSC2mLlXoJcXDGRKsIToLhxfz1iYp41zF6ooxi4afBQq
 tpKaanRZYtQrZD2OQmFItDDviLjsqFWPZ5n9iPykbKZc1N5YltkR6rnYd
 oV/uPaIIFEAysfqPVL9k/Xa9LMJgoVDl8pAS798N275tCLsA47BCfIGSG
 mYekP3JjXglds3Wsww7O56vJFupEUehaBn0TcUqr6rhss3NG3glvBF2dw
 ZjYqFaweybhQmw6Y0gqg7eUrDbrwqepqoIO2YtNwaCXL78yWFWFZURz/B
 G8szzLV1PGmh/YtKSoei1oN63arMtedTbIZda6McJHcTqHvy7qMSWjNHu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4868398"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4868398"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 03:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="10787715"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2024 03:38:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjGZ9-0008BP-19;
 Sun, 10 Mar 2024 10:38:03 +0000
Date: Sun, 10 Mar 2024 18:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kjetil Oftedal <oftedal@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 14/28] sparc32: Drop unused mmu models
Message-ID: <202403101854.Z94SAU13-lkp@intel.com>
References: <20240309-sunset-v2-14-f09912574d2c@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240309-sunset-v2-14-f09912574d2c@ravnborg.org>
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

Hi Sam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 84b76d05828a1909e20d0f66553b876b801f98c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Ravnborg-via-B4-Relay/sparc32-Update-defconfig-to-LEON-SMP/20240310-021717
base:   84b76d05828a1909e20d0f66553b876b801f98c8
patch link:    https://lore.kernel.org/r/20240309-sunset-v2-14-f09912574d2c%40ravnborg.org
patch subject: [PATCH v2 14/28] sparc32: Drop unused mmu models
config: sparc-randconfig-r113-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101854.Z94SAU13-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240310/202403101854.Z94SAU13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101854.Z94SAU13-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/sparc/mm/srmmu.c:49:5: sparse: sparse: symbol 'vac_line_size' was not declared. Should it be static?

vim +/vac_line_size +49 arch/sparc/mm/srmmu.c

accf032cfa582e Sam Ravnborg   2012-05-19  46  
^1da177e4c3f41 Linus Torvalds 2005-04-16  47  int vac_cache_size;
9d262d95114cf2 Guenter Roeck  2017-04-01  48  EXPORT_SYMBOL(vac_cache_size);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @49  int vac_line_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
