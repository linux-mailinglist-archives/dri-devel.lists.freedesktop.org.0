Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04C9730B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA9210E0CD;
	Tue, 10 Sep 2024 10:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gs4Mc100";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA2810E021;
 Tue, 10 Sep 2024 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962638; x=1757498638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4nxuq1JF/WLyoYfRJgd23d2HCrJg2MR8DnEeLMIhpfQ=;
 b=Gs4Mc100HvFq30pARA/nJBB012O0G83kQuOtydq7Gtx/wJYEAWandNCP
 O+odIV+PqT5rL8BjmCHu23+mFFmqJF7LTjNSHvxCU4ZO2KtIvrIkHFJPc
 3kvquQaDVHYYK7JsVs3qBtldw55umhQA8PVmAWvbx6vPhDgY95E9fZW1T
 I/phVnt+ibxDXKH/YGdwbu/ScZUvlmCjchioagDDnNnICUvA9xjTTVM0R
 UPSJFSrKU0u0KHJwLXYr4+HymS7bMeq0PtyvDYQnVpgTZoHDBg4fJUDI2
 5aY0LGPGvzv4jF6Pnf8UsqYFSVV4/VaEylMEyPr3yj9yYmdMhdb0vaJdw Q==;
X-CSE-ConnectionGUID: 2asuiqanSsqpS2TI/63VYA==
X-CSE-MsgGUID: WFp2GIZMQ8y7SVJFXvSslw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28479077"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28479077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:03:58 -0700
X-CSE-ConnectionGUID: 9+OBD67xQbak5KHu32BEzw==
X-CSE-MsgGUID: usBGByiPQgqE0LtsXv5U+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71381993"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:03:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/8] drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with
 __maybe_unused
Date: Tue, 10 Sep 2024 13:03:37 +0300
Message-Id: <70ee8eae9f82330ae3b67a3d29a530c6df9ab989.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
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

Building with clang and and W=1 leads to warning about unused
hdmi_read(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 26c187d20d97..4377f9d89a82 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -27,7 +27,7 @@ static inline void hdmi_write(struct dw_hdmi_i2s_audio_data *audio,
 	audio->write(hdmi, val, offset);
 }
 
-static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
+static inline __maybe_unused u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
 {
 	struct dw_hdmi *hdmi = audio->hdmi;
 
-- 
2.39.2

