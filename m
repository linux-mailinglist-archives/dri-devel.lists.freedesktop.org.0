Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709357F5EF3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080110E07D;
	Thu, 23 Nov 2023 12:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901DF10E071;
 Thu, 23 Nov 2023 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700742152; x=1732278152;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=fnIvowgESj/1IKFwSce/blavN94I9Hoi7hYWboZGMdU=;
 b=EkZDpNT6m5vdHGRFu6ZRtHc8WwAsBovdYEpxZtpTsImQPFkY/2FskTOx
 3w39jTs4byjp5+XRQbvnlOB0RBkX0LXhHlGapcI5XTSXrwp1doKwqqWrd
 mia+z6u9F9T4eGrtP17qqSnFB/1Ewi4glYiIQMEC1bjMzHFdgz5G7xUWf
 SaM/lacSj0bEycat3jBiGppLd1gGmRDhfPpbYPvh2gPFOLZCbFFhc8JA7
 V8rqvgd6fxOdI3qP4JXcOy5eqaqYx0MsWpLM7hdGvvi0IfF+ZBJL6jLlc
 J9G1PN1aNrX2h2K5FAxhwAZYngq2hdeiRzz7HZcuv4Yjf0cT8Ql+UqDmY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478456784"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="478456784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 04:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="15646159"
Received: from dtanasex-mobl.ger.corp.intel.com (HELO [10.252.40.72])
 ([10.252.40.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 04:22:28 -0800
Message-ID: <12322257-2e0c-43d3-8241-876aafc10e4a@linux.intel.com>
Date: Thu, 23 Nov 2023 13:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Lots of small fixes for various drivers.

Cheers,
~Maarten

drm-misc-fixes-2023-11-23:
Fixes for v6.7-rc3:
- Panel fixes for innolux and auo,b101uan08.3 panel.
- Fix ivpu MMIO reset.
- AST fix on connetor disconnection.
- nouveau gsp fix.
- rockchip color fix.
- Fix Himax83102-j02 timings.
The following changes since commit ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07:

   nouveau: don't fail driver load if no display hw present. (2023-11-15 
18:23:31 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-11-23

for you to fetch changes up to ab93edb2f94c3c0d5965be3815782472adbe3f52:

   nouveau/gsp: allocate enough space for all channel ids. (2023-11-21 
22:28:01 +0100)

----------------------------------------------------------------
Fixes for v6.7-rc3:
- Panel fixes for innolux and auo,b101uan08.3 panel.
- Fix ivpu MMIO reset.
- AST fix on connetor disconnection.
- nouveau gsp fix.
- rockchip color fix.
- Fix Himax83102-j02 timings.

----------------------------------------------------------------
Cong Yang (1):
       drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP 
and HBP

Dave Airlie (1):
       nouveau/gsp: allocate enough space for all channel ids.

Jacek Lawrynowicz (1):
       accel/ivpu/37xx: Fix hangs related to MMIO reset

Jonas Karlman (1):
       drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full

Marek Vasut (2):
       drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
       drm/panel: simple: Fix Innolux G101ICE-L01 timings

Thomas Zimmermann (1):
       drm/ast: Disconnect BMC if physical connector is connected

Xuxin Xiong (1):
       drm/panel: auo,b101uan08.3: Fine tune the panel power sequence

  drivers/accel/ivpu/ivpu_hw_37xx.c               | 46 +++++++++---------
  drivers/gpu/drm/ast/ast_drv.h                   | 13 +++++-
  drivers/gpu/drm/ast/ast_mode.c                  | 62 
++++++++++++++++++++++---
  drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c |  2 +-
  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c  |  9 ++--
  drivers/gpu/drm/panel/panel-simple.c            | 13 +++---
  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 14 ++++--
  7 files changed, 113 insertions(+), 46 deletions(-)
