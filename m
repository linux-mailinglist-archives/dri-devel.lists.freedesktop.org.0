Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8719730C7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F1210E752;
	Tue, 10 Sep 2024 10:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTWpAa44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5810E671;
 Tue, 10 Sep 2024 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962657; x=1757498657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSdYiAHGKQ8evoBaTlnrF5os3kXXdvMYMqdDz6+YC+I=;
 b=eTWpAa444avdg5kCFuHgr2eMT6sjwE/QskLG9+mUlVIAShh43RVixqQ6
 iBZoJxpvZYvnyhI2PnRGpkvok6Yb+locruQwauJlsqG5zA1a9QifJu8PY
 QU6mKtIRLiVRrFMsfcRSQYL7M9LZsBn5Jv2xCuYbMRhtTX8bCya0b220J
 M0u1KCStUukwxOO299vl93vvWfB0LzZTJjgg3U3YsPjtDVCn6Z7unh2om
 Zwk3MPkclEhmD2l9OdYuGKLIPQavhCv/uC1a+BiiK8RMGoF73cXxjO9mG
 KbJNjb00AiTnRgSiJF2icnaw9Wl0u6Blq9kJhACsYRoqecssxZVdTKFOL A==;
X-CSE-ConnectionGUID: xT82LVQ1Sx2ztXX4+LP5fQ==
X-CSE-MsgGUID: JAPQDXvyTwOsqMJ3V9QLvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28479106"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28479106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:16 -0700
X-CSE-ConnectionGUID: FiNwJEJxR0eQWh4NClRotQ==
X-CSE-MsgGUID: 9GWPB/FQSM2Z33bPAMRtvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71382027"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/8] drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request,
 release} with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:40 +0300
Message-Id: <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
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

Building with clang, W=1, CONFIG_PM=n and CONFIG_OF_GPIO=n leads to
warning about unused ti_sn_pwm_pin_request() and
ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..0fd4cb400e81 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1635,8 +1635,8 @@ static void ti_sn_pwm_unregister(void)
 }
 
 #else
-static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
-static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
+static inline int __maybe_unused ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
+static inline void __maybe_unused ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
 
 static inline int ti_sn_pwm_register(void) { return 0; }
 static inline void ti_sn_pwm_unregister(void) {}
-- 
2.39.2

