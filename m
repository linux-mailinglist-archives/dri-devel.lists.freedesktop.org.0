Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7614231A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 07:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A366E58B;
	Mon, 20 Jan 2020 06:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BA6E58B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 06:15:24 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 22:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; 
 d="gz'50?scan'50,208,50";a="274930193"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2020 22:15:22 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1itQLJ-000J1z-QZ; Mon, 20 Jan 2020 14:15:21 +0800
Date: Mon, 20 Jan 2020 14:15:07 +0800
From: kbuild test robot <lkp@intel.com>
To: yu kuai <yukuai3@huawei.com>
Subject: Re: [PATCH] video: remove set but not used variable 'mach64RefFreq'
Message-ID: <202001201425.ttqGO8xJ%lkp@intel.com>
References: <20200119122038.13425-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="khj4ag6tr5sttfa3"
Content-Disposition: inline
In-Reply-To: <20200119122038.13425-1-yukuai3@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 b.zolnierkie@samsung.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com, yukuai3@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--khj4ag6tr5sttfa3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[also build test ERROR on linux/master linus/master v5.5-rc7 next-20200117]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/yu-kuai/video-remove-set-but-not-used-variable-mach64RefFreq/20200119-203016
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: x86_64-randconfig-s1-20200120 (attached as .config)
compiler: gcc-6 (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/video/fbdev/aty/mach64_gx.c: In function 'aty_var_to_pll_8398':
   drivers/video/fbdev/aty/mach64_gx.c:625:2: error: 'mach64MinFreq' undeclared (first use in this function)
     mach64MinFreq = MIN_FREQ_2595;
     ^~~~~~~~~~~~~
   drivers/video/fbdev/aty/mach64_gx.c:625:2: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/video/fbdev/aty/mach64_gx.c:626:2: error: 'mach64MaxFreq' undeclared (first use in this function)
     mach64MaxFreq = MAX_FREQ_2595;
     ^~~~~~~~~~~~~

vim +/mach64MaxFreq +626 drivers/video/fbdev/aty/mach64_gx.c

^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  607  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  608  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  609      /*
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  610       *  Chrontel 8398 Clock Chip
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  611       */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  612  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  613  static int aty_var_to_pll_8398(const struct fb_info *info, u32 vclk_per,
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  614  			       u32 bpp, union aty_pll *pll)
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  615  {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  616  	u32 tempA, tempB, fOut, longMHz100, diff, preDiff;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  617  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  618  	u32 mhz100;		/* in 0.01 MHz */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  619  	u32 program_bits;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  620  	/* u32 post_divider; */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  621  	u16 m, n, k = 0, save_m, save_n, twoToKth;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  622  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  623  	/* Calculate the programming word */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  624  	mhz100 = 100000000 / vclk_per;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  625  	mach64MinFreq = MIN_FREQ_2595;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16 @626  	mach64MaxFreq = MAX_FREQ_2595;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  627  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  628  	save_m = 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  629  	save_n = 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  630  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  631  	/* Calculate program word */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  632  	if (mhz100 == 0)
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  633  		program_bits = 0xE0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  634  	else {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  635  		if (mhz100 < mach64MinFreq)
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  636  			mhz100 = mach64MinFreq;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  637  		if (mhz100 > mach64MaxFreq)
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  638  			mhz100 = mach64MaxFreq;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  639  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  640  		longMHz100 = mhz100 * 256 / 100;	/* 8 bit scale this */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  641  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  642  		while (mhz100 < (mach64MinFreq << 3)) {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  643  			mhz100 <<= 1;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  644  			k++;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  645  		}
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  646  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  647  		twoToKth = 1 << k;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  648  		diff = 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  649  		preDiff = 0xFFFFFFFF;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  650  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  651  		for (m = MIN_M; m <= MAX_M; m++) {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  652  			for (n = MIN_N; n <= MAX_N; n++) {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  653  				tempA = 938356;		/* 14.31818 * 65536 */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  654  				tempA *= (n + 8);	/* 43..256 */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  655  				tempB = twoToKth * 256;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  656  				tempB *= (m + 2);	/* 4..32 */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  657  				fOut = tempA / tempB;	/* 8 bit scale */
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  658  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  659  				if (longMHz100 > fOut)
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  660  					diff = longMHz100 - fOut;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  661  				else
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  662  					diff = fOut - longMHz100;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  663  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  664  				if (diff < preDiff) {
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  665  					save_m = m;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  666  					save_n = n;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  667  					preDiff = diff;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  668  				}
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  669  			}
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  670  		}
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  671  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  672  		program_bits = (k << 6) + (save_m) + (save_n << 8);
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  673  	}
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  674  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  675  	pll->ics2595.program_bits = program_bits;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  676  	pll->ics2595.locationAddr = 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  677  	pll->ics2595.post_divider = 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  678  	pll->ics2595.period_in_ps = vclk_per;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  679  
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  680  	return 0;
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  681  }
^1da177e4c3f41 drivers/video/aty/mach64_gx.c Linus Torvalds 2005-04-16  682  

:::::: The code at line 626 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--khj4ag6tr5sttfa3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
xf8Dq7dQ8vI/AgA=

--khj4ag6tr5sttfa3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--khj4ag6tr5sttfa3--
