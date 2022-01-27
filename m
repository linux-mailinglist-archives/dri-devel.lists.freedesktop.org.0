Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FD49D937
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD410EDB8;
	Thu, 27 Jan 2022 03:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AEA10EDB8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:26:16 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s16so1009294pgs.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 19:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXgGm9s9WWnJocR1csEpEoFP0RYkPEhnyAgndhDwtjc=;
 b=O4KjoPSuQDZNGBWdQmitA/kZxO0YlbnND4cNyWdlyu4NQbK+BjberWp7inGyjYEFJK
 V6JfMoxtuIZkIBnyKTfo0YDRqThLerNVvqa+K1pSkgZZvEcRMTgu3/Fla5GeW5IktNNn
 Bijtm9oz/pYUb5wZ8jBAPSSs4k9N9koKFTfDDcGFPBvT1f6aT69SbDPqjCIOCXPuxmTu
 3zWG6DCftxpuLhT0mrnB7Ni8jRvM2RLA+4slw5oHeDn0lLA7Qm21MGiq0iFX+UpbBapn
 fzZcajgCC/wg3/Mw4zbuNAa0nNAWO80t/e4VHG2oUY2aJnDbWbkuoV/5ZDfxq5gVqZdt
 hdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXgGm9s9WWnJocR1csEpEoFP0RYkPEhnyAgndhDwtjc=;
 b=5OlB7FDh3/BLTTBU5TfJb647KWzRNGJN7MghEaLDcXN8SbCcu0r8G3As2XU7epszu4
 FBd8xPxrg6aFXzIXu7tcJTSHxtElOo9tsXDB3hVnii72ZjyNQPCTTWoGwd3NqY7ZIlOw
 jpkv7fOM08UuOaqcLWv89LGWECgNczQomPgJwQmMV7EGPhSu1Bpdzd4XIRNDwdpjToa8
 xFPwj6xzTPWCPqpJM6pSL79u7DRJrX6G+NpgSC9MkcGQmc+Rs5bkeiJ9hdAuFkEbd7dc
 0VwlG1+5X80MAce92Tcwvn43GTeNyc+SHnRVcwvc1SUkjqoJe9r32Y2M95qk7UcnGFum
 eN8g==
X-Gm-Message-State: AOAM531JMxzbMwUoHEUJqiszjIvh+N580FzG2a+lmQPnlI1hf5qC/+bI
 u4Jy5aoUZDDhDHrHA8N21lJZuRPH296K/D4B
X-Google-Smtp-Source: ABdhPJysmgOujAl45WjONf68QQ5jRzvfCobqxGtGJ8Z511kMtGA4DmksGOLMeNbJRLJFDxAUzyr1Nw==
X-Received: by 2002:a63:2c07:: with SMTP id s7mr1356397pgs.181.1643253975979; 
 Wed, 26 Jan 2022 19:26:15 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id t15sm4203111pjy.17.2022.01.26.19.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 19:26:15 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v5 3/3] drm: remove allow_fb_modifiers
Date: Thu, 27 Jan 2022 12:25:39 +0900
Message-Id: <20220127032539.9929-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127032539.9929-1-etom@igel.co.jp>
References: <20220127032539.9929-1-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The allow_fb_modifiers flag is unnecessary since it has been replaced
with fb_modifiers_not_supported flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
 include/drm/drm_mode_config.h                    | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 61b44d3a6a61..f6d66285c5fc 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
@@ -323,7 +323,6 @@ static struct drm_device mock_drm_device = {
 		.max_width = MAX_WIDTH,
 		.min_height = MIN_HEIGHT,
 		.max_height = MAX_HEIGHT,
-		.allow_fb_modifiers = true,
 		.funcs = &mock_config_funcs,
 	},
 };
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 4a93dac91cf9..6b5e01295348 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -917,22 +917,6 @@ struct drm_mode_config {
 	 */
 	bool async_page_flip;
 
-	/**
-	 * @allow_fb_modifiers:
-	 *
-	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
-	 * Note that drivers should not set this directly, it is automatically
-	 * set in drm_universal_plane_init().
-	 *
-	 * IMPORTANT:
-	 *
-	 * If this is set the driver must fill out the full implicit modifier
-	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
-	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
-	 * broken for modifier aware userspace.
-	 */
-	bool allow_fb_modifiers;
-
 	/**
 	 * @fb_modifiers_not_supported:
 	 *
-- 
2.25.1

