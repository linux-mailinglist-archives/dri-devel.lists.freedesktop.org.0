Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6A57761A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 14:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EE414BD21;
	Sun, 17 Jul 2022 12:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803A614BCBF
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658060373; x=1689596373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fm0yl+AmZGkN8KmCTahys4EupjeO4maSBEAoi742aEI=;
 b=RiF88pjqhMzSqeXpFSSttT3muTYJg91scxwwJhz0odK8vPLJ0qItWIAa
 fFee0o++053oBcJJcoMGqv6HQToUXjAKAySqfzJKp6zeuSHRJRJ/sz2se
 pL/1bEZiZZi6MlChtOppak+BojZoaILJFbt4GUDestOve4Mhl2Z+D9VT8
 cywoAFFp81cPFHNX4FIFaFU+7HEQP72mhJHAEDDJgPFY6LOVLJTuY6zYz
 7N7EvX7a2AZ0jrDv/I+TaMy33xh0SRluzDY7HoLwL759BTrpBG4S4sIw1
 3F39ZdjxWsQUjdnXnl2VDl0w8x/hmGeOPL2CMkBdfRt8qby9F17rBCzBB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="347744340"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="347744340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 05:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="924020499"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2022 05:19:30 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oD3FB-0003DK-UR;
 Sun, 17 Jul 2022 12:19:29 +0000
Date: Sun, 17 Jul 2022 20:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 andrealmeid@igalia.com
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
Message-ID: <202207172035.mtErdlaw-lkp@intel.com>
References: <20220715092253.17529-1-matthieu.charette@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715092253.17529-1-matthieu.charette@gmail.com>
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthieu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.19-rc6]
[also build test WARNING on linus/master]
[cannot apply to drm-misc/drm-misc-next next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
base:    32346491ddf24599decca06190ebca03ff9de7f8
config: loongarch-randconfig-s052-20220715 (https://download.01.org/0day-ci/archive/20220717/202207172035.mtErdlaw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e583aaf4f6464add35f2350c728d80a3fe790638
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
        git checkout e583aaf4f6464add35f2350c728d80a3fe790638
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/drm_connector.c: note: in included file:
>> include/drm/drm_edid.h:387:24: sparse: sparse: marked inline, but without a definition

vim +387 include/drm/drm_edid.h

   374	
   375	int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
   376	int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
   377	int drm_av_sync_delay(struct drm_connector *connector,
   378			      const struct drm_display_mode *mode);
   379	
   380	#ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
   381	void drm_cache_edid_firmware(struct drm_connector *connector);
   382	struct edid *drm_load_edid_firmware(struct drm_connector *connector);
   383	int __drm_set_edid_firmware_path(const char *path);
   384	int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
   385	#else
   386	static inline void
 > 387	drm_cache_edid_firmware(struct drm_connector *connector);
   388	static inline struct edid *
   389	drm_load_edid_firmware(struct drm_connector *connector)
   390	{
   391		return ERR_PTR(-ENOENT);
   392	}
   393	#endif
   394	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
