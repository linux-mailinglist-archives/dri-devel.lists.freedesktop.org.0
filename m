Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427161BBDF1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4966E3C1;
	Tue, 28 Apr 2020 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C6589F99;
 Mon, 27 Apr 2020 08:14:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f8so13050581lfe.12;
 Mon, 27 Apr 2020 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FdfIU2NSLi88tCR7YZD3MsDxdEuhmbVZJnaYrUyg/FE=;
 b=USImTHS+2kjnjzTvZI+vUWJujyfWRDkv01ERhF34UHkbrkyZuD1txWGzcFXSWY+YDK
 CIQAOQ2rJrPhgm8dk2ZRlT5u/vPMqogGCQJe+KL9HGR3aLw14Vo+0f8NEieK72B0Eh2c
 UaPBxPidYjOZpx4IvXrgM4/EWxxXIjAxbDGX/+FQmOggRC+eFb9RiQ6srgiQ8n0U6uch
 pDO5IB9Stv9HwGtgkKeOh6s7t1ADYFsA/NVZYEiMyZoxHAAZjVh6jxOboqcTBsfvbgiV
 HRhH72dexIXWO28Mh7cHYZKjQxuNbQt5P0tGKTWSNDs1adrH/A+ONgelIHXSCEJAXl4/
 l3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FdfIU2NSLi88tCR7YZD3MsDxdEuhmbVZJnaYrUyg/FE=;
 b=rpdxq1fWE29CwghVc3FEBleEQyAlNucYcZr+MS6cJ1ez2Me6taIVdLnOh+TS+dcExG
 ZhLgZQjkL+jOGoq1PhFF1ssH4wdnlMfolyu159mNHNbXx2h5EmePO522A2gM7YHnqCWu
 jN7pAVkxEN5MQ7JBH2Z2AQ2D0C7TpqaE9/7ikMPGzUIYWuHtm17OQF2T8UkqISJMpRIF
 nL5cO14+qS06Vkh7oO3X89MoxVvXW5KBXSBzICIV7VnGFJd/9RWjXTRaOloC8KkxQstm
 CTveTrv/lxJ7fAXZCeZlDK69QbH+hZ3/3zDGFssL+WQxOUWRmSqbv3xYTacyUBzcMjJG
 W+sA==
X-Gm-Message-State: AGi0Pub5LGiK36iUFM9i81huOtEnj+4jn9WonJETCRYUNv7MDEACB92D
 DKypJVlM4IthvsPFF3nZrFY=
X-Google-Smtp-Source: APiQypJb8u+s2Yxiz9lf4eiIRKY3+cYu2Oqfifby+TcDNTNf2cVOtw+SmKfnqQEiTDVq3TME2jyUEQ==
X-Received: by 2002:a19:e04a:: with SMTP id g10mr14556853lfj.164.1587975240426; 
 Mon, 27 Apr 2020 01:14:00 -0700 (PDT)
Received: from e123311-lin.cambridge.arm.com
 (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id i20sm11209907lfe.15.2020.04.27.01.13.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:13:59 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, chris@chris-wilson.co.uk,
 jose.souza@intel.com
Subject: [PATCH] Remove drm_display_mode.hsync
Date: Mon, 27 Apr 2020 10:05:17 +0200
Message-Id: <1587974717-14599-1-git-send-email-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Michal Orzel <michalorzel.eng@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As suggested by the TODO list of DRM subsystem:
-remove the member hsync of drm_display_mode
-convert code using hsync member to use drm_mode_hsync()

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 drivers/gpu/drm/drm_modes.c                  |  6 +-----
 drivers/gpu/drm/i915/display/intel_display.c |  1 -
 include/drm/drm_modes.h                      | 10 ----------
 3 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index d4d6451..0340079 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -752,16 +752,12 @@ EXPORT_SYMBOL(drm_mode_set_name);
  * @mode: mode
  *
  * Returns:
- * @modes's hsync rate in kHz, rounded to the nearest integer. Calculates the
- * value first if it is not yet set.
+ * @modes's hsync rate in kHz, rounded to the nearest integer.
  */
 int drm_mode_hsync(const struct drm_display_mode *mode)
 {
 	unsigned int calc_val;
 
-	if (mode->hsync)
-		return mode->hsync;
-
 	if (mode->htotal <= 0)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3468466..ec7e943 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8891,7 +8891,6 @@ void intel_mode_from_pipe_config(struct drm_display_mode *mode,
 
 	mode->clock = pipe_config->hw.adjusted_mode.crtc_clock;
 
-	mode->hsync = drm_mode_hsync(mode);
 	mode->vrefresh = drm_mode_vrefresh(mode);
 	drm_mode_set_name(mode);
 }
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 99134d4..7dab7f1 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -391,16 +391,6 @@ struct drm_display_mode {
 	int vrefresh;
 
 	/**
-	 * @hsync:
-	 *
-	 * Horizontal refresh rate, for debug output in human readable form. Not
-	 * used in a functional way.
-	 *
-	 * This value is in kHz.
-	 */
-	int hsync;
-
-	/**
 	 * @picture_aspect_ratio:
 	 *
 	 * Field for setting the HDMI picture aspect ratio of a mode.
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
