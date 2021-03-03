Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C632BA40
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 20:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4D26E9BF;
	Wed,  3 Mar 2021 19:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370E76E9BF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 19:45:22 +0000 (UTC)
IronPort-SDR: PZShqpKiOadnQn7dOWLJCjBnVQbEoYffjF/7KxnBP38k3Ig8VrcKW5ZH0S9ETtVw4m0YXf/YVo
 TTBqSC/n57OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="166522965"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
 d="gz'50?scan'50,208,50";a="166522965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:45:21 -0800
IronPort-SDR: u5u6Zjkbl948WPIb9WioA60nbF5sOIpHEu1ofRg2IWmVo7GMFBRyEujHZ6SJZlpn1I71ZBVwKJ
 9nvdw9mb3z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
 d="gz'50?scan'50,208,50";a="369503309"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 03 Mar 2021 11:45:18 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lHXQs-0001hh-1f; Wed, 03 Mar 2021 19:45:18 +0000
Date: Thu, 4 Mar 2021 03:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>, melissa.srw@gmail.com
Subject: Re: [PATCH V2 1/2] drm/vkms: Add support for virtual hardware mode
Message-ID: <202103040349.gUO3MkmE-lkp@intel.com>
References: <a3701bbf1370cd5a1859c715ce3ae834bb91f2fe.1614775351.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <a3701bbf1370cd5a1859c715ce3ae834bb91f2fe.1614775351.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, kbuild-all@lists.01.org,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sumera,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.12-rc1 next-20210303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sumera-Priyadarsini/Add-virtual-hardware-module/20210303-205440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f69d02e37a85645aa90d18cacfff36dba370f797
config: powerpc64-randconfig-p002-20210303 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/67e97bc2a047c91e1de3544be8668ff9a1e2775b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sumera-Priyadarsini/Add-virtual-hardware-module/20210303-205440
        git checkout 67e97bc2a047c91e1de3544be8668ff9a1e2775b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_composer.c: In function 'vkms_composer_worker':
>> drivers/gpu/drm/vkms/vkms_composer.c:226:20: warning: variable 'wb_pending' set but not used [-Wunused-but-set-variable]
     226 |  bool crc_pending, wb_pending;
         |                    ^~~~~~~~~~


vim +/wb_pending +226 drivers/gpu/drm/vkms/vkms_composer.c

67e97bc2a047c9 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-03-03  209  
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  210  /**
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  211   * vkms_composer_worker - ordered work_struct to compute CRC
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  212   *
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  213   * @work: work_struct
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  214   *
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  215   * Work handler for composing and computing CRCs. work_struct scheduled in
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  216   * an ordered workqueue that's periodically scheduled to run by
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  217   * _vblank_handle() and flushed at vkms_atomic_crtc_destroy_state().
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  218   */
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  219  void vkms_composer_worker(struct work_struct *work)
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  220  {
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  221  	struct vkms_crtc_state *crtc_state = container_of(work,
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  222  						struct vkms_crtc_state,
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  223  						composer_work);
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  224  	struct drm_crtc *crtc = crtc_state->base.crtc;
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  225  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
dbd9d80c1b2e03 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30 @226  	bool crc_pending, wb_pending;
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  227  	u64 frame_start, frame_end;
67e97bc2a047c9 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-03-03  228  	u32 crc32 = 0;
953025763d1421 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  229  	int ret;
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  230  
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  231  	spin_lock_irq(&out->composer_lock);
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  232  	frame_start = crtc_state->frame_start;
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  233  	frame_end = crtc_state->frame_end;
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  234  	crc_pending = crtc_state->crc_pending;
dbd9d80c1b2e03 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  235  	wb_pending = crtc_state->wb_pending;
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  236  	crtc_state->frame_start = 0;
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  237  	crtc_state->frame_end = 0;
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  238  	crtc_state->crc_pending = false;
a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  239  	spin_unlock_irq(&out->composer_lock);
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  240  
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  241  	/*
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  242  	 * We raced with the vblank hrtimer and previous work already computed
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  243  	 * the crc, nothing to do.
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  244  	 */
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  245  	if (!crc_pending)
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  246  		return;
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  247  
67e97bc2a047c9 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-03-03  248  	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
67e97bc2a047c9 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-03-03  249  	if (ret == -EINVAL)
953025763d1421 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  250  		return;
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  251  	/*
18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  252  	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  253  	 */
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  254  	while (frame_start <= frame_end)
0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  255  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  256  }
6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  257  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--r5Pyd7+fXNt84Ff3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
CYSLePIMwOKs0ugiqgIvbtYh/Qvt4c9uw4cBAA==

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--r5Pyd7+fXNt84Ff3--
