Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005377EE1E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0BC10E5DA;
	Thu, 16 Nov 2023 13:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0F210E28C;
 Thu, 16 Nov 2023 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700142539; x=1731678539;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=jnxRL3fcFHCMcn/kER0Vt+xRDIApEscVDCQk82gvUKI=;
 b=Wrc3p60pbZoF855IeHfM88oztOLhg0eu22Kp2SFYQ61SHgSr1aLtqcxK
 tHG6iRcrevW1oiq4LynMiOwaC/PIYPXrbm3RU1znpu1gU1Tuwz/z7hs+n
 bJaWVUIrLEJ4VRmlV9G9yR2an0k5fmQb4bJa3/AQZ+l5O9u6tK+vUIy+t
 BUsh3zdKlMge7O83UMA4nRLrU7BSwmS4MnHDgFXlphap24P3edMv3wMz+
 Vr/Zy3cu3Y3p8AMGSG5euR6XnvuivdMqq90s+u1nZsCEtAROIODrz1pV9
 9GR2zeXxoCxVqDKR/q9mnloD9VOvcCqOGEsldiKwBC08VubjJkRdxzQ3K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4216335"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="4216335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 05:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="6723421"
Received: from dtanasex-mobl.ger.corp.intel.com (HELO [10.252.56.125])
 ([10.252.56.125])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 05:48:54 -0800
Message-ID: <98fc82d3-8714-45e7-bd12-c95ba8c6c35f@linux.intel.com>
Date: Thu, 16 Nov 2023 14:48:52 +0100
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

Small pull request, mostly nouveau fixes.

Cheers,
~Maarten

Mostly drm-misc-fixes-2023-11-16:
Assorted fixes for v6.7-rc2:
- Nouveau GSP fixes.
- Fix nouveau driver load without display.
- Use rwlock for nouveau's event lock to break a lockdep splat.
- Add orientation quirk for Lenovo Legion Go.
- Fix build failure in IVPU.
The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-11-16

for you to fetch changes up to ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07:

   nouveau: don't fail driver load if no display hw present. (2023-11-15 
18:23:31 +0100)

----------------------------------------------------------------
Assorted fixes for v6.7-rc2:
- Nouveau GSP fixes.
- Fix nouveau driver load without display.
- Use rwlock for nouveau's event lock to break a lockdep splat.
- Add orientation quirk for Lenovo Legion Go.
- Fix build failure in IVPU.

----------------------------------------------------------------
Arnd Bergmann (1):
       accel/ivpu: avoid build failure with CONFIG_PM=n

Brenton Simpson (1):
       drm: panel-orientation-quirks: Add quirk for Lenovo Legion Go

Dan Carpenter (2):
       nouveau/gsp/r535: uninitialized variable in r535_gsp_acpi_mux_id()
       nouveau/gsp/r535: Fix a NULL vs error pointer bug

Dave Airlie (2):
       nouveau: use an rwlock for the event lock.
       nouveau: don't fail driver load if no display hw present.

  drivers/accel/ivpu/ivpu_pm.c                      |  3 ---
  drivers/gpu/drm/drm_panel_orientation_quirks.c    |  6 ++++++
  drivers/gpu/drm/nouveau/include/nvkm/core/event.h |  4 ++--
  drivers/gpu/drm/nouveau/nouveau_display.c         |  5 +++++
  drivers/gpu/drm/nouveau/nvkm/core/event.c         | 12 ++++++------
  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  6 +++---
  6 files changed, 22 insertions(+), 14 deletions(-)
