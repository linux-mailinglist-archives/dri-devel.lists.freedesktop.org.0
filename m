Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05128822B8E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8B910E277;
	Wed,  3 Jan 2024 10:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72610E261;
 Wed,  3 Jan 2024 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704278831; x=1735814831;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=HJmziMp+fsfe558FHZbjsXt3Qp2AuBHeXRFZiVluDq0=;
 b=nUJQMiFoe72yME69TF9/YwsE8QFM5TRdtpWRGB9upx2FbJygkphPZo8D
 QM6iGbdHMksgQj2lGqglYuJhjCVLiiLz+ruuAvlTNX/Io8pGx6N8vQ2NU
 vaquwqylMoZLxDu0AmblWoNx+48k5iwfCJdQMZRz4P0BkKfdnSDNzPPnd
 NMBHEGgdK7hk6AqPXXFNfPQiPB8MsU+3GIHl7sRT0hu7ypXBEl8OseUfN
 qUuao+A7I0vIQgPt5MjF8F9V8FCaIHdLIUckhl5oEZSjjXI4Tgo/IL5qS
 KI0gqcCh76qJKuDXHhSNcznuwgzMNFsqIZMcS4jEoy4OfaNyfHNrdLNpI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="399766015"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="399766015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="845847786"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="845847786"
Received: from jcrametz-mobl1.ger.corp.intel.com (HELO [10.251.211.58])
 ([10.251.211.58])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:47:08 -0800
Message-ID: <9ba866b4-3144-47a9-a2c0-7313c67249d7@linux.intel.com>
Date: Wed, 3 Jan 2024 11:47:06 +0100
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

Happy new year!

~Maarten

drm-misc-fixes-2024-01-03:
drm-misc-fixes for v6.7 final:
- 2 small qaic fixes.
- Fixes for overflow in aux xfer.
- Fix uninitialised gamma lut in gmag200.
- Small compiler warning fix for backports of a ps8640 fix.
The following changes since commit 6c9dbee84cd005bed5f9d07b3a2797ae6414b435:

   drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w (2023-12-13 
18:33:43 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2024-01-03

for you to fetch changes up to 11f9eb899ecc8c02b769cf8d2532ba12786a7af7:

   drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV, G200SE 
(2023-12-20 13:26:57 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.7 final:
- 2 small qaic fixes.
- Fixes for overflow in aux xfer.
- Fix uninitialised gamma lut in gmag200.
- Small compiler warning fix for backports of a ps8640 fix.

----------------------------------------------------------------
Douglas Anderson (3):
       drm/bridge: parade-ps8640: Never store more than msg->size bytes 
in AUX xfer
       drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes 
in AUX xfer
       drm/bridge: ps8640: Fix size mismatch warning w/ len

Jeffrey Hugo (1):
       accel/qaic: Implement quirk for SOC_HW_VERSION

Jocelyn Falempe (1):
       drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV, G200SE

Pranjal Ramajor Asha Kanojiya (1):
       accel/qaic: Fix GEM import path code

  drivers/accel/qaic/mhi_controller.c      | 15 ++++++++++++++-
  drivers/accel/qaic/qaic_data.c           |  6 ++----
  drivers/gpu/drm/bridge/parade-ps8640.c   |  7 ++++---
  drivers/gpu/drm/bridge/ti-sn65dsi86.c    |  4 +++-
  drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 +++++
  drivers/gpu/drm/mgag200/mgag200_g200er.c |  5 +++++
  drivers/gpu/drm/mgag200/mgag200_g200ev.c |  5 +++++
  drivers/gpu/drm/mgag200/mgag200_g200se.c |  5 +++++
  drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 +++++-----
  9 files changed, 48 insertions(+), 14 deletions(-)
