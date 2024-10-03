Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BC98EDE7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2B10E1DD;
	Thu,  3 Oct 2024 11:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVF9isaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CCE10E1DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954336; x=1759490336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s33xKLkAQRIbAlUPTP5cQcxaqv1POeyGIhVy9Hi8rOI=;
 b=fVF9isaY+kkEFiJjf4cJOF/nwjVzADjhZEnQbD1M/fXSx98K1/9Tzvpc
 ShbaTf/5hoqo/rSeLIBFUtJQX5rTLpkIJmm/WrjXAhLcJAE5Ox6V0umNA
 VBlM8LbRLdGtS32+64tZqUvvKzGe+mFZp0IZjwkrSbiRsBQYJETiN9rce
 3gC526yJxiUefdCBzdnY+bu+1eMJ/ccivqmbcljCSY+aCVjwovLobo2kO
 5Q7jtFmSgglI15NqN/3vbO3UjYZPeB3TPhUWkAP5wxevPP9mnj1qL1Am4
 rYDjLWQY6lIQNzEn5dth56bUO0rAmZFqLmyX4Z6T3pyEwIa2S+k1LxBve g==;
X-CSE-ConnectionGUID: GojK6WM0TaGSQCsl1tbUhw==
X-CSE-MsgGUID: CCIsr9RLRmmK/95z98639g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012944"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012944"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:18:56 -0700
X-CSE-ConnectionGUID: 8n45Wya1R0GbuLQ0RLNqqA==
X-CSE-MsgGUID: SBXF83x3Qry5MaAdfgh5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423646"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:18:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:18:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alison Wang <alison.wang@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Lucas Stach <l.stach@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/10] drm: Increase COMPILE_TEST=y coverage
Date: Thu,  3 Oct 2024 14:18:41 +0300
Message-ID: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Repost of the stragglers from
https://patchwork.freedesktop.org/series/132164/

Cc: Alison Wang <alison.wang@nxp.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Ville Syrjälä (10):
  drm/tilcdc: Allow build without __iowmb()
  drm/tilcdc: Allow build with COMPILE_TEST=y
  drm/armada: Fix printk arguments
  drm/armada: Fix armada_debugfs_crtc_reg_write() return type
  drm/armada: Allow build with COMPILE_TEST=y
  drm/imx/dcss: Fix 64bit divisions
  drm/imx/dcss: Allow build with COMPILE_TEST=y
  drm/fsl-dcu: Allow build with COMPILE_TEST=y
  drm/mediatek: Allow build with COMPILE_TEST=y
  drm/meson: Allow build with COMPILE_TEST=y

 drivers/gpu/drm/armada/Kconfig          | 2 +-
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 drivers/gpu/drm/armada/armada_gem.c     | 2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig         | 2 +-
 drivers/gpu/drm/imx/dcss/Kconfig        | 2 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c  | 4 ++--
 drivers/gpu/drm/mediatek/Kconfig        | 4 ++--
 drivers/gpu/drm/meson/Kconfig           | 2 +-
 drivers/gpu/drm/tilcdc/Kconfig          | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    | 3 +++
 10 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.45.2

