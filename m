Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC16AADE72
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95310E794;
	Wed,  7 May 2025 12:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUJQoGOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD0410E78A;
 Wed,  7 May 2025 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746619778; x=1778155778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZFgHW4s0fNOgPlRqyw/XxBhMGeuQT0H/6RPXIQJKtYo=;
 b=XUJQoGOME12LkvPFacXPKeFZTLTspW4KD0+/KK3361aPC1k/4VZiKKZ0
 jJPD2eHizAwtrvlbr4uum7P4neZS0bKPcqV+d3jzjL89w/TdzGmm1oxb2
 gIanLdfVv4vK9HBvKW9ZwOx0nuvyBLNFyFiSYDnW+QyzE0QnbbNivBoRS
 ZWB0Nf1Y7GqKLZVo/5OZqU8tgCEqreIHpW7DjajbCOI7IvwbW1R6FNjZh
 OlJbgPE9ucmjItjgX28kNu901Y/wGBWMZzBj1h9Ujn6kRZ/fL8K5K+qUO
 5/3Rcq8P67MI75EjPdGCUAJsAGQKftL3Pl4Het7XjX5B/y8fsZK6OLWkd w==;
X-CSE-ConnectionGUID: Ps2FtWn1Rzadtn4YlWvIiA==
X-CSE-MsgGUID: HAxChupEQ2GC/dk2B+H5tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51998549"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="51998549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 05:09:37 -0700
X-CSE-ConnectionGUID: quqmDMwvTSa21yOPqautSQ==
X-CSE-MsgGUID: p7RcOXiTQfiAc6wb+o3j5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135955875"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 05:09:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCdae-0007kn-1j;
 Wed, 07 May 2025 12:09:32 +0000
Date: Wed, 7 May 2025 20:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Message-ID: <202505071939.IQ3zWvvX-lkp@intel.com>
References: <20250414041637.128039-7-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414041637.128039-7-suraj.kandpal@intel.com>
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

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250411]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes v6.15-rc2 v6.15-rc1 v6.14 v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-dp-Introduce-new-member-in-drm_backlight_info/20250414-132323
base:   next-20250411
patch link:    https://lore.kernel.org/r/20250414041637.128039-7-suraj.kandpal%40intel.com
patch subject: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
config: i386-randconfig-141-20250414 (https://download.01.org/0day-ci/archive/20250507/202505071939.IQ3zWvvX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071939.IQ3zWvvX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_helper.c:4215 drm_edp_backlight_probe_state() warn: inconsistent indenting

vim +4215 drivers/gpu/drm/display/drm_dp_helper.c

  4182	
  4183	static inline int
  4184	drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl,
  4185				      u8 *current_mode)
  4186	{
  4187		int ret;
  4188		u8 buf[3];
  4189		u8 mode_reg;
  4190	
  4191		ret = drm_dp_dpcd_read_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
  4192		if (ret < 0) {
  4193			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
  4194				    aux->name, ret);
  4195			return ret < 0 ? ret : -EIO;
  4196		}
  4197	
  4198		*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
  4199		if (!bl->aux_set)
  4200			return 0;
  4201	
  4202		if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
  4203			int size = 1 + bl->lsb_reg_used;
  4204	
  4205			if (bl->luminance_set) {
  4206				ret = drm_dp_dpcd_read_data(aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
  4207							    buf, sizeof(buf));
  4208				if (ret < 0) {
  4209					drm_dbg_kms(aux->drm_dev,
  4210						    "%s: Failed to read backlight level: %d\n",
  4211						    aux->name, ret);
  4212					return ret;
  4213			}
  4214	
> 4215			return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
  4216			} else {
  4217				ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
  4218							    buf, size);
  4219				if (ret < 0) {
  4220					drm_dbg_kms(aux->drm_dev,
  4221						    "%s: Failed to read backlight level: %d\n",
  4222						    aux->name, ret);
  4223					return ret;
  4224				}
  4225	
  4226				if (bl->lsb_reg_used)
  4227					return (buf[0] << 8) | buf[1];
  4228				else
  4229					return buf[0];
  4230			}
  4231		}
  4232	
  4233		/*
  4234		 * If we're not in DPCD control mode yet, the programmed brightness value is meaningless and
  4235		 * the driver should assume max brightness
  4236		 */
  4237		return bl->max;
  4238	}
  4239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
