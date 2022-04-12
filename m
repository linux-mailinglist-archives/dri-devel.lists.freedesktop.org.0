Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366824FD409
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E6F10E086;
	Tue, 12 Apr 2022 10:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297410E086
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649757654; x=1681293654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7tP6Hmh57tdYk/XI1EXwttwZcLinGHP54ZjZICaf18M=;
 b=IP4f0St3HE7L2DS7hFIdTuebHeYZiuc6JfnnlMxXwmubZqUHOtNVKNWM
 artZ7LqNw8WFU6JHXkn9iPI21FPpOyJXAjtRe/1HzZ4V82CahukFxbE9Z
 u2Ci12dNKjgV2/jRdCcLUncWxxVOMdtAWVRtHQ2ABbP8AhcBGPQ8r8H0f
 Ebqd6OBAUyqPnHPlOMIPGxtTmMRJlOwdnUlIy5/6eRGJZSG/+GUv5knlm
 tmpQTePvY/bRyGMaXbQq2znJUit+L2B4LPZ2Z2F/LtKaRPKj8vBfvedKJ
 RwW93wHjbh9Tb877TyjkJHT6aARn5Jh61+A76TiQFesSoLtcDEwff36T+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249619635"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="249619635"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 03:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="525976363"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 03:00:47 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neDKJ-0002jQ-1f;
 Tue, 12 Apr 2022 10:00:47 +0000
Date: Tue, 12 Apr 2022 18:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 04/10] drm/sun4i: Allow building the driver on RISC-V
Message-ID: <202204121758.QeUxJKUh-lkp@intel.com>
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
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

I love your patch! Yet something to improve:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on drm/drm-next linus/master v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/drm-sun4i-Allwinner-D1-Display-Engine-2-0-Support/20220411-123701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220412/202204121758.QeUxJKUh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/829dac8ee2cbb6d1b7bda1c513cc2ad1939fca53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Samuel-Holland/drm-sun4i-Allwinner-D1-Display-Engine-2-0-Support/20220411-123701
        git checkout 829dac8ee2cbb6d1b7bda1c513cc2ad1939fca53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:59:3: error: implicit declaration of function 'readsb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   readsb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
                   ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:59:3: note: did you mean 'readb'?
   arch/hexagon/include/asm/io.h:83:18: note: 'readb' declared here
   static inline u8 readb(const volatile void __iomem *addr)
                    ^
>> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:61:3: error: implicit declaration of function 'writesb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   writesb(hdmi->base + hdmi->variant->ddc_fifo_reg, buf, len);
                   ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:61:3: note: did you mean 'writeb'?
   arch/hexagon/include/asm/io.h:122:20: note: 'writeb' declared here
   static inline void writeb(u8 data, volatile void __iomem *addr)
                      ^
   2 errors generated.


vim +/readsb +59 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c

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
