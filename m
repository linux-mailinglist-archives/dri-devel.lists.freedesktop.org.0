Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BE6EEDF5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 08:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9A010E8A3;
	Wed, 26 Apr 2023 06:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0397310E8A3;
 Wed, 26 Apr 2023 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682489090; x=1714025090;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=3SEcgBRccRZ/r/EX9X0r/aUjaYTFykKZyDakmFpR3kI=;
 b=n6NhSm83mzgZi7pzlFgE7fzFB4lhxZTXksMPD/ygRXUqHTNPQU8NiJq/
 gk5wVsG8DORB1poqHKpodNX9YCK3k6ukqxdJwjuUW/HAK/j5PrNoHA4iL
 EaDXbCJUeAwZ5TRrwawosAjCl2XnnGKU/j5QFTnXPyegFYtmQN0l8oEqD
 Nhb4Ziadcf0XUlsN1W+OlMazDVtYrG8GxQ2JwcjQxxcVFaHWNzVppmMVA
 IBua9W6WxnqyXwXZPYWL+9qEf8i6NuOU/kqoLPa2uSrLjoJKVPR67704H
 9HQwIvkpHasAoFTXLsye++POIY0Pf6xm5PGrmmJiklCEdRprYMHtfDFkr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="433288106"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="433288106"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 23:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="805351727"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; d="scan'208";a="805351727"
Received: from mpkangas-mobl1.ger.corp.intel.com (HELO [10.249.38.1])
 ([10.249.38.1])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 23:04:43 -0700
Message-ID: <45757de9-75d8-5b41-f1f9-562a7c4675b9@linux.intel.com>
Date: Wed, 26 Apr 2023 08:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next-fixes
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave, Daniel,

Complementary pull request for drm-misc-next-fixes!

~Maarten

drm-misc-next-fixes-2023-04-26:

drm-misc-next-fixes for v6.4-rc1:
- Revert uAPI from accel/qaic.
- Fix TTM build on archs where PMD_SHIFT is not constant.
- Improve error handling in nt35950.
- Fix double unregister in otm8009a when removing the driver.
The following changes since commit d8dab40a8b37fe8207e1edf68205c709b477e0a4:

   Merge tag 'drm-misc-next-2023-04-12' of 
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-04-12 
16:23:04 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc 
tags/drm-misc-next-fixes-2023-04-26

for you to fetch changes up to a50be876f4fe2349dc8b056a49d87f69c944570f:

   drm/panel: novatek-nt35950: Only unregister DSI1 if it exists 
(2023-04-18 10:20:26 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v6.4-rc1:
- Revert uAPI from accel/qaic.
- Fix TTM build on archs where PMD_SHIFT is not constant.
- Improve error handling in nt35950.
- Fix double unregister in otm8009a when removing the driver.

----------------------------------------------------------------
Christian König (1):
       drm/ttm: revert "Reduce the number of used allocation orders for 
TTM pages"

James Cowgill (1):
       drm/panel: otm8009a: Set backlight parent to panel device

Jeffrey Hugo (1):
       Revert "accel/qaic: Add mhi_qaic_cntl"

Konrad Dybcio (2):
       drm/panel: novatek-nt35950: Improve error handling
       drm/panel: novatek-nt35950: Only unregister DSI1 if it exists

  drivers/accel/qaic/Makefile                      |   1 -
  drivers/accel/qaic/mhi_qaic_ctrl.c               | 569 
-----------------------
  drivers/accel/qaic/mhi_qaic_ctrl.h               |  12 -
  drivers/accel/qaic/qaic_drv.c                    |  10 -
  drivers/gpu/drm/panel/panel-novatek-nt35950.c    |  10 +-
  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c |   2 +-
  drivers/gpu/drm/ttm/ttm_pool.c                   |  30 +-
  7 files changed, 21 insertions(+), 613 deletions(-)
  delete mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
  delete mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h

