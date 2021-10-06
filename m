Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4083C424A76
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 01:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F5D6E57E;
	Wed,  6 Oct 2021 23:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742C46E56D;
 Wed,  6 Oct 2021 23:20:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="224893731"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
 d="gz'50?scan'50,208,50";a="224893731"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 16:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
 d="gz'50?scan'50,208,50";a="589928180"
Received: from lkp-server01.sh.intel.com (HELO 72c3bd3cf19c) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 06 Oct 2021 16:20:20 -0700
Received: from kbuild by 72c3bd3cf19c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mYGCy-0006zD-6p; Wed, 06 Oct 2021 23:20:20 +0000
Date: Thu, 7 Oct 2021 07:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 33/34] component: Remove component_master_ops and
 friends
Message-ID: <202110070715.67F9LH4p-lkp@intel.com>
References: <20211006193819.2654854-34-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20211006193819.2654854-34-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I love your patch! Yet something to improve:

[auto build test ERROR on e4e737bb5c170df6135a127739a9e6148ee3da82]

url:    https://github.com/0day-ci/linux/commits/Stephen-Boyd/component-Make-into-an-aggregate-bus/20211007-034200
base:   e4e737bb5c170df6135a127739a9e6148ee3da82
config: hexagon-randconfig-r045-20211006 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c0039de2953d15815448b4b3c3bafb45607781e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b2ecd8598795ffcc3d4e766c4c4cc93865f3ff33
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephen-Boyd/component-Make-into-an-aggregate-bus/20211007-034200
        git checkout b2ecd8598795ffcc3d4e766c4c4cc93865f3ff33
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/component.c:412:15: error: no member named 'ops' in 'struct aggregate_device'
           return adev->ops->bind(adev->parent);
                  ~~~~  ^
   drivers/base/component.c:417:8: error: no member named 'ops' in 'struct aggregate_device'
           adev->ops->unbind(adev->parent);
           ~~~~  ^
   drivers/base/component.c:488:13: error: incompatible function pointer types initializing 'void (*)(struct device *)' with an expression of type 'int (struct device *)' [-Werror,-Wincompatible-function-pointer-types]
           .remove         = aggregate_driver_remove,
                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/component.c:540:8: error: no member named 'ops' in 'struct aggregate_device'
           adev->ops = ops;
           ~~~~  ^
>> drivers/base/component.c:540:14: error: use of undeclared identifier 'ops'
           adev->ops = ops;
                       ^
