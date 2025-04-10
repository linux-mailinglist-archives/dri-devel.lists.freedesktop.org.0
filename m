Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4546A8471A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0438910E9E0;
	Thu, 10 Apr 2025 14:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ikxp9Bzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4AF10E9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297150; x=1775833150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrumtVtdent9ii2CJAEtl/rkhoL9x3aJGI1qNT7jj2Y=;
 b=Ikxp9BzhZAYIFqkicOkJhOla7ObkFcNUOJI3hYtWoKgxfNImldOkahiy
 +RRfSrVlobfSazJRxJAAIn4NFOTdaMCMdpqh4xDlFR+jXAsZ/McocBiKZ
 WTeEK4QJPxNga94nQnIqlZux97rbFju5KCm7ZE+MZ/9mqk/hu2hmHX/YB
 PmV/Suj6Zi6kazVRoM9ntaKuPgmt0oLXCNqf8HD6agUcTKIO5SJTEehH3
 mKewiIX7foCddy2G3PIA/NHi+06lQTGFRmWYUdt8MSQmz5Ia0GtPSNP3T
 G+Fos/cCRFkqdaI1kUT7wHz4fCu6D5HrG6wBR/0tq76tYx+4dzeylrmc+ g==;
X-CSE-ConnectionGUID: kq4vmIEDSf2bsZ5cKXof/Q==
X-CSE-MsgGUID: OphUGDORQSWj/PywLqzi0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208107"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:08 -0700
X-CSE-ConnectionGUID: VhPTrP0RQmiP8FmOLRjrBg==
X-CSE-MsgGUID: ft0aztZFSHe9aJ21p7np1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134101970"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Russell King <linux@armlinux.org.uk>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Subject: [PATCH v3 0/6] drm: Increase COMPILE_TEST=y coverage
Date: Thu, 10 Apr 2025 17:58:58 +0300
Message-ID: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Another repost of some COMPILE_TEST=y stragglers.

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>

Ville Syrjälä (6):
  drm/tilcdc: Allow build without __iowmb()
  drm/tilcdc: Allow build with COMPILE_TEST=y
  drm/armada: Fix printk arguments
  drm/armada: Fix armada_debugfs_crtc_reg_write() return type
  drm/armada: Allow build with COMPILE_TEST=y
  drm/fsl-dcu: Allow build with COMPILE_TEST=y

 drivers/gpu/drm/armada/Kconfig          | 2 +-
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 drivers/gpu/drm/armada/armada_gem.c     | 2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig         | 2 +-
 drivers/gpu/drm/tilcdc/Kconfig          | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    | 3 +++
 6 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.49.0

