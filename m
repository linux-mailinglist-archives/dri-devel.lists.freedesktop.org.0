Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17599591CB3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 23:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4EEB5CA2;
	Sat, 13 Aug 2022 21:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E25B5B9C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660426112; x=1691962112;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=sQGDTiUOWiXi9x4BqiU+P7jDGaFon1HcdaIADMaUljY=;
 b=f/ljK2+r95OvltfuFYRfRJzin0CCFZZkrmcEj07FXw39pTGhuWDEqzWH
 hSPR+BxDnFOnWSc8/zN8vDCUx/E0DXTMspe+zet0dHgWRTIU9Z0IEKcEU
 oqFdPv6aNJ6EWwHywHPtgBSu1FNjPiVYLE6WUL+mzZ1eCfS0vNikwD4Ih
 4yDQVOdzdevR2Ym+ozRUFXLkIerXTZM/+2JaToJ8rH79tgHrC4W9ifxZ5
 X94z4sH9FdKSKbiBlZ2AROGFbtfOA9soa5UEyt811hE3o8A1kpbfjI+iw
 iu6c3yYqEGh6FSz6CErCyS15mEOuoUYCtfXaJpYdtZO6fquQmgxP+jS8W A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="317755732"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="317755732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 14:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="635043439"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2022 14:28:30 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oMygI-00026N-0a;
 Sat, 13 Aug 2022 21:28:30 +0000
Date: Sun, 14 Aug 2022 05:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 2/18]
 drivers/gpu/drm/tiny/simpledrm.c:514:32: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202208140534.AuJeaYA5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   3bd86801c84f66b4abedde4078e5237937b7576b
commit: 71bf55872cbe035820a87b2aa5fc1dc60678abfa [2/18] drm/format-helper: Provide drm_fb_blit()
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20220814/202208140534.AuJeaYA5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 71bf55872cbe035820a87b2aa5fc1dc60678abfa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/tiny/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tiny/simpledrm.c:514:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem *screen_base @@
   drivers/gpu/drm/tiny/simpledrm.c:514:32: sparse:     expected void *vaddr
   drivers/gpu/drm/tiny/simpledrm.c:514:32: sparse:     got void [noderef] __iomem *screen_base

vim +514 drivers/gpu/drm/tiny/simpledrm.c

   504	
   505	static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
   506								 struct drm_atomic_state *old_state)
   507	{
   508		struct drm_plane_state *plane_state = plane->state;
   509		struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
   510		struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
   511		struct drm_framebuffer *fb = plane_state->fb;
   512		struct drm_device *dev = plane->dev;
   513		struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
 > 514		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
   515		struct drm_rect src_clip, dst_clip;
   516		int idx;
   517	
   518		if (!fb)
   519			return;
   520	
   521		if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
   522			return;
   523	
   524		dst_clip = plane_state->dst;
   525		if (!drm_rect_intersect(&dst_clip, &src_clip))
   526			return;
   527	
   528		if (!drm_dev_enter(dev, &idx))
   529			return;
   530	
   531		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
   532		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
   533			    &src_clip);
   534	
   535		drm_dev_exit(idx);
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