>> drivers/base/component.c:572:50: error: too many arguments to function call, expected 3, have 4
           adev = aggregate_device_add(parent, NULL, adrv, match);
                  ~~~~~~~~~~~~~~~~~~~~                     ^~~~~
   drivers/base/component.c:514:33: note: 'aggregate_device_add' declared here
   static struct aggregate_device *aggregate_device_add(struct device *parent,
                                   ^
>> drivers/base/component.c:599:34: error: too many arguments to function call, expected single argument 'parent', have 2 arguments
           adev = __aggregate_find(parent, NULL);
                  ~~~~~~~~~~~~~~~~         ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/base/component.c:493:33: note: '__aggregate_find' declared here
   static struct aggregate_device *__aggregate_find(struct device *parent)
                                   ^
   drivers/base/component.c:645:34: error: too many arguments to function call, expected single argument 'parent', have 2 arguments
           adev = __aggregate_find(parent, NULL);
                  ~~~~~~~~~~~~~~~~         ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/base/component.c:493:33: note: '__aggregate_find' declared here
   static struct aggregate_device *__aggregate_find(struct device *parent)
                                   ^
   drivers/base/component.c:734:34: error: too many arguments to function call, expected single argument 'parent', have 2 arguments
           adev = __aggregate_find(parent, NULL);
                  ~~~~~~~~~~~~~~~~         ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/base/component.c:493:33: note: '__aggregate_find' declared here
   static struct aggregate_device *__aggregate_find(struct device *parent)
                                   ^
   9 errors generated.


vim +412 drivers/base/component.c

b7f12127fd97fe Stephen Boyd 2021-10-06  408  
b7f12127fd97fe Stephen Boyd 2021-10-06  409  /* TODO: Remove once all aggregate drivers use component_aggregate_register() */
b7f12127fd97fe Stephen Boyd 2021-10-06  410  static int component_probe_bind(struct aggregate_device *adev)
b7f12127fd97fe Stephen Boyd 2021-10-06  411  {
b7f12127fd97fe Stephen Boyd 2021-10-06 @412  	return adev->ops->bind(adev->parent);
b7f12127fd97fe Stephen Boyd 2021-10-06  413  }
b7f12127fd97fe Stephen Boyd 2021-10-06  414  
b7f12127fd97fe Stephen Boyd 2021-10-06  415  static void component_remove_unbind(struct aggregate_device *adev)
b7f12127fd97fe Stephen Boyd 2021-10-06  416  {
b7f12127fd97fe Stephen Boyd 2021-10-06  417  	adev->ops->unbind(adev->parent);
b7f12127fd97fe Stephen Boyd 2021-10-06  418  }
b7f12127fd97fe Stephen Boyd 2021-10-06  419  
b7f12127fd97fe Stephen Boyd 2021-10-06  420  static int aggregate_driver_probe(struct device *dev)
b7f12127fd97fe Stephen Boyd 2021-10-06  421  {
b7f12127fd97fe Stephen Boyd 2021-10-06  422  	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
b7f12127fd97fe Stephen Boyd 2021-10-06  423  	struct aggregate_device *adev = to_aggregate_device(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  424  	bool modern = adrv->probe != component_probe_bind;
b7f12127fd97fe Stephen Boyd 2021-10-06  425  	int ret;
b7f12127fd97fe Stephen Boyd 2021-10-06  426  
b7f12127fd97fe Stephen Boyd 2021-10-06  427  	/* Only do runtime PM when drivers migrate */
b7f12127fd97fe Stephen Boyd 2021-10-06  428  	if (modern) {
b7f12127fd97fe Stephen Boyd 2021-10-06  429  		pm_runtime_get_noresume(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  430  		pm_runtime_set_active(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  431  		pm_runtime_enable(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  432  	}
b7f12127fd97fe Stephen Boyd 2021-10-06  433  
b7f12127fd97fe Stephen Boyd 2021-10-06  434  	mutex_lock(&component_mutex);
b7f12127fd97fe Stephen Boyd 2021-10-06  435  	if (devres_open_group(adev->parent, NULL, GFP_KERNEL)) {
b7f12127fd97fe Stephen Boyd 2021-10-06  436  		ret = adrv->probe(adev);
b7f12127fd97fe Stephen Boyd 2021-10-06  437  		if (ret)
b7f12127fd97fe Stephen Boyd 2021-10-06  438  			devres_release_group(adev->parent, NULL);
b7f12127fd97fe Stephen Boyd 2021-10-06  439  	} else {
b7f12127fd97fe Stephen Boyd 2021-10-06  440  		ret = -ENOMEM;
b7f12127fd97fe Stephen Boyd 2021-10-06  441  	}
b7f12127fd97fe Stephen Boyd 2021-10-06  442  	mutex_unlock(&component_mutex);
b7f12127fd97fe Stephen Boyd 2021-10-06  443  
b7f12127fd97fe Stephen Boyd 2021-10-06  444  	if (ret && modern) {
b7f12127fd97fe Stephen Boyd 2021-10-06  445  		pm_runtime_disable(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  446  		pm_runtime_set_suspended(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  447  		pm_runtime_put_noidle(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  448  	}
b7f12127fd97fe Stephen Boyd 2021-10-06  449  
b7f12127fd97fe Stephen Boyd 2021-10-06  450  	return ret;
b7f12127fd97fe Stephen Boyd 2021-10-06  451  }
b7f12127fd97fe Stephen Boyd 2021-10-06  452  
b7f12127fd97fe Stephen Boyd 2021-10-06  453  static int aggregate_driver_remove(struct device *dev)
b7f12127fd97fe Stephen Boyd 2021-10-06  454  {
b7f12127fd97fe Stephen Boyd 2021-10-06  455  	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
b7f12127fd97fe Stephen Boyd 2021-10-06  456  	struct aggregate_device *adev = to_aggregate_device(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  457  	bool modern = adrv->remove != component_remove_unbind;
b7f12127fd97fe Stephen Boyd 2021-10-06  458  
b7f12127fd97fe Stephen Boyd 2021-10-06  459  	/* Only do runtime PM when drivers migrate */
b7f12127fd97fe Stephen Boyd 2021-10-06  460  	if (modern)
b7f12127fd97fe Stephen Boyd 2021-10-06  461  		pm_runtime_get_sync(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  462  	adrv->remove(to_aggregate_device(dev));
b7f12127fd97fe Stephen Boyd 2021-10-06  463  	devres_release_group(adev->parent, NULL);
b7f12127fd97fe Stephen Boyd 2021-10-06  464  	if (!modern)
b7f12127fd97fe Stephen Boyd 2021-10-06  465  		return 0;
b7f12127fd97fe Stephen Boyd 2021-10-06  466  
b7f12127fd97fe Stephen Boyd 2021-10-06  467  	pm_runtime_put_noidle(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  468  
b7f12127fd97fe Stephen Boyd 2021-10-06  469  	pm_runtime_disable(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  470  	pm_runtime_set_suspended(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  471  	pm_runtime_put_noidle(dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  472  
b7f12127fd97fe Stephen Boyd 2021-10-06  473  	return 0;
b7f12127fd97fe Stephen Boyd 2021-10-06  474  }
b7f12127fd97fe Stephen Boyd 2021-10-06  475  
b7f12127fd97fe Stephen Boyd 2021-10-06  476  static void aggregate_driver_shutdown(struct device *dev)
b7f12127fd97fe Stephen Boyd 2021-10-06  477  {
b7f12127fd97fe Stephen Boyd 2021-10-06  478  	const struct aggregate_driver *adrv = to_aggregate_driver(dev->driver);
b7f12127fd97fe Stephen Boyd 2021-10-06  479  
b7f12127fd97fe Stephen Boyd 2021-10-06  480  	if (adrv && adrv->shutdown)
b7f12127fd97fe Stephen Boyd 2021-10-06  481  		adrv->shutdown(to_aggregate_device(dev));
b7f12127fd97fe Stephen Boyd 2021-10-06  482  }
b7f12127fd97fe Stephen Boyd 2021-10-06  483  
b7f12127fd97fe Stephen Boyd 2021-10-06  484  static struct bus_type aggregate_bus_type = {
b7f12127fd97fe Stephen Boyd 2021-10-06  485  	.name		= "aggregate",
b7f12127fd97fe Stephen Boyd 2021-10-06  486  	.match		= aggregate_device_match,
b7f12127fd97fe Stephen Boyd 2021-10-06  487  	.probe		= aggregate_driver_probe,
b7f12127fd97fe Stephen Boyd 2021-10-06  488  	.remove		= aggregate_driver_remove,
b7f12127fd97fe Stephen Boyd 2021-10-06  489  	.shutdown	= aggregate_driver_shutdown,
b7f12127fd97fe Stephen Boyd 2021-10-06  490  };
b7f12127fd97fe Stephen Boyd 2021-10-06  491  
b7f12127fd97fe Stephen Boyd 2021-10-06  492  /* Callers take ownership of return value, should call put_device() */
b2ecd8598795ff Stephen Boyd 2021-10-06  493  static struct aggregate_device *__aggregate_find(struct device *parent)
b7f12127fd97fe Stephen Boyd 2021-10-06  494  {
b7f12127fd97fe Stephen Boyd 2021-10-06  495  	struct device *dev;
b7f12127fd97fe Stephen Boyd 2021-10-06  496  
b2ecd8598795ff Stephen Boyd 2021-10-06  497  	dev = bus_find_device(&aggregate_bus_type, NULL, parent,
b7f12127fd97fe Stephen Boyd 2021-10-06  498  			      aggregate_bus_find_match);
b7f12127fd97fe Stephen Boyd 2021-10-06  499  
b7f12127fd97fe Stephen Boyd 2021-10-06  500  	return dev ? to_aggregate_device(dev) : NULL;
b7f12127fd97fe Stephen Boyd 2021-10-06  501  }
b7f12127fd97fe Stephen Boyd 2021-10-06  502  
b7f12127fd97fe Stephen Boyd 2021-10-06  503  static int aggregate_driver_register(struct aggregate_driver *adrv)
b7f12127fd97fe Stephen Boyd 2021-10-06  504  {
b7f12127fd97fe Stephen Boyd 2021-10-06  505  	adrv->driver.bus = &aggregate_bus_type;
b7f12127fd97fe Stephen Boyd 2021-10-06  506  	return driver_register(&adrv->driver);
b7f12127fd97fe Stephen Boyd 2021-10-06  507  }
b7f12127fd97fe Stephen Boyd 2021-10-06  508  
b7f12127fd97fe Stephen Boyd 2021-10-06  509  static void aggregate_driver_unregister(struct aggregate_driver *adrv)
b7f12127fd97fe Stephen Boyd 2021-10-06  510  {
b7f12127fd97fe Stephen Boyd 2021-10-06  511  	driver_unregister(&adrv->driver);
b7f12127fd97fe Stephen Boyd 2021-10-06  512  }
b7f12127fd97fe Stephen Boyd 2021-10-06  513  
b7f12127fd97fe Stephen Boyd 2021-10-06  514  static struct aggregate_device *aggregate_device_add(struct device *parent,
b2ecd8598795ff Stephen Boyd 2021-10-06  515  	struct aggregate_driver *adrv,
6955b58254c2bc Russell King 2014-04-19  516  	struct component_match *match)
2a41e6070dd7ef Russell King 2014-01-10  517  {
0b7b1dfac42590 Stephen Boyd 2021-10-06  518  	struct aggregate_device *adev;
0b7b1dfac42590 Stephen Boyd 2021-10-06  519  	int ret, id;
2a41e6070dd7ef Russell King 2014-01-10  520  
6955b58254c2bc Russell King 2014-04-19  521  	/* Reallocate the match array for its true size */
82769cc671b6dd Stephen Boyd 2021-05-19  522  	ret = component_match_realloc(match, match->num);
ce657b1cddf1f8 Russell King 2015-11-17  523  	if (ret)
b7f12127fd97fe Stephen Boyd 2021-10-06  524  		return ERR_PTR(ret);
6955b58254c2bc Russell King 2014-04-19  525  
0b7b1dfac42590 Stephen Boyd 2021-10-06  526  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
0b7b1dfac42590 Stephen Boyd 2021-10-06  527  	if (!adev)
b7f12127fd97fe Stephen Boyd 2021-10-06  528  		return ERR_PTR(-ENOMEM);
2a41e6070dd7ef Russell King 2014-01-10  529  
0b7b1dfac42590 Stephen Boyd 2021-10-06  530  	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
0b7b1dfac42590 Stephen Boyd 2021-10-06  531  	if (id < 0) {
0b7b1dfac42590 Stephen Boyd 2021-10-06  532  		kfree(adev);
b7f12127fd97fe Stephen Boyd 2021-10-06  533  		return ERR_PTR(id);
0b7b1dfac42590 Stephen Boyd 2021-10-06  534  	}
0b7b1dfac42590 Stephen Boyd 2021-10-06  535  
0b7b1dfac42590 Stephen Boyd 2021-10-06  536  	adev->id = id;
0b7b1dfac42590 Stephen Boyd 2021-10-06  537  	adev->parent = parent;
b7f12127fd97fe Stephen Boyd 2021-10-06  538  	adev->dev.bus = &aggregate_bus_type;
b7f12127fd97fe Stephen Boyd 2021-10-06  539  	adev->dev.release = aggregate_device_release;
0b7b1dfac42590 Stephen Boyd 2021-10-06 @540  	adev->ops = ops;
0b7b1dfac42590 Stephen Boyd 2021-10-06  541  	adev->match = match;
b7f12127fd97fe Stephen Boyd 2021-10-06  542  	adev->adrv = adrv;
0b7b1dfac42590 Stephen Boyd 2021-10-06  543  	dev_set_name(&adev->dev, "aggregate%d", id);
2a41e6070dd7ef Russell King 2014-01-10  544  
b7f12127fd97fe Stephen Boyd 2021-10-06  545  	ret = device_register(&adev->dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  546  	if (ret) {
b7f12127fd97fe Stephen Boyd 2021-10-06  547  		put_device(&adev->dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  548  		return ERR_PTR(ret);
b7f12127fd97fe Stephen Boyd 2021-10-06  549  	}
b7f12127fd97fe Stephen Boyd 2021-10-06  550  
0b7b1dfac42590 Stephen Boyd 2021-10-06  551  	component_master_debugfs_add(adev);
2a41e6070dd7ef Russell King 2014-01-10  552  
b7f12127fd97fe Stephen Boyd 2021-10-06  553  	return adev;
b7f12127fd97fe Stephen Boyd 2021-10-06  554  }
2a41e6070dd7ef Russell King 2014-01-10  555  
b7f12127fd97fe Stephen Boyd 2021-10-06  556  /**
b7f12127fd97fe Stephen Boyd 2021-10-06  557   * component_aggregate_register - register an aggregate driver
b7f12127fd97fe Stephen Boyd 2021-10-06  558   * @parent: parent device of the aggregate driver
b7f12127fd97fe Stephen Boyd 2021-10-06  559   * @adrv: aggregate driver to register
b7f12127fd97fe Stephen Boyd 2021-10-06  560   *
b7f12127fd97fe Stephen Boyd 2021-10-06  561   * Registers a new aggregate driver consisting of the components added to @adrv.match
b7f12127fd97fe Stephen Boyd 2021-10-06  562   * by calling one of the component_match_add() functions. Once all components in
b7f12127fd97fe Stephen Boyd 2021-10-06  563   * @match are available, the aggregate driver will be assembled by calling
b7f12127fd97fe Stephen Boyd 2021-10-06  564   * &adrv.bind. Must be unregistered by calling component_aggregate_unregister().
b7f12127fd97fe Stephen Boyd 2021-10-06  565   */
b7f12127fd97fe Stephen Boyd 2021-10-06  566  int component_aggregate_register(struct device *parent,
b7f12127fd97fe Stephen Boyd 2021-10-06  567  	struct aggregate_driver *adrv, struct component_match *match)
b7f12127fd97fe Stephen Boyd 2021-10-06  568  {
b7f12127fd97fe Stephen Boyd 2021-10-06  569  	struct aggregate_device *adev;
b7f12127fd97fe Stephen Boyd 2021-10-06  570  	int ret;
b7f12127fd97fe Stephen Boyd 2021-10-06  571  
b7f12127fd97fe Stephen Boyd 2021-10-06 @572  	adev = aggregate_device_add(parent, NULL, adrv, match);
b7f12127fd97fe Stephen Boyd 2021-10-06  573  	if (IS_ERR(adev))
b7f12127fd97fe Stephen Boyd 2021-10-06  574  		return PTR_ERR(adev);
b7f12127fd97fe Stephen Boyd 2021-10-06  575  
b7f12127fd97fe Stephen Boyd 2021-10-06  576  	ret = aggregate_driver_register(adrv);
b7f12127fd97fe Stephen Boyd 2021-10-06  577  	if (ret)
b7f12127fd97fe Stephen Boyd 2021-10-06  578  		put_device(&adev->dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  579  
b7f12127fd97fe Stephen Boyd 2021-10-06  580  	return ret;
b7f12127fd97fe Stephen Boyd 2021-10-06  581  }
b7f12127fd97fe Stephen Boyd 2021-10-06  582  EXPORT_SYMBOL_GPL(component_aggregate_register);
b7f12127fd97fe Stephen Boyd 2021-10-06  583  
b7f12127fd97fe Stephen Boyd 2021-10-06  584  /**
b7f12127fd97fe Stephen Boyd 2021-10-06  585   * component_aggregate_unregister - unregister an aggregate driver
b7f12127fd97fe Stephen Boyd 2021-10-06  586   * @parent: parent device of the aggregate driver
b7f12127fd97fe Stephen Boyd 2021-10-06  587   * @adrv: registered aggregate driver
b7f12127fd97fe Stephen Boyd 2021-10-06  588   *
b7f12127fd97fe Stephen Boyd 2021-10-06  589   * Unregisters an aggregate driver registered with
b7f12127fd97fe Stephen Boyd 2021-10-06  590   * component_aggregate_register(). If necessary the aggregate driver is first
b7f12127fd97fe Stephen Boyd 2021-10-06  591   * disassembled.
b7f12127fd97fe Stephen Boyd 2021-10-06  592   */
b7f12127fd97fe Stephen Boyd 2021-10-06  593  void component_aggregate_unregister(struct device *parent,
b7f12127fd97fe Stephen Boyd 2021-10-06  594  	struct aggregate_driver *adrv)
b7f12127fd97fe Stephen Boyd 2021-10-06  595  {
b7f12127fd97fe Stephen Boyd 2021-10-06  596  	struct aggregate_device *adev;
b7f12127fd97fe Stephen Boyd 2021-10-06  597  
b7f12127fd97fe Stephen Boyd 2021-10-06  598  	mutex_lock(&component_mutex);
b7f12127fd97fe Stephen Boyd 2021-10-06 @599  	adev = __aggregate_find(parent, NULL);
b7f12127fd97fe Stephen Boyd 2021-10-06  600  	mutex_unlock(&component_mutex);
b7f12127fd97fe Stephen Boyd 2021-10-06  601  
b7f12127fd97fe Stephen Boyd 2021-10-06  602  	if (adev)
b7f12127fd97fe Stephen Boyd 2021-10-06  603  		device_unregister(&adev->dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  604  	put_device(&adev->dev);
b7f12127fd97fe Stephen Boyd 2021-10-06  605  
b7f12127fd97fe Stephen Boyd 2021-10-06  606  	aggregate_driver_unregister(adrv);
b7f12127fd97fe Stephen Boyd 2021-10-06  607  }
b7f12127fd97fe Stephen Boyd 2021-10-06  608  EXPORT_SYMBOL_GPL(component_aggregate_unregister);
b7f12127fd97fe Stephen Boyd 2021-10-06  609  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--uAKRQypu60I7Lcqm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
KcVvlaqTwzmUXQ9C9a71/wG62HlQgDMCAA==

--uAKRQypu60I7Lcqm--
