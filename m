Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0031554F5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7B76FBF7;
	Fri,  7 Feb 2020 09:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49E16FBF7;
 Fri,  7 Feb 2020 09:43:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 01:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,412,1574150400"; d="scan'208";a="430790942"
Received: from sgillich-mobl.ger.corp.intel.com (HELO [10.249.38.221])
 ([10.249.38.221])
 by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2020 01:43:26 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <551b6183-a581-9d12-10a9-24cd929de425@linux.intel.com>
Date: Fri, 7 Feb 2020 10:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-fixes-2020-02-07:
drm-misc-next fixes for v5.6:
- Fix build error in drm/edid.
- Plug close-after-free race in vgem_gem_create.
- Handle CONFIG_DMA_API_DEBUG_SG better in drm/msm.
The following changes since commit d7ca2d19c751b6715e9cb899a6b94f47b3499d02:

  Merge tag 'drm-msm-next-2020-01-14' of https://gitlab.freedesktop.org/drm/msm into drm-next (2020-01-20 14:09:43 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-02-07

for you to fetch changes up to e1cf35b94c5fd122a8780587559fc6da9fc2dd12:

  drm/edid: fix building error (2020-02-06 22:01:40 +0200)

----------------------------------------------------------------
drm-misc-next fixes for v5.6:
- Fix build error in drm/edid.
- Plug close-after-free race in vgem_gem_create.
- Handle CONFIG_DMA_API_DEBUG_SG better in drm/msm.

----------------------------------------------------------------
Daniel Vetter (1):
      drm/vgem: Close use-after-free race in vgem_gem_create

Mauro Rossi (1):
      drm/edid: fix building error

Sean Paul (1):
      drm/msm: Set dma maximum segment size for mdss

 drivers/gpu/drm/drm_edid.c      | 2 +-
 drivers/gpu/drm/msm/msm_drv.c   | 8 ++++++++
 drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++---
 3 files changed, 15 insertions(+), 4 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
