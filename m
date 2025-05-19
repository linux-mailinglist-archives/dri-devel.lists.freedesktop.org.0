Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0EABBF3D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780F310E25D;
	Mon, 19 May 2025 13:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvMMk+AX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7010E25D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747661632; x=1779197632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NZYT7Njq17fWYjY0NP0+YaRVjRNL5pkH6vBEdJFJE0I=;
 b=BvMMk+AXTO+MIW5Qw1k6yCsOIuD36AmcFwgnX3W7j4MqAVYF0SWjwXLS
 VCh+ngtG1R6vsa+VizuLcPSgSds7n/IxKYp0rThkQgNfAONtC49uqFlNa
 gqgqAtgTnvbHinYky8hePx+RhcIi0OFyPkqwLa5g4lmDgmoynfbMY0i4y
 md2QS/6a0RerREUvS3FpMd4oYqylRBrVRRQ+3O9PR1X6kqTERxoUxzubD
 gdJvCo3jJNTMxMlZsbE2Uwtmv6ueAYRECqCx7DXg4NM5RoAus7qCJt2ok
 5x9JyqAobwi/xN4SuqV1tEPomMatnk/MhMVp25lnxcNfF7oiF0E0SXxgs Q==;
X-CSE-ConnectionGUID: nAB/yGb2SRuru+RVouQpXg==
X-CSE-MsgGUID: 3pPiPu/hQNWcJ9d2fj7SAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49699754"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49699754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 06:33:51 -0700
X-CSE-ConnectionGUID: VWCidQf0QYCHPMwfd+W9fw==
X-CSE-MsgGUID: EnzbFS6pR+KtxAQgB7QBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="140388293"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 06:33:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DFFD1256; Mon, 19 May 2025 16:33:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from struct
 ili9341
Date: Mon, 19 May 2025 16:33:45 +0300
Message-ID: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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

struct device *dev from struct ili9341 is not used anywhere, remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index ff39f5dd4097..2b5bd83933e3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -173,7 +173,6 @@ struct ili9341_config {
 };
 
 struct ili9341 {
-	struct device *dev;
 	const struct ili9341_config *conf;
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
-- 
2.47.2

