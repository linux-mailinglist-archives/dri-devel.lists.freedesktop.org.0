Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6282191E5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 22:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073B86E25B;
	Wed,  8 Jul 2020 20:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CA46E177;
 Wed,  8 Jul 2020 20:57:41 +0000 (UTC)
IronPort-SDR: wUrZrwZqLKNX3VAWG9btyT0q3v4oz/tiqTGSPaYK7J/c6/TgMjBYQ1ECq1xzbclnkgGFZSnF92
 62/QcsDNcC7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="232775693"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; 
 d="gz'50?scan'50,208,50";a="232775693"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:57:40 -0700
IronPort-SDR: S59gTG/A0UADSeeW+zy9XkJU8J2xrzHFJOuN7v7I0IgmSNhbwP3/8C6J34atIhDfVltC5eFoSl
 NW54UYog0nlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; 
 d="gz'50?scan'50,208,50";a="306168499"
Received: from lkp-server01.sh.intel.com (HELO 6136dd46483e) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2020 13:57:35 -0700
Received: from kbuild by 6136dd46483e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jtH8I-0000Hg-FP; Wed, 08 Jul 2020 20:57:34 +0000
Date: Thu, 9 Jul 2020 04:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/9] drm/connector: Add a drm_connector
 privacy-screen helper functions
