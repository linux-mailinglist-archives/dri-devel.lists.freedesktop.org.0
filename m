Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C6337956
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADCE6EE66;
	Thu, 11 Mar 2021 16:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271A86EE65
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:30:03 +0000 (UTC)
IronPort-SDR: tAVjrwgbjyY0xx1lOUSJ/NRH93vXqC0O0UDe7SMmazFeowWIeocp2ngmrVGYRbHJaN3PDO4Fjl
 QjSSHSzxlTNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="167968322"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
 d="gz'50?scan'50,208,50";a="167968322"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 08:30:01 -0800
IronPort-SDR: qnCfYdPckOPRvapO4Slvbq2bZLrsOchGRKaJPytJdWIgC+4kTxryS2yO1c+Jz1vAwIu6XM6I1o
 fFWhoU5fOB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
 d="gz'50?scan'50,208,50";a="370597950"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 11 Mar 2021 08:29:57 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lKOCC-0000r0-Nl; Thu, 11 Mar 2021 16:29:56 +0000
Date: Fri, 12 Mar 2021 00:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Qing <wangqing@vivo.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: delete redundant printing of return value
Message-ID: <202103120043.iUUfmGvf-lkp@intel.com>
References: <1615464851-18433-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <1615464851-18433-1-git-send-email-wangqing@vivo.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.12-rc2 next-20210311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Wang-Qing/video-fbdev-delete-redundant-printing-of-return-value/20210311-201743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a74e6a014c9d4d4161061f770c9b4f98372ac778
config: arm-pxa_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6d93756a48a2f91e8ac0cfdfd8734d30080706c2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wang-Qing/video-fbdev-delete-redundant-printing-of-return-value/20210311-201743
        git checkout 6d93756a48a2f91e8ac0cfdfd8734d30080706c2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/pxafb.c: In function 'pxafb_probe':
>> drivers/video/fbdev/pxafb.c:2329:2: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2329 |  if (irq < 0)
         |  ^~
   drivers/video/fbdev/pxafb.c:2331:3: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2331 |   goto failed_free_mem;
         |   ^~~~


