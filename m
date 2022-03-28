Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB94E9083
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E945E10E637;
	Mon, 28 Mar 2022 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A71010E637
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648457513; x=1679993513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uko3a2nCSk6e9cWZGc5GPkvEJFBNVpTbn9hSqYN7JjU=;
 b=OKHvi0Vd64USGlVXAeDJWp6VaMxnMYvnWiiMfFtxXTfupNrb7L5FxlrN
 I4BZK5bmlbDVnZRjtSsJLDF1VJHHrz6wxqLJ605jV8MfiGTfAy56R2+yF
 Rx+NB3LDCUw8LK8SyPseLYHtGy2mB7potG6IzjggOZAFmbMa9Ja7cToVM
 k5ayjhc9LmjGg6Sdm9iPbB/GxxoBCnCdeLqQnmyy/OjTRA5JWoR6TxA4b
 sOzEcBt+kHtOB8br72zFyNK0W4fWlbGSReAjeRv2O1XuTKL1bB9i14qo1
 tdByGCCJKTC+cE4gK3QfIk9Mi0YzCBmIG2juTzR7JDwImAHIx55tq94gK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="322135217"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="322135217"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 01:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="719029861"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 28 Mar 2022 01:51:42 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nYl6D-0001tN-AK; Mon, 28 Mar 2022 08:51:41 +0000
Date: Mon, 28 Mar 2022 16:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <error27@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v13 5/6] drm/loongson: add drm driver for loongson
 display controller
Message-ID: <202203281653.wiRaycuD-lkp@intel.com>
References: <20220328022835.2508587-5-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328022835.2508587-5-15330273260@189.cn>
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
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next linus/master v5.17 next-20220328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MIPS-Loongson64-dts-update-the-display-controller-device-node/20220328-103101
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: microblaze-randconfig-s032-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281653.wiRaycuD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/836c0ab646f65b0a8c6574b5d2495c8617e96545
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/MIPS-Loongson64-dts-update-the-display-controller-device-node/20220328-103101
        git checkout 836c0ab646f65b0a8c6574b5d2495c8617e96545
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_i2c.c:179:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dir_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:179:23: sparse:     expected void [noderef] __iomem *dir_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:179:23: sparse:     got void *
>> drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dat_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse:     expected void [noderef] __iomem *dat_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:180:23: sparse:     got void *
   drivers/gpu/drm/loongson/lsdc_i2c.c:252:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dir_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:252:23: sparse:     expected void [noderef] __iomem *dir_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:252:23: sparse:     got void *
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dat_reg @@     got void * @@
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse:     expected void [noderef] __iomem *dat_reg
   drivers/gpu/drm/loongson/lsdc_i2c.c:253:23: sparse:     got void *
--
>> drivers/gpu/drm/loongson/lsdc_pci_drv.c:185:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/gpu/drm/loongson/lsdc_pci_drv.c:185:61: sparse:     expected void *reg_base
   drivers/gpu/drm/loongson/lsdc_pci_drv.c:185:61: sparse:     got void [noderef] __iomem *reg_base
--
>> drivers/gpu/drm/loongson/lsdc_output.c:232:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/gpu/drm/loongson/lsdc_output.c:232:63: sparse:     expected void *reg_base
   drivers/gpu/drm/loongson/lsdc_output.c:232:63: sparse:     got void [noderef] __iomem *reg_base

vim +179 drivers/gpu/drm/loongson/lsdc_i2c.c

   129	
   130	struct lsdc_i2c *lsdc_of_create_i2c_adapter(struct device *parent,
   131						    void *reg_base,
   132						    struct device_node *i2c_np)
   133	{
   134		unsigned int udelay = 5;
   135		unsigned int timeout = 2200;
   136		int nr = -1;
   137		struct i2c_adapter *adapter;
   138		struct lsdc_i2c *li2c;
   139		u32 sda, scl;
   140		int ret;
   141	
   142		li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
   143		if (!li2c)
   144			return ERR_PTR(-ENOMEM);
   145	
   146		spin_lock_init(&li2c->reglock);
   147	
   148		ret = of_property_read_u32(i2c_np, "loongson,sda", &sda);
   149		if (ret) {
   150			dev_err(parent, "No sda pin number provided\n");
   151			return ERR_PTR(ret);
   152		}
   153	
   154		ret = of_property_read_u32(i2c_np, "loongson,scl", &scl);
   155		if (ret) {
   156			dev_err(parent, "No scl pin number provided\n");
   157			return ERR_PTR(ret);
   158		}
   159	
   160		ret = of_property_read_u32(i2c_np, "loongson,nr", &nr);
   161		if (ret) {
   162			int id;
   163	
   164			if (ret == -EINVAL)
   165				dev_dbg(parent, "no nr provided\n");
   166	
   167			id = of_alias_get_id(i2c_np, "i2c");
   168			if (id >= 0)
   169				nr = id;
   170		}
   171	
   172		li2c->sda = 1 << sda;
   173		li2c->scl = 1 << scl;
   174	
   175		/* Optional properties which made the driver more flexible */
   176		of_property_read_u32(i2c_np, "loongson,udelay", &udelay);
   177		of_property_read_u32(i2c_np, "loongson,timeout", &timeout);
   178	
 > 179		li2c->dir_reg = reg_base + LS7A_DC_GPIO_DIR_REG;
 > 180		li2c->dat_reg = reg_base + LS7A_DC_GPIO_DAT_REG;
   181	
   182		li2c->bit.setsda = ls7a_i2c_set_sda;
   183		li2c->bit.setscl = ls7a_i2c_set_scl;
   184		li2c->bit.getsda = ls7a_i2c_get_sda;
   185		li2c->bit.getscl = ls7a_i2c_get_scl;
   186		li2c->bit.udelay = udelay;
   187		li2c->bit.timeout = usecs_to_jiffies(timeout);
   188		li2c->bit.data = li2c;
   189	
   190		adapter = &li2c->adapter;
   191		adapter->algo_data = &li2c->bit;
   192		adapter->owner = THIS_MODULE;
   193		adapter->class = I2C_CLASS_DDC;
   194		adapter->dev.parent = parent;
   195		adapter->nr = nr;
   196		adapter->dev.of_node = i2c_np;
   197	
   198		snprintf(adapter->name, sizeof(adapter->name), "gpio-i2c-%d", nr);
   199	
   200		i2c_set_adapdata(adapter, li2c);
   201	
   202		ret = i2c_bit_add_numbered_bus(adapter);
   203		if (ret) {
   204			if (i2c_np)
   205				of_node_put(i2c_np);
   206	
   207			kfree(li2c);
   208			return ERR_PTR(ret);
   209		}
   210	
   211		dev_info(parent, "sda=%u, scl=%u, nr=%d, udelay=%u, timeout=%u\n",
   212			 li2c->sda, li2c->scl, nr, udelay, timeout);
   213	
   214		ret = devm_add_action_or_reset(parent, lsdc_of_release_i2c_adapter, li2c);
   215		if (ret)
   216			return NULL;
   217	
   218		return li2c;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
