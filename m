Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4990B845A59
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 15:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2D10EEBE;
	Thu,  1 Feb 2024 14:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBffOjLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F6210EEA7;
 Thu,  1 Feb 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797995; x=1738333995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JyYmWku11jc1wVAbf4fVhXHZu/SKlHE62dkNbif3mFQ=;
 b=TBffOjLqrz8rRl+4hdZ66rso/SzPv8G7YiVNEahe8GmT2XyfZemiabee
 5Fanwm8jId3u+K0ax/4kM+pQewY/ijsbzXraxWjTic+KFFF9746qn5Emh
 D0/PkZhOqI+MLb8T3HyBMZkjD617MOFaxHFV67TH1D4vFzaj8wYUSWPRO
 6OJOBYfCXOd0SVeodfu2IZsQv50SuSAetaMef9ORMDUanV8cwouFqjGmM
 1NwRMDm9UF9WmW+TOTe6hjDHbmumI+FfalWhYDdPfpuqakHcF0BSO0Po5
 vCjBOLLSuJtCYGoFmBynRBMVTWwZp2/jmcmNPHk0dqcmOGcIooxYsiPlU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401036831"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401036831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4425721"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
Date: Thu,  1 Feb 2024 16:33:07 +0200
Message-Id: <cover.1706797803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v3 of [1], with the warning fixes already merged, and rebased on
upstream warning changes.

I built this on x86-64 (both gcc and clang), arm and arm64, and
everything passed.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1704908087.git.jani.nikula@intel.com

Jani Nikula (2):
  drm: enable (most) W=1 warnings by default across the subsystem
  drm: Add CONFIG_DRM_WERROR

 drivers/gpu/drm/Kconfig  | 13 +++++++++++++
 drivers/gpu/drm/Makefile | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.39.2

