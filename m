Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754939E593A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2810EEB2;
	Thu,  5 Dec 2024 15:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdBMIOkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4ED10EEB0;
 Thu,  5 Dec 2024 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410988; x=1764946988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MxF30jw4Xbnas2YA1CrLkGV1Sd62EheHBJcH/qOk3Vo=;
 b=cdBMIOkDAH9SftZT/Lh1faumLGyaoVUPnWR9McyzqX8ggQtr+EWMETXX
 kLANuLQo4pYCGo8FMyGRAVF0IwLfF4X9MKlT65aRj6TkSHE8C3lyVF8oH
 erfDWkiGs2hhWMwnqdCjPmrels9TOncRpAD2mUNk21cTCGOhsmlIlkUIa
 Jsk0K5xZ5hecgk1L4DADFA4LUishRvJ6ujRA/7CzoFcx2mLq0rmVFCvuq
 fBHni1YRH2BkqZf9bVPiQI8PbHF5k4aETNfKEIUMkRa0SLmLGZUrWH1du
 nWi6Yg4Ob5VeFQOZbwvWYAwpxBr5NlZ7ppb+hbA7iXxFUpf5p95SH/uny w==;
X-CSE-ConnectionGUID: XoJWk3wtR0KY/1Slm7jolg==
X-CSE-MsgGUID: OFGLsZjqSTSGv0D7Z08zjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51142018"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51142018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:08 -0800
X-CSE-ConnectionGUID: XgfqyspzSU29YKNQCNFxBw==
X-CSE-MsgGUID: FbqRljMWSfqNMa6Uzu9J6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93982980"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH v2 0/3] drm: fix and enable warnings on unused static inlines
Date: Thu,  5 Dec 2024 17:02:58 +0200
Message-Id: <cover.1733410889.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

v2 of [1]. Dropped the parts that have already been fixed. No other
changes. Hoping to get this merged soon.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1725962479.git.jani.nikula@intel.com


Jani Nikula (3):
  drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with __maybe_unused
  drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
  drm: enable warnings on unused static inlines

 drivers/gpu/drm/Makefile                            | 3 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c          | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.39.5

