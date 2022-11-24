Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258F63764F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF85110E6D7;
	Thu, 24 Nov 2022 10:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692D10E6D7;
 Thu, 24 Nov 2022 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669285580; x=1700821580;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=Z5oBq+KbQWfzyj6/35rAlRJZ1RCyHJCD1egnZq61/0w=;
 b=jHGgpZPOzTC5ok9KEs8SI+FDNStdqEqMQcgr08w/gKy+o888FTNUTa/3
 ZzvlxNhyd1gae6jPBefnWqnlPvC2893N8Yj60jkpdjSfwZzalpBV18y8g
 dgDPBm3SjFxuFZE3CEQ5QZdqz3w2ImgOCuC1Xvg6iNmIgVUxYFbGIDjx3
 4AOBbF2326o0Q1/zmM19BJDRTUT67CoKryDsGHDZBDEj5XjQoh818w40j
 KdzvPx+m0BRoI3YUxApB48EtqvQKrc6geUd5jeBWW8IklSZcgBwWzHWgO
 SKDGQSxCR42IegWUwL5eEwQRY3EQdQLcdjR3c3aBcGgj8yEB4xBux3jhe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="294657358"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
 d="scan'208,217";a="294657358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 02:26:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="710918847"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
 d="scan'208,217";a="710918847"
Received: from etorregr-mobl3.amr.corp.intel.com (HELO [10.251.210.198])
 ([10.251.210.198])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2022 02:26:17 -0800
Content-Type: multipart/alternative;
 boundary="------------1FMFax9m0Gbpsds9jJF5sMFs"
Message-ID: <a5721505-4823-98ef-7d6f-0ea478221391@linux.intel.com>
Date: Thu, 24 Nov 2022 11:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
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
--------------1FMFax9m0Gbpsds9jJF5sMFs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Daniel and Dae,

Not much here, a few fixes to dma-fence handling and a fix to amdgpu and logo.

Enjoy!
Maarten Lankhorst

drm-misc-fixes-2022-11-24:
drm-misc-fixes for v6.1-rc7:
- Another amdgpu gang submit fix.
- Use dma_fence_unwrap_for_each when importing sync files.
- Fix race in dma_heap_add().
- Fix use of uninitialized memory in logo.
The following changes since commit 5954acbacbd1946b96ce8ee799d309cb0cd3cb9d:

   drm/display: Don't assume dual mode adaptors support i2c sub-addressing (2022-11-15 23:31:02 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-24

for you to fetch changes up to a6a00d7e8ffd78d1cdb7a43f1278f081038c638f:

   fbcon: Use kzalloc() in fbcon_prepare_logo() (2022-11-22 15:48:02 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc7:
- Another amdgpu gang submit fix.
- Use dma_fence_unwrap_for_each when importing sync files.
- Fix race in dma_heap_add().
- Fix use of uninitialized memory in logo.

----------------------------------------------------------------
Christian König (1):
       drm/amdgpu: handle gang submit before VMID

Dawei Li (1):
       dma-buf: fix racing conflict of dma_heap_add()

Jason Ekstrand (1):
       dma-buf: Use dma_fence_unwrap_for_each when importing fences

Tetsuo Handa (1):
       fbcon: Use kzalloc() in fbcon_prepare_logo()

  drivers/dma-buf/dma-buf.c               | 23 +++++++++++++++++------
  drivers/dma-buf/dma-heap.c              | 28 +++++++++++++++-------------
  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 +++---
  drivers/video/fbdev/core/fbcon.c        |  2 +-
  4 files changed, 36 insertions(+), 23 deletions(-)

--------------1FMFax9m0Gbpsds9jJF5sMFs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hey Daniel and Dae,

Not much here, a few fixes to dma-fence handling and a fix to amdgpu and logo.

Enjoy!
Maarten Lankhorst

drm-misc-fixes-2022-11-24:
drm-misc-fixes for v6.1-rc7:
- Another amdgpu gang submit fix.
- Use dma_fence_unwrap_for_each when importing sync files.
- Fix race in dma_heap_add().
- Fix use of uninitialized memory in logo.
The following changes since commit 5954acbacbd1946b96ce8ee799d309cb0cd3cb9d:

  drm/display: Don't assume dual mode adaptors support i2c sub-addressing (2022-11-15 23:31:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-11-24

for you to fetch changes up to a6a00d7e8ffd78d1cdb7a43f1278f081038c638f:

  fbcon: Use kzalloc() in fbcon_prepare_logo() (2022-11-22 15:48:02 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.1-rc7:
- Another amdgpu gang submit fix.
- Use dma_fence_unwrap_for_each when importing sync files.
- Fix race in dma_heap_add().
- Fix use of uninitialized memory in logo.

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: handle gang submit before VMID

Dawei Li (1):
      dma-buf: fix racing conflict of dma_heap_add()

Jason Ekstrand (1):
      dma-buf: Use dma_fence_unwrap_for_each when importing fences

Tetsuo Handa (1):
      fbcon: Use kzalloc() in fbcon_prepare_logo()

 drivers/dma-buf/dma-buf.c               | 23 +++++++++++++++++------
 drivers/dma-buf/dma-heap.c              | 28 +++++++++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 +++---
 drivers/video/fbdev/core/fbcon.c        |  2 +-
 4 files changed, 36 insertions(+), 23 deletions(-)

</pre>
  </body>
</html>

--------------1FMFax9m0Gbpsds9jJF5sMFs--
