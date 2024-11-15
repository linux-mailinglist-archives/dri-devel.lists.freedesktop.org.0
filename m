Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9A9CD95F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 07:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208610E3A4;
	Fri, 15 Nov 2024 06:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2PBNUf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417EF10E00F;
 Fri, 15 Nov 2024 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731653972; x=1763189972;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1jlZEkviRKioQw0a2Kvop97hPoGUlRhDmZt3HdTyPGA=;
 b=G2PBNUf9LS7R00yqMGmjtbCHCyRgDMXqyZMHIUgTH3OJTesUgJGloNcx
 CyMNH7GE1mIn/YL2oaF5QGmyDWC/imXr9BjUse5rVo7gt9rUM+XdRQYYv
 luQgIlGWdkiIuhGJcX43kya2+XETZPS5oradUPX3TQjH4TWYZh2MYM16i
 FhMgqGsvefIGz7PKnooHhw04308yq4qaHlam16sHOlMKJQf0uw2K5Il7T
 uIqSUM8YMlB/f4ZeXDPtxhRp3G84HDk+F6U/i7mHze9LwGFFnanHOikZr
 vF+rHj+HVx/ORr4G4ILLnSMmR9w6wx34+j31Pj9gB16vW+icZt5k1Xa7w g==;
X-CSE-ConnectionGUID: JXX0Of5zQImHnsiMzxBxxw==
X-CSE-MsgGUID: l+wTzVHNQ8CxS9FMUCVT4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31780014"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31780014"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:03:24 -0800
X-CSE-ConnectionGUID: ZMwCYSwNStuoCVH1gtD6MQ==
X-CSE-MsgGUID: nnQdEjCmQqa9JtQcU2ihuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="93440706"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:03:21 -0800
Date: Thu, 14 Nov 2024 18:03:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <5ntcf2ssmmvo5dsf2mdcee4guwwmpbm3xrlufgt2pdfmznzjo3@62ygo3bxkock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Simona,

A few more drm-xe fixes for this week.

thanks
Lucas De Marchi

drm-xe-fixes-2024-11-14:
Driver Changes:
- Fix unlock on exec ioctl error path (Matthew Brost)
- Fix hibernation on LNL due to ggtt getting lost
   (Matthew Brost / Matthew Auld)
- Fix missing runtime PM in OA release (Ashutosh)
The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

   Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-11-14

for you to fetch changes up to c0403e4ceecaefbeaf78263dffcd3e3f06a19f6b:

   drm/xe/oa: Fix "Missing outer runtime PM protection" warning (2024-11-13 11:37:22 -0800)

----------------------------------------------------------------
Driver Changes:
- Fix unlock on exec ioctl error path (Matthew Brost)
- Fix hibernation on LNL due to ggtt getting lost
   (Matthew Brost / Matthew Auld)
- Fix missing runtime PM in OA release (Ashutosh)

----------------------------------------------------------------
Ashutosh Dixit (1):
       drm/xe/oa: Fix "Missing outer runtime PM protection" warning

Matthew Auld (2):
       drm/xe: improve hibernation on igpu
       drm/xe: handle flat ccs during hibernation on igpu

Matthew Brost (2):
       drm/xe: Ensure all locks released in exec IOCTL
       drm/xe: Restore system memory GGTT mappings

  drivers/gpu/drm/xe/xe_bo.c       | 43 +++++++++++++++++++++-------------------
  drivers/gpu/drm/xe/xe_bo_evict.c | 20 +++++++++++--------
  drivers/gpu/drm/xe/xe_exec.c     |  4 ++--
  drivers/gpu/drm/xe/xe_oa.c       |  2 ++
  4 files changed, 39 insertions(+), 30 deletions(-)
