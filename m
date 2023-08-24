Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E8786D85
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5367810E525;
	Thu, 24 Aug 2023 11:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532CE10E525
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692875711; x=1724411711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pn8EQw0NgUrSxiYsZQ7PcOdWCJRnfghJYSzf+L1Vvpo=;
 b=m20+y/u7QRa/ldc+OPt/p02XR1VQIQAaKpFj5N3JqbWl5w23MHjIfJ4D
 /8tVz/FHu0BNy567uiJjWDCEq81zYk2rlivDokRqcVmaifSIVLQxAPFdc
 0KiVBmqEgpkEgoMwqhopZ1Q9ztefKLocZet+hc5BwguPnKg8fDACJilms
 zDMwBbg6zFMCGtK5wtfvyirCVMgwy5pkKqfmPRVfRqGUmEkkHkpPD4XCm
 7O/UICc8i4F5lBN7cjRBveOdD1GsZ8TZ2re3ZuVtwAahHKtwJLp/idX3J
 T2hyvt9j+eMEZgnK974VPJWcAT8cSMB3+N/U4Dv5nBNBVuL35mhgMQDmH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353949358"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="353949358"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802502136"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802502136"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 04:15:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZ8In-0001yk-22;
 Thu, 24 Aug 2023 11:15:03 +0000
Date: Thu, 24 Aug 2023 19:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Pollack <brpol@chromium.org>, marius.vlad@collabora.com,
 jshargo@chromium.org
Subject: Re: [PATCH v4 5/7] drm/vkms: Support enabling ConfigFS devices
Message-ID: <202308241907.YtPY7t8j-lkp@intel.com>
References: <20230824084350.1062579-6-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824084350.1062579-6-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, hirono@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de, oe-kbuild-all@lists.linux.dev,
 Brandon Pollack <brpol@chromium.org>, mairacanal@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brandon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230824]
[cannot apply to linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Pollack/drm-vkms-Back-VKMS-with-DRM-memory-management-instead-of-static-objects/20230824-164550
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230824084350.1062579-6-brpol%40chromium.org
patch subject: [PATCH v4 5/7] drm/vkms: Support enabling ConfigFS devices
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241907.YtPY7t8j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241907.YtPY7t8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241907.YtPY7t8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_output.c:178: warning: Function parameter or member 'vkmsdev' not described in 'validate_vkms_configfs_no_dangling_objects'


vim +178 drivers/gpu/drm/vkms/vkms_output.c

   166	
   167	/**
   168	* validate_vkms_configfs_no_dangling_objects - warn on unused objects in vkms configfs.
   169	*
   170	* This gives slightly more visible warning messaging to the user before the drm
   171	* system finds the configuration invalid and prints it's debug information.  In
   172	* this case the user may have accidentally not included some links, or the user
   173	* could be testing this faulty configuration.
   174	*
   175	*/
   176	static void
   177	validate_vkms_configfs_no_dangling_objects(struct vkms_device *vkmsdev)
 > 178	{
   179		struct vkms_configfs *configfs = vkmsdev->configfs;
   180		struct config_item *item;
   181	
   182		// 1. Planes
   183		list_for_each_entry(item, &configfs->planes_group.cg_children,
   184				    ci_entry) {
   185			struct vkms_config_plane *config_plane =
   186				item_to_config_plane(item);
   187			if (config_plane->possible_crtcs.linked_object_bitmap == 0)
   188				DRM_WARN(
   189					"Vkms configfs created plane %s has no linked crtcs",
   190					item->ci_name);
   191		}
   192	
   193		// 2. connectors
   194		list_for_each_entry(item, &configfs->connectors_group.cg_children,
   195				    ci_entry) {
   196			struct vkms_config_connector *config_connector =
   197				item_to_config_connector(item);
   198			if (config_connector->possible_encoders.linked_object_bitmap ==
   199			    0) {
   200				DRM_WARN(
   201					"Vkms configfs created connector %s has no linked encoders",
   202					item->ci_name);
   203			}
   204		}
   205	
   206		// 3. encoders
   207		list_for_each_entry(item, &configfs->encoders_group.cg_children,
   208				    ci_entry) {
   209			struct vkms_config_encoder *config_encoder =
   210				item_to_config_encoder(item);
   211			if (config_encoder->possible_crtcs.linked_object_bitmap == 0) {
   212				DRM_WARN(
   213					"Vkms configfs created encoder %s has no linked crtcs",
   214					item->ci_name);
   215			}
   216		}
   217	
   218		// 4. crtcs only require a primary plane to function, this is checked during
   219		// output initialization and returns an error.
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
