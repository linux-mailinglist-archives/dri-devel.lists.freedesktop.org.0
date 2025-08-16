Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E64B2897C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 02:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB31F10E2B6;
	Sat, 16 Aug 2025 00:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yx9mH3Mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7884110E2B6;
 Sat, 16 Aug 2025 00:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755305867; x=1786841867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ukMsMQdY1esdd5Vpb3YVrIGo9PLgslhipI1hpV6tqTI=;
 b=Yx9mH3MrfMaHZ6vv4stvIEBPqJ1vQ0dRkWrAOcIxV1Gh7DqhNJKIq3LO
 IYRIbYd/foZGIROPWT9qafYJ52s2orWeQRc5Y6buZkAI5G+3+f0nuXK8C
 UL/hvG4ysvj1+NRQ4WI1iQ0MY7pnATd3AtT8pXZJtYr/+A/UHj6mWCfVp
 BfBiF4jlsAfHHW5YrkAMJH6j36+PnJVHuIerGx063jYPz1FhQ31U168VG
 k94x5mt61fogdFPDmQigc+GGDie2YFFMnLhZ6BPaQUmSbaCMMDgKwv2la
 KkPqKkRlk5YU1zBqu/sXA8Nlmuezeq4kh8j41MtJLZCP40l0Fdea/c8aN g==;
X-CSE-ConnectionGUID: BXKRbS2aTHScGQFakM75pQ==
X-CSE-MsgGUID: MeZTukRwTPKYoKhS43Q5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57536999"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57536999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:57:47 -0700
X-CSE-ConnectionGUID: vZYKcPdgTbm2DrN25iXXQA==
X-CSE-MsgGUID: lD6nAVcHT767qK3gjbyk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166750340"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 15 Aug 2025 17:57:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1un5Er-000CSm-1S;
 Sat, 16 Aug 2025 00:57:41 +0000
Date: Sat, 16 Aug 2025 08:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: 2564278112@qq.com, alex.williamson@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 alexandre.f.demers@gmail.com, boyuan.zhang@amd.com,
 jiangwang@kylinos.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Fixed an issue where audio did not turn off
 properly after unplugging HDMI
Message-ID: <202508160829.jfFPh4YJ-lkp@intel.com>
References: <tencent_E5B1CAABB0320691EB730CDB19E55EA85E05@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E5B1CAABB0320691EB730CDB19E55EA85E05@qq.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/2564278112-qq-com/drm-amdgpu-Fixed-an-issue-where-audio-did-not-turn-off-properly-after-unplugging-HDMI/20250815-164929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/tencent_E5B1CAABB0320691EB730CDB19E55EA85E05%40qq.com
patch subject: [PATCH] drm/amdgpu: Fixed an issue where audio did not turn off properly after unplugging HDMI
config: x86_64-buildonly-randconfig-002-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160829.jfFPh4YJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160829.jfFPh4YJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160829.jfFPh4YJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c: In function 'dce_v6_0_encoder_mode_set':
>> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:3271:38: error: implicit declaration of function 'amdgpu_connector_edid'; did you mean 'amdgpu_connector_add'? [-Werror=implicit-function-declaration]
    3271 |         if (drm_detect_monitor_audio(amdgpu_connector_edid(connector))) {
         |                                      ^~~~~~~~~~~~~~~~~~~~~
         |                                      amdgpu_connector_add
>> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:3271:38: warning: passing argument 1 of 'drm_detect_monitor_audio' makes pointer from integer without a cast [-Wint-conversion]
    3271 |         if (drm_detect_monitor_audio(amdgpu_connector_edid(connector))) {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   In file included from drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:26:
   include/drm/drm_edid.h:443:50: note: expected 'const struct edid *' but argument is of type 'int'
     443 | bool drm_detect_monitor_audio(const struct edid *edid);
         |                               ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c: In function 'dce_v6_0_encoder_disable':
   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:3341:46: warning: passing argument 1 of 'drm_detect_monitor_audio' makes pointer from integer without a cast [-Wint-conversion]
    3341 |                 if (drm_detect_monitor_audio(amdgpu_connector_edid(connector)))
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              |
         |                                              int
   include/drm/drm_edid.h:443:50: note: expected 'const struct edid *' but argument is of type 'int'
     443 | bool drm_detect_monitor_audio(const struct edid *edid);
         |                               ~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +3271 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c

  3250	
  3251	static void dce_v6_0_encoder_mode_set(struct drm_encoder *encoder,
  3252				  struct drm_display_mode *mode,
  3253				  struct drm_display_mode *adjusted_mode)
  3254	{
  3255		struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
  3256		struct drm_connector *connector;
  3257		struct amdgpu_connector *amdgpu_connector = NULL;
  3258		amdgpu_encoder->pixel_clock = adjusted_mode->clock;
  3259	
  3260		/* need to call this here rather than in prepare() since we need some crtc info */
  3261		amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
  3262		connector = amdgpu_get_connector_for_encoder_init(encoder);
  3263		amdgpu_connector = to_amdgpu_connector(connector);
  3264		if (!amdgpu_connector) {
  3265			DRM_ERROR("Couldn't find encoder's connector\n");
  3266		}
  3267	
  3268		/* set scaler clears this on some chips */
  3269		dce_v6_0_set_interleave(encoder->crtc, mode);
  3270	
> 3271		if (drm_detect_monitor_audio(amdgpu_connector_edid(connector))) {
  3272			dce_v6_0_afmt_enable(encoder, true);
  3273			dce_v6_0_afmt_setmode(encoder, adjusted_mode);
  3274		}
  3275	}
  3276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
