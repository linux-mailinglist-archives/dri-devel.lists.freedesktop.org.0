Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55A8C9265
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 23:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BF010E153;
	Sat, 18 May 2024 21:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErmkiMBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5710E153
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716067206; x=1747603206;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=rBj9cZeUYAoUD9odKeNyy82c0utbn05HIdZeMtOw4ac=;
 b=ErmkiMBguMsoQ3RsuzOoCTqQpm3+iu/2B34QLt62eNaa4Ap9B8nDFycP
 IC/1yURPzNg62YLqVn6SJwKjZv66CT6xx9g9beUJJwKp1n7PBgzlIN3Kl
 Fr5aDwdiJ9+bq+gME3YNbwaFiEEiZZms22zL92Y/BXWoQSky5/UzERzsT
 5fdfjAJMeOYPZFDKpjBDxvOhHavQK8JKvwL6oQST9l97yWkWBHKn+Yp1p
 2KdMYogBFfNOduQNfw97JrE0Fzo6v7j3akImnSNdVDLmXuA3LCcqZBkcm
 QdF4c3j161+BpbtploPVjtZ8XCofS2YVwt70Ee6gM1Z/44gVYuyGiEfBR g==;
X-CSE-ConnectionGUID: RVA1m/SQS8+O0uOQjOEBLg==
X-CSE-MsgGUID: 1wyl4AllRDCFas41k/cYdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12080870"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; d="scan'208";a="12080870"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2024 14:20:05 -0700
X-CSE-ConnectionGUID: ckjP751USHuvYbCxa9p+SA==
X-CSE-MsgGUID: 5f6Dyo4sRUOfPQ1G6nGfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; d="scan'208";a="32119398"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 18 May 2024 14:20:02 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s8RTE-0002d0-0r;
 Sat, 18 May 2024 21:20:00 +0000
Date: Sun, 19 May 2024 05:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [drm-misc:drm-misc-next 10/10] drivers/gpu/drm/stm/ltdc.c:494:35:
 error: unused function 'encoder_to_ltdc'
Message-ID: <202405190539.epnOVnMx-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   85cb9d603953d77de5cb311d229a79c439ff6bfb
commit: 6597efcfc53585d5fb177b901a41b4ac2f282b99 [10/10] drm/stm: Allow build with COMPILE_TEST=y
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240519/202405190539.epnOVnMx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190539.epnOVnMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190539.epnOVnMx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/stm/ltdc.c:494:35: error: unused function 'encoder_to_ltdc' [-Werror,-Wunused-function]
     494 | static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
         |                                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +/encoder_to_ltdc +494 drivers/gpu/drm/stm/ltdc.c

b759012c5fa761 Yannick Fertre 2017-04-14  493  
b759012c5fa761 Yannick Fertre 2017-04-14 @494  static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
b759012c5fa761 Yannick Fertre 2017-04-14  495  {
b759012c5fa761 Yannick Fertre 2017-04-14  496  	return (struct ltdc_device *)enc->dev->dev_private;
b759012c5fa761 Yannick Fertre 2017-04-14  497  }
b759012c5fa761 Yannick Fertre 2017-04-14  498  

:::::: The code at line 494 was first introduced by commit
:::::: b759012c5fa761ee08998c80fc4ad6343c258487 drm/stm: Add STM32 LTDC driver

:::::: TO: Yannick Fertre <yannick.fertre@st.com>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