vim +/if +2329 drivers/video/fbdev/pxafb.c

  2235	
  2236	static int pxafb_probe(struct platform_device *dev)
  2237	{
  2238		struct pxafb_info *fbi;
  2239		struct pxafb_mach_info *inf, *pdata;
  2240		int i, irq, ret;
  2241	
  2242		dev_dbg(&dev->dev, "pxafb_probe\n");
  2243	
  2244		ret = -ENOMEM;
  2245		pdata = dev_get_platdata(&dev->dev);
  2246		inf = devm_kmalloc(&dev->dev, sizeof(*inf), GFP_KERNEL);
  2247		if (!inf)
  2248			goto failed;
  2249	
  2250		if (pdata) {
  2251			*inf = *pdata;
  2252			inf->modes =
  2253				devm_kmalloc_array(&dev->dev, pdata->num_modes,
  2254						   sizeof(inf->modes[0]), GFP_KERNEL);
  2255			if (!inf->modes)
  2256				goto failed;
  2257			for (i = 0; i < inf->num_modes; i++)
  2258				inf->modes[i] = pdata->modes[i];
  2259		}
  2260	
  2261		if (!pdata)
  2262			inf = of_pxafb_of_mach_info(&dev->dev);
  2263		if (IS_ERR_OR_NULL(inf))
  2264			goto failed;
  2265	
  2266		ret = pxafb_parse_options(&dev->dev, g_options, inf);
  2267		if (ret < 0)
  2268			goto failed;
  2269	
  2270		pxafb_check_options(&dev->dev, inf);
  2271	
  2272		dev_dbg(&dev->dev, "got a %dx%dx%d LCD\n",
  2273				inf->modes->xres,
  2274				inf->modes->yres,
  2275				inf->modes->bpp);
  2276		if (inf->modes->xres == 0 ||
  2277		    inf->modes->yres == 0 ||
  2278		    inf->modes->bpp == 0) {
  2279			dev_err(&dev->dev, "Invalid resolution or bit depth\n");
  2280			ret = -EINVAL;
  2281			goto failed;
  2282		}
  2283	
  2284		fbi = pxafb_init_fbinfo(&dev->dev, inf);
  2285		if (IS_ERR(fbi)) {
  2286			dev_err(&dev->dev, "Failed to initialize framebuffer device\n");
  2287			ret = PTR_ERR(fbi);
  2288			goto failed;
  2289		}
  2290	
  2291		if (cpu_is_pxa3xx() && inf->acceleration_enabled)
  2292			fbi->fb.fix.accel = FB_ACCEL_PXA3XX;
  2293	
  2294		fbi->backlight_power = inf->pxafb_backlight_power;
  2295		fbi->lcd_power = inf->pxafb_lcd_power;
  2296	
  2297		fbi->lcd_supply = devm_regulator_get_optional(&dev->dev, "lcd");
  2298		if (IS_ERR(fbi->lcd_supply)) {
  2299			if (PTR_ERR(fbi->lcd_supply) == -EPROBE_DEFER)
  2300				return -EPROBE_DEFER;
  2301	
  2302			fbi->lcd_supply = NULL;
  2303		}
  2304	
  2305		fbi->mmio_base = devm_platform_ioremap_resource(dev, 0);
  2306		if (IS_ERR(fbi->mmio_base)) {
  2307			dev_err(&dev->dev, "failed to get I/O memory\n");
  2308			ret = PTR_ERR(fbi->mmio_base);
  2309			goto failed;
  2310		}
  2311	
  2312		fbi->dma_buff_size = PAGE_ALIGN(sizeof(struct pxafb_dma_buff));
  2313		fbi->dma_buff = dma_alloc_coherent(fbi->dev, fbi->dma_buff_size,
  2314					&fbi->dma_buff_phys, GFP_KERNEL);
  2315		if (fbi->dma_buff == NULL) {
  2316			dev_err(&dev->dev, "failed to allocate memory for DMA\n");
  2317			ret = -ENOMEM;
  2318			goto failed;
  2319		}
  2320	
  2321		ret = pxafb_init_video_memory(fbi);
  2322		if (ret) {
  2323			dev_err(&dev->dev, "Failed to allocate video RAM: %d\n", ret);
  2324			ret = -ENOMEM;
  2325			goto failed_free_dma;
  2326		}
  2327	
  2328		irq = platform_get_irq(dev, 0);
> 2329		if (irq < 0)
  2330			ret = -ENODEV;
  2331			goto failed_free_mem;
  2332	
  2333		ret = devm_request_irq(&dev->dev, irq, pxafb_handle_irq, 0, "LCD", fbi);
  2334		if (ret) {
  2335			dev_err(&dev->dev, "request_irq failed: %d\n", ret);
  2336			ret = -EBUSY;
  2337			goto failed_free_mem;
  2338		}
  2339	
  2340		ret = pxafb_smart_init(fbi);
  2341		if (ret) {
  2342			dev_err(&dev->dev, "failed to initialize smartpanel\n");
  2343			goto failed_free_mem;
  2344		}
  2345	
  2346		/*
  2347		 * This makes sure that our colour bitfield
  2348		 * descriptors are correctly initialised.
  2349		 */
  2350		ret = pxafb_check_var(&fbi->fb.var, &fbi->fb);
  2351		if (ret) {
  2352			dev_err(&dev->dev, "failed to get suitable mode\n");
  2353			goto failed_free_mem;
  2354		}
  2355	
  2356		ret = pxafb_set_par(&fbi->fb);
  2357		if (ret) {
  2358			dev_err(&dev->dev, "Failed to set parameters\n");
  2359			goto failed_free_mem;
  2360		}
  2361	
  2362		platform_set_drvdata(dev, fbi);
  2363	
  2364		ret = register_framebuffer(&fbi->fb);
  2365		if (ret < 0) {
  2366			dev_err(&dev->dev,
  2367				"Failed to register framebuffer device: %d\n", ret);
  2368			goto failed_free_cmap;
  2369		}
  2370	
  2371		pxafb_overlay_init(fbi);
  2372	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UugvWAfsgieZRqgk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
nLlVSWTszjG6TXg5eeqI8/9K8U01Pz8CAA==

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--UugvWAfsgieZRqgk--
