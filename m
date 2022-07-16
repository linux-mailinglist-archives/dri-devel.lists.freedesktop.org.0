Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA55770F7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 21:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACB710E23F;
	Sat, 16 Jul 2022 19:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30AB10E23F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657998275; x=1689534275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8frvfJ6bz/9hCYcXkLFOuympGu4Rfw7p/JbRkZZZy0Y=;
 b=kblaL21MN9p/3fNJfNsZQ1EcF9HfekTV8mxR+ZfiUbGGo7yUehtrE8Ud
 /BgLK0lHvCBqLHQo84Fx5tfGk5Tb1KU+zKcLWJHDgnZtTtEfy32L3cg0m
 6tzTMkN4ULf7+bBKJBT2VfcQ9/+h2jTtqhnmW68GUEXnn3CJC9mtahwUQ
 o9WMVs4tkrOXX34c2IpDHcRmqKu333W/cAOD/AfyF0NQOpxlLJkDBDW/r
 uZYw4enDZYV0/iIr2taHhDighNYXA7fqGja0zgZYoRz6OJ7BdrgyyypCG
 UOucIgBMZjVgIQMpu04Mm2dcZdrtsXkC6JiiS3lBi5wL6bPO8ZfYOkEDa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="372312117"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="372312117"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2022 12:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; d="scan'208";a="686305192"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2022 12:04:33 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCn5c-00021a-Hm;
 Sat, 16 Jul 2022 19:04:32 +0000
Date: Sun, 17 Jul 2022 03:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 andrealmeid@igalia.com
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
Message-ID: <202207170211.AaMpUwPs-lkp@intel.com>
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
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20220717/202207170211.AaMpUwPs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e583aaf4f6464add35f2350c728d80a3fe790638
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthieu-CHARETTE/drm-Fix-EDID-firmware-load-on-resume/20220716-214028
        git checkout e583aaf4f6464add35f2350c728d80a3fe790638
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_connector.c:25:
>> include/drm/drm_edid.h:387:1: warning: 'drm_cache_edid_firmware' used but never defined
     387 | drm_cache_edid_firmware(struct drm_connector *connector);
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_cache_edid_firmware +387 include/drm/drm_edid.h

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
