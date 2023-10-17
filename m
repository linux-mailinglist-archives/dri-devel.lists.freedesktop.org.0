Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7F37CC833
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 17:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7F10E305;
	Tue, 17 Oct 2023 15:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0410E305;
 Tue, 17 Oct 2023 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697558147; x=1729094147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PdRQtW1RsEyKvVD1SIpdj+V1KGBuViZmfbhU4YbcJbg=;
 b=LjVLHf+Y+/yami/RBm3DV3Iiw1vFME05GWak7kNDe+g9YKHYLyt/yRB2
 L+Evo70iZ/NaIURVW0aEQ4RVumgupy6fQGudWsgBcRPH/d2gHfljRvClv
 zEWzh724WIVPxQuZ4G1aOOwPjhzpPOZOu4R4tCWZw1clRQ7750zFl/lRc
 M/BO/Iad3bhBWi8RW8dZYyVSpZizgfHptgWW7pLG0DgiyLUC9fFjoZoWa
 7um6lflLkOJUHuWyHMVTXpUO1MsbHndyDIvON+Yh2ve8Jia2dtEVWVDqU
 vUmwvEH4IHRTDRzX3Gqf8IthKCM734wofIL18Sr+C5SJ+dKOcR9yEddnf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385651948"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="385651948"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791271126"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791271126"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 17 Oct 2023 08:55:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qsmPx-0009ln-2N;
 Tue, 17 Oct 2023 15:55:37 +0000
Date: Tue, 17 Oct 2023 23:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] drm: Refuse to async flip with atomic prop changes
Message-ID: <202310172311.kgvIGcqy-lkp@intel.com>
References: <20231017092837.32428-5-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017092837.32428-5-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, oe-kbuild-all@lists.linux.dev,
 alexander.deucher@amd.com, hwentlan@amd.com, christian.koenig@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.6-rc6 next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/drm-allow-DRM_MODE_PAGE_FLIP_ASYNC-for-atomic-commits/20231017-173047
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231017092837.32428-5-andrealmeid%40igalia.com
patch subject: [PATCH v7 4/6] drm: Refuse to async flip with atomic prop changes
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172311.kgvIGcqy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172311.kgvIGcqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172311.kgvIGcqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'drm_atomic_set_property':
>> drivers/gpu/drm/drm_atomic_uapi.c:1062:41: warning: unused variable 'config' [-Wunused-variable]
    1062 |                 struct drm_mode_config *config = &crtc->dev->mode_config;
         |                                         ^~~~~~


vim +/config +1062 drivers/gpu/drm/drm_atomic_uapi.c

  1021	
  1022	int drm_atomic_set_property(struct drm_atomic_state *state,
  1023				    struct drm_file *file_priv,
  1024				    struct drm_mode_object *obj,
  1025				    struct drm_property *prop,
  1026				    uint64_t prop_value,
  1027				    bool async_flip)
  1028	{
  1029		struct drm_mode_object *ref;
  1030		uint64_t old_val;
  1031		int ret;
  1032	
  1033		if (!drm_property_change_valid_get(prop, prop_value, &ref))
  1034			return -EINVAL;
  1035	
  1036		switch (obj->type) {
  1037		case DRM_MODE_OBJECT_CONNECTOR: {
  1038			struct drm_connector *connector = obj_to_connector(obj);
  1039			struct drm_connector_state *connector_state;
  1040	
  1041			connector_state = drm_atomic_get_connector_state(state, connector);
  1042			if (IS_ERR(connector_state)) {
  1043				ret = PTR_ERR(connector_state);
  1044				break;
  1045			}
  1046	
  1047			if (async_flip) {
  1048				ret = drm_atomic_connector_get_property(connector, connector_state,
  1049									prop, &old_val);
  1050				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
  1051				break;
  1052			}
  1053	
  1054			ret = drm_atomic_connector_set_property(connector,
  1055					connector_state, file_priv,
  1056					prop, prop_value);
  1057			break;
  1058		}
  1059		case DRM_MODE_OBJECT_CRTC: {
  1060			struct drm_crtc *crtc = obj_to_crtc(obj);
  1061			struct drm_crtc_state *crtc_state;
> 1062			struct drm_mode_config *config = &crtc->dev->mode_config;
  1063	
  1064			crtc_state = drm_atomic_get_crtc_state(state, crtc);
  1065			if (IS_ERR(crtc_state)) {
  1066				ret = PTR_ERR(crtc_state);
  1067				break;
  1068			}
  1069	
  1070			if (async_flip) {
  1071				ret = drm_atomic_crtc_get_property(crtc, crtc_state,
  1072								   prop, &old_val);
  1073				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
  1074				break;
  1075			}
  1076	
  1077			ret = drm_atomic_crtc_set_property(crtc,
  1078					crtc_state, prop, prop_value);
  1079			break;
  1080		}
  1081		case DRM_MODE_OBJECT_PLANE: {
  1082			struct drm_plane *plane = obj_to_plane(obj);
  1083			struct drm_plane_state *plane_state;
  1084			struct drm_mode_config *config = &plane->dev->mode_config;
  1085	
  1086			plane_state = drm_atomic_get_plane_state(state, plane);
  1087			if (IS_ERR(plane_state)) {
  1088				ret = PTR_ERR(plane_state);
  1089				break;
  1090			}
  1091	
  1092			if (async_flip && prop != config->prop_fb_id) {
  1093				ret = drm_atomic_plane_get_property(plane, plane_state,
  1094								    prop, &old_val);
  1095				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
  1096				break;
  1097			}
  1098	
  1099			ret = drm_atomic_plane_set_property(plane,
  1100					plane_state, file_priv,
  1101					prop, prop_value);
  1102			break;
  1103		}
  1104		default:
  1105			drm_dbg_atomic(prop->dev, "[OBJECT:%d] has no properties\n", obj->id);
  1106			ret = -EINVAL;
  1107			break;
  1108		}
  1109	
  1110		drm_property_change_valid_put(prop, ref);
  1111		return ret;
  1112	}
  1113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
