Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C41D6CD1
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 22:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8DE6E12A;
	Sun, 17 May 2020 20:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56AC6E12A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 20:22:39 +0000 (UTC)
IronPort-SDR: DU9RhsNuHIlTCOUOf+nqfdUG5E9lZN53+iELFHmcBLMEjFSVj/V1uczs6IlpR3wObG7GWFkRKb
 SUAiDxJqsbmg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 13:22:39 -0700
IronPort-SDR: lp47C4n48TX6p9EaYW43yMUfLOyaklycO6RAIPDAGuMAef4B56O18Y1ruKu1vWWmmytEa32W2z
 W9ak8IKWCF3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,404,1583222400"; 
 d="gz'50?scan'50,208,50";a="252884489"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 17 May 2020 13:22:34 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jaPnt-0006Ag-Sf; Mon, 18 May 2020 04:22:33 +0800
Date: Mon, 18 May 2020 04:22:19 +0800
From: kbuild test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 15/16] backlight: make of_find_backlight_by_node()
 static
Message-ID: <202005180449.0uKcChq3%lkp@intel.com>
References: <20200517190139.740249-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200517190139.740249-16-sam@ravnborg.org>
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[also build test ERROR on pwm/for-next linus/master v5.7-rc5]
[cannot apply to backlight/for-backlight-next next-20200515]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sam-Ravnborg/backlight-updates/20200518-030516
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: arm-randconfig-r011-20200517 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/gpu/drm/tilcdc/tilcdc_panel.c: In function 'panel_probe':
>> drivers/gpu/drm/tilcdc/tilcdc_panel.c:324:26: error: implicit declaration of function 'of_find_backlight_by_node'; did you mean 'of_find_i2c_adapter_by_node'? [-Werror=implicit-function-declaration]
324 |   panel_mod->backlight = of_find_backlight_by_node(bl_node);
|                          ^~~~~~~~~~~~~~~~~~~~~~~~~
|                          of_find_i2c_adapter_by_node
>> drivers/gpu/drm/tilcdc/tilcdc_panel.c:324:24: error: assignment to 'struct backlight_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
324 |   panel_mod->backlight = of_find_backlight_by_node(bl_node);
|                        ^
cc1: all warnings being treated as errors

vim +324 drivers/gpu/drm/tilcdc/tilcdc_panel.c

0d4bbaf9f3e5b9 Rob Clark        2012-12-18  303  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  304  static int panel_probe(struct platform_device *pdev)
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  305  {
18c44db8cafe9b Ezequiel Garcia  2014-09-02  306  	struct device_node *bl_node, *node = pdev->dev.of_node;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  307  	struct panel_module *panel_mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  308  	struct tilcdc_module *mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  309  	struct pinctrl *pinctrl;
12778fc14301cf Ezequiel Garcia  2014-09-02  310  	int ret;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  311  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  312  	/* bail out early if no DT data: */
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  313  	if (!node) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  314  		dev_err(&pdev->dev, "device-tree data is missing\n");
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  315  		return -ENXIO;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  316  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  317  
971645d1fd734b Ezequiel Garcia  2014-09-02  318  	panel_mod = devm_kzalloc(&pdev->dev, sizeof(*panel_mod), GFP_KERNEL);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  319  	if (!panel_mod)
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  320  		return -ENOMEM;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  321  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  322  	bl_node = of_parse_phandle(node, "backlight", 0);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  323  	if (bl_node) {
18c44db8cafe9b Ezequiel Garcia  2014-09-02 @324  		panel_mod->backlight = of_find_backlight_by_node(bl_node);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  325  		of_node_put(bl_node);
18c44db8cafe9b Ezequiel Garcia  2014-09-02  326  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  327  		if (!panel_mod->backlight)
18c44db8cafe9b Ezequiel Garcia  2014-09-02  328  			return -EPROBE_DEFER;
18c44db8cafe9b Ezequiel Garcia  2014-09-02  329  
18c44db8cafe9b Ezequiel Garcia  2014-09-02  330  		dev_info(&pdev->dev, "found backlight\n");
18c44db8cafe9b Ezequiel Garcia  2014-09-02  331  	}
18c44db8cafe9b Ezequiel Garcia  2014-09-02  332  
26a5bd26499fba Uwe Kleine-König 2015-02-11  333  	panel_mod->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
26a5bd26499fba Uwe Kleine-König 2015-02-11  334  							 GPIOD_OUT_LOW);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  335  	if (IS_ERR(panel_mod->enable_gpio)) {
d898ce03675fc0 Ezequiel Garcia  2014-09-02  336  		ret = PTR_ERR(panel_mod->enable_gpio);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  337  		dev_err(&pdev->dev, "failed to request enable GPIO\n");
d898ce03675fc0 Ezequiel Garcia  2014-09-02  338  		goto fail_backlight;
d898ce03675fc0 Ezequiel Garcia  2014-09-02  339  	}
d898ce03675fc0 Ezequiel Garcia  2014-09-02  340  
26a5bd26499fba Uwe Kleine-König 2015-02-11  341  	if (panel_mod->enable_gpio)
d898ce03675fc0 Ezequiel Garcia  2014-09-02  342  		dev_info(&pdev->dev, "found enable GPIO\n");
d898ce03675fc0 Ezequiel Garcia  2014-09-02  343  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  344  	mod = &panel_mod->base;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  345  	pdev->dev.platform_data = mod;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  346  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  347  	tilcdc_module_init(mod, "panel", &panel_module_ops);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  348  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  349  	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  350  	if (IS_ERR(pinctrl))
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  351  		dev_warn(&pdev->dev, "pins are not configured\n");
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  352  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  353  	panel_mod->timings = of_get_display_timings(node);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  354  	if (!panel_mod->timings) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  355  		dev_err(&pdev->dev, "could not get panel timings\n");
12778fc14301cf Ezequiel Garcia  2014-09-02  356  		ret = -EINVAL;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  357  		goto fail_free;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  358  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  359  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  360  	panel_mod->info = of_get_panel_info(node);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  361  	if (!panel_mod->info) {
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  362  		dev_err(&pdev->dev, "could not get panel info\n");
12778fc14301cf Ezequiel Garcia  2014-09-02  363  		ret = -EINVAL;
7cdcce9f8b4c15 Guido Martínez   2014-06-17  364  		goto fail_timings;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  365  	}
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  366  
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  367  	return 0;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  368  
7cdcce9f8b4c15 Guido Martínez   2014-06-17  369  fail_timings:
7cdcce9f8b4c15 Guido Martínez   2014-06-17  370  	display_timings_release(panel_mod->timings);
7cdcce9f8b4c15 Guido Martínez   2014-06-17  371  
7cdcce9f8b4c15 Guido Martínez   2014-06-17  372  fail_free:
7cdcce9f8b4c15 Guido Martínez   2014-06-17  373  	tilcdc_module_cleanup(mod);
d898ce03675fc0 Ezequiel Garcia  2014-09-02  374  
d898ce03675fc0 Ezequiel Garcia  2014-09-02  375  fail_backlight:
18c44db8cafe9b Ezequiel Garcia  2014-09-02  376  	if (panel_mod->backlight)
18c44db8cafe9b Ezequiel Garcia  2014-09-02  377  		put_device(&panel_mod->backlight->dev);
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  378  	return ret;
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  379  }
0d4bbaf9f3e5b9 Rob Clark        2012-12-18  380  

:::::: The code at line 324 was first introduced by commit
:::::: 18c44db8cafe9bda4fcb51bfc05c1f1d7cefc44c drm/tilcdc: panel: Fix backlight devicetree support

