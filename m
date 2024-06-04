Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277988FA80F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 04:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009E910E41A;
	Tue,  4 Jun 2024 02:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRUNcG5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BEE10E40E;
 Tue,  4 Jun 2024 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466601; x=1749002601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VTCH11EDuFxS9Okiehsc89nS6yYQ+MIJBAIq81KUk0s=;
 b=VRUNcG5JyVH+ED/Dmm5u9saavT4BWjzeNmBMw6Zz9NJW4aZ64HGBuhvR
 xp0NxakAKND/yQ+ZQ+nwkRmrsSUwglRBMPzu4TMiTfkDi24/4gZX3PLJa
 v/1vyDUFXOMLsJNrvAjXDri4uNnM2eFaw5FvdtW0YKZzthreLjejq8raz
 ogBuovXEk0hf0VJtICquHmFgYya3nMQFNpG31Xps1TT1fUJxtjl5Lzjlh
 q5MSyZthJp1pNvVEGTeMyej+vsBNupy2jlKrgTHACgv52l2vPJsvPE9jt
 44KZKoXYvdDBo/yKlBzbTu3Uq/i/MFzze8nm4CQ+h+axufjddAr2wkm6w w==;
X-CSE-ConnectionGUID: Qy3Q7iJjRRGBV1V2DGQgIw==
X-CSE-MsgGUID: Gckb0mdbQjeQn7v1UkYVZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11884911"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="11884911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 19:03:13 -0700
X-CSE-ConnectionGUID: YFB59XH6RPabyn5x7q+MDg==
X-CSE-MsgGUID: O0cRuqV4QWOcwVyqRpgsIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="74557144"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2024 19:03:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sEJVn-000MQt-0n;
 Tue, 04 Jun 2024 02:03:05 +0000
Date: Tue, 4 Jun 2024 10:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>, hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <202406040928.Eu1gRIWv-lkp@intel.com>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528210319.1242-1-mario.limonciello@amd.com>
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

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-client-Detect-when-ACPI-lid-is-closed-during-initialization/20240529-050440
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240528210319.1242-1-mario.limonciello%40amd.com
patch subject: [PATCH v2] drm/client: Detect when ACPI lid is closed during initialization
config: i386-randconfig-053-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040928.Eu1gRIWv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_match_edp_lid':
>> drivers/gpu/drm/drm_client_modeset.c:281:(.text+0x221b): undefined reference to `acpi_lid_open'


vim +281 drivers/gpu/drm/drm_client_modeset.c

   260	
   261	static void drm_client_match_edp_lid(struct drm_device *dev,
   262					     struct drm_connector **connectors,
   263					     unsigned int connector_count,
   264					     bool *enabled)
   265	{
   266		int i;
   267	
   268		for (i = 0; i < connector_count; i++) {
   269			struct drm_connector *connector = connectors[i];
   270	
   271			switch (connector->connector_type) {
   272			case DRM_MODE_CONNECTOR_LVDS:
   273			case DRM_MODE_CONNECTOR_eDP:
   274				if (!enabled[i])
   275					continue;
   276				break;
   277			default:
   278				continue;
   279			}
   280	
 > 281			if (!acpi_lid_open()) {
   282				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
   283					    connector->base.id, connector->name);
   284				enabled[i] = false;
   285			}
   286		}
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
