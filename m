Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F04FC692
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974410F78F;
	Mon, 11 Apr 2022 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A1C10F78F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649711759; x=1681247759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5x2VQ9HU/v0yZ3qoFFue9KWN+qZAjMg8ZLZUP+AvOiA=;
 b=AxyJ+li+3alQx3RWpTgCsRdH8B8tGfQCn4HfsNE1YGMKWPuiuD8/rhGG
 TqcvaKdN7EKSpeqY4xAY1Xbprx8tGgsQ/LKIIEW1LpFkPrFBFrCxUXmGK
 eWfvzee/sCkldH12Mwqm5hsAVmXXobImZG4Z98h3stCK4mwj6Fmo51NfS
 7fNBpCRK1VBuyv2yZzJ+4INcFFnRBX9MpLbRU8hlhohW8NYizY5iFqMaj
 pZJe+KtPdDft67eZ3ZD9bqx4o89h/PgGF5zSfBgQZqp/gz0sUBeHD+viE
 TX342d2CAFduCVoiToXYR1ectXbECo9h37FI4DmRENB7cUbbY5q9jvbMD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="325129706"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="325129706"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 14:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="854082902"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2022 14:15:54 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ne1O5-0002DR-Th;
 Mon, 11 Apr 2022 21:15:53 +0000
Date: Tue, 12 Apr 2022 05:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 04/10] drm/sun4i: Allow building the driver on RISC-V
Message-ID: <202204120528.TRFC7Ywj-lkp@intel.com>
References: <20220411043423.37333-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411043423.37333-5-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

I love your patch! Yet something to improve:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on drm/drm-next linus/master v5.18-rc2 next-20220411]
[cannot apply to mripard/sunxi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/drm-sun4i-Allwinner-D1-Display-Engine-2-0-Support/20220411-123701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220412/202204120528.TRFC7Ywj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/829dac8ee2cbb6d1b7bda1c513cc2ad1939fca53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Samuel-Holland/drm-sun4i-Allwinner-D1-Display-Engine-2-0-Support/20220411-123701
        git checkout 829dac8ee2cbb6d1b7bda1c513cc2ad1939fca53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: In function 'fifo_transfer':
>> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:59:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      59 |                 readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
         |                 ^~~~~~
         |                 readb
>> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:61:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
      61 |                 writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
         |                 ^~~~~~~
         |                 writeb
   cc1: some warnings being treated as errors


vim +59 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c

f0a3dd33ba685b Jonathan Liu 2017-07-02  24  
f0a3dd33ba685b Jonathan Liu 2017-07-02  25  static int fifo_transfer(struct sun4i_hdmi *hdmi, u8 *buf, int len, bool read)
f0a3dd33ba685b Jonathan Liu 2017-07-02  26  {
f0a3dd33ba685b Jonathan Liu 2017-07-02  27  	/*
f0a3dd33ba685b Jonathan Liu 2017-07-02  28  	 * 1 byte takes 9 clock cycles (8 bits + 1 ACK) = 90 us for 100 kHz
f0a3dd33ba685b Jonathan Liu 2017-07-02  29  	 * clock. As clock rate is fixed, just round it up to 100 us.
f0a3dd33ba685b Jonathan Liu 2017-07-02  30  	 */
f0a3dd33ba685b Jonathan Liu 2017-07-02  31  	const unsigned long byte_time_ns = 100;
f0a3dd33ba685b Jonathan Liu 2017-07-02  32  	const u32 mask = SUN4I_HDMI_DDC_INT_STATUS_ERROR_MASK |
f0a3dd33ba685b Jonathan Liu 2017-07-02  33  			 SUN4I_HDMI_DDC_INT_STATUS_FIFO_REQUEST |
f0a3dd33ba685b Jonathan Liu 2017-07-02  34  			 SUN4I_HDMI_DDC_INT_STATUS_TRANSFER_COMPLETE;
f0a3dd33ba685b Jonathan Liu 2017-07-02  35  	u32 reg;
939d749ad6649c Chen-Yu Tsai 2017-10-10  36  	/*
939d749ad6649c Chen-Yu Tsai 2017-10-10  37  	 * If threshold is inclusive, then the FIFO may only have
939d749ad6649c Chen-Yu Tsai 2017-10-10  38  	 * RX_THRESHOLD number of bytes, instead of RX_THRESHOLD + 1.
939d749ad6649c Chen-Yu Tsai 2017-10-10  39  	 */
939d749ad6649c Chen-Yu Tsai 2017-10-10  40  	int read_len = RX_THRESHOLD +
939d749ad6649c Chen-Yu Tsai 2017-10-10  41  		(hdmi->variant->ddc_fifo_thres_incl ? 0 : 1);
f0a3dd33ba685b Jonathan Liu 2017-07-02  42  
939d749ad6649c Chen-Yu Tsai 2017-10-10  43  	/*
939d749ad6649c Chen-Yu Tsai 2017-10-10  44  	 * Limit transfer length by FIFO threshold or FIFO size.
939d749ad6649c Chen-Yu Tsai 2017-10-10  45  	 * For TX the threshold is for an empty FIFO.
939d749ad6649c Chen-Yu Tsai 2017-10-10  46  	 */
939d749ad6649c Chen-Yu Tsai 2017-10-10  47  	len = min_t(int, len, read ? read_len : SUN4I_HDMI_DDC_FIFO_SIZE);
f0a3dd33ba685b Jonathan Liu 2017-07-02  48  
f0a3dd33ba685b Jonathan Liu 2017-07-02  49  	/* Wait until error, FIFO request bit set or transfer complete */
939d749ad6649c Chen-Yu Tsai 2017-10-10  50  	if (regmap_field_read_poll_timeout(hdmi->field_ddc_int_status, reg,
939d749ad6649c Chen-Yu Tsai 2017-10-10  51  					   reg & mask, len * byte_time_ns,
939d749ad6649c Chen-Yu Tsai 2017-10-10  52  					   100000))
f0a3dd33ba685b Jonathan Liu 2017-07-02  53  		return -ETIMEDOUT;
f0a3dd33ba685b Jonathan Liu 2017-07-02  54  
f0a3dd33ba685b Jonathan Liu 2017-07-02  55  	if (reg & SUN4I_HDMI_DDC_INT_STATUS_ERROR_MASK)
f0a3dd33ba685b Jonathan Liu 2017-07-02  56  		return -EIO;
f0a3dd33ba685b Jonathan Liu 2017-07-02  57  
f0a3dd33ba685b Jonathan Liu 2017-07-02  58  	if (read)
939d749ad6649c Chen-Yu Tsai 2017-10-10 @59  		readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
f0a3dd33ba685b Jonathan Liu 2017-07-02  60  	else
939d749ad6649c Chen-Yu Tsai 2017-10-10 @61  		writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
f0a3dd33ba685b Jonathan Liu 2017-07-02  62  
939d749ad6649c Chen-Yu Tsai 2017-10-10  63  	/* Clear FIFO request bit by forcing a write to that bit */
939d749ad6649c Chen-Yu Tsai 2017-10-10  64  	regmap_field_force_write(hdmi->field_ddc_int_status,
939d749ad6649c Chen-Yu Tsai 2017-10-10  65  				 SUN4I_HDMI_DDC_INT_STATUS_FIFO_REQUEST);
f0a3dd33ba685b Jonathan Liu 2017-07-02  66  
f0a3dd33ba685b Jonathan Liu 2017-07-02  67  	return len;
f0a3dd33ba685b Jonathan Liu 2017-07-02  68  }
f0a3dd33ba685b Jonathan Liu 2017-07-02  69  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
