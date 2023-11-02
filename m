Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F947DF3D2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C2110E8AA;
	Thu,  2 Nov 2023 13:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFCC10E8AC;
 Thu,  2 Nov 2023 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698931873; x=1730467873;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=ZhxBzSdtpLaB0SitYulabK7DLieZEKfvltvm74NLGLs=;
 b=kIiyrTOUu3Kv2BgNlOUsfBPEjUAUnZYLBSUkq3DT4s4o4QCHId476GXd
 T93BeScApC/2uRMHMbo0ngwe+LwzN8Q1AkX/QB/ItTZ8A3o3shop4Krio
 aL0FuK6dHxBUvZsFMYRoICbyc1MlyX9WaE1UpUfZGXd+9511qpeZmxRxP
 XXSwJXsaeW1AYdDunrG4BXOZFrVkhy/Fq795z/+LnNnHJOm9ZAI3GAJxl
 Yv/ywNAyV7CF0Eu70xisLhNx0XxQLuxnPfIuF4X+ii2GBgGpR3GxEc9an
 FWWMCbYaOwwsO5jijOdtSIusGNH7dgPghf7G8F32iB2z3oAE5sjwvxAPl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368053720"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="368053720"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 06:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="8994310"
Received: from oroos-mobl1.ger.corp.intel.com (HELO [10.252.51.56])
 ([10.252.51.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 06:31:09 -0700
Message-ID: <58f40043-bb8a-4716-bf07-89f6a9f56c4c@linux.intel.com>
Date: Thu, 2 Nov 2023 14:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-next-fixes
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

Hi Daniel, Dave,

Just 2 small ssd130x fixes.

Cheers,
~Maarten

drm-misc-next-fixes-2023-11-02:
drm-misc-next-fixes for v6.7-rc1:

- dt binding fix for ssd132x
- Initialize ssd130x crtc_state to NULL.

The following changes since commit b70438004a14f4d0f9890b3297cd66248728546c:

   drm/amdgpu: move buffer funcs setting up a level (2023-10-26 16:04:24 
-0400)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc 
tags/drm-misc-next-fixes-2023-11-02

for you to fetch changes up to 94565e95e247c188fed4d3da1034402f3fb297de:

   drm/ssd130x: Fix possible uninitialized usage of crtc_state variable 
(2023-10-30 11:00:27 +0100)

----------------------------------------------------------------
drm-misc-next-fixes for v6.7-rc1:

- dt binding fix for ssd132x
- Initialize ssd130x crtc_state to NULL.

----------------------------------------------------------------
Javier Martinez Canillas (2):
       dt-bindings: display: ssd132x: Remove '-' before compatible enum
       drm/ssd130x: Fix possible uninitialized usage of crtc_state variable

  Documentation/devicetree/bindings/display/solomon,ssd132x.yaml | 8 
++++----
  drivers/gpu/drm/solomon/ssd130x.c                              | 2 +-
  2 files changed, 5 insertions(+), 5 deletions(-)
