Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACFC3538AA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 17:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE216E4CB;
	Sun,  4 Apr 2021 15:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD196E4CF
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 15:49:39 +0000 (UTC)
IronPort-SDR: o4eLBrdHOxuvJqfjjkci3qBCLeZeL9ySOXvQxAJaAfh0gLtNW4W2HrSScbAf6D3Lu9wjucCUR2
 AbsZFG0Iu58A==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="256693993"
X-IronPort-AV: E=Sophos;i="5.81,304,1610438400"; 
 d="gz'50?scan'50,208,50";a="256693993"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2021 08:49:38 -0700
IronPort-SDR: d/YO1Hoi8mZ9e7REOei7HAfxq9cJORAH3gf7WTpO3sdBCJG08jCTcAhuLAozLsueyUnCfNXVZz
 cA+urrO4QTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,304,1610438400"; 
 d="gz'50?scan'50,208,50";a="608584641"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2021 08:49:35 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lT50I-0008ip-DX; Sun, 04 Apr 2021 15:49:34 +0000
Date: Sun, 4 Apr 2021 23:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>, melissa.srw@gmail.com
Subject: Re: [PATCH V3 1/2] drm/vkms: Refactor vkms_composer_worker() to prep
 for virtual_hw mode
Message-ID: <202104042357.O0wCwDE8-lkp@intel.com>
References: <e948dc1de2c7de246c81728248d7c6cdca7b4fd6.1617539357.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <e948dc1de2c7de246c81728248d7c6cdca7b4fd6.1617539357.git.sylphrenadin@gmail.com>
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


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sumera,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.12-rc5 next-20210401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sumera-Priyadarsini/Add-virtual-hardware-module/20210404-211300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2023a53bdf41b7646b1d384b6816af06309f73a5
config: mips-randconfig-r025-20210404 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4bd5c27357dd86b6099f3f28db5db722ceeed582
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sumera-Priyadarsini/Add-virtual-hardware-module/20210404-211300
        git checkout 4bd5c27357dd86b6099f3f28db5db722ceeed582
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_composer.c: In function 'vkms_composer_worker':
>> drivers/gpu/drm/vkms/vkms_composer.c:226:20: warning: variable 'wb_pending' set but not used [-Wunused-but-set-variable]
     226 |  bool crc_pending, wb_pending;
         |                    ^~~~~~~~~~


vim +/wb_pending +226 drivers/gpu/drm/vkms/vkms_composer.c

4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  209  
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
4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  228  	u32 crc32 = 0;
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
4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  248  	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  249  	if (ret == -EINVAL)
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

--LZvS9be/3tNcYl/X
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--LZvS9be/3tNcYl/X--
