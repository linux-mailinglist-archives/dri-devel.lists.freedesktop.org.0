Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5087F217AA8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 23:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2726E24E;
	Tue,  7 Jul 2020 21:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57EE6E24D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 21:47:12 +0000 (UTC)
IronPort-SDR: ar8oW+xSXNSx60XFZbQw8Cp3TIVsI4/QeELBwVP9CctOj+PRMTCrhp2LzWA4WWVVAZi+oX51lF
 W0Ewl5W8G8Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232562656"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
 d="gz'50?scan'50,208,50";a="232562656"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:47:11 -0700
IronPort-SDR: /+mJrTw7+x/1qki4t8RjHKbaFHVGhsgX9uUBHPXMPmphFBb3ZOMx6i2etZ+rNoeyeP6TOgifbX
 g3/x4KxJD/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
 d="gz'50?scan'50,208,50";a="483208346"
Received: from lkp-server01.sh.intel.com (HELO f2047cb89c8e) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2020 14:47:08 -0700
Received: from kbuild by f2047cb89c8e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jsvQh-0000OJ-F6; Tue, 07 Jul 2020 21:47:07 +0000
Date: Wed, 8 Jul 2020 05:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v4 20/20] backlight: make of_find_backlight_by_node()
 static
Message-ID: <202007080515.xYGH5THV%lkp@intel.com>
References: <20200703184546.144664-21-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703184546.144664-21-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org, kbuild-all@lists.01.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on backlight/for-backlight-next]
[also build test ERROR on tegra-drm/drm/tegra/for-next pwm/for-next linus/master v5.8-rc4]
[cannot apply to next-20200707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sam-Ravnborg/backlight-backlight-updates/20200704-024949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
config: arm-randconfig-r034-20200707 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tilcdc/tilcdc_panel.c: In function 'panel_probe':
>> drivers/gpu/drm/tilcdc/tilcdc_panel.c:320:26: error: implicit declaration of function 'of_find_backlight_by_node'; did you mean 'of_find_i2c_adapter_by_node'? [-Werror=implicit-function-declaration]
     320 |   panel_mod->backlight = of_find_backlight_by_node(bl_node);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                          of_find_i2c_adapter_by_node
>> drivers/gpu/drm/tilcdc/tilcdc_panel.c:320:24: error: assignment to 'struct backlight_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     320 |   panel_mod->backlight = of_find_backlight_by_node(bl_node);
         |                        ^
   cc1: all warnings being treated as errors

vim +320 drivers/gpu/drm/tilcdc/tilcdc_panel.c

0d4bbaf9f3e5b9 Rob Clark        2012-12-18  299  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  300  static int panel_probe(struct platform_device *pdev)
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  301  {
18c44db8cafe9b Ezequiel Garcia  2014-09-02  302  	struct device_node *bl_node, *node = pdev->dev.of_node;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  303  	struct panel_module *panel_mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  304  	struct tilcdc_module *mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  305  	struct pinctrl *pinctrl;
12778fc14301cf Ezequiel Garcia  2014-09-02  306  	int ret;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  307  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  308  	/* bail out early if no DT data: */
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  309  	if (!node) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  310  		dev_err(&pdev->dev, "device-tree data is missing\n");
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  311  		return -ENXIO;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  312  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  313  
971645d1fd734b Ezequiel Garcia  2014-09-02  314  	panel_mod = devm_kzalloc(&pdev->dev, sizeof(*panel_mod), GFP_KERNEL);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  315  	if (!panel_mod)
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  316  		return -ENOMEM;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  317  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  318  	bl_node = of_parse_phandle(node, "backlight", 0);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  319  	if (bl_node) {
18c44db8cafe9b Ezequiel Garcia  2014-09-02 @320  		panel_mod->backlight = of_find_backlight_by_node(bl_node);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  321  		of_node_put(bl_node);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  322  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  323  		if (!panel_mod->backlight)
18c44db8cafe9b Ezequiel Garcia  2014-09-02  324  			return -EPROBE_DEFER;
18c44db8cafe9b Ezequiel Garcia  2014-09-02  325  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  326  		dev_info(&pdev->dev, "found backlight\n");
18c44db8cafe9b Ezequiel Garcia  2014-09-02  327  	}
18c44db8cafe9b Ezequiel Garcia  2014-09-02  328  
26a5bd26499fba Uwe Kleine-König 2015-02-11  329  	panel_mod->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
26a5bd26499fba Uwe Kleine-König 2015-02-11  330  							 GPIOD_OUT_LOW);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  331  	if (IS_ERR(panel_mod->enable_gpio)) {
d898ce03675fc0 Ezequiel Garcia  2014-09-02  332  		ret = PTR_ERR(panel_mod->enable_gpio);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  333  		dev_err(&pdev->dev, "failed to request enable GPIO\n");
d898ce03675fc0 Ezequiel Garcia  2014-09-02  334  		goto fail_backlight;
d898ce03675fc0 Ezequiel Garcia  2014-09-02  335  	}
d898ce03675fc0 Ezequiel Garcia  2014-09-02  336  
26a5bd26499fba Uwe Kleine-König 2015-02-11  337  	if (panel_mod->enable_gpio)
d898ce03675fc0 Ezequiel Garcia  2014-09-02  338  		dev_info(&pdev->dev, "found enable GPIO\n");
d898ce03675fc0 Ezequiel Garcia  2014-09-02  339  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  340  	mod = &panel_mod->base;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  341  	pdev->dev.platform_data = mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  342  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  343  	tilcdc_module_init(mod, "panel", &panel_module_ops);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  344  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  345  	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  346  	if (IS_ERR(pinctrl))
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  347  		dev_warn(&pdev->dev, "pins are not configured\n");
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  348  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  349  	panel_mod->timings = of_get_display_timings(node);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  350  	if (!panel_mod->timings) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  351  		dev_err(&pdev->dev, "could not get panel timings\n");
12778fc14301cf Ezequiel Garcia  2014-09-02  352  		ret = -EINVAL;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  353  		goto fail_free;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  354  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  355  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  356  	panel_mod->info = of_get_panel_info(node);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  357  	if (!panel_mod->info) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  358  		dev_err(&pdev->dev, "could not get panel info\n");
12778fc14301cf Ezequiel Garcia  2014-09-02  359  		ret = -EINVAL;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  360  		goto fail_timings;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  361  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  362  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  363  	return 0;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  364  
7cdcce9f8b4c15 Guido Martínez   2014-06-17  365  fail_timings:
7cdcce9f8b4c15 Guido Martínez   2014-06-17  366  	display_timings_release(panel_mod->timings);
7cdcce9f8b4c15 Guido Martínez   2014-06-17  367  
7cdcce9f8b4c15 Guido Martínez   2014-06-17  368  fail_free:
7cdcce9f8b4c15 Guido Martínez   2014-06-17  369  	tilcdc_module_cleanup(mod);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  370  
d898ce03675fc0 Ezequiel Garcia  2014-09-02  371  fail_backlight:
18c44db8cafe9b Ezequiel Garcia  2014-09-02  372  	if (panel_mod->backlight)
18c44db8cafe9b Ezequiel Garcia  2014-09-02  373  		put_device(&panel_mod->backlight->dev);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  374  	return ret;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  375  }
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  376  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--SLDf9lqlvOQaIe6s
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
62yyfovHoUnV0fZGlcRGOaDqO1Lq1dkvn/6SYkPh7I/P31AJIFSattZklnVdtafKLmm55YZR
G8vjdSbXI0viIPOBnpW7NAk9mWfgLwTgLcx6flZDdbK6lySrKPNLCnzMzombemJ9jc/Bm/Vm
ZzXHOgQTDttaidjNLevWBcov//r6/fPPP15/OG1Qn7q9E/97JveMCHh+w0v0Q5zibiLcLGT7
UdS1l+rHU/8Jcer0QvTmb69ff/z88r9vPr3+89PHj58+vvnHzPWb1Nc/yAr6u+lxrgQbd/gd
d9V1Yay5jrRWQwp+alXYy9kJBgdFXT45fdVAFyPD7SZVUz1huxKAqW7+6lKuOpo9b98671sA
A6jurw5BKjn2dp0kP1aN7HKuMJ3n1WrBsm1RY8lgGR5jRwDBm7FySr9d251fi5GT2Z9S05DQ
P2QflU398vHlm5rhPG9wqFXegYff2Z2uDnUb2eWs0fRMEbt9Nx7P799fO2knuFUwluAD+0R9
38il6Q3efrPs3c8/9MicBTf6qS307Fu7PLfwao8MdBTYgonxjJ3XKsjveYo0RzZzh7GOKEqG
mFhZYDzfYaHiSpoLjJEuxnZi9Sbsqn/1nLxCBJiOve2mcBZjvXvV8zfNyw/oSOzrnz+/f/3y
Rf4XeQcTMtDWEK4RAgzaDyGRegT1LEpn23RJBZdtDvgmveKZuPpXLnW8NTV8SZvvfbsfC8ct
UsWridt+kmMOC0QUuc5LrsCHi7sHZoMq1uqrRbRGHVC0XaVd/KzMAUDqwuIBwxuMqS0eYrIG
yJr/gFA3eXCt6x4R0dp0monWgQAQOz3m7eTLbUybVbCw4CILIve79XYE1Z0nztz2nSBaB8F/
mzsN2vvn9l3TX0/vkKFUNn6gZjUwDM3CfIzcFM1+JueWtP/+9efXD1+/zIPL1Np71ZctTVC1
Qtf1EIBZRRK2obGusmgKnKq0Z7QbST/9+OrTdbgs9czm0Jl7hr31VKsw3E7lD0vD1eclgr/5
cJsrboG5FfnLZwjHuH4sZAB6rxFFs7c0eflzI956O/bA4dtGkjaX5WvIkKW0iyBKzaMy16yI
ryuotvNRi/PGgoWaXVF3jN1E+5d6rfHn1++eutaPvRT864f/QsSW3xqmRQEPgqqHyswrhToA
wxu470a+bGLcLXz5+PEz3DiUCoMq7cd/WE9tWSVB7M8i6uMYbQGflzXoauZ/2e3DXItgiYk9
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
xHZxUgBT1eVFEZblFLDP9i/F38PrGO0BAA==

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--SLDf9lqlvOQaIe6s--
