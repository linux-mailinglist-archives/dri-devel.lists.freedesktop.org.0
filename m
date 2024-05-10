Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA88C25A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0810E5FE;
	Fri, 10 May 2024 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA7SxeRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67ED10E5FE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715347573; x=1746883573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sZRh5Eid65xXB2IpEjdjl8NweL0W0yfXFs2tjA+YFUc=;
 b=CA7SxeRodVVnbVuH95lIp+ldjmRQWc+OSIKjGc5dmo9flKeLRaMrjqKK
 JO2/39JfiWGDRBdUHA7DC32yxiApqaVQhioWPKtYd8Al5ZmoGEAsa9UWl
 jHMn56j8/iQMlgiYyNO43MPO4BiyN5ry3iDhW7liggpYjVnlIU6RxbJa+
 VtuskeKcIm7gtLC6rvNLxhyQmnaMpPyHgT8ubwPs3QYnRc9pa7GomUS5u
 6ua9Hwyy+OeWqql/nZ3KwUrn8nRA9G+Alm9C6Xm4+uE+DHPda20qY2e88
 V02U5Tb5HQcMX7meayZYRPRS2sfzCWdZXpnT3FQfjvTdLMz72ho5ltlSb A==;
X-CSE-ConnectionGUID: vB0uZDhRSNes8EYkPS/A9g==
X-CSE-MsgGUID: sfEQAPyMQYGPfGEDM9oCjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11489918"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489918"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:13 -0700
X-CSE-ConnectionGUID: B1ZiA3L0RSOpvp2nJTqz5Q==
X-CSE-MsgGUID: KzILx4szRkejWrABSFETeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30168749"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [RESEND 0/6] drm: struct drm_edid conversions
Date: Fri, 10 May 2024 16:26:03 +0300
Message-Id: <cover.1715347488.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Resend of the remaining patches from [1].

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1713273659.git.jani.nikula@intel.com


Jani Nikula (6):
  drm/bridge/analogix/anx6345: switch to struct drm_edid
  drm/bridge/analogix/anx78xx: switch to struct drm_edid
  drm/bridge: anx7625: use struct drm_edid more
  drm/i2c: tda998x: switch to struct drm_edid
  drm/bochs: switch to struct drm_edid
  drm/virtio: switch to struct drm_edid

 .../drm/bridge/analogix/analogix-anx6345.c    | 15 +++++------
 .../drm/bridge/analogix/analogix-anx78xx.c    | 23 ++++++++--------
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 26 ++++++++++++-------
 drivers/gpu/drm/bridge/analogix/anx7625.h     | 10 ++-----
 drivers/gpu/drm/i2c/tda998x_drv.c             | 19 +++++++-------
 drivers/gpu/drm/tiny/bochs.c                  | 23 +++++++---------
 drivers/gpu/drm/virtio/virtgpu_display.c      | 10 +++----
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 ++++-----
 9 files changed, 69 insertions(+), 71 deletions(-)

-- 
2.39.2

