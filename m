Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9B6475C5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 19:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F0510E4C3;
	Thu,  8 Dec 2022 18:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88310E4C0;
 Thu,  8 Dec 2022 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670525268; x=1702061268;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=P1dKBWNynqWrHTBpG9vqMbsNyH8WBJTq1rySaVPVHnU=;
 b=QH1mFB31o2Fj2quxKrMUyaquZa6vVgnDVbwAGFPM4gkhm5DTPtGMtjCO
 +Ldf1xjREU9pNcUgYDcO+24Yew05T3sDXtI9ayG4rCjMijsYXvrHe3d8k
 0LQs4PtHr/bYQkCmmDUSc5H4DnIcjzDhpfUvRre2lR03EhZLKn5aE+MLl
 FxcHkZ8gxMIL39v4upQ+hM6Ms+YNwWMrQ4h9DLoT5x88GqB3rCvWcw9ta
 ia/7od1w0K1EQn1ByU298DnAkhcjLLrrjnxPUWZ6orPM/V48yk9Pbfdqa
 nppzgZd6uk8HDEyJJwRf2o+0dDncbJROPjapBqw1ZZ5JpV/YAgPfZhlyM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="344303615"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
 d="scan'208,217";a="344303615"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 10:47:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="789424572"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
 d="scan'208,217";a="789424572"
Received: from valeriik-mobl.ger.corp.intel.com (HELO [10.251.214.36])
 ([10.251.214.36])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 10:47:44 -0800
Content-Type: multipart/alternative;
 boundary="------------SCfLpiZp0zd7P0T56PL8T0MY"
Message-ID: <8110f02d-d155-926e-8674-c88b806c3a3a@linux.intel.com>
Date: Thu, 8 Dec 2022 19:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------SCfLpiZp0zd7P0T56PL8T0MY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Dave,

drm-misc-fixes for v6.1 final.
A bit late, hopefully just in time.

----
drm-misc-fixes-2022-12-08:
drm-misc-fixes for v6.1 final?:
- Fix polarity bug in bridge/ti-sn65dsi86.
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
   panels lie about YUV support.
- Fixes to shmem-helper error paths.
- Small vmwgfx to stop using screen objects when SEV is active.
The following changes since commit a6a00d7e8ffd78d1cdb7a43f1278f081038c638f:

   fbcon: Use kzalloc() in fbcon_prepare_logo() (2022-11-22 15:48:02 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-12-08

for you to fetch changes up to 6e90293618ed476d6b11f82ce724efbb9e9a071b:

   drm/vmwgfx: Don't use screen objects when SEV is active (2022-12-05 13:59:38 -0500)

----------------------------------------------------------------
drm-misc-fixes for v6.1 final?:
- Fix polarity bug in bridge/ti-sn65dsi86.
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
   panels lie about YUV support.
- Fixes to shmem-helper error paths.
- Small vmwgfx to stop using screen objects when SEV is active.

----------------------------------------------------------------
Dawei Li (1):
       drm/vmwgfx: Fix race issue calling pin_user_pages

Guillaume BRUN (1):
       drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420

Qiqi Zhang (1):
       drm/bridge: ti-sn65dsi86: Fix output polarity setting bug

Rob Clark (2):
       drm/shmem-helper: Remove errant put in error path
       drm/shmem-helper: Avoid vm_open error paths

Zack Rusin (1):
       drm/vmwgfx: Don't use screen objects when SEV is active

  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  6 +++---
  drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  4 ++--
  drivers/gpu/drm/drm_gem_shmem_helper.c    | 18 ++++++++++++------
  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       |  6 +++---
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c      |  4 ++++
  5 files changed, 24 insertions(+), 14 deletions(-)

--------------SCfLpiZp0zd7P0T56PL8T0MY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hey Dave,

drm-misc-fixes for v6.1 final.
A bit late, hopefully just in time.

----
drm-misc-fixes-2022-12-08:
drm-misc-fixes for v6.1 final?:
- Fix polarity bug in bridge/ti-sn65dsi86.
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
  panels lie about YUV support.
- Fixes to shmem-helper error paths.
- Small vmwgfx to stop using screen objects when SEV is active.
The following changes since commit a6a00d7e8ffd78d1cdb7a43f1278f081038c638f:

  fbcon: Use kzalloc() in fbcon_prepare_logo() (2022-11-22 15:48:02 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-12-08

for you to fetch changes up to 6e90293618ed476d6b11f82ce724efbb9e9a071b:

  drm/vmwgfx: Don't use screen objects when SEV is active (2022-12-05 13:59:38 -0500)

----------------------------------------------------------------
drm-misc-fixes for v6.1 final?:
- Fix polarity bug in bridge/ti-sn65dsi86.
- Prefer 8-bit RGB fallback before any YUV mode in dw-hdmi, since some
  panels lie about YUV support.
- Fixes to shmem-helper error paths.
- Small vmwgfx to stop using screen objects when SEV is active.

----------------------------------------------------------------
Dawei Li (1):
      drm/vmwgfx: Fix race issue calling pin_user_pages

Guillaume BRUN (1):
      drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420

Qiqi Zhang (1):
      drm/bridge: ti-sn65dsi86: Fix output polarity setting bug

Rob Clark (2):
      drm/shmem-helper: Remove errant put in error path
      drm/shmem-helper: Avoid vm_open error paths

Zack Rusin (1):
      drm/vmwgfx: Don't use screen objects when SEV is active

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c    | 18 ++++++++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c      |  4 ++++
 5 files changed, 24 insertions(+), 14 deletions(-)

</pre>
    <pre></pre>
  </body>
</html>

--------------SCfLpiZp0zd7P0T56PL8T0MY--
