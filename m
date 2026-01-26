Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAWdNUJ1d2n7ggEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:08:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AB89534
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6701D10E205;
	Mon, 26 Jan 2026 14:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nk/mswTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CBF10E154;
 Mon, 26 Jan 2026 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769436478; x=1800972478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WgZhqburwJXfSnO9FAvCh2UJKSg6moYZxg9UTVJ0mVc=;
 b=Nk/mswTFpBNt+1AUukdmbGjs+qCVLkSlL9t1hJGaAq8wiPRLIYWxkoPw
 YDJQM7XP6K4qHTN4l9iVnogWhoZNrQwlkDloE+ZUBrpIa6PkKekhI82z9
 hvLdNz9xsNxKeApsMgTkq68qOCh9U63EGbepJ1fB+YXlOwMyJ+B10moAF
 NizsEpx4HtFTtc8Ssvs+D2Xeg99+mNEMGBVM+XbYk0jCkwE6NNmlnLZ/J
 WNbeTs4lK26kNxfFzjMz1R3cuehnvJ//TkYCXTPO+Gr7Tsb8twUIa/JRZ
 NjkquinEC/Q2lxfTTo4r2lAkZsbVmvJkL42V0UhREzllGivhrHYEfS1QA w==;
X-CSE-ConnectionGUID: NhnpfYrnS4ua+leTA+I8nQ==
X-CSE-MsgGUID: sWCtmSefTs21155TWj1dug==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70579631"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="70579631"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 06:07:57 -0800
X-CSE-ConnectionGUID: bt3jTQ2rRJ+b/17QZMrRDA==
X-CSE-MsgGUID: EYt16mIYQoOQmElucEeS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207288300"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2026 06:07:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkNFu-00000000XNK-3v5w;
 Mon, 26 Jan 2026 14:07:50 +0000
Date: Mon, 26 Jan 2026 22:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: oe-kbuild-all@lists.linux.dev, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: Re: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
Message-ID: <202601262244.EnQPfewn-lkp@intel.com>
References: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 8A2AB89534
X-Rspamd-Action: no action

Hi Tomasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260123]
[cannot apply to drm-misc/drm-misc-next v6.19-rc6 v6.19-rc5 v6.19-rc4 linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Paku-a/drm-amd-display-Return-if-DisplayID-not-found-in-parse_amd_vsdb/20260126-024258
base:   next-20260123
patch link:    https://lore.kernel.org/r/20260125183914.459228-17-tomasz.pakula.oficjalny%40gmail.com
patch subject: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM behavior
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601262244.EnQPfewn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262244.EnQPfewn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262244.EnQPfewn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1129:7: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
    1129 |  * DOC: hdmi_hpd_debounce_delay_ms (uint)
         |       ^


vim +1129 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

a96a787d6de732 Alex Deucher  2025-02-18  1127  
ee725b1d954d29 Tomasz Pakuła 2026-01-25  1128  /** */
6a681cd9034587 Ivan Lipski   2026-01-13 @1129   * DOC: hdmi_hpd_debounce_delay_ms (uint)
6a681cd9034587 Ivan Lipski   2026-01-13  1130   * HDMI HPD disconnect debounce delay in milliseconds.
6a681cd9034587 Ivan Lipski   2026-01-13  1131   *
6a681cd9034587 Ivan Lipski   2026-01-13  1132   * Used to filter short disconnect->reconnect HPD toggles some HDMI sinks
6a681cd9034587 Ivan Lipski   2026-01-13  1133   * generate while entering/leaving power save. Set to 0 to disable by default.
6a681cd9034587 Ivan Lipski   2026-01-13  1134   */
6a681cd9034587 Ivan Lipski   2026-01-13  1135  MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect debounce delay in milliseconds (0 to disable (by default), 1500 is common)");
6a681cd9034587 Ivan Lipski   2026-01-13  1136  module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms, uint, 0644);
6a681cd9034587 Ivan Lipski   2026-01-13  1137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
