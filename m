Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B3247BFE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 03:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F42898BF;
	Tue, 18 Aug 2020 01:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057A898BF;
 Tue, 18 Aug 2020 01:49:46 +0000 (UTC)
IronPort-SDR: BTzXwo3mNsfeLqqBOIu1IjQuiQ78Xj0gESDqEbC5SBZ/3Dxm3wrx5I8K8w15VG5MzixjUNLdgn
 zsTq34PD+KIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152233538"
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; 
 d="gz'50?scan'50,208,50";a="152233538"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 18:49:46 -0700
IronPort-SDR: vnOtqsUlDXwCAuZ89i9mWJgfWqlLbkuFMzfM5SpOg1sFlY3Hsz0LeZnUwdpAByl7b5DrU2hRA/
 05DLe/gljBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; 
 d="gz'50?scan'50,208,50";a="279273654"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2020 18:49:43 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k7qkx-0000wo-0F; Tue, 18 Aug 2020 01:49:43 +0000
Date: Tue, 18 Aug 2020 09:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [drm-tip:drm-tip 5/10] drivers/gpu/drm/qxl/qxl_display.c:187:2:
 error: implicit declaration of function 'drm_drv_uses_atomic_modeset'
Message-ID: <202008180951.gAsSfPC9%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   d6cb40f33c1b213c96924b8fb68db613862fc2c5
commit: a012dc947ede8d940b6f79de96429af04a9360c4 [5/10] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: x86_64-randconfig-a016-20200817 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project de71b46a519db014ce906a39f8a0e1b235ef1568)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout a012dc947ede8d940b6f79de96429af04a9360c4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/qxl/qxl_display.c:187:2: error: implicit declaration of function 'drm_drv_uses_atomic_modeset' [-Werror,-Wimplicit-function-declaration]
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
           ^
   include/drm/drm_modeset_lock.h:167:7: note: expanded from macro 'DRM_MODESET_LOCK_ALL_BEGIN'
           if (!drm_drv_uses_atomic_modeset(dev))                          \
                ^
>> drivers/gpu/drm/qxl/qxl_display.c:189:35: error: too few arguments provided to function-like macro invocation
           DRM_MODESET_LOCK_ALL_END(ctx, ret);
                                            ^
   include/drm/drm_modeset_lock.h:194:9: note: macro 'DRM_MODESET_LOCK_ALL_END' defined here
   #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)                         \
           ^
>> drivers/gpu/drm/qxl/qxl_display.c:189:2: error: use of undeclared identifier 'DRM_MODESET_LOCK_ALL_END'
           DRM_MODESET_LOCK_ALL_END(ctx, ret);
           ^
>> drivers/gpu/drm/qxl/qxl_display.c:187:2: error: use of undeclared label 'modeset_lock_fail'
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
           ^
   include/drm/drm_modeset_lock.h:173:8: note: expanded from macro 'DRM_MODESET_LOCK_ALL_BEGIN'
                   goto modeset_lock_fail;
                        ^
   drivers/gpu/drm/qxl/qxl_display.c:411:2: error: implicit declaration of function 'drm_drv_uses_atomic_modeset' [-Werror,-Wimplicit-function-declaration]
           DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
           ^
   include/drm/drm_modeset_lock.h:167:7: note: expanded from macro 'DRM_MODESET_LOCK_ALL_BEGIN'
           if (!drm_drv_uses_atomic_modeset(dev))                          \
                ^
   drivers/gpu/drm/qxl/qxl_display.c:434:35: error: too few arguments provided to function-like macro invocation
           DRM_MODESET_LOCK_ALL_END(ctx, ret);
                                            ^
   include/drm/drm_modeset_lock.h:194:9: note: macro 'DRM_MODESET_LOCK_ALL_END' defined here
   #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)                         \
           ^
   drivers/gpu/drm/qxl/qxl_display.c:434:2: error: use of undeclared identifier 'DRM_MODESET_LOCK_ALL_END'
           DRM_MODESET_LOCK_ALL_END(ctx, ret);
           ^
   drivers/gpu/drm/qxl/qxl_display.c:411:2: error: use of undeclared label 'modeset_lock_fail'
           DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
           ^
   include/drm/drm_modeset_lock.h:173:8: note: expanded from macro 'DRM_MODESET_LOCK_ALL_BEGIN'
                   goto modeset_lock_fail;
                        ^
   8 errors generated.