Message-ID: <202007090426.SBr4GhzN%lkp@intel.com>
References: <20200708164335.25097-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20200708164335.25097-7-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.8-rc4]
[cannot apply to drm-intel/for-linux-next drm-tip/drm-tip next-20200708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/drm-Add-privacy-screen-class-and-connector-properties/20200709-004703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcde237b9b0eb1d19306e6f48c0a4e058907619f
config: riscv-randconfig-s031-20200708 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-37-gc9676a3b-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_register':
>> drivers/gpu/drm/drm_connector.c:533: undefined reference to `drm_privacy_screen_register_notifier'
   riscv64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_unregister':
>> drivers/gpu/drm/drm_connector.c:567: undefined reference to `drm_privacy_screen_unregister_notifier'
   riscv64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_set_link_status_property':
>> drivers/gpu/drm/drm_connector.c:2076: undefined reference to `drm_privacy_screen_get_state'
   riscv64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_privacy_screen_notifier':
>> drivers/gpu/drm/drm_connector.c:2299: undefined reference to `drm_privacy_screen_set_sw_state'
   riscv64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_tile_group_free':
>> drivers/gpu/drm/drm_connector.c:2586: undefined reference to `drm_privacy_screen_put'

vim +533 drivers/gpu/drm/drm_connector.c

52217195176115 Daniel Vetter      2016-08-12  495  
52217195176115 Daniel Vetter      2016-08-12  496  /**
52217195176115 Daniel Vetter      2016-08-12  497   * drm_connector_register - register a connector
52217195176115 Daniel Vetter      2016-08-12  498   * @connector: the connector to register
52217195176115 Daniel Vetter      2016-08-12  499   *
69b22f51e6644b Daniel Vetter      2019-09-17  500   * Register userspace interfaces for a connector. Only call this for connectors
69b22f51e6644b Daniel Vetter      2019-09-17  501   * which can be hotplugged after drm_dev_register() has been called already,
69b22f51e6644b Daniel Vetter      2019-09-17  502   * e.g. DP MST connectors. All other connectors will be registered automatically
69b22f51e6644b Daniel Vetter      2019-09-17  503   * when calling drm_dev_register().
52217195176115 Daniel Vetter      2016-08-12  504   *
52217195176115 Daniel Vetter      2016-08-12  505   * Returns:
52217195176115 Daniel Vetter      2016-08-12  506   * Zero on success, error code on failure.
52217195176115 Daniel Vetter      2016-08-12  507   */
52217195176115 Daniel Vetter      2016-08-12  508  int drm_connector_register(struct drm_connector *connector)
52217195176115 Daniel Vetter      2016-08-12  509  {
e73ab00e9a0f17 Daniel Vetter      2016-12-18  510  	int ret = 0;
52217195176115 Daniel Vetter      2016-08-12  511  
e6e7b48b295afa Daniel Vetter      2017-01-12  512  	if (!connector->dev->registered)
e6e7b48b295afa Daniel Vetter      2017-01-12  513  		return 0;
e6e7b48b295afa Daniel Vetter      2017-01-12  514  
e73ab00e9a0f17 Daniel Vetter      2016-12-18  515  	mutex_lock(&connector->mutex);
39b50c603878f4 Lyude Paul         2018-10-16  516  	if (connector->registration_state != DRM_CONNECTOR_INITIALIZING)
e73ab00e9a0f17 Daniel Vetter      2016-12-18  517  		goto unlock;
52217195176115 Daniel Vetter      2016-08-12  518  
52217195176115 Daniel Vetter      2016-08-12  519  	ret = drm_sysfs_connector_add(connector);
52217195176115 Daniel Vetter      2016-08-12  520  	if (ret)
e73ab00e9a0f17 Daniel Vetter      2016-12-18  521  		goto unlock;
52217195176115 Daniel Vetter      2016-08-12  522  
b792e64021ecde Greg Kroah-Hartman 2019-06-13  523  	drm_debugfs_connector_add(connector);
52217195176115 Daniel Vetter      2016-08-12  524  
52217195176115 Daniel Vetter      2016-08-12  525  	if (connector->funcs->late_register) {
52217195176115 Daniel Vetter      2016-08-12  526  		ret = connector->funcs->late_register(connector);
52217195176115 Daniel Vetter      2016-08-12  527  		if (ret)
52217195176115 Daniel Vetter      2016-08-12  528  			goto err_debugfs;
52217195176115 Daniel Vetter      2016-08-12  529  	}
52217195176115 Daniel Vetter      2016-08-12  530  
52217195176115 Daniel Vetter      2016-08-12  531  	drm_mode_object_register(connector->dev, &connector->base);
52217195176115 Daniel Vetter      2016-08-12  532  
39b50c603878f4 Lyude Paul         2018-10-16 @533  	connector->registration_state = DRM_CONNECTOR_REGISTERED;
968d81a64a883a Jeykumar Sankaran  2020-06-02  534  
968d81a64a883a Jeykumar Sankaran  2020-06-02  535  	/* Let userspace know we have a new connector */
968d81a64a883a Jeykumar Sankaran  2020-06-02  536  	drm_sysfs_hotplug_event(connector->dev);
968d81a64a883a Jeykumar Sankaran  2020-06-02  537  
3823adf8dc676e Hans de Goede      2020-07-08  538  	if (connector->privacy_screen)
3823adf8dc676e Hans de Goede      2020-07-08  539  		drm_privacy_screen_register_notifier(connector->privacy_screen,
3823adf8dc676e Hans de Goede      2020-07-08  540  					   &connector->privacy_screen_notifier);
3823adf8dc676e Hans de Goede      2020-07-08  541  
e73ab00e9a0f17 Daniel Vetter      2016-12-18  542  	goto unlock;
52217195176115 Daniel Vetter      2016-08-12  543  
52217195176115 Daniel Vetter      2016-08-12  544  err_debugfs:
52217195176115 Daniel Vetter      2016-08-12  545  	drm_debugfs_connector_remove(connector);
52217195176115 Daniel Vetter      2016-08-12  546  	drm_sysfs_connector_remove(connector);
e73ab00e9a0f17 Daniel Vetter      2016-12-18  547  unlock:
e73ab00e9a0f17 Daniel Vetter      2016-12-18  548  	mutex_unlock(&connector->mutex);
52217195176115 Daniel Vetter      2016-08-12  549  	return ret;
52217195176115 Daniel Vetter      2016-08-12  550  }
52217195176115 Daniel Vetter      2016-08-12  551  EXPORT_SYMBOL(drm_connector_register);
52217195176115 Daniel Vetter      2016-08-12  552  
52217195176115 Daniel Vetter      2016-08-12  553  /**
52217195176115 Daniel Vetter      2016-08-12  554   * drm_connector_unregister - unregister a connector
52217195176115 Daniel Vetter      2016-08-12  555   * @connector: the connector to unregister
52217195176115 Daniel Vetter      2016-08-12  556   *
69b22f51e6644b Daniel Vetter      2019-09-17  557   * Unregister userspace interfaces for a connector. Only call this for
69b22f51e6644b Daniel Vetter      2019-09-17  558   * connectors which have registered explicitly by calling drm_dev_register(),
69b22f51e6644b Daniel Vetter      2019-09-17  559   * since connectors are unregistered automatically when drm_dev_unregister() is
69b22f51e6644b Daniel Vetter      2019-09-17  560   * called.
52217195176115 Daniel Vetter      2016-08-12  561   */
52217195176115 Daniel Vetter      2016-08-12  562  void drm_connector_unregister(struct drm_connector *connector)
52217195176115 Daniel Vetter      2016-08-12  563  {
e73ab00e9a0f17 Daniel Vetter      2016-12-18  564  	mutex_lock(&connector->mutex);
39b50c603878f4 Lyude Paul         2018-10-16  565  	if (connector->registration_state != DRM_CONNECTOR_REGISTERED) {
e73ab00e9a0f17 Daniel Vetter      2016-12-18  566  		mutex_unlock(&connector->mutex);
52217195176115 Daniel Vetter      2016-08-12 @567  		return;
e73ab00e9a0f17 Daniel Vetter      2016-12-18  568  	}
52217195176115 Daniel Vetter      2016-08-12  569  
3823adf8dc676e Hans de Goede      2020-07-08  570  	if (connector->privacy_screen)
3823adf8dc676e Hans de Goede      2020-07-08  571  		drm_privacy_screen_unregister_notifier(
3823adf8dc676e Hans de Goede      2020-07-08  572  					connector->privacy_screen,
3823adf8dc676e Hans de Goede      2020-07-08  573  					&connector->privacy_screen_notifier);
3823adf8dc676e Hans de Goede      2020-07-08  574  
52217195176115 Daniel Vetter      2016-08-12  575  	if (connector->funcs->early_unregister)
52217195176115 Daniel Vetter      2016-08-12  576  		connector->funcs->early_unregister(connector);
52217195176115 Daniel Vetter      2016-08-12  577  
52217195176115 Daniel Vetter      2016-08-12  578  	drm_sysfs_connector_remove(connector);
52217195176115 Daniel Vetter      2016-08-12  579  	drm_debugfs_connector_remove(connector);
52217195176115 Daniel Vetter      2016-08-12  580  
39b50c603878f4 Lyude Paul         2018-10-16  581  	connector->registration_state = DRM_CONNECTOR_UNREGISTERED;
e73ab00e9a0f17 Daniel Vetter      2016-12-18  582  	mutex_unlock(&connector->mutex);
52217195176115 Daniel Vetter      2016-08-12  583  }
52217195176115 Daniel Vetter      2016-08-12  584  EXPORT_SYMBOL(drm_connector_unregister);
52217195176115 Daniel Vetter      2016-08-12  585  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--opJtzjQTFsWo+cga
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--opJtzjQTFsWo+cga--
