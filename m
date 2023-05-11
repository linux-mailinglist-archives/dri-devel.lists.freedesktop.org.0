Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C356FEF9B
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 12:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765F10E5C7;
	Thu, 11 May 2023 10:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1539410E21E;
 Thu, 11 May 2023 10:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683799501; x=1715335501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BVimK+d6kYOzWtHVU8qMyCxY6XspAN39+zxPNZAl9lg=;
 b=i4V8cj3EuXXcKauTUl1v9/vEmhVwfSaWcMvDK3mLfWQ28bgEz1qsE1Ra
 WJg+ZZeruo4aA+tinNIx6s6S3U3y/n1n8OIDDbfCtkj6EAof4Z1zITyoD
 Q3dmRtxDAMaZon1KzvCiYoHDzJU/ddYNJUtoetakwvIfAXLevqlQvyTXt
 1of1ZlYTNNwJk8FOILzLUeXfL8QqgOHm9sk702mSoxrem+4r9eGxxtTb5
 GN0zlCd0KyPQTDDxqLo/GoNGpSmRAAXyarE10UtFOjz7oI2/8BBnrFaxL
 qswxkQ72OkSYJxOcNwx7BjZyAN6gFSRftGfBQjpBjIplEWwtYP9dXLr3J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353550266"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="353550266"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843887612"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="843887612"
Received: from acharach-mobl.ger.corp.intel.com (HELO [10.251.219.38])
 ([10.251.219.38])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:04:58 -0700
Message-ID: <b34135e3-2651-4e0a-a776-9b047882b1b2@linux.intel.com>
Date: Thu, 11 May 2023 12:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>
 <e1d716ad-569f-c26a-82cd-bf747a352360@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <e1d716ad-569f-c26a-82cd-bf747a352360@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Next pull request, with the previous one included too:

drm-misc-fixes-2023-05-11:
drm-misc-fixes for v6.4-rc2:
- More DSC macro fixes.
- Small mipi-dsi fix.
- Scheduler timeout handling fix.

---

drm-misc-fixes for v6.4-rc1:
- Fix DSC macros.
- Fix VESA format for simplefb.
- Prohibit potential out-of-bounds access in generic fbdev emulation.
- Improve AST2500+ compat on ARM.
The following changes since commit b63a553e8f5aa6574eeb535a551817a93c426d8c:

  drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume (2023-04-17 23:40:40 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-05-11

for you to fetch changes up to 2da5bffe9eaa5819a868e8eaaa11b3fd0f16a691:

  drm/sched: Check scheduler work queue before calling timeout handling (2023-05-10 10:28:01 -0400)

----------------------------------------------------------------
drm-misc-fixes for v6.4-rc2:
- More DSC macro fixes.
- Small mipi-dsi fix.
- Scheduler timeout handling fix.

---

drm-misc-fixes for v6.4-rc1:
- Fix DSC macros.
- Fix VESA format for simplefb.
- Prohibit potential out-of-bounds access in generic fbdev emulation.
- Improve AST2500+ compat on ARM.

----------------------------------------------------------------
Jammy Huang (1):
      drm/ast: Fix ARM compatibility

Jani Nikula (2):
      drm/dsc: fix drm_edp_dsc_sink_output_bpp() DPCD high byte usage
      drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values

Kees Cook (1):
      drm/nouveau/disp: More DP_RECEIVER_CAP_SIZE array fixes

Pierre Asselin (1):
      firmware/sysfb: Fix VESA format selection

Saravana Kannan (1):
      drm/mipi-dsi: Set the fwnode for mipi_dsi_device

Sui Jingfeng (1):
      drm/fbdev-generic: prohibit potential out-of-bounds access

Vitaly Prosyak (1):
      drm/sched: Check scheduler work queue before calling timeout handling

 drivers/firmware/sysfb_simplefb.c                |  4 +++-
 drivers/gpu/drm/ast/ast_main.c                   |  9 +++++----
 drivers/gpu/drm/drm_fb_helper.c                  | 16 ++++++++++++----
 drivers/gpu/drm/drm_mipi_dsi.c                   |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    |  4 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c           |  2 +-
 include/drm/display/drm_dp.h                     |  5 ++---
 include/drm/display/drm_dp_helper.h              |  5 ++---
 10 files changed, 32 insertions(+), 20 deletions(-)

-----

On 2023-05-11 10:01, Thomas Zimmermann wrote:
> A friendly ping to merge this PR. The patches appear to be missing from drm-fixes.
>
> Am 26.04.23 um 07:59 schrieb Maarten Lankhorst:
>> Hi Dave, Daniel,
>>
>> drm-misc-fixes pull request for rc1. drm-misc-next-fixes coming up.. next
>>
>> ~Maarten
>>
>> drm-misc-fixes-2023-04-26:
>> drm-misc-fixes for v6.4-rc1:
>> - Fix DSC macros.
>> - Fix VESA format for simplefb.
>> - Prohibit potential out-of-bounds access in generic fbdev emulation.
>> - Improve AST2500+ compat on ARM.
>> The following changes since commit b63a553e8f5aa6574eeb535a551817a93c426d8c:
>>
>>   drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume (2023-04-17 23:40:40 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-04-26
>>
>> for you to fetch changes up to 0d68683838f2850dd8ff31f1121e05bfb7a2def0:
>>
>>   drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values (2023-04-24 22:40:57 +0300)
>>
>> ----------------------------------------------------------------
>> drm-misc-fixes for v6.4-rc1:
>> - Fix DSC macros.
>> - Fix VESA format for simplefb.
>> - Prohibit potential out-of-bounds access in generic fbdev emulation.
>> - Improve AST2500+ compat on ARM.
>>
>> ----------------------------------------------------------------
>> Jammy Huang (1):
>>       drm/ast: Fix ARM compatibility
>>
>> Jani Nikula (2):
>>       drm/dsc: fix drm_edp_dsc_sink_output_bpp() DPCD high byte usage
>>       drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values
>>
>> Pierre Asselin (1):
>>       firmware/sysfb: Fix VESA format selection
>>
>> Sui Jingfeng (1):
>>       drm/fbdev-generic: prohibit potential out-of-bounds access
>>
>> drivers/firmware/sysfb_simplefb.c   |  4 +++-
>> drivers/gpu/drm/ast/ast_main.c      |  9 +++++----
>> drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
>> include/drm/display/drm_dp.h        |  5 ++---
>> include/drm/display/drm_dp_helper.h |  5 ++---
>> 5 files changed, 24 insertions(+), 15 deletions(-)
>>
>>
>
