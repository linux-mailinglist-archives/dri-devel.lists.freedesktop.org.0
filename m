Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC296EEDE3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6557210E8A2;
	Wed, 26 Apr 2023 05:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C860210E89E;
 Wed, 26 Apr 2023 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682488793; x=1714024793;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=F8GtQx+smirhZawJSh9U1XxVjNFwvA5P0Nq79tBw248=;
 b=hU52Bk2SpiwTPR6tw7evPt5/d6GcCJ8qSuON3iPj26csKXKotKMt1rRK
 LoYCK2mpzB/jdMb2g5p83zgVB0oazTFEDR+5J7TDA36asIKrb21d+lm4u
 e4RszGIx/r5pEFVLVki4LouKg4c/hgGp1VoDQDYj+s1LMjnfwsrxJZYiV
 vPQmqzmo+ERv+WVRvArvJtXXByD5TMb3w1irPFSRI5MRNUt5zQyiL8rm8
 ZRl6o1+9avshOmrlexS1oAioybsXCaIV/QMLcCb0NcS7GEADtBN0ms3oF
 7YHaTt7j34Q8BV+Zlpf1N+MgRKyd2UjIRg1CfKSUNOdGNdYEXUJfdfTWK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326615287"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
 d="scan'208,217";a="326615287"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 22:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="693819403"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
 d="scan'208,217";a="693819403"
Received: from mpkangas-mobl1.ger.corp.intel.com (HELO [10.249.38.1])
 ([10.249.38.1])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 22:59:34 -0700
Content-Type: multipart/alternative;
 boundary="------------EKTYVz655X0ecc43iVa93F8X"
Message-ID: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>
Date: Wed, 26 Apr 2023 07:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------EKTYVz655X0ecc43iVa93F8X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,

drm-misc-fixes pull request for rc1. drm-misc-next-fixes coming up.. next

~Maarten

drm-misc-fixes-2023-04-26:
drm-misc-fixes for v6.4-rc1:
- Fix DSC macros.
- Fix VESA format for simplefb.
- Prohibit potential out-of-bounds access in generic fbdev emulation.
- Improve AST2500+ compat on ARM.
The following changes since commit 
b63a553e8f5aa6574eeb535a551817a93c426d8c:

  drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume 
(2023-04-17 23:40:40 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-04-26

for you to fetch changes up to 0d68683838f2850dd8ff31f1121e05bfb7a2def0:

  drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values (2023-04-24 22:40:57 
+0300)

----------------------------------------------------------------
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

Pierre Asselin (1):
      firmware/sysfb: Fix VESA format selection

Sui Jingfeng (1):
      drm/fbdev-generic: prohibit potential out-of-bounds access

drivers/firmware/sysfb_simplefb.c   |  4 +++-
drivers/gpu/drm/ast/ast_main.c      |  9 +++++----
drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
include/drm/display/drm_dp.h        |  5 ++---
include/drm/display/drm_dp_helper.h |  5 ++---
5 files changed, 24 insertions(+), 15 deletions(-)


--------------EKTYVz655X0ecc43iVa93F8X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Dave, Daniel,</p>
    <p>drm-misc-fixes pull request for rc1. drm-misc-next-fixes coming
      up.. next<br>
    </p>
    <p>~Maarten</p>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">drm-misc-fixes-2023-04-26:
        </span><br>
        drm-misc-fixes for v6.4-rc1:
        <br>
        - Fix DSC macros.
        <br>
        - Fix VESA format for simplefb.
        <br>
        - Prohibit potential out-of-bounds access in generic fbdev
        emulation.
        <br>
        - Improve AST2500+ compat on ARM.
        <br>
        The following changes since commit
        b63a553e8f5aa6574eeb535a551817a93c426d8c:
        <br>
        <br>
         drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume
        (2023-04-17 23:40:40 +0200)
        <br>
        <br>
        are available in the Git repository at:
        <br>
        <br>
         git://anongit.freedesktop.org/drm/drm-misc
        tags/drm-misc-fixes-2023-04-26
        <br>
        <br>
        for you to fetch changes up to
        0d68683838f2850dd8ff31f1121e05bfb7a2def0:
        <br>
        <br>
         drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values (2023-04-24
        22:40:57 +0300)
        <br>
        <br>
        ----------------------------------------------------------------
        <br>
        drm-misc-fixes for v6.4-rc1:
        <br>
        - Fix DSC macros.
        <br>
        - Fix VESA format for simplefb.
        <br>
        - Prohibit potential out-of-bounds access in generic fbdev
        emulation.
        <br>
        - Improve AST2500+ compat on ARM.
        <br>
        <br>
        ----------------------------------------------------------------
        <br>
        Jammy Huang (1):
        <br>
             drm/ast: Fix ARM compatibility
        <br>
        <br>
        Jani Nikula (2):
        <br>
             drm/dsc: fix drm_edp_dsc_sink_output_bpp() DPCD high byte
        usage
        <br>
             drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values
        <br>
        <br>
        Pierre Asselin (1):
        <br>
             firmware/sysfb: Fix VESA format selection
        <br>
        <br>
        Sui Jingfeng (1):
        <br>
             drm/fbdev-generic: prohibit potential out-of-bounds access
        <br>
        <br>
        drivers/firmware/sysfb_simplefb.c   |  4 +++-
        <br>
        drivers/gpu/drm/ast/ast_main.c      |  9 +++++----
        <br>
        drivers/gpu/drm/drm_fb_helper.c     | 16 ++++++++++++----
        <br>
        include/drm/display/drm_dp.h        |  5 ++---
        <br>
        include/drm/display/drm_dp_helper.h |  5 ++---
        <br>
        5 files changed, 24 insertions(+), 15 deletions(-)<br>
        <br>
        <br>
      </span></p>
  </body>
</html>

--------------EKTYVz655X0ecc43iVa93F8X--
