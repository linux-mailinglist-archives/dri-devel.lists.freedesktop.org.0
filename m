Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F022A5EFF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 08:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9026E957;
	Wed,  4 Nov 2020 07:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793BB6E957
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 07:55:58 +0000 (UTC)
IronPort-SDR: 5IBbipjh34sfxLH4EYrccUrEC37K8ZzF2tfdjvAbqvAF6ZeoStZipwYGWS3kRGbd68bJDbJcsi
 AJHvs+CAhz1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="169321091"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; 
 d="gz'50?scan'50,208,50";a="169321091"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 23:55:56 -0800
IronPort-SDR: x0HTAxvJVuVTzV9NiugV+uKRB27INs9tjFQpCALVBxA34SmyfqB1taOE0KCD4TC/X+buDZq5ba
 YxLfW6pzhnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; 
 d="gz'50?scan'50,208,50";a="320715993"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 03 Nov 2020 23:55:54 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kaDe5-0000l8-DC; Wed, 04 Nov 2020 07:55:53 +0000
Date: Wed, 4 Nov 2020 15:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 7/7] drm/kmb: Build files for KeemBay Display driver
Message-ID: <202011041514.kCV8EWHA-lkp@intel.com>
References: <1604445978-14924-8-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <1604445978-14924-8-git-send-email-anitha.chrisanthus@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: clang-built-linux@googlegroups.com, edmund.j.dea@intel.com,
 kbuild-all@lists.01.org, sam@ravnborg.org, narmstrong@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anitha,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.10-rc2 next-20201103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Anitha-Chrisanthus/Add-support-for-KeemBay-DRM-driver/20201104-072844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm-randconfig-r023-20201104 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a6d15d40701ad38f29e4ff93703b3ffa7b204611)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/060e5099db380b6f351791e410a9d6d89c2ffeab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Anitha-Chrisanthus/Add-support-for-KeemBay-DRM-driver/20201104-072844
        git checkout 060e5099db380b6f351791e410a9d6d89c2ffeab
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/kmb/kmb_drv.c:28:5: warning: no previous prototype for function 'kmb_display_clk_enable' [-Wmissing-prototypes]
   int kmb_display_clk_enable(struct kmb_drm_private *kmb)
       ^
   drivers/gpu/drm/kmb/kmb_drv.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kmb_display_clk_enable(struct kmb_drm_private *kmb)
   ^
   static 
>> drivers/gpu/drm/kmb/kmb_drv.c:41:5: warning: no previous prototype for function 'kmb_initialize_clocks' [-Wmissing-prototypes]
   int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device *dev)
       ^
   drivers/gpu/drm/kmb/kmb_drv.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device *dev)
   ^
   static 
   2 warnings generated.
--
>> drivers/gpu/drm/kmb/kmb_plane.c:103:14: warning: no previous prototype for function 'get_pixel_format' [-Wmissing-prototypes]
   unsigned int get_pixel_format(u32 format)
                ^
   drivers/gpu/drm/kmb/kmb_plane.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int get_pixel_format(u32 format)
   ^
   static 
>> drivers/gpu/drm/kmb/kmb_plane.c:193:14: warning: no previous prototype for function 'get_bits_per_pixel' [-Wmissing-prototypes]
   unsigned int get_bits_per_pixel(const struct drm_format_info *format)
                ^
   drivers/gpu/drm/kmb/kmb_plane.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int get_bits_per_pixel(const struct drm_format_info *format)
   ^
   static 
   2 warnings generated.

vim +/kmb_display_clk_enable +28 drivers/gpu/drm/kmb/kmb_drv.c

ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  27  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03 @28  int kmb_display_clk_enable(struct kmb_drm_private *kmb)
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  29  {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  30  	int ret = 0;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  31  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  32  	ret = clk_prepare_enable(kmb->kmb_clk.clk_lcd);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  33  	if (ret) {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  34  		drm_err(&kmb->drm, "Failed to enable LCD clock: %d\n", ret);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  35  		return ret;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  36  	}
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  37  	DRM_INFO("SUCCESS : enabled LCD clocks\n");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  38  	return 0;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  39  }
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  40  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03 @41  int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device *dev)
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  42  {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  43  	int ret = 0;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  44  	struct regmap *msscam;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  45  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  46  	kmb->kmb_clk.clk_lcd = devm_clk_get(dev, "clk_lcd");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  47  	if (IS_ERR(kmb->kmb_clk.clk_lcd)) {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  48  		drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  49  		return PTR_ERR(kmb->kmb_clk.clk_lcd);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  50  	}
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  51  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  52  	kmb->kmb_clk.clk_pll0 = devm_clk_get(dev, "clk_pll0");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  53  	if (IS_ERR(kmb->kmb_clk.clk_pll0)) {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  54  		drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  55  		return PTR_ERR(kmb->kmb_clk.clk_pll0);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  56  	}
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  57  	kmb->sys_clk_mhz = clk_get_rate(kmb->kmb_clk.clk_pll0) / 1000000;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  58  	drm_info(&kmb->drm, "system clk = %d Mhz", kmb->sys_clk_mhz);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  59  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  60  	ret =  kmb_dsi_clk_init(kmb->kmb_dsi);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  61  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  62  	/* Set LCD clock to 200 Mhz */
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  63  	clk_set_rate(kmb->kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  64  	if (clk_get_rate(kmb->kmb_clk.clk_lcd) != KMB_LCD_DEFAULT_CLK) {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  65  		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  66  			KMB_LCD_DEFAULT_CLK);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  67  		return -1;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  68  	}
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  69  	drm_dbg(&kmb->drm, "clk_lcd = %ld\n", clk_get_rate(kmb->kmb_clk.clk_lcd));
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  70  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  71  	ret = kmb_display_clk_enable(kmb);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  72  	if (ret)
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  73  		return ret;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  74  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  75  	msscam = syscon_regmap_lookup_by_compatible("intel,keembay-msscam");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  76  	if (IS_ERR(msscam)) {
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  77  		drm_err(&kmb->drm, "failed to get msscam syscon");
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  78  		return -1;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  79  	}
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  80  
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  81  	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  82  	regmap_update_bits(msscam, MSS_CAM_CLK_CTRL, 0x1fff, 0x1fff);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  83  	regmap_update_bits(msscam, MSS_CAM_RSTN_CTRL, 0xffffffff, 0xffffffff);
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  84  	return 0;
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  85  }
ef228657da9c1a3 Anitha Chrisanthus 2020-11-03  86  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ZPt4rx8FFjLCG7dd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
LAHwiJ107qh141yflcfj/wdApeHB+qMBAA==

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ZPt4rx8FFjLCG7dd--