:::::: TO: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--d6Gm4EdcadzBjdND
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICKyWwV4AAy5jb25maWcAlFxbc9s4sn7fX6Gaedl9yIwviTPZU34ASVDCiCQYApQlv7AU
h8m4xrZ8JHlm8u9PN8ALAAKyz9RWbdTduDUa3V83QP/8r59n5OW4e9we7++2Dw8/Zt/bp3a/
PbZfZ9/uH9r/mSV8VnA5owmTv4Bwdv/08s+v2/3j7MMvH385e7e/O58t2/1T+zCLd0/f7r+/
QOP73dO/fv4X/O9nID4+Qz/7/86gzbsHbP3u+9NLu/1y/+773d3s3/M4/s/s0y+Xv5yBfMyL
lM2bOG6YaIBz/aMnwY9mRSvBeHH96ezy7KxnZMlAv7h8f6b+G/rJSDEf2GdG9wsiGiLyZs4l
HwcxGKzIWEEnrBtSFU1ONhFt6oIVTDKSsVuaGIK8ELKqY8krMVJZ9bm54dUSKEotc6Xlh9mh
Pb48jwuPKr6kRcOLRuSl0RoGamixakgFC2Y5k9eXF6jcfsi8ZBltJBVydn+YPe2O2PGgIR6T
rFfCTz/5yA2pTT1ENQO1CpJJQ35BVrRZ0qqgWTO/Zcb0TE52mxM/Z30basFDjPfAGFZpDG0u
0uXjBE7x17ceFVlTmfb43tMkoSmpM9ksuJAFyen1T/9+2j21/xn0JTZixUrDhDsC/n8ss5Fe
csHWTf65pjX1UydNakEzFo2/SQ3H09EiqeKFZmBrkmWO+EhVFgkWOju8fDn8OBzbx9Ei57Sg
FYuVAZcVj4wZmiyx4DdhTpPRFc3M+VUJ8EQjbpqKClok/rbxwjQzpCQ8J6ywaYLlPqFmwWiF
StiYAxcJHJROAGTthimvYpo0clFRkrBibuxdSSpBuxaDgZhzTWhUz1Nhm1779HW2++bo1l1p
DCdxCQoqpOg3Q94/tvuDbz8Wt00JrXjCYnMmBUcOg8V5TBX+T9K1bGRF4qW1LJejNTDp2Hue
Fmy+wN1rJMvBi3gXPlnH2LysKM1LCQMU1Nt/L7DiWV1IUm08K+tkjFPTNYo5tJmQ0QF2Go7L
+le5Pfw5O8IUZ1uY7uG4PR5m27u73cvT8f7p+6jzFaugx7JuSKz61SocJipZvHTYnql6OkEL
sA0QVRkYJRIJHsCYCoES0qszScRSSCKFT1eCmf3Bz8GHJUyQKKOJdw/foCml0SquZ2JqsBJU
3wBvukcWEX40dA2mbeyasCRURw4JlzvtBzSQZRgVc17YnILC8RZ0HkcZE9LmpaTgtQqsEyL4
L5Jen1+N2kNexLnwb4MaiscR7rdXp7auBgtY6n8YNrEcdMZjk7wAB0VNgJFxDNspuFuWyuuL
s1HZrJBLiOUpdWTOL11HJOIFqEe5o/6YiLs/2q8vgN9m39rt8WXfHhS5W4aHO3iWecXrUpgW
l9M8nnv1FWXLroHPeymGnty43pSwqvFy4lQ0Efj5G5bIhbHF0hEf4ZOmlywR3tl1/CoJAIuO
n4J93tIqvIKErpjtXDsGWEnwRPeTo1Ua7jkqU0+3KiJ5GgkeLwcZIonl7gHJQKwDL+MbbUHj
ZcnBoNDvA8C1FqOtB4HkZCdHmY2A3UkouICYSNvh9PtEM2JEbDQNUJyCwJWxy+o3yaE3wWuM
WSNQrRIHnwIhAsKFOVugBZEi8Nb+mKda8TDrvd+8OceIhP/2aTVuOISmHNIIDL9qq3mVk8Kx
FUdMwD98m+sgRQUFa5acXxk6VebS/XCdriObQ3xgADcra6vnVObge5sOQ/rngXvjIs9UIzAX
5moIYYYI9Fru76bImZmkGI6SZilouDI6jgjgtbS2Bq8B7Dg/4dgbvZTclBdsXpAsNaxOzdMk
KNiWWu6EMO7RB+NNXTkhnSQrJmivJN+JA5cZkapiSv19VoKym1xMKY2l6oGqNIHHSrIVtazA
2J/RWIH8O6SbJLshGwGpqGdaKrXAdHicH3RVxM4WAGK24LJySIrq6RN6okliOnJlungamgEc
9+aARDDKZpXD7LmFhMv4/Mw6hipgdSWKst1/2+0ft0937Yz+1T4BjCEQymIEMgBUR9RiD+us
wB3eG+LfOOLY9yrXA2rsOkHUA2LPSyKbqFr6Dl1GIuucZnXk98MZjwLtYU+rOe2hod0bcDHK
IXZqKjjIPPf3vqjTFNKskkBHSkMEgoXPvHNSKoGbUDUFDFTSXIUprOOwlEFfGsYbiQJPWeag
7mEf7ErLaMG5NUgj6rLklYQzVMI+gNfrhxnzIMZRooE5G00lJE6YPdG+BxOSxUsIdVNGj7cW
NxRyKA8DziSLKgiQsA1WNFQHb5hqrRJy81ws8MSmqaDy+uyfs7PfrGpY37vlOMu5ROivM3Rx
fdHBPgVMZ/LHc6uzpX6/6pA3UFtZFRBpGcwshxz9t1N8skY4PW4G+NpinmHRIl99zC0nia1p
JMj5+ZnX2rRA+elyvQ7zUwjBUcWSuT/XVDIJX53gqgmcmIG4jC/e21Mw2UR+OrcOEwe8TWCx
E1cVP+zu/jzsXvbgMb7u7/8CdH1oH9q7rqo6jipzmmm0riFQI2PfodZ5EAgu+0lY+7KOe6yf
tH/dw5jHfdvOdk8PP8YS7v7Y/vOO/Nr9I59tDz8eH9vj/v5u9vjycLx/3u/u2sMBUsHZ88P2
iA7P8KW4VJavP0Jqkb83jk5PdtWCxDoLAEjgr9Ir2xSsbZD5pQX0ctJT0/cXn3xOyBC4+hRo
+vH91emmH1XTCX3x8f3l1JpT4IQtKYMQ9lvYkvJSXPRbVmrF7/b9Ue33vKwbfY4MglzUecSL
bOMhg8sp0Q/YrMuLv9xOSFRhzQY8gU0vFSOjcxI7/cegDApNSh95MkkgNEWdq0rbpzN3lemY
hBq+Q63AwsrQUYSYokgYKfxxFESYnkNX/QiKJUExczhIaRIWD7UU85jlTXberVen3h/MHYfo
lhNEUpibp7QKDGK7/nF11umhUnVUEkiNfDVrICs46IkOiodJhckbsxuK/ntF1bVGI3njHwBX
k5e1mlNfIzBCidrN6AULgs/P4EzMWoJJNiHbdMsVrAhGOaWnomrmJePjlc/itknZGpCFsSag
hTw6sC7OfD4GGR/OTJ0D5TLcy4cwC8b2j3ANIwwJB5r2RXcTYeQhmkxWnCVN1R2CvPm9zstz
08NTEhnpzXgtUKZFswKQYaLtGz/WVvI3BHCpwg8kaxY1pH9ZZFt4zpMaIV9mtlXVZAz2zS0v
KK8SyGPOz4cAQGNEswYWAbPFMqkF7jqaWxo9hbkHk9H2tgOx3TOGT8OIEL5zq2oCEHPuy8Fu
VfpecVAxXcvRpEZ6JMT1makMUpZwOGnSJDKyvX+uhkF6h+R97iRP1N3jWNFYs3JiAkhTeI8k
SaXOgT4IJh9AfIZllr7M0w9QEQFwpzZ1j3Wb5hazROzOOL+W+vrS+azc/Q24JN8+bb+3j5DV
DFgBeOm+/d+X9unux+xwt32wKunoKSGD+Gz7fKQ0c74C3cgKnViA7VZ0ByaWvD3kvryNbUNV
Fa8sv4H0iwTQoLcJVkhU3eztTThYCMwneXsL4MEwK5XHB8LQoCt7vV6JfpUB/rCkAL+ff3Cz
xskaly6zb651dCD3YGJbENSr9xdF8RwBSrz63AsGpUScs5NCn3nFAt2M9x8ekx7Ww74+OMCL
JS6OQoqupJV4+1ixlVXtGkRQb3gAzXKPxcxpUQdYkhrX6InUDDwYdLhVBIUMU54lg9YNdQG3
m73jsz6d9zyvjvw9mxrUajIpExei5pg+7LZHlUjs7p+OsxbyC+s9CTnOHtrtAVzSUztyIQ0B
0pe2y5TaryayCHapwaWaxuMwDSNUjLiqFujQ/deUXhzkLyIooJw7sbXrHCuhgkWd8rupByen
dXW/f/x7uw/spTL9suKSxzyzg7Vm4fmfXKhrdhluWYZapqzKb0hFEYFaNZI555ja9/wJA4uG
KpZKGzh3bLw2Al/CbbPsOwUcSjVuHvrx7Mekq0F4MtyqTPrzItvv++3sW69l7adMywoIDIbn
7o99quJqU0qrVmw9Ddru7/64P4I1A5R597V9hk5t8zRRHddFMOrYFqIcfMwDiAlQyg1xH+1Y
BfURHqqC1oJzowI/3BHmpXYt+pHEVEAxsY6OgbwunQlh0RjikmTppr+4mQosKS3d+56B2eU4
vNp4Z65m1egXWM3Ngklq3/QqqcuLiElMIRr30UxF54CoikQX9hBvqvv20lVTV9o2SXG2dCgK
T2OPPjqG124UB4kNgBsfC+l3J/3rLc+KOxQNxyuTZtwI0VVLNS6ecJXQGQ5Kv3Kz2eqJhpVm
WmxfDqP0EXx1otivvodQUv5HEaYEJB6dIkoaY33YKMOonESoU4AXRBXNPAalOKqYjcmv3Tld
g524lt6trtz01iYzM5hnoC1IsuMlOLvEYHB8Usfmnbu/nDBI7Ba2u1q/tlbUwqmrGJULAIZP
zPd3WBw0bxUGKDCP+erdl+2h/Tr7UydNz/vdt3sbraPQJO8YBlTczu00ziWSy/O5ZBRREFU2
75uPZtQ7NTlrE/BRaJnVc1YYeraJxpR6chNvYqXbDLd3443qhjRmUAU+v5QV7Ll3JYMs2pH2
PYGhRwEToZ+8uHglDvSzwJsJvNA07wPUzZ/AS6oxP+0OhVXn1Lm7ztYzTnzX8p1MXSA/2Fiz
/c07H+YbWVTx8BDVNpaJJPO/IOnYuKsVeOxTMvq+KWcCrxzGBw+QUKjSmrdpXYAPgVO6ySOe
+UVkxfJebon3rkElCv2UKYP4asbHqHt3M/xcAtoSDLzW55qaIax/EhEJ+4HYSM6Y/9pvfEwh
6bwK2X4vhTUbP+ZV73V0lUIHqCoodhP58JgeAu9SU+GuARXIS5JNgFG53R/vFdrHYqIF0GES
kkllP8kKT5TXBkXCxSg6KpSmzCKP8NsZ0Zx+/lmFMMZ7l8r4+B7KgGcgx7h+G5NAsLBflRvM
5SayH1n0jCj156X2eIN7FoVRAMRbVbVLAgCVOp2midklZSIhAsYNgPR+RfSf9u7luP0COR1+
CzBTF9lHS/ERK9JcqhiaJiWLfXutRURcsdIFYhhHOj5Wqgwbf4WIL+FXJb6JL9VreUQkfkGI
rhPGbdevuwyxgPwkUe3CCwHPYWAMzCM6/DbsTEhvSnF5+7jb/zDy3imix/EB4hqpFS6k4InK
YOwLaKVGBMzqLYa9v6LMADiUUqEAgFri+pP6zzw3c8S8aAD+V6vqpqfprua1j6NrxMTXQxlX
vaksMf8CMLc0r3MyCkcRrz1G2m3JuYUUbqPad1ZvL1Nr4/rsgpIq28DRUPcRhoIwDeyuJ6zq
Ma1wVqEnsXN8O0eLeJET9WnGsIPhTRpXbRgm/AAdzTHy2ETq0MQyAv0BnugjoTKJoj3+vdv/
iSWKiS1AaFqaQ+nfTcLI3Drma/sXpvimIhQNG3m0gPD10QhkmeieKvplAWQaG7pOzZcU+AsC
7Jw7JPcBmSJiFKpS4h1HCYg6wkySqRtFu23O5vg+ItgSNhzSPhY7+7GkVlcd6VRvSaneS1L7
HZBBDmmVaQsZ3XmpK4Ax8X6kA+w+dDUVr6UTCzCPi/D80aAx9wNgiVFVUoTTg+q2kyFy4Q3Z
gxjgsYgLn0oGkTgjgKHMN5llUxal+7tJFnHpTAXJWH3xX/J3AhWpfO+B1WErzfedmgJHDew2
r9cuo5F1YaUwg7yV1G4gMQBIxrxPX3WTlWR2L3Xi7z3l9YQwzsT8LgyZZGGpRzkOEVCNngji
3IDNjfOxG4UOf1xipj4frG+c28CK7G9NBnpcRyz2g+Fe5AaQ6w3nPhc/yCxkXHpGXYgAfRNl
xENf0TkR3nkWq9OTxDeQwRcAg1TgRYoxfuF7+DnwN9Te54HBMoBonPnMbpBJYr8y4mTu27DI
8h79HZKzWw6324ZJK6Vv79J7CaX5kxJq+iclYCEn+bCkk/zKr/2e3avm+qc/jnfPP9m7kCcf
hPdpNpz4K9tzra4674xfsaQB7wVC+qk2RqAmIf4kCk/lFZz9E8xTXuDK4wbsOeSsvApzmb2p
Vs+uS1MNLOenKIJJEzj0tOaq8p13xS4SQM8KyspNSZ3+vMPOK1fMcq49xd/4ZEDE2dYR5uJ+
49U9qO0OLUfQ+VWT3Xhc7sAFbOk7daOA8/GGtrEyG7r1zg22CVwW9RXW8tJyFernxJI1FecW
+moYRsAPlrGOPKBjh1UuNqosCYgkLwP5A5VuAXogmSFnzMTUI81RaPo8crdvETFDZnVs95OP
zieD+HB5x0IlsmLpY6UkZ5BoAAI50VB9h3eK73zSOxXI+PwUmwvjQ40Cv3AoClVOh2M3UvGz
ruFpxLhJmgFdAZj37YzRXTPZYZPZWcBrfWC5SPinqz5fsys9Flu/OfIbuimHxgbH8W2Cyipf
m7Q6RM6spb77hKBlniOTI2IZ4AAghJybBldK8MWEP5pacmkAGltCi8uLy9elWOXHaJYQmEnE
uGiKN+yCKAJRx97y8i1LECTw9a8tFfjk395zR2fW7vRH/dHyYs5xm2c1ZDVeZ5g2BZHWqYPf
DT75rKjlAzQjJwLOfkUSarG6KPQ4IfXZ4oSuj6/Jkfg8Fi/KzKUANTBvrILxG7zrVIX7R5PT
fWgy6QlUqv7IRKBDdFpWP/ovUlgkVIBNUbqySY5Kh9TFovHod0BaNk37VYfEJXFH/B33xkPT
6nZ0gXdtNm1BxMKmqGqHRdFVAGfKwpmvBOew3rh6hoxT0f32ltRlv/tOu5ET2vGbZGw69qgM
QX/t4a7f4Bnk4YCsB/ikQvBa1TYPs7vd45f7p/br7HGHVeiDL/yu5TS4mEw0Nje6+CUFlRMw
0M/kuN1/b4+hCUhSzTHNtv9Ihk9ElzRSt0g0lfPM+oS4ri96FduL4LMJ9XXh6QkGAMMo0Cnb
J6GP28l1FfhdZ6DoMhVOX51NkQYh0CiEpTd9wXVybr2zfd1SBlX0TvjNTWAib1z8CItPdReX
uZgcm8ft8e4P+/7KOS8SPxhKkgpzpNfmo6WtT3o9fP25d1DFnVBWC+n9gt0nDIiTFuFd66WK
ItrIQIYVaDDJbF5t4Ear1xq8zeOM8gphvFEvZX1yJzpUeWpEcNyhP4bgkxaxN0kZBGhcnOaL
1yaEgfD/peMFzcrApbBP2pfGeuR0wePkWlhZkWJOX1kPZMOBIq8rmV3I15ST0WJuV9NPyCqk
dLo/f73AKxj0P52Aqn5Yn556pIo0lMYOInYe6uHfFMHApSWm1zg+oaV0Pd4pcQX53ircBZm3
abaiJMtfmSyEInB/b+vPyRc9Aj2KPDWiesz91vUON2BvnKGsrKd1HpEhmJ0QAQDzitpq98vH
/kX4qbKOcaFkfR2if6uviS8+XDnUiCGWaVg5kR84cNRCzO7YmHdSyEVP2DDv3YslYJ9Nm2ef
yCmPubdlDr+gfj/szsCf9ptSodLkKAFjdUP6Z3yKMb0Adbt9fXCWWh+gdFz1BwhcS1gJuxgN
BFX2DGlhJYJ/IUdzIelRX6tfn3dfxauwcdxvnw74lSI+Sjzu7nYPs4fd9uvsy/Zh+3SHd/jm
x41Wh7pE5NyEeCTqpHRW1jFIH6w9vCCDLPz0zimNKzv0r4nGNErLV9VUszeVP7xrbhawK2yY
xWMmpEkpn/bPV76/d9T1Hk37QFrlEpOFSxETSj6VoYlLKrCYMWpKLMLKArsdDOc3o01+ok2u
27AioWvb2rbPzw/3d/oblz/ah+fu+wN7cmk8zYxZ+d83VMlTvCCriLp1eG8VBHRE0nSrLqVK
Fh56V8dy6GPFRQ8wKWQgPVDbk+rNwwmBftDAOwG74uEusB/cnpSqmQf7Q+Zk5eYCzYMGLFYO
FT9zz4DT5Xg+2GgKIHQPtJXSh5q1RHfl8n+cPcl227qSv6JVn/cW6avBkuVFFiBISog4maAk
+m54fBO/E5/nDCd2Xt/8faMAkMRQINO9yKCqwkgMVYUavtjQQY7WajGn2l6wDWulFJ2jRrAK
z4jcFq2va8DpJuX+fkYgeMgEQU2uE1ghy59da1iLQCwI1KJGofyHKpdCd/C9YWE2tT/1Bv7P
7ve28LhVd7ZqediqDnzYqrvQVt0Ftip+mRpbFYuS4W1Ep3a0cmx/2cPQm3FnLvNdeNftQtsO
p0nObIefOxYZHJ7zVGUVeN2yqI64zsOigQGr2I/ztPlvDLMObSuDhteTFfnL36WYOFn8Fid2
8m56K+9m9/IOPb/MPs4eYCZxUTmzN+ztqa2LXr67nr+IE/r16e03Nr4gLKSGtTvUJAJX09Ly
25+rCLtIJyIkWU9tE3T9+33aJZGqFSdDTk3zZAUtWUA6oLZGBn53cXSAhyJa4MtZ0fSWRtLI
T9k+5PEWaSVIzo9k5beNEAaDGssSv9mDqZbrGDUXs+KNw68uF7cn0RLFaPQEGN/91MYHDAZJ
YzowN3lHM1PE7iEyYBrNHUxGTO8HgORVaQUgBVhUr3d7LOa61sYZv/qw22YVEn7ZYNNqFlcr
1f3dsUMuFllRlpUbgFnhL2IM+szDTV6UYy1YXHI7tKoCISVklfvlemVFSxyh3eFS44ySQZNf
UK5VHRPjKPWxMZgY93OWUevH2vxKxPRsBc8gUlVZYoNZFdtSq/jZJQU1rfTb9dZohFRGCJnq
WDrqgp1gGSqCRZ9kSZLAmLdWeoAR2hWZ/o+MbcrgmYKgzPJYRCvgRqspQocmjO/Xxw6WR/X9
z6efT0Lg/0O74SjfSet7c3gQiLBwlz322EReE90xNV1Meqi183pgVbPSelmUUKn5vXdXH5dq
S9wascfzFHcdG/FTo2mS+wxrtYlwW8lxjkJG14BNmtQfYkPk0JHGDnNjjHn47VYSiH8TZK7j
uvaB+b3uhztRpwhH0GN5SnzwfYp+L1rGqJVfj0/vFQnSDsGaSe/9qTweU2RhMVeV27cnMBMd
Gu3tvLLgAzv5mS2WfZh1db/6hoAvj6+vz//S2hHr6V/cQF4HBAj8YUMKcYlvqFLB/HIR8ri8
8eHp1Z5NgJ036xGoAdLZdyzeQxHLCNUcv4Q8H3r0DisHYlZw5QNBMMj6MENV6o8IqjXVCT1c
igdWzGHAJBKMwbSb3hhh30ABq/AFgcvXYxRjzbMBzxPLEGhEyPBdGIKSgsUohlU8wcuAL6M3
IcR5RwOAevpyhgBwcPgfoQeibAgjv4Kc1XUS+xVwAi7sPtzrGgBtW6u+a5DVCamYuR9DQk8R
Tk75Ofehom/chwLD4kO9VSer1e/0CKZhRVqiPcxLZKJYisySsjWTHmFIAzZMVCAr93qjEf4l
rBH9geIcaw3tPQGnTnaWmhGdqLEy4oJDBP4S0jcZDKxgEIj0gMZg/X8vFk9roANOHgZJTHDx
yiApUA/gEZ+D+xvaPYSRd7HTVcuI82bxskqKC78ysV0xpnt063MgvXPlyGX3iExIBRFuCaJ8
wbFabYQXxK7Qxqe2R6fcPdZJAJDuwI11JiFwM4GgYkPFEeCaUoKugBvH8pG7zIycKdvaFN7a
NqAUgTdchbIWckE5Q5eETi8BNLA5kAkzKDxHQimhtF105g+dHZI/ujd/qFD1NoA3dUJyHZbg
ve1hu3h7erVT+8gOnhoVeMYW1eqy6sSXYk6Im0HB4tXpIEx33lE2zGsSjzEDqseP/356W9SP
n56/De+JZhwvJTKN0rH4LbZhTiAYeyA+oeh8XWJByeqSD5H4SPvf6+3iqx7CJxX5GQnEl59Y
IJrGrnI2gqHbuU+aI6oRj8iDWP8dhD5K49Y8Bwb4EYGLj2mfCxKaVBgn80ByUw02OdBhLZqX
kvgBSkbzzAZQRLE5Bczhahf+sLrb3PX6PAHoA2vHSJxDOJBpKEQxINspLM8oKiEDzjEcBhAl
GYWHSXBNQ1UXQCRjhDsF0yyZ7MehDvejYd0xodTrSxcuQunt7dKeUwnqGCcYuMpIA6F03DZY
yuDfFPNGA3zuf3gJMis0FwUltdsEwCbb4B8IBPq1a9JAfzw9Au8AL1N91g9L68yFuA6ZJP71
+NE0wAbyPahqBIFdSZJzBMhjAK5t6AGhPF0I7FIPntOIaKg1QVVCTp3sJTo9Z/UFRjMgf0x2
fSpqjIpPgOecQ3bccJzYQT8gjUYSB2LXQDDzMCaQKioCs5QsdV3qTDySJ1CFKX75+fT27dvb
54nTWBQ/UhY1+Hz2WB7behEFPxPU3kYXovl6uWn9UlElFiQWil6jU/jkv2zgRfyxYHl9yTxA
p7tpQJvT0PU++HBoUoYLMhWMQl1Z/uk9LPSmOOIL+bKYlba6YsB7TOeofm9PaJgrUfREzcwi
DjOiwfBYWusoXBp0ZXWSWX6KPQTEBAOaSKcJ0ylWguwEcRrELIaNpgfQaa58TUqP+Pr09Ol1
8fYNIqk+fQVr9U8QvGahtaErI6qRhoBI39uStTp8/DgAMMz7Zf3U+1flA90bE5qeGBomDlix
OyfWw101hl6yeLa7cNIzSpidI038niSGCi1mWAKt5U6TCkx67dQDGgb+4U3zEGyhJ4PYhLg4
V6TU+iEkhANrSGYDC2plddSgLrDbAX30S/BjbFtsaab58ccifX56gXRFX778/NobIv1DlPmn
3pG2GwPUxTA+CTBg8SduN7fxNA4594kixXazca8PhIKtQz6OVB02U1XwRk6ZU4c5oW2l59kH
QjEbwTfptS62KFBTG6LCb01xX1OlVT7WbrC0G4YvugOxXURiMWgnNJOQx8SyzFy5U2YLzLlt
GwwXsO06nRKWlRc7ao2QApqyzHoRN/RWloxynJmHBg1qTPLIelSrqGDAYm/pytiJzx91HYvS
i/6vYmIqN4VxEBa4gyA5RhB+MeQmr2wVQw8TguK5wDacOB6LmGSl+ewpTgbZzBAwWabb7kc/
BA0Gq1LTVDC9ytiM1j3Sg2QgrxgSiIxIcQXUZIy6PA5kLCVj0LqTgKLF982yyAqyNtL1URfN
le0OY7gFILAtMKZG4LT++8rAjDjOgRofQLKDMqI6usEHfrEOWCIoAuDYdDWQ66REA+xXeXdf
8u50hnTsjeOyJmsgMguerkdm50LbVDX0ZMHE7UM6MIiSe25KJ/825EKKzsZ2rZODFRVN/bZP
KA27rjxQnpv8WF/WTJENeWp0iDwVcttGpUkBSahqQi1Lt8BeHHLBIPdIVNOcN1F3YDwS2x5j
dlneCi7HzPx9SVq5CnWmTfPbpDwTAgpMFlJTfmR6Gq1cNO7ZK/4p/PhygutCohf0368w+bm8
seOmNrH87r4kMEad/P7449UOJtlAsONbGa3SrtqMx+miyhSDkpRjYPF1ZTD2CZSyxyzrBx2z
9N0qWEF3LnQCQDOylE8GcZR1aiok+mY/D3J6zq+QNkB5HMtcig1Y5Os8ANnjL1eDJdqS3UR3
4oDtatwUJm0CnoghBAti6jQOVsd5GuMsDM+DheS3LatAtFuBHIKaih2rlLjeYqtJ/kdd5n+k
L4+vnxcfPz9/NwRPc3mlzF29H5I4od4hZxCI86tzzixdlVTYlzIhO3erBXRRQrD64LiAJBL3
5kOTdC6hQ5YZZFhLh6TMkwZNLg8kcAZGpDh1Mpt0t7JH4mDXk9gbfxbYCoE5tZSmzdJAVDRC
NjTlwmFic8HaeQcNYAQrghkf9ehzwzJnh5LcAZS5WzGJuOMFN+Y4D68sFQj18ft3I/2LFDQl
1eNHyPbmLD8VrhvmFOyynIMJYp/n/vfV4HCmJZPITgZlYiA0NRGzg9/lJuUhyVnBZhpibXXT
tugAZNKybsjAZBCcqTjcz5giRhbPSFPbeu+52VVpPp9e/vXu47evb48yjIOoylc+Gc3wrG/E
6rqTCs7Cij9TaHn0rqFd91yKn1///a78+o5Cn8MKdKgkLulhgy7B+fFZO61ICiufkQFUyWcf
umutovsgFJpbc+enR4eCXZo06xbOy8PUjNXk2hVO1ig5IVklls3iv9S/60VF88UXFcUWe9YR
NakC+IJSlXTFxVpT802YdZzN1HMa0F0zmTSBHyG6783ybucSREmkvaTXSxeXiivMYnB7BATu
ibz7SVbn3vwG/vggBBuLgY4bg1MuU/P/EEG3aaw47GUqAzNDADkLqGIUo6hTGX2wAPFDQXJm
tSr3v6UJFDCLDy9T2+9S/M4tZWoJXhOQfQvufdOSTSFA0WROloCC6J4R7BZUOUchT7FOXiJz
ktg+rCNg5IwVSJBjgpRGkna/v73beRV1q/X+xocWwC4ac6UD1Vtaax27vjhnGfzAtfCaCJ7z
JwniOgoHwJfNzOBDO5nGkDewOjU0vuA1QMJr+CigRMFNf5VdwdwYnREoxd4lTxbc91IFeJcG
NGmAU34P+Gu4Wae6359fPxrCXc/OJgWHFKIZ45vsslybKX7i7XrbdnFlZmUygLYgq9IfN9TR
v8bnPH+A7YLJjJTfbdb8Zrlyq+HcOreFIJuV/Fwn8CLtvTT1JauY3+2Xa2LF8+XZ+m65tHL+
KtgaS/bZz0YjSLYyr6iDiI4reAs1fQ40RjZ/t8RzXh9zutts10iLMV/t9gaLyS0uD351SZtY
szEI1vyB0xR/EGkhAXvb8ThNsA0PMfM7IedZL0zVpSIFw5cbXbv+4SojQVKBbQPiYa0w4nOu
MccBjXXTE2twTtrd/nbrwe82tN15UMHMd/u7Y5Xw1sMlyWq5vDHvTKfHOq/Y34+vC/b19e3H
Twgu/7p4/fz4QzAoo2/5i2BYFp/EDnr+Dv81R9oAK4/uwf9Hvdi2HJTU/UIHXwcC8kPlJ+Vg
X9+eXhbiChN8wY8nIYWL5pDPcykrV/0yuktNVDHMLz0a99uwnPR7zMj1mmeOYnHBQkkzfWO/
+lFDfhUwGTQ9awiLZSJSXKzmnsVTz2siDVnHOc7S4af/EGasDpha6wdw6y0FKWC0n/d5JwNW
HPAc5hP0vPjbj+e/fsKH4f/z/Pbx84IYSYksBrP3PvvNIsP3BYOhws2pcEmKuKzFAiQU+G56
RJZlgwapN0vn5E/H4G5A3Z9J0TCCI2uKw891Wds+SxIimIH9Hk3pbBSO6pLE1Jajoxvc0TSi
EOcxEOxDnMVNkgeCaBgNUhInTs7bnFBMo2oVurBzjo6esro+W+uO8v3d3zPDpjLBiDVpSlYe
Pjyum8/vloEE2rFTxm8z+ZMe7VAqCtIVFZiuF0T0QCX2mqspJTWJiRW9KBWCCA1lD0+bg49F
qoXI05SY73mpffOC3rq6l8w93pDAtwflRhggOTBSiP5P90SlvkS/95FxcbVTO7bwkbXbY7zu
DqEgM1BKDCaMrpY3Qc72GAhCK+DgQId7EgFy/ksez+SaMHSgbC/4zBZHgbYNxeREyFh26rv8
4n4LpJgoQ4rS4obyrOXX8AEu0Ol1plZGazsK+Ynv99uVKBuyrDBKlnq3BLA8yW0Bm1PalTTJ
yt5yeLqJgjS6CgQHFqtFmeMrsLDNFZhY8cn/bf/uN3cWC63FTnSexaIsQy5CurpK8EqQLxLt
rbhRMjDxNtu7l9aqoc1Q57MDqMUYOeFogzXYldcoipOcn20nVt4eosTdeUjJxExvaiLKjNRp
Rmr8W/HcFqR4Tu9WuIgiUUEc95BYXyg8bbQ408AbuW6t3jQ5nJXzo38oykpcsJZceaVdm7kH
nl/2wqxbTvzs6iMLeIMDVpwfYhxowAKj2iv7s7D9YxWku25Dt9BAsJm7iJTwZlauxTnSsvC6
1TSZEMJdmoG5ZaU21TR4dwBGNguhYBTyJ7JQc4qGNRFBTZf7ajuVAMgppuBSvT5TVj6D18nB
77DC6oQSrbnlJMV45XnNs+p+vwxEE5EE8jDNGWo5pQguluGZhLWVmd2qOj4oTUi/1q8C8l7b
lIiqF+LnhGUpiVkBdWB6jly+T1gHqOabQyXU+RrpYiM7e9u2rQfc3yJA5ZjhjKlnnv0qbvb7
lQ2lTHC+xO245kPdfo+7XDC+ugEcX+03+/U6MG7ANnS/WrnNymI3++lqd7cz+LtAsylrk9ge
PaNVduYODLiYrr2SBxueceDCV8vVijqItrEBmtvBgavlwUFIdsSdioHVCAxmxDcrvz7Jhthg
wViIW4A4vSLNfrlp3cbv++JIwxDzs0lObhF99YYKicu3H4yx98R+dusR0tpq2WIv1SDFitXO
KHfLXITMy3kSaFufvwexudc1/G0cBpkt+FQVrufmWSCxgjhttBOUpxHobxdw5BwaHGyVr2bG
a6AZpOY4F7MbwDW2YN8cg5a5drHcZndNZH9WzNRBGacl3que60erl7kLhWSE37wGod4eM92Q
UVqC81MT29bSwqllG0ByFhoAanBmEpjZnkz4nw8xCXxjeSskhZTz5eVyfc5JK/7+8fTy9Pq6
iH58e/z01+PXT5jNlzIPZ+ub5TL3zXW1Wmm2QqO+mdgh/do2DsgRl5JTklnvCgaSBPwvDJLj
lTNbfyLYIAA5jsC91Sy6jBiPsSH0j7Ljz65yXoG0Zvb7z7eg6pMV1dmMnwo/pV+LC0tTeEK0
XRMUBjwznec3heDS3+EUjO4niXLS1Kx1iQYLrxf4qphnky5dQqJt0zzfhoOptJkJ0sFycTUl
Rde+Xy3XN9M0D+9vd3ub5EP5gDSdXNDJSC4hJxKFJ1VeQXiFwPcLGUOrwqfkISpJbSmwe5g4
cnFO2iCottv9/neI7pCFOJI0pwjvwr3gK7a4eGLR3M7SrFe7GZpYu1HXu/12mjI7nQLvtgOJ
KyngFHILBILNDIQNJbubFa5tMIn2N6uZT6G2zMzY8n0oK5RFs5mhEefs7WZ7N0NEcU3dSFDV
q/VqmoYXEJL4WgvANCHLZ8ZeJNemxL1UBxoICgBKtpmOa9XJzBIoszhl/DiVv2yssSmv5Epm
xiganV2b7J7v1jNTUYpzFRc4xyWXr7umPNPj7MQ31+xmuZnZfm0z23FKqtWqnem542eNrKlG
MOnwWjhxt8AZPoEXBziExsctJxSJjF0YCI6pCGDq1B0x1RPBX2JyQ85uei8+QxEogCFPJonk
OcZ3SFQqbQ4cCJgvWEb9AF/H+rXXpV+tPMjahWyWXo/TDfbirlBm/DQN2fbM4fHxxyfpIcL+
KBfAnFhWIla/5U/42zY7UmDBbDjXj4KDq9Apx6wxFT5jUcXXbm3g+e+A9EMjQixAoBDyCtQU
oyYV1qC6R0z42Rn9geSJa17Vw7qCi9sZf/npSTLnINC8NDb/45M8wjsqbv3z44/HjxBO1DPt
aRpbesUkDMhDf7fvqubBYCeVWUYQqPLUmRkeMplFFlxiZFK7X70164/nxxffdBWmk2TKLI+a
L8EasV/bljcDUEihVZ1I3wXMWN2kXO222yXpLkSAQleBSZ+CAIkZJppEAsRL813ORBa1dPLk
728wbC1mjOXJQIJ2ImmFtBYH+BeTkPAqEXNwCXiVWgPjWWiOYjw2mdUj/Oy3Rtas9/vAs4Ei
A3cXHT/BY6qLb1/fQTUCIheLNIpB7FV0VXCGiMqWK/zyc6lwTsdZf9KPERRRxzIQJaCvFvQb
UwQhhkij4WtBMtLwF7P9yA2gsfTcWjlLWSDyjKa4n8RySos2oI7qKVY7xm8DjIImEmzCbjNN
os/tDw05uAs3QDpHplVuFZ+lzMWJPktEAplZNRpe97NqrhJJxQoI0TJHSuG1TPpfsgOj4uzE
9Q79ZwB3xskO8qqePDt4kwey/ThHtbMCc9rUmbwYkfVXiJUpnWoDbQ9MedPgbC3ENcGPGWk0
HCom/RrF6i9wrvF4oRC0emo6QKng2cCNdyfEayga7E6QCNu1Oqv6LYrRV44mQtsKIyVGdlWw
1N1RzGsWSGWQR/opT+k+7bw8x6tgnIrYtmsagDIvlGBp8sDxPhJ6R55H4Qd+GHHeetMUot+W
Fbz4fVKAkZMlV8SLuP84VPypQmOrMB2zLMK4c8JqqAcArn9QZyMosb1ZkZisi4ktzpeycZEX
0a9OpZ31CvFms/mzWt+EMbaptTj2sgfnybaHidsW3eE+n2hOtpq5+izOGHACVX7kvgZMyEK+
4tLsGQxfSoUyIKSpexOIoNuXRB5FKUuJJ4Dq7Vg9mf58eXv+/vL0txgB9EP6IWGdAf9kxcTL
WKhJYcYU15X2Z5kHdR6re0TW0JvNMpC5StNUlNxtb3COw6b5OzAFkoIVcNj6fbOewAEYJ5P0
edbSKlNiWG+MOzWFZnkdYgD4ebtiIe+a7jlytrNDGZkx/3qgGGv/7aCxQboBX+7xu43r6tfr
29OXxV/g6a1d5P7x5dvr28uvxdOXv54+fXr6tPhDU70TTCP4zv3T+fAQKc35egBTsflmg4/D
IoQN5K+NOOHsUMjQEPb54SCHKGFOJwwSL0ygQZbkyWXtlg0qPuU5lGMmORoj7iRvbxZlTmJ2
soHl/3L2JNuN40j+ik7zqt50T5LgfpgDRVISy6TIJCiZzgufx6nq8hun7Wc7u6vn6ycAcMES
kHvmkGk7Iog1EAsQCPD9NxUGs2ftTnfj2aqlZd2rIZMcyvTADtuVWLGR/hF6y1PCL0Ey4iLC
nyDansGEAdQXYFNgo/vv969c3hlb9WxKyoYdlJ2I0di8OhLrgE83n6z4rtk2/e707dvYgF1u
JevTho6gBC1d68vjnZrZiA9Iya7HTacLvNPNxx9iKU89lhaPHPttXX76LJ3QUzSGYlyriQKx
pvhtCpPfWQoPa+jkSsLkxCck1ksKki6SvvMsFl+Lp0WlbY0jDpY8qm2L5Ifo283D08vDf2OO
KyBHN4jjMdNvPgq+5Vm9NiKyZsPO2I5Ff9t0PO6B22lgXNfsijVLA/Z+uWxgzoG1v/NEDMDv
vOL3/5Dn22zPYojq2mLOaDIhRp4DVo5iKo+1fGwn0TMlszvBZ9M2jFQF/IZXIRDL2IgZnurG
7OapVSn1IqJIxgUztMTBzsIWAqETECjIVR8tssYSyc3YPE2ckJgl1llLPOrEWIngo9jeUFpI
BjdA0/otBH29G7DCRcjvlS9BE5jNBWCUY8UBIq5xr0AhwQ7CFYLWWjp2E1DqpoeM7qRAwsSG
iqyoQ+R7yHQx+zY14Rn1o8oNLIjYhkgcGwLpTPH1BKpr2yk3OvitXn6fNwMjHIxxbsFK6aHZ
30rw3QTgl7BZZqzplnbgLtn8m51my8yflN1X/SqGWIqWeEzeljmdtwxbr9jLUH5U6ayWu7iS
/uP+9RVsOF6FoZL5d5E/DHPWo3X7oF12/G0tW6/UyND8Vjxoo5a069kPbf8Q6ZJs/CjoTt8G
ERNV3WJSg+OqZl9m58z4pt7GIY3wHTNB0GbxMGBSQaAHfeDbygldDUbTOg1yAtzXbE9GG8zN
QxXbDHpxdzRT755wsDDG7F35Vpxt92H4/Nb5uMsOqKK/wj6L88Chlz9fQX+abDVFVZhMJeCW
u8kTybHVGeB2FG6VyfEOBiWDOfECrlesEnFXEbWzJ/QuDiKz7L4tMxLr2+OSzaQNlVihu9wc
Qm2wuvJbc8TvTHKCbR45AbGcfPH1CJozwN5WE1iwuqXtqx68IXShVa2X+HioxISPoyC0VrPI
fXNGojCwCoUuC/og9pDRpvBVjCW1XfHENXmPI+LwyorhFIldTvVfQZeGGsdNgQFmdbdV6PjW
sm7r2AscZavA5AgRCUa31xeb4qQsxSGfqdMCpvFJeuJEzoZ3645C4vAGuH/9x+PkxdT37x9K
A4ByfhmBEl/WySpGvm6/YhRxKn/g3ioOzoqyaMuVgO5LeRSQtst9ok/3f7+o3RFOFruRWStt
E3CqbKIuYNZFJ9CaLKHwNarQuNhjfWopoaVm4uGI2AksX6j8qqLw7TSVBpcGKs3nfcbNb5ki
ih28B1HsWvpcOL6tb3HhRqiQVrlBsqFZUOKYnvHzCoFlSWZQX4Bj6altK2n7WYYKA1DCsbsa
/JWp1URlG9gqaDaW0jxjL78Az6t3C9IhTkgwGvGU64hwyXOFgGfxNNATku0Z79mggCYXls/y
3dQaPj0hJvhkAnliFbhrgROsqqrYN2OBvnM5k9CtZEHPrVeA4h7lDDTq2H4l0WA5ZV1aCIrW
w7q8DBdzmgezawt8KVJArkwPIwATancqqnGfnvaYKTkXD9zgRqCFsH5NOOywSCEh7oB9Puk9
pt4t7x1xsm4IFCaZB6SkLav9ypBxTpYjumbEqnE1BDNESGTCdatmrYFP/JU2VL0XBq5ZYl70
PPsnHyE/DEKTZLZvUEycJBHeIoaKr7QIuNF3gwH7mKMSPEpDpiFB9EkFkReYzQZEECdIf2i9
9Xy0O8JWS67JAs7B7LCHJD6y9OeTbIwDuz5wPGzpz9V3feIHAdawU0Zdx8H3nJf+XrGuD7e1
JciWGw6p5U4MezUvb7A7PZRuYclTWm61gBP8lYusTmVyCawMFCNjETbsmrCtmCkDM8+gkNVH
4/sZjxtegmTSY+uh4e8/nx94LlprKsVdbsR+Mlia9TFMGpqkk6GpF8khmjNM26msuX4EVxNN
OMU/SnsSR452tsQx7PTqRFM5yFLAWZIs/gqQlgJ0QR6qDJWFjAIGKkicYdC/3OZJELn17dnW
UE1xrDD1FJjB9R22FWbSrrtuSnM42MN8uQUr78gtQFkurECiz1SZyRuDbJq45jRGhTuuxPIc
wUKgNWTZJzaKCnF7dUK7qBPKkYqHzIczc71hGFCgnjOKoQ5l6BPXHqvNvO6WjwsW8QFIKFPZ
+2CFiuB3vaqbogZKS0/iuK1jR5skATR4gINDS1Y1wVOg9IIoukYAus+6+EzVuELjUG+OgCf2
KeQEsY+N4IQGtRUZlTEzGQEmGGUSa8A+9AzC4rgj7rbWFprinUvwruhPelfbbAdGtcW74gS1
ZXeSl8j1oVaLuYvCwTexg1kZHHcM+tDVOkyLDJGVtPSjcMAQdeC4eqUcaM0/wAhu7mJgLKKX
pebTSLdD4DhXssSwb/q6RTNyM9y8nSrBepY02vOCYexpBgatihUbYHp3mLVpuTg2FVnVJ/tM
plWdYpeKmc3kOqqFJ+woSwCuQEY2rpj3y7QOT5aZ3qlp98y+tFm3oOPoLqmED8IAqZDobDXv
ySHQxMUbl7jX9AKQgJjzJBNh9lO0KLQJOjvXaj0TMj3hWYymrT3UgLmtXBJ5tqx1nG9qL/AM
buozD6xr66gq71JwSFSF4bA1iwm9OBrwh35mgsQbMKuSo+ctTpXVm+wArhKaQosrdrFTrWl7
AbSYHnLkHR+3OnAdYsJMLritmZC2tIQjY72Y2HewYjx3uMJKyw6tAcMUPa/Ykt6ECdXmUDOP
wo3t4nsiYU6HIa+Xzy0OyST0PAKrj0ea2oQfp+EUVBOzPTNSXB0ojsBlfSZlQhUBcmqwm830
n8uAb05Vqr0hsgCtSQ9WCpHq49xUfSqHGa4ELDz2JEK96akuLBWxG0a0ZfHMM93VWsEo2iuC
SkGpttWKYu5MLItCCZUHnsypEuYIP1oUI7wWFDV7RkhXhYd0tXvmPtSKm12XqwUgjCtNKjfy
r36vG/QqRg7/UDBElQ8aDt/KllgpPQZegJ6QrUTqef4KL2mVeA7aZECFJHJTDMeMicgyURx3
faL4HhfKhlztos0xFLKEEnrH0hxAhhF20rbSMF8gkK0LBaWZ+QouDn1LvRxpuequUoFd/1nr
JjPfVgCaIFqjkS19HYWuYMyV0bCx80nFk0+pmi0qPlINexUJ/f5sALPWhen5lKwNtKv7CEkc
BwnaTMDgUrNuv0YJwZkDvCvXtWHk0y4Vo+6prrh2d/pW2FLESWTnOHbQgwuNJkZbzVEJjrqt
MTDinElI4YZdbY3u8a0YSuo2ddAxZCiKDy8N6jgKLaM4e2dXW0SrfcDfesaL4NbHtmn0Z5gs
lOeu2In3/KyFtbefFaSZNRIK+uOEqJAGVEx8lG/Bwwjc0EMVEua7qVjifSrXhGtmyV+hk1li
mXSyGL9HoZOhO/UakWvvuurfaTghBmxV41EXCpHm10k4MwJDMgb1OFeMZjJpr7ZACtjAcD6a
YDIztk0Y5Nj05a6UD3W7iUxKjQSgGn3VqyrlpNwdC9rOmlzY88vXJcsou6DQ/pdcAH1OEn5G
8tv504poc7z7lCY93jUYkURySLt2JpEHq2TarBhvtvlntQx1e72Osm6Oliq6rK6vfMyn4jyl
pF9haV/y5zR76YnaspvzRyswVrdWJ29Ol2Jpj0WntffmWTOLvEt7bDuUDSF/jftb2qoV75uu
rU575Ul7Dj+BN6KV37PcX6VlBNh7MvyNVLkYETJa6uMp4qTQey1cZwJOKUbcIdUKmS6W9l16
pDV7nsjGO7z6taHDthnG/JyvQJ6AjsdmiEQT63HWj8v3x/vNw8vbBbtuIL7L0pq/ECE+x510
TggDWjX7sT9jtArl9Ni1RKrsC3CaLmV5UD8rieadVITabhAT1tLhj75j+Z2wQT2XedGMygVC
ATr7FcFg+r6JwLBnEG1ev6AQHn9dHnkewONeXmD5eWvswzFYbcu8xpB4smn+WTpAg9KWZTb8
TzeUUdMzVaIdVK9PXA2kBb+bAauAUhaEbG3BqSrMTk+h24zXsPfK+IywrJT22WZFz1HUUnK/
9Wy7yAw82kbGMNcIRbIRsRbYq3J19oWyzdLpApiceaSmI+VJkLuzvtZYknAYrTWvCC/24eXH
D7Z/JN7KfdHfrc7uxP7T8qqzymlgLxJN565whDM5vAb5LN/Bkb6o+dutK4r3p0yPzVjn/VkW
RiumMx+SF9N6//zw+PR0v74Wt/nl4+cz/PwLUD6/v7BfHskD/PX6+JfN728vzx+X5+/vv5p8
QE9bGFB+X5QWFbCdde2nfZ9mB309MuEOq/HHGtBdPD+8fOdN+X6Zf5saxS9JvfCbb39cnl4v
4hnF9/kuafrz++OL9NXr2wt7X3H+8MfjnwpHiAb0Z769rrerz9PI9wzxAeAk9h0DXLC8cgEi
VTgGPYEU+Jq2nu8YBWbU89QbRTM88Hw8pd5KUHkEC1yYGlSdPeKkZUa8rV7rKU9dzydmtWBY
RtG1ahmBh13GmqRuSyJat4NeIbfHtv1uFDjxCm5OlznUJ4umaSji+Tnp+fH75cVKDAI9cmNP
r3Pbx26CAOXgqQUYGsAb6rhycNc0jVUcnqMwNBDQ4kgcHiDgAeGXcxu4Pu5NSRSWRI4LReSg
+zoT/pbEjm/w8G2ihLlJ0BBpJ8BRX2me8MEjfFdFmii2CO+VNYrMb+RGBptkAwnEqpNKuzxf
KcOcIQ6OA7MnnE0ie1cEPtDLY2DPN8aLgxMTfBPH6HQfaExUl03I2Psfl7f7Se5J6b3E86IA
lTQzh4mXfTVCMVCPP0AQ/v3CXiFb5KW67Ns8BM9V3ieWEXwJrQL2iygVtOPrG0hXdsSClsrW
ahSQw6JPQZdvuJbR6ZmSB4OHiFFeHiy8gIZ6vrz8fNeFvT6CkWfybR2QKDGW3Wz4SZdi/h/q
RvSmLfV2rSl1dJyqCfvTkTvdYqZ/vn+8/Hj8n8umP4vhkcPTVnp2v76Vo+xkHKglV02dpmFj
klxDykvOLDdyrdgkjpVtOgVdpEEUulaDQKaK8BrqnjiDpW0MFzq2yjnWEsCikpEQ21TWiFzP
MgYsY65rGdohIw6JbbjAcazf+drWpdKaoYJPA2yXyCSLDD9rwma+T2P1bUwFz5ZjiGt8k0Es
yXJlwl3m2HKyGWT4SYBBhgZamW0j+AgUvnX8dxmoG/v4x3FHQ/j4mnM9teCUJtDQT9pJS+IG
lgVQ9onrWRZAB5rDNr1D5Tlut7PwbO3mLoygaukZFFvoI56uEpNZsjB7v2zAA9zsZr9h1kd8
E+P9A8Tq/dv3zS/v9x8g4x8/Lr+uLobsYTAvkvZbJ04wy3LChq48jQJ4dhLnT90z5mDUZJmw
IdhpfxpFAdRVgWxlqQG0HBrHOfVcxzNdLrXXDzzrw79vwD0F/fnBkq9d6X/eDVgaMoaahXNG
8tzobKkvX7mpxzj2I6L1igMXVQ+gv9J/bYrAOvNd68ByrHxWxivrPZfobf5WwVR6mDBesYk2
P8HB9Qky/ySOdeA2dDBOIYlepuAElH3QzfVpLmJHPUKbp8jBL4nOX5FQY69zQd0h0QZslga5
fqi1IsU0YEJxrWrQS03N5SPKCTFghACN0QfOG/R6KChCjQ4WizEf7Fp8qlctxpDbIAtn9ptf
rMtHbksbK2EqC2wwOkIiZBwASBCG8zQgrFFjAVahH8W4vls75WN7znxjcOhNboVFE2g1s0Xh
BRqv5OWWDW291ds0I7BIswkfMTzyHYNjh0ATOjEaO3VQW4XpLgG9rZdfWN7nnJedFxqMlxNQ
fh0C9d1CA3d9RWLPwYAEBTJ/BJWn2CE4n4XcBW3Ltl6bXObSbBL2V2QnW+wxwZ35dRgtafsl
AtuyFxIuWhy4nkKjji9vH39sUvAwHx/un7/cvLxd7p83/bqgvmRcR+X92bq0gEPBb9XWUdMF
LtHVJQOKw1ql4dus9gKr1qj2ee95evkTNEChYWqswb31pYplLaMZhDirnuKAaAwiYCPbb9Wq
mjBnHz/jXapTTWCx50nzf12gJcQ1FnuMy1HiLJ43r0LV5v/2f6q3z9g9GMxi8L1l4y5//Nvj
x/2TbNhsXp6f/jlZiF/aqlJLbdXXWldVBp1yHHRLRqNJlj0hWmSbB2j728vTvAuy+f3lTdgx
arUgrr1kuPtN46Lj9qBGaC1Q/OWNCd0SzL5fkNqYsYg8X2dgDtQnVgANWck8edytFRxP431l
s/s4VtfNab8F01WXjyBWwjDQrOFyIIETGLzPHSLiWEU4E/qe0ZFD052oh2cV4V/RrOkJfrWC
f19UhfqUp5Ct4tCmnF8r2vxSHAOHEPfXmT2elLyAmiWbE8fubLRk5rb+5eXpnWVlA1a7PL28
bp4v/7hiw5/q+m7caX1RfSnDZeKF7N/uX/94fHg3s53mcloI+GOsy7YEo0p5ZIzB8xaE0zDn
WMWHk5HxJFA1lpZwRdOi2rFb+ev5GcPd1HRKG6q2iMF32xWF1AeNqyl7v6NtqmZ/N3bFDj8H
ZJ/stixrc1GzYJfScu2V0bEMtiM4s/lyNGfvdcuOIi193hf1yG+uWvpmw7Hv6KGG/xfscrg1
bVpvXowTLKVdIisuGF2o5zAR0LJyQ18fWJ7qc2j55lwSowamTqXmf7nWTGFEdLX54AQr9JBX
Wa63hwNhPJrb8XTMi647YfnjOAenFXBwSdtKfd+dj3dTF3mKLiC5OXJx532hLZEzzJoKOeWV
CuiyFFTLLbS6NlYSx1XnHNt5Y/i+ZPdu1fJYRvg8O6lA2tcGYFq6ErBNjzwH9aRb31+f7v+5
ae+fL08Gu3BS/pbBtcypK+W2KcYDe+MvJlGSI9Vyiv7sOu7tqR6PVYjRsKHA4PpG9YopqjJP
x5vcC3pX0wgLza4oh/I43kDdY1mTbWoJDFa+uEuP+3F3BzYD8fOShKnnYDdQ129K9hjDDfuR
xLGb4U0pj8emYomWnSj5lmFHqivtb3k5Vj00oC6cQPfRF6qb8rifOByGwUmiHE09IY1xkeas
oVV/A6UecnAWEmxkj82ZvVk5HsFHDOT96JWkqcq6GEa2GuHX4wlGuUHpupKytBKHsenZfZIk
Ralozv7BLPUkiKMx8HqUGeD/lDbHMhvP58F1do7nHx20fV1K2y3IhzvQY9KDTjjpXV4CY3Z1
GLlykk+UhB2woSRNdsP7+dvBCaIjsyYtdMdtM3ZbmNzcQymmF8pGGuZumFvmfiUqvEP6GVNL
1KH3mzM4qIeHkcdx6ozwpx+QYueggyNTp6mtvUV504y+d3veuVhMlETJwyGrr8AMnUsH9cat
QUYdLzpH+a1jcWpNet/r3apA99FlqdPDRJUDCNMosnSbRRuk2eATP71pMYq+O1V3YhEl0Xj7
ddijzA9Lpy1g/Ia2dYIgIxGRFagmq+XPt12Z71HRuGAUcb+asdu3x+9/uxiSP8uPlKkOm9k2
yRoAHXmiGLVqJsFHFkZqCMCavfh0KFv2DEHeDuwGyL4Yt3HgnL1xhz8exL5jNkXbHz0fvb8g
utuleTG2NA4V50hF+do6A1sH/pXwjaManwBMHPki0gwknq8DmVpaB1ppd38ojyzbWhZ6MCjs
JVKbkm/oodym4p5sFGp1aNjoKjbWsCD2dq2vC28A02MYwByr93jmT9rcJdRx8aM6RiTiPGFh
pMchtAUP6YQRfj90Nh1ZlEPgGutcQl2xq1fzygSyzwyE4tpoi8xcIfLHaZe1e836qgdqAHZb
FbSvXXLyiC7sK9fsc1/maMQ+wxUDf/Rtxy4HgNuEKkhQt+xZAh6u+fVUdjcaFUvau7znIkI9
3u5/XDb/9fP338Euz3VDHDyurGbvr0piBmA81v9OBskdmR0l7jYhnWGFwr/d/5L2ZMuNIzm+
z1co5mGjO2J7W6JO78Y88JLEEq9iUofrheG22S5F2ZZHkmPa8/UDZPLIA2l3x75UWUDezEQC
SBxRHBdAR5SWEeFn+S1Udw0EMJmr0IsjtQq7ZXRbiCDbQgTdVl5kaNsB5KnEn9s0cfM8RLdv
rQn4CmG0SqswDSJXiS8ESC8r1w2Gnr4H/5E1YTwlkJWP6vLpKnadSzTUXQKzAwOVbQ+xI9ff
xNFqrc4yASLdiJNqM8jr45qUwFmSG+R7G/3fiH0EtUFk8DWZjX806uzj4u5Cpi5ql8JVa4KN
Au43SLdTaoGeGxDczT6dnx1bbEJ5yBDmb9XI6DjGgFbB4rw8ONmHcjK1uOBBkTbOFz2GxqNb
/TIh8h0gnqpj02QgBDF8JpjLRIw8yfwTenf3P56Oj9+vg/8awAeypg5Hbt6PXcYal4++R8SY
gay73WWp1eO78BAGRvEi7MFdBCUDQ3i/9sivfpZUey1zs1HKDdCBc0g3wZGWtNVSKeG0/kkp
mPZsPKRkPa3MDT2WOF9Mp9S2l9YPqbkcH6tHSZFnqBlw3/pPJmALkNaPcDd1hvM4p/vwgtmI
dGaWhlH4Bz9NyU0TKrF/P9nFbX1um0dTOF0PAwyKFku86crQlPZ1WLZNld0lUt7CRWccJwDK
vcHPPn5nWQDLX67J5YeCmm9Uh9quyRsVm+5D6IsnjNf6Ht9MsAKhoMYa7gQFVktzrl+oKaw6
YLWk89HwAnlOaos4jskpnzhkC9dqrMK8MN5Eqd6xv0ZZ3tIwiBbw69aokxXMjWifOYHf0sFf
EJm4vhvHZpvcrsk2DuHDodeBj7nKUtSDWOqFqNpeqsuA3g9ZosG+bUJjRKsw8aLCuimWhdbI
KgYeMdO/BDTMtSR665tb26D3bizieSjld1G45woa66qvbgtD4S6hI8zBoI4tKkO9my+uR2Zx
QFy5j9K1m+rzSzF5SpkZOyv2bUGBOTYM1IbiMM12mQYDOQdPEg3FH3mukR2BsRwkxBfbxIvD
3A2cj0qtbibDj/D7dRjGTCuh7PJV5POc6vqyJPB5C8uziMDfLuHOt1EP7q25yrSvkER+kbFs
WWrgDPNOmlsbM3BHfFtaeknLSG0J5KNwozcDNyTGL4V9bzsleVi68W1qkLscc6n61lqxm3It
ka8dprxAbbgKA0okhqbAuOJMA2JCZhC49LJl6Cb6+AAInxeofkjJjLzENs1j/bAXibZsK1SN
uixS8xm0QPv2YYlblF+y26aL/o6U4PbaZbTL9BkBSWEhyb1x7BrOsLEK5RrTTYpI+db9usUr
tcoZGZESyVkUcWdmZV0OUZoYQ/wWFhlOzNrVt9sA7kkrhWNAikCEX2897QsLeJO1R/zSrss4
ZzJDRF3xXXIFlSPpGQjmVXYeIo86k6O2De8ExfLz6Xq6PxEp2LG9jafwOQjiNIVkrT5pVy+m
pKjn+ecoTovnmowUbtEo2yKUVqUhZ2s/UuXvfvUl/1QVKHw9Vdg2zqNKS6oqyqapjaFGfJO5
iVVrP1Ba1Bty0xSYUD+s0nDfOuebdsKKzwsuZ+9zqrQWhEsXCG2FrHJkyVvOyymewtZiWbmq
9msgdrHWmFbGizmfz0r1JPD5ofvnFghhioEP8P3W0XdXasyXb5jT5Trwe8OMwOR7+YeYzQ/D
IS6zZXwH3Apr39jVHB54K58MYdGVMAVlRIV9ozq0yDK+DFVZ6l1yfFnip2bABNOZsbuCS0ar
K7oCyYHSo8rD0xLdKSgqjyf/noetMxqu8w+WFCPjj2YHcwGWsBmgsonILB8hkwdq22DEiOUT
Oho7VNMsXoxG+iSUEsUCLZlu5h/NNDk4I6p1HA9GFrc2jgV4mgqUXskNLrQ6A//p7nKhpDp+
enzK7AYxRLZxBO8DOk0f4srEdPpO4Z783wFfrzIDLi8ESfwVrYwGp5cB81k0+O3tOvDiDc+L
zoLB891767Nx93Q5DX6rBy91/VA//N8A81DKLa3rp1duafeMYSmOL7+f2po4/ej57vH48mja
i3CiEPgL9aUcA3rktqClnBAEKRtrBB1B1coNVqFxFgUOQ89b10sUoVWefJD8OwdyrJseDA0b
9yj+I0Zj7ZOXCTA2ZKHlgBdJRZ/urrCiz4PV01s9iO/e63PnQcP3FOzI59NDrXjj8+0SZVWW
xrf2G2FPBvhuUI4+F4QZqycM0+4eHuvrr8Hb3dMvQLprPp7Buf7n2/Fci8tLFGkvbjSWg11U
85ynD+o+4N1gguYcmH43JkdBrhZRzBLAoytQFnCJwY3IWAgMXLY07/x1BDxVSMmqLVWcz4bq
ZhDAEbCsvt5cU16kP9DHT5QTO4eXtDVl3zi47HyxLYRmy9jcYmzOjzQPYUO2qvImJE8ZJtHM
2EEAdOiYX5zwBdtyazt4LNyxJq6rBMVMO6U1Jw0vYaXzbcQO/3buz3Qqcqul2uIrHrSStnz9
lUFUAY+TGkweatKaF3dydLxAlSwjnrhT5Pewf4wIGCpvt7JfPmSQfX4FFC7wmrvIK1zlyZ9P
Kdu7RRHpYG7VqbEQDPYhv9yW0aHcFsR+RJ3vkgoJhehbqHIw9sM3voQHKjgBp6hb3KWeMx0d
NBZzzYCThT/G0+GYxkxmasotvkYgllfwPULxAmu/BdZuxjahnXK6ZUIejPz7++V4DyIdJ9P0
ycjXiqIkzXLBefphRKXb4BcIT6jnyXqA0l3vMjU1eAcS5MW7bUUDkzyNVascfgsdGA7NMgKU
iQgpCdWFXYwmSfKzrIMyp/aKNmBd5hZlfA1uh2kLSE2s3gC+KcsxmUw8jcR1Rp3v/h8OgW0Y
nSrdJiAjLpf4PuFIG6A+H1+/12eYei/HqN+/4c/1/RTG+Jf9fKPtKJ4Fy8yXeBiG2k3U8ubb
QONXVgV1O7XMsY39PLjO3DjDyQ6bsrFLgBxrcgFLcy0SUguFdjjDr/FWOCZHhXlQUkxAZZGY
rljAwmlYOq1RlgmugsR2uzefXKS0NfgQbsZvyBryISD3gtxBHHl+luQZi0r9WqkwVJdG9LZV
iNeSXjL0E6Py1mP64VoaG35pkyjEn0tTKSFxcq/nGoN+nC71A/pS/H58fDvfaUGxsC1Utxl0
3/Jwxhe9Sn27PCM+yZJSl4pTINLQGzPt4Ni3PhwJW6RwZdvPYF+wea2zM/X4nt5KRfa5mkyW
grZ9nwAjczYb56OVzDaRnaKsUNSsEvt0V0KD/wFe00Rq2MBb0dHuBHofer5rk3VR2ytJcXL6
2E/3X3ch3uaqLSMHVKWfU70K5NaXLe/xV+X7kopflFoHY8aakEZq2zxs7KLzgsMBl++v9S++
cPx/far/qM+/BrX0a8D+dbzefze1oqJJjOCXR2NO36djR1+Ov9q6Piz36VqfX+6u9SBBoc1g
WcQg0G8oLlGvYa5nuot4RDeBt5LDj/tTvj1IMxXbR6X8JJfIKYzyfcHCryBPEEAWLOaLuQnW
A+YkfuXFmb8hQG00xYX0JILBArcuHc0S6jUssxDLedxBEXrQrtKUKmspVxHkFgn8p1g7IFiE
l2ZBQrpt8xLB2o/UtjioaiyqGMuUJBsdPo/LZWL0x1HZEsbjMtKiTS3FX7/sjdAaP6VMiH9R
4wMcyOwJo7H47Jz6Id01b9Oi1elLLfF/2aS/RyVR7IXuttS+EXJtib7aSvpoBEjZIuUNgyZu
Wo6qBqxCgr3+u/tUKtSLt+EyCpW8bAITHm7TjOlrg0a20Xh+s/B3jsUGrim2sYROAuxui2yn
Fb2Fz/UBMlhHMzjt9vpoX4KeLFsy4ySW8L+uzWOyZl8txZNyQ33gQ5iqpgXSvqMDXvcF3GQ2
lfMGhQkrI4WuNBAtJWX9fDq/s+vx/geRibKtsk2Zuwwxn/M2UXc3y4tMkCt69ZiJNPr9nDq1
45A+RD8xfL+KQ9nvC38JY0IKVnGTAw3jFag4SFEVs96j6J2uwu4VEy0BCfUVr+i65cghg8ML
dDoeOlPZX0mA2Xg2mSov5WIYfjIbO1RQhx49XWiNcbPIIQV0KODY6BWNB8lkxx32Rs2p2MGH
I4qacbSej4IDc9+9MYfVQI1kxBxpeesUQ8DscxN9kgCcGjPPp1OeMkR9ae1wsqt7D9SHj0BV
odiAF1OL61CLX5DOJ/3sp+b6NvAPFwDLzGQLVw7V03NxoJlNVLSwp9hQjpLTUSm7MHAWQ2OB
y/H0Rl8vIhNLs/3prJ4cWfouZm8wKpWxP70ZkfbborM+p45asUlU88H+nsphBUQdKWOl2tqm
DJzZjfW0RGw8Wsbj0Y251A3KUaegURj+bvXb0/Hlx0+jnznLWqy8QWOL/PaCHtCExcbgp96y
5WeDRnmocqTFWY4XaR+t6xofRDIzGYgpwjSQyOpoOWJIQ+Z6hT4lSLcI5fn4+EjR2RII9EqL
tN3gBUMZeehAq2g1I/g3jTw3pbTSYeAi85ShNQLzC9l8gKMMS42i9FFXIneAIH6nkGsbYIJh
2q4CUN52aQbwZrepz1WGfbdsz6E9QNStkmwXGi40Da4NiqCGYhe4dejm2nhb/yV1UN3ybg+9
B3wDWweTyVzO9RMlKwyPEUWV5ruxLkezDZmKPHcL7oqUN07lHVj46HLkP4YauMj46kxVsLiv
4dAypiS+yxvH8azscH//ez82fO5AnwQvBr6eMjCTCyiMmYSwGTBq02pq9AB03JDi0EtQNfI3
/kZypGTEbcC7IKc1Kw3ewwDtFvvLpkiU5ltKnGw71txiJHDr00UZD/XlYYR89FQX/IUgykpZ
xbhrHrCVMs30FVgaGsV2TEjSfe8CrK2SgkRbUtaYauFLnuvfdrzx8f58upx+vw7W76/1+Zfd
4PGtvlwVg7g2veMnRds+V0V4q7ygNAAQDqULlZXuSvhO9RsOg03QSrCijIEsERMsFvORs21n
EwEXcbk2pg9qoGb3/r4Gxvv0XF9b0tsGslAxovTL3dPpkUeaaaIr3Z9eoDmj7kfl5JZa9G/H
Xx6O51qkyFTabClRUM7Hciy+BqDHUP6T7TZRrV/v7qHYy31tnVLX23wks1Xwez6ZyR1/3ljj
So2j6YJTsfeX6/f6clRWz1pGWM/U13+dzj/4TN//XZ//exA9v9YPvGNf/RrdYIE9G5N0/082
1myVK2wdqFmfH98HfFvghop8ta9wvpjScVrtDfAWivpyekI26NPt9VnJzoST2Petb8vdj7dX
rHRBc5HLa13ff1diZtMlJH2cOKiV4c/RbO+H8+n4oJ4JAdJOetUmQe95njKsVkEyd8h4jK0y
p9LyRKxAuM1XLl54irY+jYDFYznpp9IkGvHjTXWI0wP+sf+mDibhhBJV/WmYljSh37D5kAyd
11I4HFQhO6O0CGFyqwE1d9MOnK0oYJNXSbU75zibW0aLxxdWo0HTTKGbBPfUD5rncw2pZkNt
oUqO525Y+4QaLdOSahsFLLrfDs31Io011OVHfZWM3Hq3NBXTtnGI4so9ROgFvVQ9YVGbx5+j
Q8o0QFIs9sNt92ce5fZM9Hj1ViGtmfPXsFfCzvKS3nNJGMdumh26YtT2jjdoQAh7ZLOV4mus
XeCecc/nRQjnQs5C152Hdimb+G3+0+n+h/CPRXLZ3wvYzJoFG6oNOd8pibyZqAkgJCzzE/rG
V8rkVKANuUQ0HU9GZPeImlpRo4kNM7Fi5Mi2EsYP/HA+pNcAcZonrozlUfwqn37CkzsXqTvp
HdCmpVc6AfDXrIgoHa3UrnZSJczOp4IaykPCZ5IlvVSIWs9JXJMK3dJrk/ArIXVCycFvNm7P
ktCbVxLQ9iyPUlJJKyqx09v5nnqTw0zpIDj1kxAQkNE8+TzFG4YJG5UnhQbIl8EsmsvMsFsk
u3mCOgpVn90U7qKLGZgoQd2Z/FqCjmNoSwlkqZxNPGWZqKl2Fd0o9rKDMqYqWSsSGfaWQCFK
EmyThYkqHXTsDHkVqV249gtXAza9K497Rf18utaYTIpSTIuUivAdfJIFIyqLRl+fL4/mdy7y
hEm3Lv/JxVlFE8Kh3HF+xQ3cCvJ5WxTrhNx+SErXHXeEXtL7qOhiEMH3eXnYA2csxRgRCJjq
T+z9cq2fBxns9u/H15+RXbs//n68lx4UBF/2DNIBgNnJV1av5dEItKiH/N+DtZqJ7T5reTOC
ycCWlDidDsiWXThG73y6e7g/PRt9dAviAwviJ6z0yC9L1hcCwyH/dXmu68v9HTCyX09noHtq
J00XX7eR74M8vFKjtbC4Wm1LxXHssyZ5v8f/SQ50R3w9ksMikds0ivNGvr7dPWHmO9vSk3h1
1VQDEl75cHw6vvxBD05YWwGJ38qjo2p0ssKf2oH9oHKMN7pbFiF1/4SH0ucKJz7Q8I8rSCCt
24bxOiYKg9DlV19cmUI2iCVzgckYGnCVXW2AwJGMx9MpBW+SvXczaDB5meq5v9QCRbm4mY9d
oipLplMyJ1iDb61OFVkEaBvpwx/Js4lQ+cUNIylY5XskGF/+shTfOLVqG+SJK5FuWwI3Omm4
j6m+xJ+yEZhUxyjKe2XoctAVceQibN8HRukvHYFoKpgCqKnX6ST0QzyeTFE4oc3CET93rHgv
cUcL6psDQkkdKH7r2U29xIctI2LrEI0ErqPmugncMcnaBQmIzTJfKQBKHBQOIiVTyV+Wj6SS
jUQ3BxYo7XCAdUE2B/8LxgclEwD5Y0e16HDnE/mMNQBVVETgTEsmlbgLOss8YG6m05FhysGh
OkB6pUt4XqepApg5U4UbZ+VmMbYkQEKc5+qZ//4/ysNuA86HN6OC4rAB5ajGywCZDWdVtHT9
kEfsi+OQdmGEkjc3dCZDfh+7geU88MvaTdxp4OiF2iKH3BlihlzpGyJssVBhPmaWGI5UYBCn
jgoJ010YZzlq18s2TGLPsx9sQXei1HUOB+s84MKdB1ZsXPrOZG55yEbcgo7Ux3HkAytcG6Ox
7NeCEu9MTseQ+Pl44ihv6qm7nS8sIXaLdFrORgvrFBifHfo+iqdrYkzCes0N9PTzHVwHBUsW
JGRhgVGqlBH+HooAvjKMAXVQzhVCE7hsja/V4vfxZDgGEcFVjeS5LAvwVU7X2y1no2GlVdpF
OfosACm09NZwPIe23l9V4vMo8YNQCzWPF1QRMt/VneTU5qXKDYf++gR8k8LmrBN/0qgJOka9
KyX6/F4/c38PJnIlSpr7MnbRsaQPiCBdReGMvMl8ny3kjRq5X/Vk2thaVGCURLbKx1QjLGcy
5d99WzR2Aa3YqQ9ZxIE6PjQArr0WIrwSEaq9twTzoD64a+ie4eiDF5Dty9wGpmvmTbT6SyFl
sbyt142pZ4ANpMK+lFqDNK5Z4b8puTswSyvfJvSjzHQohzyF32OVeQDIZEIFrQfE9MYpKs+V
/ek4dFwoAEV/h79vZuo0gjzDaHNqzFo2mZAxW5OZM5bVHkATpyM1ZSVAFmQSDyCXk7kzNQiR
a1ItVydwQHAAOJ3KuTMFsWhH3r09fbDy3WPiw9vzc5usWz/zTWBb7p5CHnyjgb+JKJH1P9/q
l/v37r3r32jcEgSsydQiqaVW+IR0dz2dfw2OmNnltzd835N35IflhMvO97tL/UsMxUByj0+n
18FP0A+mnGnHcZHGIbf9V2v24RU/nKGy8R/fz6fL/em1Hlw6gibRrZUtkdDy4DIHMzBRdF6i
DqvbIhM8b7/x8u14OB1a2dzmuIqa+FpACWLlauwMh9SGMmck6F1993T9LpHtFnq+DgphpP9y
vKoUfRlOJnLCaBRchyMtRamAOeQOJJuXkPKIxHjeno8Px+u79DXawSTOeCQn0FmXalDedYBM
H813KtF8kiiIStrjc10yx5J0a11uSWLBornC3ONvR/kwxpzE6YYTc0ULs+f67vJ2Fmma32CN
pDl7STSaKYIe/lap4vKQsYWSxK6F6ALhJjmQWXmjdId7csb3pCLgywjiQolZMgvYwQY3si7b
ZyxM03jESPPDB1/g441lNsENtoeRklnQxbyn6m/Mdi8B8oDdKG6THHKjLO96NJ9qv2Wdjg8k
f7RQNh2CxpSwCAjFMtdHQ96p+ns2Vdpa5Y6b0/nbBQomNBzK6pGvbOaAkBOrIb1aFoDFzs1w
RNk5q0XkVMUcMpLvPlmAjxkJzwtZlf6FuSNHzfJZ5MVwajlX7ViE2TRlH1kWSgTgeAdfeuKr
Tg7uYTKhM1E1KCl7Rpq5IyWZXJaXsDOkLnKYgTNUYSwajf7T2pM1N47j/L6/ItVP31b19MSO
cz30Ay1Rttq6Qkk+8qJKJ560azpH5did2V//AaQOHqDSW7UPuz0BYF4iQQDEoefFxb9nhoyw
Ojkxy4fCUajXcTmlFOwqKE9m+uufBOjFWbuFqeCTnJ4Z/r0SdEEtFmLO9VYAMDs9MdIEnU4u
prqPXJAlZk1kBTkxFKk1T6VGROlCEnVuTH2dnFm2qx51DcsNqzshLwyTBygPsZv7x/2bMnBQ
lzRbXVyeUyKgRGhfiK2OLy/NO6O1kaVskXmvY0Ce0GVutSOALfAqT3nFhX3dp8HJ6XRGNdDy
S9m9vOkdVtqNrEc75wZUttOL2Yk9fItKpCdGwVcTbnNqcsnVxxjCDTUWLbWZ2lC6DML2wrv9
eXh0viOhUGUBqMnkWmpUylDbiLwiqoL1Nw7RpRxM5wJ99NuRqtD88+lxb05IxuOKuqhoc7JS
ANRrLE2wK6OS0gzpvtsr8BEkJlAI7uB/9+8/4b+fn14P0qnOWTLJ/mdNkRsvRr/ShCEBPz+9
wUV8IA3Yp9NzT8GaEo43aYcFrcoolIvKFNxCJkBxpIGfFYlXhPQMk5wCLOeb6dWeFpeTYztq
zdOy+rXSWV72ryiiENLIvDg+O061t9p5Wkwvju2/LdU1WQKLNGukFVg1/CNpVSauoYkKcv3j
oJgcG0c9xfIVp/bflh28SE5MovLUtCDKv60fAezk3GFZXWZlAmpLpNXpjJzEspgen2k9XRcM
pKwzB2DzLeezDXLlI7om6reHfuEYyHYDPP11eEChHQ/SnSzjfkvqiFJiOiWLFGHVM4GJKnmz
NuShdD6hpcYi1pPMigidX4+Nn5YiIkuHlVsYhM7ggU47dOvk9CQ5dkTyD6b5v/UWVYx3//CM
pgLycEmOdsww/VCq+5EN56FFDCuZbC+PzyakBUiidFZUpSBen1l/axu4ApZtpsuRkCmd+IOa
Sf8d9VIJ8Ie6DPSWEegkLTOwMuaY2iMdDkTGudkLehBEldV1nG4nDmR67oCAC1u/lJF/J/ao
ZTic55FCThUvRs+4q01iNwegxqoCocQFcSWLTxIpZMUVOhhpgh0WoFrHBmthsBIxGTnPQnT/
gUZsYx7f6kmqcUWACBM3CwuaVZaw44xVYw8F5p2b12RMVZdGFngjR+dfTFKdJHp/H2FaR5XW
/m9j8SXKgYFYkzSLjQ1HR0gHZmVSUFCsTCWD2b52SXmWu6Py/furdMwYvlObOMXy4x2AbX0n
K0vWPMCqnxmTKZDsPFXDzoGft4kAmioXgmd0ji+dLvyVxsoYhD4qkgWJ8HxJd5orMzpaTWYL
66pPSUMWW9ZML7JU5izzoHC+JiqAo1YQPbGiWOYZb9IwPTvTmT5i84AnORr7RajnxEKU9BxT
mdOMU2iiYloNQqqufqCdncokkocJSOAP6gAiTQXoydTUlhGuNie3cl4M15Wx0foG0f0cVko7
pWHCoa1vqszUcFkEc4fNFPsXzCclr70HZaJ0OQ4ymCDITI5TpIZvYrc3mjAUiKMnMNKbZi5h
bjDjEOfQDSELRW4m0u4DHzSfDtoemq1T7ua1W26O3l5ubqUwZC+BUbsW69YWoHlh8JuxoQcE
1r6qTIR8qDBBZV4LOHQAKfOEk7glZ6Kacz1XmNolZnanDtb4SrX0BGVFRRL2aNjhbk9NYVwN
HXRIX9eZet0V7H6EMSO6fVI6oRag7do50hyUlSkNG3IKSrY/igTn11Stw/bluUC9Ochr4OrU
q71sWvBFbAZi5pGO8f0ujBJrkABpWGSdEsqTXiafgjFth6LZel4jN2dGje/5i/PLqbakCDTd
7RDSx1a6dgnXFTbODY9w/Lvpgk5o42USp/TdLq0HgSq/qbcJi59V5OKnXVLhTj01XRHV290B
I6Qk+9OWY81Q0wAtIyrRM8eIGgdQjHlN9DGAoDNtPAXXAXcygpuN4lZ1FqvcoTSR4DEMDobk
aeSbg+q2r0R8fdA2NECu6ryiQ3MRiznTYJsEtJMSUghaZkBUnsmoWxmz7iXaMEGH/SLSL9wv
otK7/HngIjvBqBLOKnSwDybbkwVLDtIo7s2F8L2B9cSizuDGhy+6G/mkito/WYVnJXx3erWH
7niEgQZxRA8ri5ORdYumvq2jL85wLFSFTt1vtIO0ecHMso0xyBMINtTzFK5gdH/aefCYgjAL
xK6oYt11xAAD416UBg6XwMyw0AO9Wa4HinkdAyuF7xYvMobJe43G+0wGg4CgQCQDkxgrCUXE
3DY6WJsjAt1rMc82zI76HvLQDg3KPzHOXAY0SK6JHoaGYIipEVtCPHKwyOQeUBS+NVLYCi5I
ve2rKK2aNWW8UZipNdKg0jYRVr+IypmRbVPBDFAES6jObXcHYG5p7RS38f7k9s3hw2IlZ73B
AYbVm2KsptrAP+MELNkwWY80SfKNcbsPxHEWciq4RiNJOSxCXvTx+8HN7Q+jDC3oocBlzP0r
QRiH62EiHcUyLqt8IRidRqWj8p8Chc/nKPg3WLHEuHkRKTMFk6J5OxE1qfA3kae/h+tQ3rjD
hatZ/fJL0L187KgOIwfV9UO3rezZefl7xKrf+Rb/H1RaT+9pCZS+vtfwW/8tPYLMKuJm7oSR
sZEpRep1/373dPSHMeL+BOdBY9m/ELROPSUfJBaNDPpxk8BgGSchqPsDeMWFkQW2M7X1Ahf+
0x3JQRNzh9vz9bhU+WEwHI6nxrBzgUlQ/BIMC0dwkR/H5YXgwy79PwSUqt3luZ5HxjofGc6Y
jOaVUOp5PKyzBcP64JidPpQx7pT821Mm15oM30OvVVogB1xWodsfw3e5LrvQWF9bVlWCHG/J
g9qWkZw51dWSZ1UcsMpSmQJgYp4FLK9qVi59h3frX/k0zkCM8QmO6cgeKfy4q2w7G8We+QQr
0XapT1vBME8Axuvs3LyEHrrU/IhOMzmpsysyDJyqNH+GAnMxc/tvzJCfoI4kt5/xQtUSwLYb
Q85GkcvAj76YTXXkwAIVGndwj6d4oSIbacGeWlcNgDbRubP9NfrZKP3YimjVCexm9bX5uFmn
wU8//zP7cfvJIbPMSS3cjLFtgXBQdVkMeP7ae6uPMEyR+5Eg3W5ysdLvFGKOme5dBX8Mkzy8
Pl1cnF7+Nvmko4M85AUWKJjpj7AG5tyPOTe8ewzcBRloaJFMR35O+TtZJL5xXej+eBZm4sWM
DOaMel+2SGbehk+9mDMv5tKDuTw58w7z8uMlv9RfMk3MzNflxfnM7hIEV9xLDeUWaPx2Mj31
fQpAWd9CZqXzdUVpVzremlcHPqHBMxrsbOcOQVch0inOP6S4/JCCjEk0CDzjnjgDX+XxRUOX
OerRVKY3RKYswFvRrFHUIQKeVDH1IjMQgPpdi9wcqcSIHEQcT7M7ESeJ59WoI1ownoz2jTVs
V27HcYAVl0Kq3zirY+quMNbBM+aqFquYzCiIFHUVaa4TYZIafxBFa7I4sPLhd2pi3myudLXD
MOCqeJ/97fsLemA4eSpXfGfc9vg36PNXNdZmktosfWGr6qDwLfEXIs4W9K1UYS1eLguKU9dR
a6NqCXR1a9eEyyaHbqTUazklKqG5CVNeyvfiSsQB9ZU6Sk1vayER3WJ7idIidUdUMFJQlImI
lkyEPIP5oEULTRgNJm4MzBxUDtEIqomggbmRDcClQYZZFnqF2ghUErSWqfctY67oyhjI32J9
hSVPCk+9s37CJezmD9akytN853m+6GhYUTDo84POkpyFRUybvHuiHfPUzRzGzCL0I/AUFNF6
C1ZhvskwnMDzwLKwTaU9cDCAjv1UpnYzxNLYM3i+psbQFeQdtr0eIgbjBgH16fbPu6d/P37+
++bh5vPPp5u758Pj59ebP/bQzuHu8+HxbX+P5//z9+c/PimWsNq/PO5/Hv24ebnbS9e0gTX8
Y8jrfnR4PGA4xeE/N21QVj+9GKtXod9JlmfGDlsEWHepXqCFGM5/UCWcreSGo18qSPL5TnC6
kP0IPR42z7ssjFYawuGD9ytKPjN2pPjKqVEaz3v00nRo/8r2EZY2O+6foHKh1FndkIscMu9N
oS9/P789Hd1iPdSnl6Mf+5/PekUwRYwGf6ZXWDPAUxfOWUgCXdJyFchKml6E+5OlkaRfA7qk
Qn/aGGAkoVuOrhu4dyTMN/hVUbjUAHRbQO3QJQUhgC2Idlu4+wPzwcOkbsK4ZPOEN13iZ5Nq
EU2mF2mdOIisTmig2738h/jk0tRkuLi1GLu+oYntkwwpI+3795+H29/+3P99dCt36/3LzfOP
v51NKkrmjCB0dwoPAgJGEoqQaBK45ppPT08nl90A2fvbD3TGvr15298d8Uc5SnRd//fh7ccR
e319uj1IVHjzduMMO9Dro3XfhIAFS5Ce2PS4yJNdGwpkryrji7ickFUiulPFr+I1MdMlAz61
7iY0l/GxWCX31R3u3F2+IJq7sMrdkAGx/XgwJ2aSiA3JeFt0HlFpjVtkQQ1xa6Y8744k320E
WT+l2+5LbbmtxcbE0FXtfihMOd8v5fLm9YdvJVPmjnNJAbdqRvbo10Dr+EOFh/v965vbmQhO
psSXQ7Db35bksfOErfh0rlueDAwlkQ/9VJPjMI7crU52NbLJ05BynO6R7odKY9je0s2RWkSR
htaJoSg8AdUDxfSU1tkHipMpmUyiPZdLNnEGDkBolgKfToibdMlOXGBKwPA9eZ67N2O1EJPL
KbFGm+LUTPOjRAdZPtLd14xTRw2gjadYX0eR1XMybrzDi2BG7Ml8Y1avshBDFgy7v4BhmtiY
8pvtKVR6YyOLhoZz9xpC3S8WkisSyX/9va+W7JqQo0qWlEwPI7buB/cHquaZDRQFaNvEhnHX
uOKMGD5otpFljvhHmxT3GUNaDPG+Xwhp9Hd6MF7PWtjFzN3jybU7Omm2d6DtE5sKBrl5vHt6
OMreH77vX7q0D11KCHsPYkXFQmTUW303CTFfWIUHdAzJwRWG4nQSQ12WiHCA3+Kq4ug4Lgw1
X5MCG0pQ7xD0EHqsJozbC9PTjC5NT9VqAHYrjjeFK8RjbRZbO/l5+P5yAxrSy9P72+GRuEqT
eN6yHQJOsQ1EtJdW590/RkPi1IEb/bkioVG9GKm14IhBBqF/4ZAu9My/u0pBPo6v+dfLMZKx
uXgFoWGihnDqEnnus+XG3ft8LX3TA8ZSHwM2aJjcOrjzYBmI46fREstsNOXz1KFovxHHVsdL
Qya16gZVnFXjQ5YUygu3qZZJ+BW2w4fk0ptAUR/PLsbn3HE/OmX42Hp/tJrFKvgvmkU1nOJf
SFRCn4LQ8AClIssGbdNLQRyRAVtRJ2hAl8RBHrAxIVwPWKVzUgvVtw0fibbiacTptmzCYERd
QSIthzKxiDLOBaTxj7pShEu6ghHR4M61baiPFvFtwF07AiKDQDk2EquSJvkiDprFlv6lhrer
07Jyl6YcLfjS6o81gElkUc+Tlqas5ybZ9vT4sgk4mrzRTYYPDurDg8UqKC/Qy3ONeGxF0VB+
AEB63pWZcnzdFRbtIdiK3gVag7GiBFeuutLNuPXacYUuzFLzh7RAvMpCca+H+0cV5nn7Y3/7
5+HxXguLkc/5+luKMHyAXXxpVMdq8XxbCaYvE/1ikmchEzuiN7s9uGuDFTpAdjS0K+IvzLSN
oPYJDYLF4VlTXA020Q7SzIGBgAAnjJIhGA0Zk2LPPAZdChPNa5tHvtvIKEkK24USghKWBfgc
I2QMm74jdJKEZx5sxqumruLE8BoUoRGpJ/AKyOp0jpXEtMniFtIDL/v4RlmHOWVGmCpMBH2B
g7TYBsuFfOEQ3NDj4WoKQC41QJMzkwPBfST1f5KbBE1c1Y3ZwImliAZYWLqtXudhXpIEDjWf
73wKvUYyGyNhYkNvaIWfx+Zgz2bWYGkTRaAXOoznrk0m0J5wbSOMfPZxJTTBsjBPtcUZUJYP
lwbFeCobjr6KKHybCtq1Ei0tKO12hlCqZdoPzeeAhtTk+HSXMwtM0W+vEax/FwVpthdUzscW
KeMyi8BupomZ+Y1bMBO02/eArpZw/sZosPoSmXdVoefBN2cw5mceJt8srvUQcw0xB8TUPfDE
YzJcyWFT5kmOMvcDBcVX9gv6B9ilhqrgiig5shAK1qz0fAkafJ6S4KjU4Kws8yAGTiaZrTBK
UDIZPsZTExSmmvyW4aABgnHJUivVhYQuwh3xGxErJ8W5UfYAUTDXhEnPvaVUyYkWSl7VhSRW
oTn9t0eQ0lZoZaNcJOrjaF1e6Rw7yQ2zOf5NssduvknrM2xvAFnmVHcmC5LrpmJ6Gnxxhbqf
1nlaxIZfM/wRhdr08ziUYZdwge2sRcnyRtUIiTWFTj77hrzI9dhbYLHGRYROGdlC53JaOhTr
pjcfpDvpR0KfXw6Pb3+qzCEP+9d714NFRu6spPpkCAEKHGAKcbpamvTfxEJkCVz6Sf+ceO6l
uKpjXn2d9cvaSohOC7NhFLJiaTuUkCeM8vQOdxnD2rWWYAyi7zxHkZcLAQT6ZkbCBv63xkzQ
JdfX1rteva3v8HP/29vhoRW/XiXprYK/uKur+mptPA4MI3/qgJs5hwZsWSQxfflrROGGiYi+
3DWqeeXxBgjnGEAZF6SdimfyITWt0S6MYYnDJCIBaypDvb5eTC6nuoMMtAb8CvOpeMqVCc5C
2TAr6etkyTEBCMY6wVlJyMoIcmogbssAvTQuU1bpbNfGyJFixOjO/g5RjhHsG3SCwJoTQWFU
OvnlLy73h7S1Hm67sxjuv7/fy3qL8ePr28s7JtPUI6QZ6nSgDehpTjRg7z6hPsPX478mFBWI
y7Eu3bo4fAatMXMGqjXm5K04kJLRSdp+aWJm0xjywxN3Z2PkjqPPtS4hfbsae0IWAZciZhjX
rWKqMcTa94aJ6Paw4+0gG843maGcSo01j8s8MzREEy65uoy5NbUmg+aaC6owmRqdin4r3cVp
EeOSv0mKjjYfdaRS4JX2InVY9Nnzj0UEtTyQH3YCxwdOTxc97+vM+h4Tu9syYbT82KKlz1SN
NwftmgZ8KmypeBYqtjXS3prmQAqZ5WlatykVPKXN1Z6WtXik7xN1VQZSOFox2DSuQqPAcsBy
MUwnqeFEOAuxxIxGznM40h/lT8+vn48wKff7s+JXy5vHe/3Sh+0boJtWbsRQG2BMWVDzrxMT
iTspr7Ee+bDkeVShmoyiX1ujw7NWiGyWmJ2mYiX9VTZXwKqBYYc5JSdKu5HqS+fS47NWLrzA
vO/ekWMTTEZtGluAkEDz6pYw+aqjd0+1bW5+XLUV523qOGWvQZ+TgZH+3+vz4RH9UGAKD+9v
+7/28B/7t9svX7780xYnRAVXMmgK3DnRXQVDG+4hF5tSxU4aUCUkw0GEAdu4NoBePZ+1TMrg
YzIwH3YAunX63J42GzWgQbp90KTb/2JdDIm6ElZMurzy4RJo6gzfhOFjKuPByEFeKS71MQUw
hYSzknsO4J/qnry7ebs5wgvyFg12jljYRj+bFxcFLBcue5bx/DFwdXKwkuOCfsoqhnYyTJHq
S8A6OmJzHAHIqxhLqZJMq8fmoKZOlL4D9LHjZQL3ROTbGoi3fqth8HqREmHPhqYTs225CWih
E7D8ikyD0aVGNKZizhzYkhIUxSAimuqE3PggqKDBnpoZWpSyYFfldvFdDKGWU8KhgwCR6V5j
qjwv7DY0dqbyatW4EcPUb6YrvgSN7uOOBEu5jRG09S2T2Je3raVTf/kCaRXNOsLsw/JNJ0Qr
MOXONtghOGa+auJSmgQ2pnqkghVaGuf03bw8ULuxzjaYNkGggUrX0NMW435O293aPLeJfUBV
OSksSm2OFevezrommSe7iiI7/yWy5Ydk7YBAqwzoV69OdUrjZV5WvkQd3UxlR83F1C5tRpJh
imAqN0W/SC0ZHPBBruibwJzSdQhKyh1+wd8PD399KT85HyYbCcMdkHZj74+3rZ/Olx+9DsSZ
SHatecF4VuClWXW9BzWYAaXEvG5Nif9lmMENop6mqVLK3DlQK6IirunGJJpX87UnEbFGqZKx
cdgn1EfQCPU8cQMYuaslA2lIPbmaAW5DNeQrC8rKhmhkHkjdUFXtX9/wgkc5LXj61/7l5l5L
7i2zVOkLotJWyeF5WM2Q2GoEzbeKIfnshu2likYjmeX8m7IjaMa+SDJjP7VudK2Q4/mo+pEp
Jb/va4w1roJcd2dWigXoDwBW90ej2/Jb6mEJkKzVv/CgMIHaKnWQJCVaX0SdYpAa01megEtI
OltwyT4s37BkFVaG04mS2fGds8w9PEuSpHGGeiZd4FxSeH8/78Q/KVH694CYoy/oCF637Xup
ZAIkUI6a8cZaddiz0zpLtGnh1We75NuwTseWQ5mIVQga9RU7qjIodroXs3p9B0RFlumWaMkV
o+FFRAJbI7XdFIBhgyd0rJikqGtPJJnEbuWLhh+PqY0ikAT8FALfDivc2H4a27nDxMYh5Rir
9u4qtdZB+v3JyENrfQpnxfCRf5lLg8daX7gIxA5cuOEJ3td9FIsUVBm9fpn8rl3mHd2vACAf
8UHlcTBOoybpM7i320rGQUpnCXs/gGQWMNhCI79FLVJ/VO5+F1tsH0DuKM1AMfoicaLJ1LPI
/wMCoyfHyOEBAA==

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--d6Gm4EdcadzBjdND--