git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
git fetch --no-tags drm-tip drm-tip
git checkout a012dc947ede8d940b6f79de96429af04a9360c4
vim +/drm_drv_uses_atomic_modeset +187 drivers/gpu/drm/qxl/qxl_display.c

7dea0941f8806e Dave Airlie             2014-10-28  161  
f64122c1f6ade3 Dave Airlie             2013-02-25  162  void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
f64122c1f6ade3 Dave Airlie             2013-02-25  163  {
cbdded7f8a633e Gabriel Krisman Bertazi 2017-01-26  164  	struct drm_device *dev = &qdev->ddev;
bbaac1354cc984 Sidong Yang             2020-05-24  165  	struct drm_modeset_acquire_ctx ctx;
bbaac1354cc984 Sidong Yang             2020-05-24  166  	int status, retries, ret;
9e3b317839298a Christophe Fergeau      2016-11-08  167  
9062155de0dfdc Gerd Hoffmann           2017-03-01  168  	for (retries = 0; retries < 10; retries++) {
9e3b317839298a Christophe Fergeau      2016-11-08  169  		status = qxl_display_copy_rom_client_monitors_config(qdev);
9062155de0dfdc Gerd Hoffmann           2017-03-01  170  		if (status != MONITORS_CONFIG_BAD_CRC)
9062155de0dfdc Gerd Hoffmann           2017-03-01  171  			break;
9062155de0dfdc Gerd Hoffmann           2017-03-01  172  		udelay(5);
9062155de0dfdc Gerd Hoffmann           2017-03-01  173  	}
66e0c8a5bcfd29 Anton Vasilyev          2018-07-27  174  	if (status == MONITORS_CONFIG_ERROR) {
66e0c8a5bcfd29 Anton Vasilyev          2018-07-27  175  		DRM_DEBUG_KMS("ignoring client monitors config: error");
66e0c8a5bcfd29 Anton Vasilyev          2018-07-27  176  		return;
66e0c8a5bcfd29 Anton Vasilyev          2018-07-27  177  	}
9062155de0dfdc Gerd Hoffmann           2017-03-01  178  	if (status == MONITORS_CONFIG_BAD_CRC) {
9062155de0dfdc Gerd Hoffmann           2017-03-01  179  		DRM_DEBUG_KMS("ignoring client monitors config: bad crc");
9062155de0dfdc Gerd Hoffmann           2017-03-01  180  		return;
9e3b317839298a Christophe Fergeau      2016-11-08  181  	}
9e3b317839298a Christophe Fergeau      2016-11-08  182  	if (status == MONITORS_CONFIG_UNCHANGED) {
9062155de0dfdc Gerd Hoffmann           2017-03-01  183  		DRM_DEBUG_KMS("ignoring client monitors config: unchanged");
9e3b317839298a Christophe Fergeau      2016-11-08  184  		return;
f64122c1f6ade3 Dave Airlie             2013-02-25  185  	}
4fdb086924db46 Marc-André Lureau       2013-10-18  186  
bbaac1354cc984 Sidong Yang             2020-05-24 @187  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
7dea0941f8806e Dave Airlie             2014-10-28  188  	qxl_update_offset_props(qdev);
bbaac1354cc984 Sidong Yang             2020-05-24 @189  	DRM_MODESET_LOCK_ALL_END(ctx, ret);
cbdded7f8a633e Gabriel Krisman Bertazi 2017-01-26  190  	if (!drm_helper_hpd_irq_event(dev)) {
4fdb086924db46 Marc-André Lureau       2013-10-18  191  		/* notify that the monitor configuration changed, to
4fdb086924db46 Marc-André Lureau       2013-10-18  192  		   adjust at the arbitrary resolution */
cbdded7f8a633e Gabriel Krisman Bertazi 2017-01-26  193  		drm_kms_helper_hotplug_event(dev);
4fdb086924db46 Marc-André Lureau       2013-10-18  194  	}
f64122c1f6ade3 Dave Airlie             2013-02-25  195  }
f64122c1f6ade3 Dave Airlie             2013-02-25  196  

:::::: The code at line 187 was first introduced by commit
:::::: bbaac1354cc98415e5b4c3830d796c583ca71907 drm/qxl: Replace deprecated function in qxl_display

:::::: TO: Sidong Yang <realwakka@gmail.com>
:::::: CC: Gerd Hoffmann <kraxel@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FCuugMFkClbJLl1L
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
jMAF7LOghznz38GKhZavXP8DJxwxlPonAgA=

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--FCuugMFkClbJLl1L--
